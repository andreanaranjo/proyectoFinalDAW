<template>
    <v-card min-height = "300">
        <v-img
        src="https://cdn.vuetifyjs.com/images/cards/desert.jpg"
        aspect-ratio="2.75"
        ></v-img>
        <v-card-title primary-title>
            <div>
                <div class = "headline">{{event.name}}</div>
                <span class="grey--text">Día del evento: {{nicedate}}</span>
            </div>
        </v-card-title>
        <v-card-actions>
            <v-layout align-center justify-space-around row fill-height>
                <v-dialog v-model="dialog" 
                :max-width="($vuetify.breakpoint.mdAndUp) ? '600px': '100%'" 
                
                :fullscreen="$vuetify.breakpoint.xsOnly" hide-overlay transition="dialog-bottom-transition">
                <v-btn slot="activator" color="orange" dark>Descripción</v-btn>
                <v-card :min-height="($vuetify.breakpoint.mdAndUp) ? '600px': '100%'" >
                    <v-toolbar  dark color="primary">
                        <v-btn icon dark @click="dialog = false">
                            <v-icon>close</v-icon>
                        </v-btn>
                        <v-toolbar-title>{{event.name}}</v-toolbar-title>
                    </v-toolbar>
                    <br>
                    <v-card-title primary-title>
                        <h2>Descripción del evento</h2>
                        <p>{{event.desc}}</p>
                        <h2>Tareas </h2>
                        <v-list>
                            <v-list-tile v-for="t in tasks">
                                <v-list-tile-action>
                                    <v-checkbox :readonly="true" v-model="t.completed"></v-checkbox>
                                </v-list-tile-action>
                                <v-list-tile-content>
                                        <v-list-tile-title>
                                            {{t.name}}
                                        </v-list-tile-title>
                                </v-list-tile-content>
                            </v-list-tile>
                        </v-list>
                    </v-card-title>
                </v-card>
            </v-dialog>
        </v-layout>
    </v-card-actions>
</v-card>
</template>

<script>
    export default {
        name: 'EventDescription',
        props: ['event'],
        computed: {
            nicedate: function(){
                var date = new Date(this.event.due_time)
                return date.toLocaleDateString()    
            }
            
        },
        data () {
            return {
                dialog: false,
                tasks: []
            }
        },
        mounted() {
            let API = this.$store.getters.api
            API.get(`get_tasks_event/${this.event.id}`)
            .then(response => this.tasks = response.data)
            .catch(error => {
                console.log(error)
                console.log(error.response.body)
            })

        }
    }
</script>

