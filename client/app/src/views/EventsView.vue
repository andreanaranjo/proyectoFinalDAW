<template>
    <div>
        <h2>TODO: Hacer esto bonito</h2>
        <ol>
            <li v-for='event in eventos'>
                <EventShow :event="event"/>
            </li>
        </ol>
    </div>
    
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