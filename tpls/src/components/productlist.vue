<template>
  <div>
    <div class="container-fluid">
      <div class="filter-wrap">
        <br>
        <div class="timer">
          <div>
            时刻:
          </div>
          <div>
            <ul>
              <li>全部</li>
              <li>浪漫时刻</li>
              <li>派对时刻</li>
              <li>纯真时刻</li>
              <li>午后时刻</li>
              <li>许愿时刻</li>
              <li>感恩时刻</li>
            </ul>
          </div>
        </div>
        <br>
        <div class="taste">
          <div>
            口味:
          </div>
          <div>
            <ul>
              <li>全部</li>
              <li>冰淇淋味</li>
              <li>奶油口味</li>
              <li>巧克力味</li>
              <li>慕斯口味</li>
              <li>拿破仑味</li>
              <li>芝士口味</li>
              <li>雪域口味</li>
              <li>鲜果口味</li>
            </ul>
          </div>
        </div>
        <br>
        <div class="spec">
          <div>
            规格:
          </div>
          <div>
            <ul>
              <li>全部</li>
              <li>2-4人食</li>
              <li>5-8人食</li>
              <li>10-12人食</li>
              <li>15-20人食</li>
              <li>其他</li>
            </ul>
          </div>
        </div>
        <br>
      </div>
      <div class="p-container">
        <div class="p-list">
          <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-3 text-center info-container " v-for="product in list">
              <div class="img-wrap">
                <router-link :to="'/productDetail/'+product.pid">

                  <img v-lazy="require('../assets/'+product.showpic)" alt="" class="lazy">
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
      <!--加入购物车成功显示-->
      <div class="addSuccess"></div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
        return {
            list:[],
            showBuyPop:false,
            pname:'',
            pnameen:'',
            showpic:'',
            pid:'',
            price:'',
        }
    },
    methods:{
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
        this.$http.get('http://127.0.0.1:3003/product_list')
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
      }
    },
    created(){
      this.loadProduct()
    },
    mounted(){

    }
  }
</script>
<style scoped>
  a:hover{
    text-decoration: none;
  }
  /*过滤模块样式*/
  div.filter-wrap div{
    height:20px;
    line-height:20px;
  }
  div.filter-wrap div div{
    float:left
  }
  div.filter-wrap ul{
    list-style: none;
  }
  div.filter-wrap ul>li{
    float:left;
    margin-right:20px;
    width:60px;
  }
  /*产品列表样式*/
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
  .p-list .info-container{
    margin-bottom:20px;
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
