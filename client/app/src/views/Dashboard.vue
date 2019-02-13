<template>
    <v-container>
        <h2>Próximos eventos</h2>
        <v-layout row wrap v-if="eventos.length > 0">
            <v-flex lg3 xs12 v-for="e in listaEventos" class="eventos">
                <v-card max-width="400"    >
                    <v-responsive contain>
                        <v-img src="//via.placeholder.com/350x150"/>
                    </v-responsive>
                    <v-card-title primary-title>
                        <EventShow :event="e"/>
                    </v-card-title>
                    <v-card-actions>
                        
                    </v-card-actions>
                </v-card> 
            </v-flex> 
        </v-layout>
        <p v-else>Hubo un error al contactar la API</p>
        <v-spacer></v-spacer>
        <h2 v-if="anuncios.length > 0">Anuncios recientes</h2>
        <v-layout row wrap v-if="anuncios.length > 0">
            <v-flex lg3 xs12 v-for="a in listaAnuncios" class="anuncios">
                <v-card max-width="400">
                    <v-responsive contain>
                            <v-img src="//via.placeholder.com/350x150"/>
                    </v-responsive>
                    <v-card-title primary-title>
                        <AnnouncementShow :anuncio="a" />
                    </v-card-title>
                </v-card>
            </v-flex>
        </v-layout>
        <h2 v-else>Hubo un error al obtener los anuncios</h2>
        <h2>Miembros</h2>
        <v-layout row wrap v-if="miembros.length > 0">
            <v-flex lg3 xs12 v-for="m in listaMiembros" class="miembros">
                <v-card>
                        <v-responsive contain>
                                <v-img src="//via.placeholder.com/350x150"/>
                        </v-responsive>
                        <v-card-title primary-title>
                            <MemberShow :member="m"/>
                        </v-card-title>
                </v-card>
            </v-flex>
        </v-layout>
    </div>
</v-container>
</template>

<script>
    import EventShow from '@/components/EventShow'
    import AnnouncementShow from '@/components/AnnouncementShow'
    import MemberShow from '@/components/MemberShow'

    export default {
        name: 'Dashboard',
        components: {
            EventShow,
            AnnouncementShow,
            MemberShow
        },
        data() {
            return {
                eventos: [],
                anuncios: [],
                miembros: []
            }
        },
        computed: {
            listaEventos: function () { return this.eventos.slice(0,3)},
            listaAnuncios: function() {return this.anuncios.slice(0,3)},
            listaMiembros: function() {return this.miembros.slice(0,3)}
        },
        mounted(){
            var API = this.$store.getters.api

            API.get('events')
            .then( response => this.eventos = response.data)
            .catch(error => {
                console.error(error)
                console.error(JSON.stringify(error.response.data))
            })
            API
            .get("members")
            .then( r => { this.miembros = r.data})
            .catch(error => {console.log(error)})
            API
            .get("announcements")
            .then( r => this.anuncios = r.data)
            .catch(error => console.log(error))
        }
        
    }
    
    
</script>

<style scoped>
    .miembros, .eventos,.anuncios {
        margin: 10px;
    }
</style>