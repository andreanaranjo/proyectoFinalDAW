<template>
    <ul class="nav">
        <li>
            <router-link to="/">
                <i class="pe-7s-graph"></i>
                <p>Dashboard</p>
            </router-link>
        </li>
        <li>
            <router-link to='/announcements'>
                <i class="pe-7s-speaker"></i>
                <p>Anuncios</p>
            </router-link>
        </li>
        <li>
            <router-link to='/events'>
                <i class="pe-7s-date"></i>
                <p>Eventos</p>
            </router-link>
        </li>
        <li>
            <router-link to='/profile' >
                <i class="pe-7s-user"></i>
                <p>Perfil del usuario</p>
            </router-link>
        </li>
    </ul>
</template>

<script>
    export default {
        name: 'AppNav'
    }
</script>

<style scoped>
    
</style>