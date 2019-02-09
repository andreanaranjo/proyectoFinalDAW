import Vue from "vue";
import Router from "vue-router";
import Dashboard from "./views/Dashboard"

Vue.use(Router);

export default new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'Dashboard',
      component: Dashboard
    },
    {
      path: '/profile',
      component: () => import('./views/ProfileView')
    },
    {
      path: '/announcements',
      component: () => import('./views/AnnouncementsView')
    },
    {
      path: '/events',
      component: () => import('./views/EventsView')
    }
  ]
});
