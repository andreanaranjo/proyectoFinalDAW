<template>
    <div>
        <h2>Anuncios recientes</h2>
        <AnnouncementShow v-for="a in anuncios" :anuncio="a"/>
    </div>
</template>

<script>
    import AnnouncementShow from '@/components/AnnouncementShow'
    import axios from 'axios';
    export default {
        name: 'AnnouncementsView',
        components: {
            AnnouncementShow
        },
        data () {
            return {
                anuncios: {}
            }
        },
        mounted() {
            let hostname = "http://localhost:3000"
            axios
            .get(hostname+'/api/v1/announcements')
            .then( r => this.anuncios = r.data)
            .catch(error => console.log(error))
        }
    }
</script>