<template>
    <div>
        <h2>{{anuncio.title}}</h2>
        <p>{{anuncio.fulltext}}</p>
        <p>Autor: {{anuncio.member_id}}</p>
    </div>
</template>

<script>
    export default {
        name: 'AnnouncementShow',
        props: ['anuncio']
    }
</script>

<style scoped>
    
</style>