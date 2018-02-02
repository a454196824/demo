<template>
  <div>
    <div class="banner">
      <img :src="require('../assets/'+dataMsg[0].lg)" alt="">
    </div>
    <div  class="container-fluid main-goods">
      <!--标题价格等信息-->
      <div class="row">
        <div class="col-xs-12 col-sm-6">
          <div class="pro-info">
            <span class="pname">{{dataMsg[0].pname}} {{dataMsg[0].pnameen}}</span>
            <span class="price">¥{{dataMsg[0].price}}</span>
            <br><br>
            <p >提交订单或直接进入订单详情页即可上传语音</p>
          </div>
          <div class="sales-info">
            <p>优惠促销</p>
            <p class="orange">3月订单累计在线现金支付满298元（不含配送费）并在3月内完成配送，可获得价值98元大桔大利芝士蛋糕抵用券1张（该券于2018年4月9日前发放）</p>
          </div>
        </div>
        <!--右边标签页功能-->
        <div class="col-xs-12 col-sm-6">
          <p class="group-title">建议食用人数</p>
          <div class="tabs">
            <div class="tab">
              <div class="tab-title">2-4人食</div>
            </div>
            <br>
            <div class="tab-content clear">
              <div >
                <span>含5套餐具</span>
                <span>约13x13cm</span>
                <span>约450g</span>
                <span>甜度：适中</span>
              </div>
            </div>
          </div>
          <div class="group">
            <div>
              <div class="group-img"><img src="../assets/img/product/list_15884.jpg" alt=""></div>
              <div class="group-info">
                <span class="flag">[组合购]</span>
                <p>大桔大利芝士蛋糕 +78.00元换购</p>
              </div>
            </div>
            <div>
              <div class="group-img"><img src="../assets/img/product/list_16091.jpg" alt=""></div>
              <div class="group-info">
                <span class="flag">[组合购]</span>
                <p>柠檬蜜蛋糕(樱花粉) +109.00元换购</p>
              </div>
            </div>
            <div>
              <div class="group-img"><img src="../assets/img/product/list_16097.jpg" alt=""></div>
              <div class="group-info">
                <span class="flag">[组合购]</span>
                <p>柠檬蜜蛋糕(迷迭紫) +109.00元换购</p>
              </div>
            </div>
          </div>
          <div class="btns">
            <div class="add-cart">加入购物车</div>
            <router-link to="/cart"><div class="buy-now">立即购买</div></router-link>
          </div>
        </div>
      </div>
      <!--第一张图-->
      <div class="row">
        <div class="col-xs-12 ">
          <img :src="require('../assets/'+dataMsg[0].md1)" alt="">
        </div>
      </div>
      <!--第二张图-->
      <div class="row">
        <div class="col-xs-12">
          <img :src="require('../assets/'+dataMsg[0].md2)" alt="">
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12 col-sm-6">
          <img src="../assets/img/product/1.jpg" alt="">
        </div>
        <div class="col-xs-12 col-sm-6 text-center text-detail">
          <p>手工打发而成的进口鲜奶油</p>
          <p>口感绵密，精致细腻</p>
          <p>这份雪白让你有如获至宝的幸福感</p>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12 col-sm-6 text-center text-detail">
          <p>选用进口白巧克力</p>
          <p>极致工艺将白巧克力擦出</p>
          <p>如初雪般的轻柔</p>
          <p>触碰舌尖即化，甜蜜动人</p>
        </div>
        <div class="col-xs-12 col-sm-6">
          <img src="../assets/img/product/a.jpg" alt="">
        </div>
      </div>

    </div>
    <div class="container-fluid">
      <!--主要原材料-->
      <div class="row">
        <div class="col-xs-12 text-center">
          <div class="material-desc">
            <h4 >主要原材料</h4>
            <h5>Main raw materials</h5>
            <div class="sp">&nbsp;</div>
            <div class="inner">
              <h5><span>食材配比</span>                                                <span>产地</span></h5>
              <p><span>无盐黄油</span>                                                <span>新西兰</span></p>
              <p><span>白巧克力</span>                                                <span>比利时</span></p>
              <p><span>芝士</span>                                                <span>新西兰</span></p>
              <p><span>淡奶油</span>                        <span>法国</span></p>
            </div>
          </div>
        </div>
      </div>
      <!--快递发货-->
      <div class="row">
        <div class="col-xs-12">
          <img src="../assets/img/product/express.jpg" alt="" class="img-responsive">
        </div>
      </div>
      <div class="row">
        <div class="col-xs-12 col-sm-4 col-sm-offset-2 audio-desc">
          <h4 class="orange text-center">如何定制个性语音</h4>
          <div class="text-center">DIY radio</div>
          <div class="text-center"><img src="../assets/img/product/audio_icon1.jpg" alt=""></div>
          <div class="text-center"><img src="../assets/img/product/wave1.jpg" alt=""></div>
          <p><i>1</i> 成功提交订单后，添加录音</p>
          <p><i>2</i> 添加录音（时长限制21秒）</p>
          <p><i>3</i> 录制成功后，上传即可</p>
          <p><i>4</i> 收货人收到蛋糕后，微信扫描卡片上的二维码，即可倾听ta的心声</p>
        </div>
        <div class="col-xs-12 col-sm-4 col-sm-offset-2 edible">
          <h4 class="text-center">关于食用</h4>
          <h5 class="text-center">About edible</h5>
          <div class="text-center">
            <img src="../assets/img/product/fork1.jpg" alt="">
          </div>
          <p>适合季节：所有</p>
          <p>保鲜条件：冷藏0~4摄氏度</p>
          <p>食用方法：请收到蛋糕后2-3小时内食用</p>
          <p>温馨提示：蛋糕中出现的细小黑色颗粒为香草籽，</p>
          <p>此为香草荚未碾磨均匀带入的颗粒，可放心食用。</p>
          <p>*商品以实物为准。</p>
        </div>
      </div>
      <div class="row goods-desc">
        <div class="col-xs-12 col-sm-4 col-sm-offset-2">
          <div class="goods_desc text-center" v-html="dataMsg[0].details">

          </div>
        </div>
        <div class="col-xs-12 col-sm-6">
          <img src="../assets/img/product/a_002.jpg" alt="">
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
        return{
            pid:1,
            dataMsg:[],
        }
    },
    methods:{
        loadPage:function(){
            this.pid=this.$route.params.pid
            this.$http.get("http://127.0.0.1:3003/product_detail?pid="+this.pid).then((response)=>{
                this.dataMsg=response.data
                console.log(this.dataMsg[0])
            })

        }
    },
    created(){

    },
    mounted(){
      this.loadPage()
    }
  }
