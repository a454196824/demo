// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
//css
import './assets/css/bootstrap.css'
import './assets/css/font-awesome.css'
//js
import './assets/js/jquery'
import './assets/js/jquery.lazyload'
//让vue支持vue-resource

import VueResource from 'vue-resource'
Vue.use(VueResource);//支持VueResource这个插件

Vue.config.productionTip = false

import VueLazyload from 'vue-lazyload'
Vue.use(VueLazyload)//支持图片懒加载


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
