<template>
  <div>
    <div class="container-fluid banner-bg">
      <div class="login">
        <p class="title">账户密码登录</p>
        <p>
          <input type="text" placeholder="请输入账号" v-model="uname">

        </p>
        <p>
          <input type="password" placeholder="请输入密码" v-model="upwd">
          <span class="err" v-show="false">*账户名或密码错误</span>
        </p>
        <p>
          <input type="button" value="立即登录" class="login-btn" @click="login()">
        </p>
        <p>
          <a href="#">忘记密码</a>
          <span class="right">还没有账号？ <router-link to="/register" class="register">立即注册</router-link></span>
        </p>
      </div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
        return {
            uname:"",
            upwd:""
        }
    },
    methods:{
        login(){
          this.$http.get("http://127.0.0.1:3003/login?uname="+this.uname+"&upwd="+this.upwd).then((response)=>{
              if(response.data){
                this.$router.push("/index")
              }
              this.$parent.loginStatus()
          }
          )
        }
    }
  }
</script>
<style scoped>
  a{
    text-decoration: none;
  }
  .banner-bg{
    background:url('../assets/img/login/988F8878E3A5C398C8BD9924AB021C93.jpg') no-repeat center;
    height:520px;
    position:relative;
  }
  div.login{
    background:#fff;
    width:370px;
    height:auto;
    padding:20px 60px;
    position:absolute;
    right:100px;
    top:50px;
    opacity:0.9;
  }
  .login p{
    margin-bottom:30px;
  }
  .title{
    color:#ff4001;
    font-size:16px;
  }
  .login input{
    width:100%;
    padding-left:20px;
    height:30px;
    border: none;
    outline:none;
    border-bottom:1px solid #ddd;
    font-size:14px;
  }
  .login .login-btn{
    height:50px;
    background:#ff4001;
    color:#fff;
  }
  .login .right{
    float:right;
  }
  .login .register{
    color:#ff4001
  }
  .err{
    color:red;
  }
</style>
