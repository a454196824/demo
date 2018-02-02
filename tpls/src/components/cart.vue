<template>
  <div>
    <div class="container">
      <div>
        <a href="javascript:;" class="back">继续购物</a>
        <h5 class="text-center">您的购物车（{{count}}）</h5>
      </div>
      <div class="goods-list ">
        <div class="goods-item row" v-for="item in list">
          <div class="col-xs-1 col-sm-1 goods-checked" >
            <a href="javascript:;" :class="{'check-btn':true,'checked':isChecked}" @click="toggleChecked(item.pid)"></a>
          </div>
          <div class="col-xs-4 col-sm-2 goods-img">
            <img :src="require('../assets/'+item.showpic)" alt="" class="img-responsive">
          </div>
          <div class="col-xs-6 col-sm-6 goods-detail">
            <p>{{item.pname}}</p>
            <p>{{item.pnameen}}</p>
            <p>2-4人食</p>
            <p>单价：¥ {{item.price}}</p>
          </div>
          <div class="col-xs-12 col-sm-3 ">
            <p class="price">小计：¥{{item.price*item.pcount}}</p>
            <p class="operate">
              <a href="javascript:;" class="reduce" @click="reduceCake(item.pid)"></a>
              <span class="p-count">{{item.pcount}}</span>
              <a href="javascript:;" class="add" @click="addCake(item.pid)"></a>
            </p>
          </div>
        </div>
        <p class="news">3月订单累计在线现金支付满298元（不含配送费）并在当月完成配送，可获得价值98元指定蛋糕抵用券1张（该券于2018年4月9日前发放），可兑换大桔大利芝士蛋糕或粉粉爱芝士蛋糕1个。</p>
      </div>
      <div class="parts">
        <h5 class="text-center">精品配件</h5>
        <div class="parts-content">
          <div class="part">
            <img src="../assets/img/cart/list_15826.jpg" alt="">
            <p>许愿树蜡烛(单品)</p>
            <p>¥39.00 <a href="javascript:;" class="add-part"></a></p>
          </div>
          <div class="part">
            <img src="../assets/img/cart/thumb_10838.jpg" alt="">
            <p>餐具(5套一组)</p>
            <p>¥2.50 <a href="javascript:;" class="add-part"></a></p>
          </div>
          <div class="part">
            <img src="../assets/img/cart/thumb_12278.jpg" alt="">
            <p>金色蜡烛</p>
            <p>¥10.00 <a href="javascript:;" class="add-part"></a></p>
          </div>
          <div class="part">
            <img src="../assets/img/cart/thumb_12663.jpg" alt="">
            <p>Happy Birthday蜡烛</p>
            <p>¥15.00 <a href="javascript:;" class="add-part"></a></p>
          </div>
          <div class="part">
            <img src="../assets/img/cart/thumb_10844.jpg" alt="">
            <p>I LOVE MAMA</p>
            <p>¥15.00 <a href="javascript:;" class="add-part"></a></p>
          </div>
        </div>
      </div>
    </div>
    <div class="fix-bottom container-fluid">
      <div class="row">
        <div class="col-xs-offset-2 col-xs-3 ">
          <a href="javascript:;" class="check-btn checked-all"></a>
          <span class="check-text">全选 | 共{{count}}件商品，已选择1件</span>
        </div>
        <div class="col-xs-offset-1 col-xs-2">
          <span>合计（不含运费）: <b class="price">¥78.00</b></span>
        </div>
        <div class="col-xs-3">
          <button class="order-btn">结算</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
      return {
          count:0,
          list:[],
          isChecked:false,
      }
    },
    methods:{
        getCount(){
            this.$http.get("http://127.0.0.1:3003/cart_count").then((response)=>{
              this.count=response.data[0].num
            })
        },
        loadCart(){
            this.$http.get("http://127.0.0.1:3003/loadCart").then((response)=>{
                this.list=response.data
                console.log(this.list)
            })
        },
        addCake(pid){
            this.$http.get("http://127.0.0.1:3003/addCake?pid="+pid).then((response)=>{
                this.getCount()
                this.loadCart()
                this.$parent.loadCartCount()
            })
        },
        reduceCake(pid){
          this.$http.get("http://127.0.0.1:3003/deleteItem?pid="+pid).then((response)=>{
            this.getCount()
            this.loadCart()
            this.$parent.loadCartCount()
          })
        },
        toggleChecked(pid){
          this.isChecked=!this.isChecked
          var ischecked=this.isChecked?1:0
          this.$http.get("http://127.0.0.1:3003/is_checked?pid="+pid+"&ischecked="+ischecked)
        }
    },
    created(){
        this.getCount()
        this.loadCart()
    },
    mounted(){

    }
  }
</script>
<style scoped>
  .back{
    color:#000;
    font-size:10px;
    text-decoration: none;
  }

  .back:before{
    content: '';
    display: inline-block;
    width: 16px;
    height: 16px;
    background: url(../assets/img/icons_1.png) -162px -63px no-repeat;
  }
  div.goods-item>div{
    height:120px;
    padding-top:10px;
  }
  div.goods-item>div>p{
    font-size:10px;

  }
/*购物车产品详细*/
  div.goods-item{
    padding:20px 0;
  }
  div.goods-item>div.goods-checked{
    padding-top:40px;
  }
  .check-btn{
    display:inline-block;
    width:20px;
    height:20px;
    background:url('../assets/img/icons_1.png') -115px -66px no-repeat;
  }
  .check-btn.checked{
    background:url('../assets/img/icons_1.png') -66px -66px no-repeat;
  }
  .goods-img{
    padding-top:10px;
  }
  .price{
    color: #ff4001;
    text-align: right;
  }
  .operate{
    margin-top:60px;
    text-align:right;
  }
  .reduce{
    display:inline-block;
    width:20px;
    height:20px;
    background:url("../assets/img/icons_1.png") -165px -115px no-repeat;
  }
  .add{
    display:inline-block;
    width:20px;
    height:20px;
    background:url("../assets/img/icons_1.png") -115px -115px no-repeat;
  }
  .p-count{
    width:50px;
    height:20px;
    display:inline-block;
    vertical-align: top;
    line-height:20px;
    text-align: center;
  }
  .news{
    color: red;
    text-align: center;
    padding: 20px 0px;
    font-size:10px;
  }
/*end  */
/*配件信息*/
  .part{
    display:inline-block;
    margin-left:20px;
    margin-bottom:30px;
  }
  .part img{
    width:160px;
  }
  .part p{
    text-align: center;
  }
  .add-part{
    display:inline-block;
    width:20px;
    height:20px;
    background:url("../assets/img/icons_1.png") -216px -114px no-repeat;
  }
  .fix-bottom{
    height:80px;
    background:#fff;
    border-top:1px solid #ddd;
    position:fixed;
    bottom:0;
    width:100%;
    z-index:100
  }
  .fix-bottom>div.row div{
    height:80px;
    line-height:80px;
  }
  .checked-all{
    position:relative;
    top:6px;
  }
  .check-text{
    display:inline-block;
    vertical-align:top;
  }
  .order-btn{
    width: 250px;
    height: 60px;
    line-height: 60px;
    text-align: center;
    font-size: 18px;
    color: #ffffff;
    background: #ff4001;
    border:none;
    outline:none;
  }
</style>
