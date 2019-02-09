<template>
    <ol>
        <li>
            <router-link to="/">Dashboard</router-link>
        </li>
        <li>
            <router-link to='/announcements'>Anuncios</router-link>
        </li>
        <li>
            <router-link to='/events' >Eventos</router-link>
        </li>
        <li>
            <router-link to='/profile' >Perfil</router-link>
        </li>
    </ol>
</template>

<script>
    export default {
        name: 'AppNav'
    }
</script>

<style scoped>
    ol li{
        display: inline;
    }
</style>