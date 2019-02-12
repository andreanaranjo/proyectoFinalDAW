<template>
    <v-container grid-list-xl>
        <v-layout align-center justify-space-aroundd row lg4 fill-height>
            <v-flex xs12 md4 v-for="e in eventos">
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

</style>