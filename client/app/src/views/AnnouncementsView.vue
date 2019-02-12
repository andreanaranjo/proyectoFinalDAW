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
                <v-list-tile v-for="anuncio in anunciosMiembro">
                    <MyAnnouncementsShow :a="anuncio"/>
                </v-list-tile>
        </v-list>
    </div>
</template>

<script>
    import AnnouncementShow from '@/components/AnnouncementShow'
    import MyAnnouncementsShow from '@/components/MyAnnouncementsShow'

    export default {
        name: 'AnnouncementsView',
        components: {
            AnnouncementShow,
            MyAnnouncementsShow
        },
        data () {
            return {
                id: 0,
                panel: [],
                anuncios: {},
                anunciosMiembro: [],
                items: 5
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
        }
        }
    }
</script>