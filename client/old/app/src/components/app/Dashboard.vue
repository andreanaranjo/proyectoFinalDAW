<template>
    <div>
        <div class="container-fluid">
            <div class="col" >
                <div>
                    <h2>Próximos eventos</h2>
                    <EventShow v-for="e in eventos" :event="e"/>
                </div>
            </div>
            <div class="col">
                <AnnouncementShow v-for="a in anuncios" class="minianuncio" :anuncio="a" />
            </div>
            <div class="col">
                <div>
                    <h2>Lista de miembros</h2>
                    <MemberShow v-for="m in miembros" class="minimember" :member="m"/>
                </div>
                
            </div>
        </div>
    </div>
</template>

<script>
    import EventShow from './EventShow'
    import AnnouncementShow from './AnnouncementShow'
    import MemberShow from './MemberShow'
    import axios from 'axios';
    import bootstrap from 'bootstrap';
    
    export default {
        name: 'Dashboard',
        components: {
            EventShow,
            AnnouncementShow,
            MemberShow
        },
        data() {
            return {
                eventos: {},
                anuncios: {},
                miembros: {}
            }
        },
        mounted(){
            let hostname = "http://localhost:3000"
            axios
            .get(hostname+'/api/v1/events')
            .then( response => this.eventos = response.data)
            .catch(error => console.log(error))
            axios
            .get(hostname+'/api/v1/members')
            .then( r => { this.miembros = r.data})
            .catch(error => {console.log(error)})
            axios
            .get(hostname+'/api/v1/announcements')
            .then( r => this.anuncios = r.data)
            .catch(error => console.log(error))
            
            
        },
        
    }
    
    
</script>
