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
    import EventShow from '@/components/EventShow';

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
            let API = this.$store.getters.api
            API
            .get('events')
            .then( response => this.eventos = response.data)
            .catch(error => console.log(error))
            
        }
    }

</script>

<style scoped>

</style>