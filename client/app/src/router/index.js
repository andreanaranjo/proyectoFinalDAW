import Vue from 'vue'
import Router from 'vue-router'


import HomePage from '@/components/app/HomePage'
import ProfileView from '@/components/app/ProfileView'
import AnnouncementsView from '@/components/app/AnnouncementsView'
import EventsView from '@/components/app/EventsView'


import LandingPage from '@/components/LandingPage'
import AboutPage from '@/components/AboutPage'
import WhatWeDoPage from '@/components/WhatWeDoPage'
import UpcomingEvents from '@/components/UpcomingEvents'
import Portfolio from '@/components/Portfolio'
import Contact from '@/components/Contact'
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
      path: '/what-we-do',
      name: 'WhatWeDo',
      component: WhatWeDoPage
    },
    {
      path: '/upcoming-events',
      name: 'Upcoming Events',
      component: UpcomingEvents
    },
    {
      path: '/portfolio',
      name: 'Portafolio',
      component: Portfolio
    },
    {
      path: '/contact',
      name: 'Contacto',
      component: Contact
    }
  ]
})
