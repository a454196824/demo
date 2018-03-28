<template>

  <div class="container-fluid">
    <div class="fix-bg"></div>
    <div class="banner-img">
      <div class="slide slide-1 fadeIn">
        <img src="../assets/img/index/58F5B11DF36F5A5950343EC83CCB77D0.jpg" alt="" >
      </div>
      <div class="slide slide-2">
        <img src="../assets/img/index/69970AA1707AEDEB560579FA99F33493.jpg" alt="" >
      </div>
      <div class="slide slide-3">
        <img src="../assets/img/index/CC7A4AB5C50878E39829039F3D1585DE.jpg" alt="" >
      </div>
      <div class="slide slide-4">
        <img src="../assets/img/index/E7AB8D8CE1F9692922524B045ACFAB16.jpg" alt="" >
      </div>
      <ul class="point-container">
        <li class="point checked" data-pic="0"></li>
        <li class="point" data-pic="1"></li>
        <li class="point" data-pic="2"></li>
        <li class="point" data-pic="3"></li>
      </ul>
    </div>
    <div class="floor1 text-center">
      <router-link to="/productDetail/1"><img src="../assets/img/index/BFA6C33967B35EB05448F066D7C893CD.jpg" alt=""></router-link>
      <p></p>
      <p>雪域牛乳芝士蛋糕 Le Cheesecake</p>
    </div>
    <div class="floor2 text-center">
      <router-link to="/productDetail/2"><img src="../assets/img/index/3D118343306CCCBB33B283250677ADFE.jpg" alt=""></router-link>
      <p></p>
      <p>金桔满堂蛋糕 Orange Mousse Cake</p>
    </div>
    <div class="floor3 text-center">
      <router-link to="productDetail/11"><img src="../assets/img/index/9380A2CA5A70A089BA0D80148D0DF299.jpg" alt=""></router-link>
      <p></p>
      <p>美刀刀蛋糕 Ms. Golden</p>
    </div>
    <div class="p-container">
      <div class="p-top text-center">
        <h2>诺心推荐</h2>
        <h4></h4>
        <h3>lecake recommend</h3>
      </div>
      <div class="p-list">
        <div class="row">
          <div class="col-xs-12 col-sm-6 col-md-3 text-center info-container " v-for="product in list">
            <div class="img-wrap">
              <router-link :to="'/productDetail/'+product.pid">

                <img v-lazy="require('../assets/'+product.showpic)" alt="">
              </router-link>

            </div>
            <div class="p-info">
              <div class="p-info-content">
                <p class="p-name"><span class="tag">人气爆款</span>{{product.pname}}</p>
                <p class="p-price">¥{{product.price}}</p>
                <p class="p-advice">建议食用人数2-4人食</p>
                <button class="p-btn" @click="openBuyPop(product.pname,product.price,product.pid,product.pnameen,product.showpic)">加入购物车</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--点击加入购物车显示-->
    <div class="buy-pop" v-show="showBuyPop">
      <div class="b-header">
        <h5>加入购物车</h5>
        <a href="javascript:;" class="close-btn" @click="closeBuyPop()"></a>
      </div>
      <div class="b-main">
        <div class="p-item">
          2-4人食
        </div>
        <div class="p-detail">
          <div class="p-middle">
            <div class="left">
              <h4 class="pname"> {{this.pname}}</h4>
              <h5 class="pnameen">{{this.pnameen}}</h5>
            </div>
            <div class="right">
              <h5>¥{{this.price}}</h5>
            </div>
          </div>
          <div class="p-bottom">
            <p class="">口味：雪域</p>
            <p>约13x13cm</p>
            <p>含5套餐具</p>
            <p>甜度：中等</p>
            <p>约450g</p>
          </div>
        </div>
      </div>
      <div>
        <a href="javascript:;" class="b-btn" @click="addCart">加入购物车</a>
      </div>
    </div>
    <div class="cover" v-show="showBuyPop"></div>

  </div>
</template>
<script>
  export default{
      data(){
          return {
              timer:null,
              height:0,
              showBuyPop:false,
              list:[],
              pname:'',
              pnameen:'',
              showpic:'',
              pid:'',
              price:'',
          }
      },

      methods:{
        bannerSlide:function(num){
          this.timer=setInterval(()=>{
            $($('.slide')[num]).addClass('fadeIn').siblings().removeClass('fadeIn')
            $($('.point')[num]).addClass('checked').siblings().removeClass('checked')
            num++
            if(num>3){
              num = 0
            }
          },2000)

        },
        //关闭确认加入购物车模块
        closeBuyPop:function(){
            this.showBuyPop=false
        },
        //通过参数给确认加入购物车模块传值
        openBuyPop:function(pname,price,pid,pnameen,showpic){
          this.showBuyPop=true
          this.pname=pname
          this.pnameen=pnameen
          this.showpic=showpic
          this.pid=pid
          this.price=price
        },
        loadProduct:function(){
          this.$http.get('http://127.0.0.1:3003/product_list_index')
            .then((response) => {
              this.list=response.data
            })
        },
        addCart:function(){
          this.$http.get('http://127.0.0.1:3003/addcart?pid='+this.pid+'&pname='+this.pname+'&pnameen='+this.pnameen+'&showpic='+this.showpic+'&price='+this.price)
            .then((response) => {
              console.log(response.data.msg)
              this.$parent.loadCartCount()
            })
          this.closeBuyPop()
        }
      },
      created(){
        this.loadProduct()
      },
      mounted(){
          //设置轮播模块的高
            setTimeout(()=>{
              this.height=$('.slide-1 img').height()
            },100)

            $(window).resize(()=>{
                this.height=$('.slide-1 img').height()
            })

          //设置轮播功能
          var num=1
          this.bannerSlide(num)
          $('.point').on('mouseover',(e)=>{
              clearInterval(this.timer)
              var $tar=$(e.target)
              $tar.addClass('checked').siblings().removeClass('checked')
              var num=$(e.target).data('pic')
            $($('.slide')[num]).addClass('fadeIn').siblings().removeClass('fadeIn')
          })
          $('.point').on('mouseout',(e)=>{
              var num=$(e.target).data('pic')
              this.bannerSlide(num)
          })
      },
      watch:{
          height:function(){
              $(".banner-img").height(this.height)
          }
      },
      destroyed(){
          clearInterval(this.timer)
      }
  }