</script>
<style scoped>
  *{
    color:#333;
  }
  .clear:before{
    content:'';
    display:table;
  }
  .banner img{
    width:100%;
  }
  .main-goods img{
    width:100%
  }
  .orange{
    color:#ff4001;
  }
  /*商品信息*/
  .pname{
    height: 44px;
    font-size: 18px;
  }
  .price{
    font-size: 24px;
    color: #ff4001;
    float:right;
  }
  .pro-info{
    margin-top:20px;
    padding-left:40px;
  }
  .pro-info .pname{
    margin-left:-30px;
  }
  .sales-info{
    padding:10px 0 10px 40px;
    border-top:1px solid #ddd;
    border-bottom:1px solid #ddd;
  }
  .text-detail{
    padding-top:15%;
  }
  /*标签页*/
  .group-title{
    padding-top:16px;
    color: #949494;
    height: 28px;
    line-height: 28px;
  }
  .tabs .tab{
    list-style: none;
    padding:0;
    margin:0;
    border-bottom:1px solid #ff4001;
  }
  .tabs .tab-title{
    display:inline-block;
    width: 120px; height: 50px;
    line-height: 50px;
    text-align: center;
    color:#000;
    border:1px solid #ff4001;
    border-bottom:1px solid #fff;
    position:relative;
    top:1px;
  }

  .tabs .tab-content{
    width:100%;
    height:50px;
    line-height:50px;
    border-bottom:1px solid #ddd;
  }
  .tabs .tab-content span{
    display:inline-block;
    width:100px;
    text-align: center;
  }
  .group-img{
    display: inline-block;
  }
  .group-img img{
    height:80px;
    width:110px;
  }
  .group-info{
    display:inline-block;
    padding: 16px 30px;
    height: 48px;
  }
  .group-info .flag{
    color: #ff4001;
    height: 26px;
    line-height: 26px;
  }
  .add-cart{
    width: 260px;
    height: 48px;
    text-align: center;
    line-height: 48px;
    font-size: 18px;
    color: #fff;
    display:inline-block;
    background:url('../assets/img/product/cartBtns.png') no-repeat;
  }
  .buy-now{
    width: 260px;
    height: 48px;
    text-align: center;
    line-height: 48px;
    font-size: 18px;
    color: #fff;
    display:inline-block;
    background:url('../assets/img/product/cartBtns.png') -290px 0px no-repeat;
  }
  /*主要原材料*/
  .material-desc{
    padding:40px;
  }
  .material-desc .inner h5 span{
    font-size:16px;
    font-weight:bold;
  }
  .material-desc .inner span{
    display:inline-block;
    width: 250px;
    font-size: 14px;
  }
  .goods-desc{
    padding:50px 0;
    border-top:1px solid #ddd;
    border-bottom:1px solid #ddd;
  }
  .goods_desc div.sp{
    width: 54px;
    height: 1px;
    background: #ff4001;
    margin: 10px auto 20px;
  }
  .audio-desc,.edible{
    padding:40px 0 10px;
    margin-bottom:30px;
  }
  .audio-desc{
    border-right:1px solid #ddd;
  }
</style>
