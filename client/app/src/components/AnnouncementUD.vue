<template>
    <v-dialog v-model="expandView"
              :max-width="($vuetify.breakpoint.mdAndUp) ? '600px': '100%'"
              :fullscreen="$vuetify.breakpoint.xsOnly" hide-overlay transition="dialog-bottom-transition">
        <v-btn slot="activator" color="orange" dark>Modificar anuncio</v-btn>
        <v-card :min-height="($vuetify.breakpoint.mdAndUp) ? '600px': '100%'" width="100%">
            <v-toolbar dark color="primary">
                <v-btn icon dark @click="expandView = false">
                    <v-icon>close</v-icon>
                </v-btn>
                <v-toolbar-title>Modificar anuncio</v-toolbar-title>
            </v-toolbar>
            <v-alert dismissible v-model="errors">
            </v-alert>
            <v-form>
                <v-container>
                    <v-text-field class="padding" v-model="copied.title" label="Título del anuncio"/>
                    <v-textarea class="padding" v-model="copied.fulltext" label="Texto"/>
                    <v-dialog v-model="showModify" :max-width="($vuetify.breakpoint.mdAndUp) ? '600px': '100%'">
                        <v-btn slot="activator" justify-end  color="primary" flat :disabled="areEqual">
                            Guardar cambios
                        </v-btn>
                        <v-card>
                            <v-card-title class="headline">
                                ¿Estás seguro de que quieres guardar este anuncio con estos datos?
                            </v-card-title>
                            <v-card-actions>
                                <v-btn @click.prevent="modifyAnnouncement">
                                    Sí
                                </v-btn>
                                <v-btn @click.prevent="showModify = false">
                                    No
                                </v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>

                    <v-dialog v-model="showDelete" :max-width="($vuetify.breakpoint.mdAndUp) ? '600px': '100%'">
                        <v-btn slot="activator" justify-end flat color="red" >
                            Borrar
                        </v-btn>
                        <v-card >
                            <v-card-title class="headline">
                                ¿Estás seguro de que quieres borrar este anuncio?
                            </v-card-title>
                            <v-card-actions>
                                <v-btn @click.prevent="deleteAnnouncement" >
                                    Sí
                                </v-btn>
                                <v-btn @click.prevent="showDelete = false">
                                    No
                                </v-btn>
                            </v-card-actions>
                        </v-card>

                    </v-dialog>

                </v-container>
            </v-form>
        </v-card>
    </v-dialog>
</template>
<script>
    import lodash from 'lodash'
    export default {
        name: 'AnnouncementUD',
        props: ['anuncio','index'],
        data() {
            return {
                expandView: false,
                showDelete: false,
                showModify: false,
                loading: false,
                copied: {...this.anuncio},
                errors: ""
            }
        },
        methods:{
            deleteAnnouncement(){
                console.log("deleteAnnouncement llamado en index: " + this.index)
            },
            modifyAnnouncement(){
                console.log("modifyAnnouncement llamado en index: " + this.index)
                if(!this.areEqual){
                    let API = this.$store.getters.api;
                    API.put(`announcements/${this.anuncio.id}`, this.copied).then(
                        response => {
                            console.log("Se cambió correctamente la data en el backend del anuncio con índice: " + index)
                            this.$emit('update:announcement', response.data, this.index)
                            this.showModify = false
                        }
                    ).catch(error => {
                        this.showModify = false;
                        this.errors = error;
                        console.log(error.response.body)
                    })

                }
            }
        },
        computed: {
            areEqual(){
                return lodash.isEqual(this.anuncio, this.copied)
            }
        }
    }
</script>
<style scoped>
    .padding {
        padding: 10px;
    }
</style>