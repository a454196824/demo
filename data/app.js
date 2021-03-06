
// 1:加载对应模块
const http = require("http")
const express = require("express")
const bodyParser = require("body-parser")
const cookieParser = require("cookie-parser")
const session = require("express-session")
const cors = require("cors")
// 2：引用连接池
const pool = require("./pool")
// 3：创建express对象
var app = express()
var server = http.createServer(app)
server.listen(3003)
// 4：配置第三方模块
//     4.1 配置跨域模块
// origin 允许来自哪个域名下跨域访问
app.use(cors({
    origin:["http://127.0.0.1","http://localhost:8080","http://127.0.0.1:8080"],
    credentials:true
}))
//     4.2 post req.body.uname
app.use(bodyParser.urlencoded({extended:false}))
//     4.3 cookie/session
app.use(cookieParser('love'))
app.use(session({
    resave: true, // don't save session if unmodified
    saveUninitialized: true,
    secret: 'love'
}));
// app.use(function(req,res,next){
//     if (!req.session.user) {
//         if(req.url=="/login"){
//             next();//如果请求的地址是登录则通过，进行下一个请求
//         }
//         else
//         {
//             res.redirect('/login');
//         }
//     } else if (req.session.user) {
//         next();
//     }
// });
//获取产品展示信息
app.get("/product_list_index",(req,res)=>{
    //获取连接
    pool.getConnection((err,conn)=>{
        if(err)throw err
        var sql="SELECT pid,pname,pnameen,price,showpic FROM lc_product limit 8"
        conn.query(sql,(err,result)=>{
            if(err)throw err
            res.json(result)
        })
        conn.release()
    })
})
app.get("/product_list",(req,res)=>{
    //获取连接
    pool.getConnection((err,conn)=>{
    if(err)throw err
    var sql="SELECT pid,pname,pnameen,price,showpic FROM lc_product"
    conn.query(sql,(err,result)=>{
    if(err)throw err
    res.json(result)
})
conn.release()
})
})

app.get("/product_detail",(req,res)=>{
    //获取连接
    var pid=req.query.pid
    var reg = /^[0-9]{1,}$/;
    if(!reg.test(pid)){
        res.json({code:-1,msg:"参数有误"});
        return;
    }
    pool.getConnection((err,conn)=>{
        if(err)throw err
        var sql="SELECT * FROM lc_product WHERE pid=?"
        conn.query(sql,[pid],(err,result)=>{
            if(err)throw err
                res.json(result)
        })
        conn.release()
    })

})
//加入购物车
app.get("/addcart",(req,res)=>{
    //获取连接
    var pid=req.query.pid
    var pname=req.query.pname
    var pnameen=req.query.pnameen
    var showpic=req.query.showpic
    var price=req.query.price
    pool.getConnection((err,conn)=> {
        if (err)throw err
        var sql = "SELECT count(pid) c FROM lc_cart WHERE pid=?"
        conn.query(sql, [pid], (err, result) => {
            if (err) throw err
            var count=parseInt(result[0].c)
            if(count>0){
                count++
                var sql="UPDATE  lc_cart SET pcount=? WHERE pid=?"
                conn.query(sql,[count,pid],(err)=>{
                    if(err)throw err
                    res.json({code:1,msg:"加入成功"})
                })
                conn.release()
            }else{
                var sql="INSERT INTO lc_cart(pid,pname,pnameen,showpic,price) VALUES(?,?,?,?,?)"

                conn.query(sql,[pid,pname,pnameen,showpic,price],(err)=>{
                    if(err)throw err
                    res.json({code:1,msg:"加入成功"})
                })
                conn.release()

            }
        })
    })


})

//获取购物车数据
app.get("/loadcart",(req,res)=>{
    //获取连接
    pool.getConnection((err,conn)=>{
        if(err)throw err
        var sql="SELECT * FROM lc_cart"
        conn.query(sql,(err,result)=>{
            if(err)throw err
            res.json(result)
        })
        conn.release()
    })
})

