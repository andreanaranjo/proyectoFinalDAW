<template>
    <v-container>
        <v-expansion-panel>
      <v-expansion-panel-content> 
        <div slot="header">
            <h3>SuitCase Resumen</h3></div>
        <v-card color="white">
          <v-card-text><h3>Datos Generales</h3></v-card-text>
          <v-layout align-center justify-center row wrap>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title justify-center primary class="title justify-center" >Miembros Actuales</v-card-title>
                        <p class="resumen"> {{resumen.miembros_actuales}}</p>
                    </v-card>
                </v-flex>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title primary class="title justify-center">Eventos Realizados</v-card-title>
                        <p class="resumen"> {{resumen.total_eventos}}</p>
                    </v-card>
                </v-flex> 
            </v-layout>
          <br>
          <v-card-text><h3>Directiva</h3></v-card-text>
          <v-layout align-center justify-center row wrap>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title justify-center primary class="title justify-center" >Presidente</v-card-title>
                        <p class="resumen"> {{resumen.directiva.Presidente}}</p>
                    </v-card>
                </v-flex>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title primary class="title justify-center">Vicepresidente</v-card-title>
                        <p class="resumen"> {{resumen.directiva.Vicepresidente}}</p>
                    </v-card>
                </v-flex>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title primary class="title justify-center">Tesorero</v-card-title>
                        <p class="resumen"> {{resumen.directiva.Tesorero}}</p>
                    </v-card>
                </v-flex>

            </v-layout>
            <br>
          <v-card-text><h3>Miembros Destacados</h3></v-card-text>
          <v-layout align-center justify-center row wrap>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title justify-center primary class="title justify-center" >Más Eventos</v-card-title>
                        <p class="resumen"> {{resumen.destacados.top_eventos}}</p>
                    </v-card>
                </v-flex>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title primary class="title justify-center">Más Tareas</v-card-title>
                        <p class="resumen"> {{resumen.destacados.top_tareas}}</p>
                    </v-card>
                </v-flex>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title primary class="title justify-center">Mayor Promedio</v-card-title>
                        <p class="resumen"> {{resumen.destacados.top_promedio}}</p>
                    </v-card>
                </v-flex>
                <v-flex justify-center d-flex xs12 sm6 md3>
                    <v-card color="blue" dark>
                        <v-card-title primary class="title justify-center">Más Anuncios</v-card-title>
                        <p class="resumen"> {{resumen.destacados.top_anuncios}}</p>
                    </v-card>
                </v-flex>
                
            </v-layout>
         </v-card>
      </v-expansion-panel-content>

      <v-expansion-panel-content> 
        <div slot="header">
            <h3>Árbol de Eventos-Tareas_Miembros</h3></div>
        <v-card color="white">
            <div id="container">
            <tree :data="tree" node-text="name" layoutType="euclidean" class="tree">
            </tree>
        </div>
        </v-card>
      </v-expansion-panel-content>

      <v-expansion-panel-content> 
        <div slot="header">
            <h3>Reporte con Filtros</h3></div>
        <v-card>
      <v-container
        fluid
        grid-list-xl
      >
        <v-layout
          align-center
          wrap
        >
         <p>{{ date.month }}</p>
            <month-picker @change="showDate"></month-picker>
          <v-flex xs12 sm6>  
            <v-select
              v-model="value"
              :items="items"
              chips
              label="Tipo de Evento"
              multiple
              outline
            ></v-select>

            <div class="wrapper">
                <h4> Elija el mes </h4>
			
            
		</div>
        <v-btn color="success">Consultar</v-btn>
          </v-flex>
          
        </v-layout>
      </v-container>
    </v-card>
      </v-expansion-panel-content>

    </v-expansion-panel>
    </v-container>
</template>

<script>
import {tree} from 'vued3tree'
import VueMonthlyPicker from 'vue-monthly-picker'
import moment from 'moment'

export default {
    name: 'ReportView',
    components: {
        tree,
        VueMonthlyPicker
    },
    
    data () {
        return {
            barChart: {
                data: [4],
                width: 420,
                barHeight: 20
            },
            items: ['Deportivo', 'Académico', 'Cultural', 'Otro'],
            value: ['Deportivo', 'Académico', 'Cultural', 'Otro'],
            date: {
				from: null,
				to: null,
				month: null,
				year: null
            },
            selectedMonth: moment(),
            tree:{
                name: "SuitCase",
                children:[{
                    name: "Evento1",
                    children:[ {name: "Tarea1", children:[{name:"Miembro1"}, {name:"Miembro3"}, {name:"Miembro4"}]}, {name: "Tarea2"}]},
                    {name: "Evento2", children:[ {name: "Tarea7"}, {name: "Tarea12"}, {name: "Tarea14"}]}]},
            resumen2: {},
            resumen: {"miembros_actuales": 7,
                    "total_eventos": 5,
                    "tareas": {"cumplidas":5, "pendientes":8},
                    "anuncios_totales":30,
                    "destacados":{"top_eventos": "Miembro Nrd", "top_tareas": "Luis JasiosdiaS", "top_promedio": "Andrea Andres", 
                    "top_anuncios": "JCDiodfjd sjda"},
                    "directiva":{"Presidente": "Alex Subia Nugra", "Vicepresidente": "Valeria Gomez", "Tesorero": "Andrew Mar"}}
        }
    },
    mounted() {
            let API = this.$store.getters.api
            API
            .get('get_events_tree')
            .then( response => this.tree = response.data)
            .catch(error => console.log(error))

            API
            .get('report')
            .then( response => {
                this.resumen2  = response.data
                console.log(response.data)
                })
            .catch(error => console.log(error))
            
        },
    methods: {
		showDate (date) {
			this.date = date
		}
    },
    
}
</script>

<style>
    p.resumen{
        font-size: 25px;
        text-align: center;
        font-weight: bold;
    }
    .tree {
    width: 100%;
    height: 100%;
    }
    #container{
        width: 80%;
        height: 500px;;
    }
</style>
