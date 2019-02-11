<template>
  <v-app>
    <v-navigation-drawer class="blue lighten-3" dark fixed app v-model="drawer" clipped>
      
      <v-list>
        <v-list-tile
        v-for="item in items"
        :key="item.title"
        @click=""
        v-show="isAuthenticated && item.requires_auth || !isAuthenticated && !item.requires_auth"
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
        drawer: false,
        items: [
        { title: 'Dashboard', icon: 'dashboard', to: "/dashboard", requires_auth: true },
        { title: 'Anuncios', icon: 'notifications_active', to: "/announcements" , requires_auth: true},
        { title: 'Eventos', icon: 'calendar_today', to: "/events", requires_auth: true},
        { title: 'Perfil', icon: 'account_box',to:"/profile", requires_auth: true},
        { title: 'Iniciar sesión', icon: "lock_open", to:"/login", requires_auth: false},
        { title: 'Cerrar sesión', icon: "lock", to: "/logout", requires_auth: true}
        ]
      }
    },
    computed:{
      isAuthenticated () {
        // return $store.logged_in && item.requires_auth || !$store.logged_in && !item.requires_auth
        return this.$store.state.logged_in
      }
    }

    
  }
</script>
