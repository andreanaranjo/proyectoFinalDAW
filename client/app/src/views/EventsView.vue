<template>
    <v-container>
        <v-layout  justify-space-around row wrap fill-height>
            <v-flex align-center xs12 lg4 v-for="e in eventos" class="event_card">
                <EventDescription :event="e"/>
            </v-flex>
        </v-layout>
    </v-container>
    
</template>

<script>
    import EventDescription from '@/components/EventDescription';

    export default {
        name: 'EventsView',
        components: {
            EventDescription,
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
 .event_card {
     padding: 10px;
 }
</style>