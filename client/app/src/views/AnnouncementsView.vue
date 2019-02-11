<template>
    <div>
        <h2 align = "center">Anuncios recientes</h2>
        <div class="d-flex justify-between align-center mb-3">
        <v-btn @click="all">Todos</v-btn>
        <v-btn @click="none">Ninguno</v-btn>
        </div>

        <v-expansion-panel
        v-model="panel"
        expand
        >
        <v-expansion-panel-content v-for="(a,i) in anuncios" :key="i">
            <AnnouncementShow :anuncio="a"/>
        </v-expansion-panel-content>
        </v-expansion-panel>
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
                panel: [],
                anuncios: {},
                items: 10
            }
        },
        mounted() {
            let API = this.$store.getters.api
            API
            .get('announcements')
            .then( r => this.anuncios = r.data)
            .catch(error => console.log(error))
        },
        methods: {
        all () {
            this.panel = [...Array(this.items).keys()].map(_ => true)
        },
        // Reset the panel
        none () {
            this.panel = []
        }
        }
    }
</script>