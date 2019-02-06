import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import NavBar from '@/components/NavBar'
import HomePage from '@/components/HomePage'
import ProfileView from '@/components/ProfileView'
import AnnouncementsView from '@/components/AnnouncementsView'
import EventsView from '@/components/EventsView'
import LandingPage from '@/components/LandingPage'
import AboutPage from '@/components/AboutPage'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'LandingPage',
      component: LandingPage
    },
    {
      path: '/app',
      name: 'HomePage',
      component: HomePage,
      children: [
        {
          path: 'profile',
          component: ProfileView
        },
        {
          path: 'announcements',
          component: AnnouncementsView
        },
        {
          path: 'events',
          component: EventsView
        }
      ]
    },
    {
      path: '/about',
      name: 'AboutPage',
      component: AboutPage
    },
    {
      path: '/comp1',
      name: 'NavBar',
      component: NavBar
    }
  ]
})
