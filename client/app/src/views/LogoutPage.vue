<template>
    <h2>Estamos cerrando tu sesión! Espera unos instantes y te redirigiremos a la página del inicio.</h2>
</template>

<script>
    export default {
        name: 'Logout',
        mounted(){
            setTimeout(() => {
                this.$store.dispatch('userLogout')
            }, 1000)
        }
    }
</script>