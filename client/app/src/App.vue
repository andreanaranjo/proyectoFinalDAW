<template>
  <v-app>
    <v-navigation-drawer class="blue lighten-3" dark fixed app v-model="drawer" clipped>
      
      <v-list>
        <v-list-tile
        v-for="item in items"
        :key="item.title"
        @click=""
        >
        <v-list-tile-action>
          <v-icon>{{ item.icon }}</v-icon>
        </v-list-tile-action>
        
        <v-list-tile-content>
          <v-list-tile-title>
            <router-link :to="item.to"> 
              {{ item.title }}
            </router-link>
            
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-navigation-drawer>
  <v-toolbar dark color="primary" flat app absolute clipped-left>
    <!--Icono para abrir el nav drawer-->
    
    
    <v-toolbar-side-icon @click.native="drawer = !drawer"></v-toolbar-side-icon>
    
    
    <v-toolbar-title class="white--text">Suitcase Club</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-btn icon ></v-btn>
  </v-toolbar>
  
  
  <v-content>
    <router-view/>
  </v-content>
</v-app>
</template>

<script>
  
  export default {
    name: 'App',
    components: {
    },
    data () {
      return {
        drawer: null,
        items: [
        { title: 'Dashboard', icon: 'dashboard', to: "/" },
        { title: 'Anuncios', icon: 'notifications_active', to: "/announcements" },
        { title: 'Eventos', icon: 'calendar_today', to: "/events"},
        { title: 'Perfil', icon: 'account_box',to:"/profile" }
        ]
      }
    }
  }
</script>
