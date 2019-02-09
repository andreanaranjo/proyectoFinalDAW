<template>
    <div>
        <h2>{{anuncio.title}}</h2>
        <p class="authorname">Autor: {{anuncio.member_id}}</p>
        <p>{{anuncio.fulltext}}</p>
    </div>
</template>

<script>
    export default {
        name: 'AnnouncementShow',
        props: ['anuncio']
    }
</script>

<style scoped>
    h2 {
        font-weight: bold;
    }
    .authorname {
        color: gainsboro;
    }
    
</style>