</script>
<style scoped>
  p{margin:20px auto}
  .fix-bg{
    height: 270px;
    background:url('../assets/img/bg_1.jpg') no-repeat;
    background-size:100% 100%;
    width:100%;
  }
  a:hover{
    text-decoration: none;
  }
  /*轮播图样式*/
  .banner-img{
    position:relative;
    margin:30px 0;
  }
  img{
    width:100%;
  }
  .banner-img div{
    position:absolute;
    top:0;
    z-index:0;
    opacity:0;
    transition:all 0.3s linear;
  }
  .banner-img div img{
    width:100%;
  }
  .banner-img div.fadeIn{
    opacity: 1;
    z-index:10;
  }
  .banner-img .point-container{
    position:absolute;
    bottom:10px;
    left:50%;
    margin-left:-100px;
    z-index:11;
    list-style: none;
    width:200px;
  }
  .banner-img .point-container .point{
    border-radius: 50%;
    width:12px;
    height:12px;
    background:#fff;
    float:left;
    margin-right:10px;
    cursor:pointer;
  }
  .banner-img .point-container .point.checked{
    background:red;
  }

  /*产品列表样式*/
  .p-container .p-top{
    color: #505050;
  }
  .p-container .p-top h2{
    font-size: 20px;
    height: 44px;
    line-height: 44px;
  }
  .p-container .p-top h4{
    width: 40px;
    height: 1px;
    margin: auto;
    background: #ff501b;
  }
  .p-container .p-top h3{
    font-size:12px;
    height: 20px;
    line-height: 20px;
  }
  .p-list .p-info{
    padding-top:20px;
    height:90px;
    overflow:hidden;
  }
  .p-list .p-info .p-info-content{
    position:relative;
    top:0;
    transition:all 0.2s linear;
  }
  .p-list .info-container{
    margin-bottom:20px;
  }
  .p-list .info-container:hover .p-info-content{
    top:-25px;
  }
  .p-list .img-wrap img{
    width:100%;
  }
  .p-list p{
    margin:5px auto;
  }
  .p-list .tag{
    display:inline-block;
    background:#ff4001;
    margin-right:2px;
    border-radius: 2px;
    padding:0 2px;
    font-size:12px;
    color:#fff;
  }
  .p-list .p-price{
    color:#ff4001;
    font-weight:bold;
  }
  .p-list .p-name{
    font-size:14px;
  }
  .p-list .p-btn{
    background:#ff4001;
    border:none;
    border-radius:2px;
    color:#fff;
    outline:none;
  }
  /*加入购物车样式*/
  .buy-pop{
    position: fixed;
    width: 450px;
    height: auto;
    top: 50%;
    left: 50%;
    margin-left: -225px;
    margin-top: -240px;
    z-index: 1001;
    background: #fff;
    font-size: 14px;

  }
  .b-header{
    padding:10px 20px;
    border-bottom:1px solid #ddd;
  }
  .b-header h5{
    display:inline-block;
  }
  .b-header .close-btn{
    display: inline-block;
    width:30px;
    height:30px;
    cursor:pointer;
    float:right;
    background:url('../assets/img/icons_1.png') -10px -160px no-repeat;
  }
  .p-bottom p{
    display:inline-block;
    width:100px;
    margin:10px;
    padding:0px;
    font-size: 12px;
  }
  .b-main .p-item{
    padding:25px;
    font-size:12px;
  }
  .b-main .p-detail .p-middle{
    margin:10px 20px;
    border-bottom:1px solid #ddd;
  }
  .b-main .p-detail .p-middle .pnameen{
    color: #949494;
  }
  .left,.right{
    display: inline-block;
    vertical-align: top;
  }
  .right{
    float: right;
    color:#ff4001;
    font-weight:bold;
  }
  .b-main .p-detail .p-bottom{
    margin:10px 20px;
    border-bottom:1px solid #ddd;
  }
  .buy-pop .b-btn{
    display: block;
    width: 192px;
    height: 56px;
    line-height: 56px;
    text-align: center;
    background: #ff4001;
    color: #ffffff;
    margin:10px auto;
  }
  .cover{
    width:120%;
    height:100vh;
    background:rgba(0,0,0,0.6);
    position:fixed;
    top:0;
    left:-100px;
    z-index:1000;
  }
</style>
