<template>
    <v-card>
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
        <v-dialog v-model="dialog" fullscreen hide-overlay transition="dialog-bottom-transition">
        <v-btn slot="activator" color="orange" dark>Descripción</v-btn>
            <v-card>
                <v-toolbar dark color="primary">
                <v-btn icon dark @click="dialog = false">
                    <v-icon>close</v-icon>
                </v-btn>
                <v-toolbar-title>Descripción</v-toolbar-title>
                </v-toolbar>
                <br>
                <p>{{event.desc}}</p>
            </v-card>
        </v-dialog>
        </v-card-actions>
    </v-card>
</template>

<script>
    export default {
        name: 'EventShow',
        props: ['event'],
        computed: {
            nicedate: function(){
                var date = new Date(this.event.due_time)
                return date.toLocaleDateString()    
            }
        },
        data () {
            return {
                dialog: false
            }
        }
    }
</script>