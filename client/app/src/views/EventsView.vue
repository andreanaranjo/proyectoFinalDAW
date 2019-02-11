<template>
    <v-layout align-center justify-space-around row fill-height>
        <v-flex xs12 md4 v-for="e in eventos">
            <v-card>
                <v-img
                src="https://cdn.vuetifyjs.com/images/cards/desert.jpg"
                aspect-ratio="2.75"
                ></v-img>

                <v-card-title primary-title>
                    <EventShow :event="e"/>
                </v-card-title>

                <v-card-actions>
                <v-btn flat color="orange">Más información</v-btn>
                </v-card-actions>
            </v-card>
        </v-flex>
    </v-layout>
    
</template>

<script>
    import axios from 'axios';
    import EventShow from '@/components/EventShow';

    let hostname = 'http://localhost:3000' // Añadí el hostname porque la API está hosteada en un puerto distinto al dominio local.
    export default {
        name: 'EventsView',
        components: {
            EventShow
        },
        data () {
            return {
                eventos: []
            }
        },
        mounted() {
            axios
            .get(hostname+'/api/v1/events')
            .then( response => this.eventos = response.data)
            .catch(error => console.log(error))
            
        }
    }

</script>

<style scoped>

</style>