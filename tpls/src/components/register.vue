<template>
  <div>
    <div class="container-fluid banner-bg">
      <div class="login">
        <p class="title">账户密码登录</p>
        <p>
          <input type="text" placeholder="请输入账号" v-model="uname" @blur="valiuname()">
          <span :class='{"detail":true,"err":showunameerr}'>10个字符以内的字母、数字或下划线的组合</span><br>
          <span class="err" v-show="showunameerr">用户名不符合规定</span>
          <br>
          <span class="err" v-show="queryuname">用户名已被注册</span>
        </p>
        <p>
          <input type="password" placeholder="请输入密码" v-model="upwd" @blur="valiupwd()">
          <span :class='{"detail":true,"err":showupwderr}'>6位数字</span><br>
          <span class="err" v-show="showupwderr">密码不符合规定</span>

        </p>
        <p>
          <input type="password" placeholder="请再次输入密码" v-model="againupwd" @blur="valiagain()">
          <span v-show="againupwderr" class="err">两次密码不一致</span>
        </p>
        <p>
          <input type="button" value="立即注册" class="login-btn" @click="register()">
        </p>

      </div>
    </div>
  </div>
</template>
<script>
  export default{
    data(){
        return {
            uname:'',
            upwd:'',
            showunameerr:false,
            showupwderr:false,
            againupwd:'',
            againupwderr:false,
            queryuname:false
        }
    },
    methods:{
        valiuname(){
            var reg=/^\w{1,10}$/
            if(!reg.test(this.uname)){
                this.showunameerr=true
            }else{
              this.showunameerr=false
            }
            this.$http.get("http://127.0.0.1:3003/valiuname?uname="+this.uname).then((response)=>{
                if(response.data!=null){
                  this.queryuname=true
                }else{
                  this.queryuname=false
                }
            })
        },
        valiupwd(){
            var reg=/^\d{6}$/
            if(!reg.test(this.upwd)){
                this.showupwderr=true
            }else{
                this.showupwderr=false
            }
        },
        valiagain(){
          this.againupwderr=this.againupwd!==this.upwd
        },
        register(){
//            if(!this.showunameerr&&!this.showupwderr&&this.againupwderr){
            this.$http.post("http://127.0.0.1:3003/register",{uname:this.uname,upwd:this.upwd},{emulateJSON: true}).then((response)=>{
                alert(response.data.msg)
            })
//            }
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

  .detail{
    color:green;
  }
  .err{
    color:red;
  }
</style>
