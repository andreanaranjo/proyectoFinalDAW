<template>
    <v-container>
        <v-layout>
            <v-flex>
                <h2>{{event.name}}</h2>
            </v-flex>
        </v-layout>
        <div>
            <p>Día del evento: {{nicedate}}</p>
        </div>
    </v-container>
    
</template>

<script>
    export default {
        name: 'EventShow',
        data(){
            return {
                tasks: [],
                assignments: [],
            }
        },
        props: ['event'],
        computed: {
            nicedate: function(){
                var date = new Date(this.event.due_time)
                return date.toLocaleDateString()    
            }
        },
        mounted(){
            let API = this.$store.getters.api
            API.get('')
        }
    }
</script>