<template>
    <v-container>
        <v-layout align-center justify-space-around row fill-height>

            <v-flex xs12 md6>
                <v-card class="v-card-profile">
                    <v-responsive>
                        <v-avatar
                                slot="offset"
                                class="mx-auto d-block"
                                size="130">
                            <img src="https://randomuser.me/api/portraits/men/20.jpg" class="image" alt="lorem"
                                 width="100%"
                                 height="100%">
                        </v-avatar>
                    </v-responsive>
                    <v-card-text class="text-xs-center">
                        <h4 class="card-title font-weight-light">{{miembro.name}} {{miembro.last_name}}</h4>
                        <br>
                        <p class="card-description font-weight-light">{{miembro.about_me}}</p>
                        <br>
                        <p class="card-description font-weight-light">{{miembro.carrera}}</p>
                        <router-link to="/profile/edit">
                            <v-btn
                                    color="success"
                                    round
                                    class="font-weight-light"
                            >Editar Perfil
                            </v-btn>
                        </router-link>
                    </v-card-text>
                </v-card>
            </v-flex>
            <v-flex xs12 md6>
                <v-container>
                    <v-card align="center" color="blue" dark>
                        <v-card-title primary class="title">Resumen de Actividad</v-card-title>
                        <v-divider light></v-divider>
                        <v-card-actions class="pa-3">
                            <h4>
                                Promedio Calificaciones Tareas:
                            </h4>
                            <v-spacer></v-spacer>
                            <v-rating
                                    v-model="datos.calificación_promedio"
                                    background-color="white"
                                    color="white"
                                    dense
                                    half-increments
                                    hover
                                    :readonly="true"
                                    size="18"
                            ></v-rating>
                        </v-card-actions>
                    </v-card>
                    <v-layout align-center justify-start row wrap>
                        <v-flex justify-start d-flex xs12 sm6 md4>
                            <v-card color="blue" dark>
                                <v-card-title primary class="title">Eventos Colaborados</v-card-title>
                                <DoughnutChart
                                        :percent="datos.eventos_participados/datos.total_eventos *100"
                                        :visibleValue="true"
                                        :value="datos.eventos_participados"
                                        :max="datos.total_eventos"
                                        foregroundColor="white"
                                        backgroundColor="gray"
                                        :strokeWidth="20"/>
                            </v-card>
                            <v-card color="blue" dark>
                                <v-card-title primary class="title">Tareas Cumplidas</v-card-title>
                                <DoughnutChart
                                        :percent="datos.tareas.cumplidas/(datos.tareas.cumplidas+datos.tareas.pendientes) *100"
                                        :visibleValue="true"
                                        :value="datos.tareas.cumplidas"
                                        :max="datos.tareas.cumplidas+datos.tareas.pendientes"
                                        foregroundColor="white"
                                        backgroundColor="gray"
                                        :strokeWidth="20"/>
                            </v-card>
                            <v-card color="blue" dark>
                                <v-card-title primary class="title">Anuncios Publicados</v-card-title>
                                <DoughnutChart
                                        :percent="datos.anuncios_publicados/datos.anuncios_totales *100"
                                        :visibleValue="true"
                                        :value="datos.anuncios_publicados"
                                        :max="datos.anuncios_totales"
                                        foregroundColor="white"
                                        backgroundColor="gray"
                                        :strokeWidth="20"/>
                            </v-card>
                        </v-flex>
                    </v-layout>

                </v-container>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
    import DoughnutChart from '@/components/DoughnutChart.vue'

    export default {
        name: 'Profile',
        data() {
            return {
                miembro: 0,
                id: 0,
                datos: {
                    "eventos_participados": 16,
                    "total_eventos": 20,
                    "tareas": {"cumplidas": 5, "pendientes": 8},
                    "calificación_promedio": 2.8,
                    "anuncios_publicados": 4,
                    "anuncios_totales": 30
                },
            }
        },
        components: {
            DoughnutChart
        },
        computed: {
            listaMiembros: function () {
                return this.miembros
            },
            idMember: function () {
                return this.id
            },
            datosMiembro: function () {
                return this.dataMiembro
            }
        },
        mounted() {
            var API = this.$store.getters.api
            API.get("get_id")
                .then(response => {
                    this.id = response.data
                })
                .catch(error => {
                    console.log(error)
                })
            API
                .get(`members/${this.$store.state.member_id}`)
                .then(r => {
                    this.miembro = r.data
                })
                .catch(error => {
                    console.log(error)
                })
            API
                .get(`get_member_metrics/${this.$store.state.member_id}`)
                .then(respuesta => {
                    this.dataMiembro = respuesta.data
                })
                .catch(error => {
                    console.log(error)
                })
        }
    }
</script>