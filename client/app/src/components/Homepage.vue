<template>
    <div>
        <h2>Hola! Placeholder para usuario</h2>
        <ol>
            <li>
                <router-link to='/app/announcements'>Anuncios</router-link>
            </li>
            <li>
                <router-link to='/app/events' >Eventos</router-link>
            </li>
            <li>
                <router-link to='/app/profile' >Perfil</router-link>
            </li>
        </ol>
        <router-view/>
    </div>
    
</template>

<script>
    
</script>

<style scoped>
    ol li{
        display: inline;
    }
</style>