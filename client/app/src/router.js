import Vue from 'vue'
import Router from 'vue-router'
import LandingPage from './views/LandingPage'
Vue.use(Router)

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'LandingPage',
      component: LandingPage
    },
    {
      path: "/dashboard",
      name: "Dashboard",
      component: () => import('./views/Dashboard'),
      meta: {requiresAuth: true}
    },
    {
      path: '/profile',
      component: () => import('./views/ProfileView'),
      meta: {requiresAuth: true}
    },
    {
      path: '/announcements',
      component: () => import('./views/AnnouncementsView'),
      meta: {requiresAuth: true}
    },
    {
      path: '/events',
      component: () => import('./views/EventsView'),
      meta: {requiresAuth: true}
    },
    {
      path: '/login',
      component: () => import('./views/LoginPage')
    },
    {
      path: '/logout',
      component: () => import('./views/LogoutPage')
    }
  ]
})
router.beforeEach((to, from, next) => {
  const requiresAuth = to.matched.some(record => record.meta.requiresAuth)
  const isAuthenticated = true;
  if (requiresAuth && !isAuthenticated){
    next("/login")
  } else {
    next()
  }
})



export default router