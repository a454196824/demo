import Vue from 'vue'
import Router from 'vue-router'
import Main from '@/components/main'
import Index from '@/components/index'
import Login from '@/components/login'
import Register from '@/components/register'
import ProductDetail from '@/components/productDetail'
import ProductList from '@/components/productlist'
import Cart from '@/components/cart'
import NotFound from '@/components/notfound'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      component: Main,
      children:[
        {path:'/',component:Index},
        {path:'/index',component:Index},
        {path:'/productdetail/:pid',component:ProductDetail},
        {path:'/productlist',component:ProductList},
        {path:'/login',component:Login},
        {path:'/register',component:Register},
        {path:'/cart',component:Cart},
        {path:'/*',component:NotFound}
      ]
    }
  ]
})
