<template>
  <div >
    <div class="errImg">
      <img src="../assets/img/errorIcon.gif" alt="">
    </div>
    <div class="text">
      <h4>非常抱歉，商品或页面没有找到......</h4>
      <p>您浏览的页面暂时无法显示。这可能是因为输入的网址不正确或网页已经过期。</p>
      <p>您可以：</p>
      <p><router-link to="/index">{{num}}秒钟自动跳转到首页......</router-link></p>
      <p>
        <router-link to="/index"><span class="home">返回首页</span></router-link>
        <span class="back" @click="goBack">返回之前页面</span>
      </p>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
        return{
            timer:null,
            num:3
        }
    },
    methods:{
      goBack:function(){
          this.$router.go(-1)
      }
    },
    mounted(){
        this.timer=setInterval(()=>{
            this.num--
            if(this.num==0){this.$router.push("/index")}
        },1000)
    },
    destroyed(){
        clearInterval(this.timer)
    }
  }
</script>
<style scoped>
  .errImg{
    display: inline-block;
    margin-left:20%;
  }
  .text{
    display: inline-block;
    margin:100px 0;
    vertical-align: middle;
  }
  .home{
    display:inline-block;
    background:url('../assets/img/bg_notfound_404_home.gif');
    width:102px;
    height:30px;
    line-height:30px;
    padding-left:35px
  }
  .back{
    display: inline-block;
    background:url('../assets/img/bg_notfound_404_back.gif');
    width:142px;
    height:30px;
    line-height:30px;
    padding-left:30px;
    cursor:pointer;
  }
</style>
