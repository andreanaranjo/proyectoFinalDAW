<template>
    <v-container fluid>
      <v-layout row wrap>
        <v-flex xs12 class="text-xs-center" mt-5>
          <h1>Error - Página no encontrada. Redirigiendo a home en 5s</h1>
        </v-flex>
      </v-layout>
    </v-container>
  </template>
  
  <script>
  export default {
    mounted() {
      setTimeout(() => router.push("/"), 5000)
    }
  }
  </script>