<template>
    <div>
        <header class="header">
          <div class="container-fluid">
            <div class="row lecake-header">
              <div class="col-sm-12 hidden-xs large-screen">
                <div class="row">
                  <div class="col-sm-2">
                    <router-link to="/index"><img src="../assets/img/index/logo.png"></router-link>
                  </div>
                  <div class="col-sm-1 col-sm-offset-2">
                    <router-link to="/index">首页</router-link>
                  </div>
                  <div class="col-sm-1">
                    <router-link to="/productlist">蛋糕</router-link>
                  </div>
                  <div class="col-sm-1 ">
                    <router-link to="/*">礼品</router-link>
                  </div>
                  <div class="col-sm-1 dropdown-container">
                     <router-link to="/*">企业专区</router-link>
                    <ul class="dropdown-list">
                      <li><router-link to="/*">企业采购</router-link></li>
                      <li><router-link to="/*">大客户区</router-link></li>
                      <li><router-link to="/*">福利券区</router-link></li>
                      <li><router-link to="/*">银行专区</router-link></li>
                      <li><router-link to="/*">小食盒区</router-link></li>
                    </ul>
                  </div>
                  <div class="col-sm-1 dropdown-container">
                    <router-link to="/*">我的诺心</router-link>
                    <ul class="dropdown-list">
                      <li><router-link to="/*">LECLUB</router-link></li>
                      <li><router-link to="/*">我的订单</router-link></li>
                      <li><router-link to="/*">找回密码</router-link></li>
                      <li><router-link to="/*">利卡专区</router-link></li>
                    </ul>
                  </div>
                  <div class="col-sm-2 text-right  login" v-show="!isLogin">
                    <router-link to="/login">登录</router-link>/<router-link to="/register">注册</router-link>
                  </div>
                  <div class="col-sm-2 text-right login" v-show="isLogin">
                    <span>欢迎{{uname}} |</span>
                    <span><a href="javascript:;" @click="logout()">注销</a></span>
                  </div>
                  <div class="col-sm-1 cart-container">
                    <router-link to="/cart"><span class="cart"></span></router-link>
                    <span class="count">{{count}}</span>
                  </div>
                </div>
              </div>
              <div class="col-xs-12 hidden-sm hidden-md hidden-lg">
                <div class="row">
                  <div class="col-xs-6 text-left">
                    <router-link to="/index"><img src="../assets/img/index/logo.png"></router-link>
                  </div>
                  <div class="col-xs-6 text-right">
                    <a href="javascript:;"><span class="glyphicon glyphicon-menu-hamburger" style="font-size:30px;color:#ff4001" @click="toggleshow()"></span>
                    </a>
                    <div class="downlist" v-show="isShow" >
                      <p><router-link to="/index">首页</router-link></p>
                      <p><router-link to="/productlist">蛋糕</router-link></p>
                      <p><router-link to="/*">礼品</router-link></p>
                      <p><router-link to="/*">企业专区</router-link></p>
                      <p><router-link to="/*">我的诺心</router-link></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </header>
        <section class="v-container">
          <router-view></router-view>
        </section>
        <footer class="footer">
          <div class="container-fluid">
            <div class="row">
              <div class="col-xs-4 col-xs-offset-4">
                <div class="agent">
                  <div class="agent-pic"></div>
                  <div>在线客服</div>
                </div>
                <div class="wechat">
                  <div class="wechat-pic">
                    <div class="erweima"><img src="../assets/img/index/qr_code_bottom.png" alt=""></div>
                  </div>
                  <div>微信</div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                客服电话：4001-578-578 服务时间（08:30-22:30）
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                诺心公告 | 关于诺心 | 联系我们  | 客服服务 | 食品经营许可证 | 生产许可证 | 上海工商
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                诺心食品（上海）有限公司   上海徐汇区田林路140号28号楼  客服邮 箱：services@lecake.com  公司电话：4001-578-578
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                copyright©2010-2017诺心lecake.com版权所有 沪ICP备10211730
              </div>
            </div>
          </div>
        </footer>
    </div>
