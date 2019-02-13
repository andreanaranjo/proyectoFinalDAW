<template>
    <div>
        <h2 align = "center">Anuncios recientes</h2>
        <br>
        <div class="d-flex justify-between align-center mb-3">
            <v-btn @click="all">Todos</v-btn>
            <v-btn @click="none">Ninguno</v-btn>
        </div>
        <br>
        <v-expansion-panel
        v-model="panel"
        expand
        >
        <v-expansion-panel-content v-for="(a,i) in anuncios" :key="i">
            <AnnouncementShow :anuncio="a"/>
        </v-expansion-panel-content>
    </v-expansion-panel>
    <v-list subheader>
        <v-subheader>Mis anuncios</v-subheader>
        <v-list-tile v-for="anuncio in anunciosMiembro" :key="anuncio.id">
            <v-list-tile-content>
                <v-list-tile-title>{{anuncio.title}}</v-list-tile-title>
            </v-list-tile-content>
            <AnnouncementUD :anuncio="anuncio" :index="anuncio.id" :v-on:update:announcement="updateAnnouncement"/>
    </v-list-tile>
</v-list>
</div>
</template>

<script>
    import AnnouncementShow from '../components/AnnouncementShow'
    import AnnouncementUD from "../components/AnnouncementUD";

    export default {
        name: 'AnnouncementsView',
        components: {
            AnnouncementUD,
            AnnouncementShow,
        },
        data () {
            return {
                expandView:false,
                id: 0,
                panel: [],
                anuncios: [],
                anunciosMiembro: [],
                items: 5,
                valid: false
            }
        },
        mounted() {
            let API = this.$store.getters.api
            API
            .get('announcements')
            .then( r => this.anuncios = r.data)
            .catch(error => console.log(error))
            API
            .get(`anuncios/by/${this.$store.state.member_id}`)
            .then( response => this.anunciosMiembro = response.data)
            .catch(error => console.log(error))
        },
        methods: {
            all () {
                this.panel = [...Array(this.items).keys()].map(_ => true)
            },
            // Reset the panel
            none () {
                this.panel = []
            },
            updateAnnouncement(announcement, index) {
                this.anunciosMiembro.splice(index, 1, announcement)
            }
        }
    }
</script>

