<template>
  <div id="app">
    <AppNav/>
    <router-view/>
  </div>
</template>

<script>
  import AppNav from '@/components/app/AppNav'
  export default {
    name: 'App',
    components: {
      AppNav
    }
  }
</script>

<style>
  

</style>