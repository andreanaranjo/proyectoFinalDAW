import Vue from 'vue'
import Router from 'vue-router'
import Dashboard from '@/components/app/Dashboard'
import ProfileView from '@/components/app/ProfileView'
import AnnouncementsView from '@/components/app/AnnouncementsView'
import EventsView from '@/components/app/EventsView'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Dashboard',
      component: Dashboard
    },
    {
      path: '/profile',
      component: ProfileView
    },
    {
      path: '/announcements',
      component: AnnouncementsView
    },
    {
      path: '/events',
      component: EventsView
    }
  ]
})