</template>
<script>
    export default{
      data(){
          return {
              count:0,
              isLogin:false,
              uname:"",
              isShow:false
          }
      },
      methods:{
        loadCartCount:function(){
            this.$http.get("http://127.0.0.1:3003/cart_count").then((response)=>{
              this.count=response.data[0].num
            })
        },
        loginStatus:function(){
            this.$http.get('http://127.0.0.1:3003/islogin').then((response)=>{
                if(response.data.ok==1){
                    this.isLogin=true
                    this.uname=response.data.uname
                }else{
                    this.isLogin=false
                }
                console.log(response.data)
            })
        },
        logout:function(){
            this.$http.get("http://127.0.0.1:3003/logout").then((response)=>{
                this.loginStatus()
            })
        },
        toggleshow:function(){
            this.isShow=!this.isShow
        },
      },
      created(){
          this.loadCartCount()
          this.loginStatus()
      },
      mounted(){
          //设置主体内容的margin-top
          var height=$('.header').height()
          $(".v-container").css("marginTop",height)
          $(window).resize(function(){
            var height=$('.header .container-fluid').height()
            $(".v-container").css("marginTop",height)
          })
      }
    }
</script>
<style scoped>
  *{
    font-size:12px;
  }
  /*页头样式*/
  header{
    color:#3e3e3e;
    position:fixed;
    width:100%;
    background:#fff;
    top:0;
    z-index:999
  }
  .lecake-header .large-screen a{
    display:inline-block;
    width:80px;
  }
  .lecake-header .login{
    width:140px;
  }
  .lecake-header .login a{
    display:inline;
  }
  a{
    color:#3e3e3e;
    text-decoration: none;
  }
  a:hover{
    color:#ff4001;
    text-decoration: none;
  }
  .lecake-header{
    height:80px;
    border:1px solid #eee;
    line-height:80px;
  }
  .dropdown-container{
    position:relative
  }
  .dropdown-list{
    position:absolute;
    list-style: none;
    padding:0;
    margin:0;
    width:100px;
    background:#fff;
    top:50px;
    left:-8px;
    text-align:center;
    height:0px;
    opacity:0;
    transition:opacity .3s linear;
  }
  .dropdown-list li{
    height:20px;
    line-height:20px;
    margin:10px 5px;
    display:none;
  }
  .dropdown-container:hover .dropdown-list{
    height:auto;
    opacity:1;
  }
  .dropdown-container:hover .dropdown-list li{
    display:block;
  }
  .downlist{
      width:100px;
      background:#fff;
    position:absolute;
    right:0;
    top:60px;
    text-align: center;
    line-height:0;
    box-shadow:3px 3px 5px 0px #ff4001
  }
  .downlist p{
    height:20px;
    line-height:20px;
  }
  .downlist p a{
    padding:0;
    margin:0;
  }
  /*页头购物车*/
  .cart-container{
    line-height:100px;
    height:80px;
    position:relative;
  }
  .cart-container a{
    width:30px;
    height:30px;
  }
  .cart{
    display:inline-block;
    width:30px;
    height:30px;
    background:url('../assets/img/icons_1.png') -204px -60px no-repeat;

  }
  .count{
    display:inline-block;
    width:30px;
    height:30px;
    background:url('../assets/img/icons_1.png') -265px -60px no-repeat;
    line-height:30px;
    position:absolute;
    top:25px;
    left:40px;
    padding-left:7px;
    text-align:left;
    color:#fff;
    font-size:10px;
  }
  /*页尾样式*/
  .footer{
    color:#3e3e3e;
    font-size:12px;
    padding: 40px 0 20px;
    background: #ebebeb;
    text-align:center
  }
  .footer div.row{
    height: 40px;
    line-height: 40px;
  }
  .footer .agent{
    width:50px;
    display:inline-block;
    margin-right:80px;
  }
  .footer .agent-pic{
    width:50px;
    height:50px;
    background:url('../assets/img/icons_1.png') -150px 0px  no-repeat;
    border-radius:50%;

  }
  .footer .wechat{
    width:50px;
    display:inline-block;
  }
  .footer .wechat-pic{
    width:50px;
    height:50px;
    border-radius:50%;
    background-color:#fff;
    position:relative;
    background:url('../assets/img/icons_1.png') -200px 0px  no-repeat;
  }
  .footer .wechat-pic .erweima{
    position:absolute;
    top:-500%;
    left:-150%;
    opacity:0;
    height:0;
    transition:opacity 0.4s linear;
  }
  .footer .wechat-pic:hover .erweima{
    height:auto;
    opacity:1;
  }
  .footer .wechat-pic .erweima img{
    display:none;
  }
  .footer .wechat-pic:hover .erweima img{
    display:block;
  }
</style>