//头页面获取购物车产品数量
app.get("/cart_count",(req,res)=>{
    //获取连接
    pool.getConnection((err,conn)=>{
        if(err)throw err
        var sql="SELECT SUM(pcount) num FROM lc_cart"
        conn.query(sql,(err,result)=>{
            if(err)throw err
            res.json(result)
        })
        conn.release()
    })
})
//增加蛋糕数量
app.get("/addCake",(req,res)=>{
    var pid=req.query.pid
    var reg = /^[0-9]{1,}$/;
    if(!reg.test(pid)){
        res.json({code:-1,msg:"参数有误"});
        return;
    }
    pool.getConnection((err,conn)=>{
        if(err)throw err
        var sql="UPDATE  lc_cart SET pcount=pcount+1 WHERE pid=?"
        conn.query(sql,[pid],(err)=>{
            if(err) throw err
            res.json({code:1,msg:"增加成功"})
        })
        conn.release()
    })
})
//删除购物车商品
app.get("/deleteitem",(req,res)=>{
    //获取连接
    var pid=req.query.pid
    var reg = /^[0-9]{1,}$/;
    if(!reg.test(pid)){
        res.json({code:-1,msg:"参数有误"});
        return;
    }
    pool.getConnection((err,conn)=>{
        if(err)throw err
        var sql="SELECT pcount FROM lc_cart WHERE pid=?"
        conn.query(sql,[pid],(err,result)=>{
            if(err) throw err
            var count=result[0].pcount
            if(count==1){
                var sql="DELETE FROM lc_cart WHERE pid=?"
                conn.query(sql,[pid],(err)=>{
                    if(err)throw err
                    res.json({code:1,msg:"删除成功"})
                })
                conn.release()
            }else{
                var sql="UPDATE  lc_cart SET pcount=pcount-1 WHERE pid=?"
                conn.query(sql,[pid],(err)=>{
                    if(err) throw err
                    res.json({code:1,msg:"增加成功"})
                })
                conn.release()
            }
        })
    })
})
//购物车选中和取消选中
app.get("/is_checked",(req,res)=>{
    var pid=req.query.pid
    var reg = /^[0-9]{1,}$/;
    if(!reg.test(pid)){
        res.json({code:-1,msg:"参数有误"});
        return;
    }
    pool.getConnection((err,conn)=>{
        var sql="UPDATE  lc_cart SET ischecked=!ischecked WHERE pid=?"
        conn.query(sql,[pid],(err)=>{
            if(err) throw err
            res.json({code:1,msg:"修改成功"})
        })
        conn.release()
    })
})
//购物车底部功能

//1.获得页面传来的参数，根据参数修改数据库中ischecked的值
//2.查询数据库中ischecked为true的价格总值和数据条数。
app.get("/checked_all",(req,res)=>{
    var checkedAll=req.query.checkedAll
    pool.getConnection((err,conn)=>{
        var sql="UPDATE  lc_cart SET ischecked=?"
        conn.query(sql,[checkedAll],(err)=>{
            if(err) throw err
            res.json({code:1,msg:"修改成功"})
        })
        conn.release()
    })

})
app.get("/checked_msg",(req,res)=>{
    pool.getConnection((err,conn)=>{
        var sql="SELECT SUM(pcount) c,SUM(price*pcount) s FROM lc_cart WHERE ischecked=1"
        conn.query(sql,(err,result)=>{
            if(err) throw err
            res.json(result)
        })
        conn.release()
    })
})
// 注册功能
app.post("/register",(req,res)=>{
    var uname=req.body.uname
    var upwd=req.body.upwd
    var reguname=/^\w{1,10}$/
    if(!reguname.test(uname)){
        return
    }
    var regupwd=/^\d{6}$/
    if(!regupwd.test(upwd)){
        return
    }
    pool.getConnection((err,conn)=>{
        var sql="INSERT INTO lc_user(uname,upwd) VALUES(?,?)"
        conn.query(sql,[uname,upwd],(err)=>{
            if(err) throw err
            res.json({code:1,msg:'注册成功'})
        })
        conn.release()
    })
})
app.get("/valiuname",(req,res)=>{
    var uname=req.query.uname
    var reguname=/^\w{1,10}$/
    if(!reguname.test(uname)){
        return
    }
    pool.getConnection((err,conn)=>{
        var sql="SELECT * FROM lc_user WHERE uname=?"
        conn.query(sql,[uname],(err,result)=>{
            if(err) throw err
            res.json(result[0])
            conn.release()
        })
    })
})
//登录功能
let user={'ok':0}
app.get("/login",(req,res)=>{
    var uname=req.query.uname
    var upwd=req.query.upwd
    var reguname=/^\w{1,10}$/
    if(!reguname.test(uname)){
        return
    }
    var regupwd=/^\d{6}$/
    if(!regupwd.test(upwd)){
        return
    }
    var sql="SELECT * FROM lc_user WHERE uname=? AND upwd=?"
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err
        res.json(result[0].uname)
        user={"ok":1,"uname":result[0].uname}
    })

})
app.get("/islogin",(req,res)=>{
    res.json(user)
})
app.get('/logout',function(req,res){
    user ={'ok':0};
    res.json({code:1,msg:'success'})
});

