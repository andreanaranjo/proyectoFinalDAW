<template>
    <div>
        <div slot="header">
            <h3>{{anuncio.title}}</h3>
            <p>Fecha: {{anuncio.updated_at}}</p>
        </div>
        <v-card>
        <v-card-text>
            <p>{{anuncio.fulltext}}</p>
            <p>Autor: {{anuncio.member_id}}</p>
        </v-card-text>
        </v-card>
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