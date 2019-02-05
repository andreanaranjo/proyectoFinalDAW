import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import NavBar from '@/components/NavBar'
import HomePage from '@/components/HomePage'
import ProfileView from '@/components/ProfileView'
import AnnouncementsView from '@/components/AnnouncementsView'
import EventsView from '@/components/EventsView'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
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
      path: '/comp1',
      name: 'NavBar',
      component: NavBar
    }
  ]
})
