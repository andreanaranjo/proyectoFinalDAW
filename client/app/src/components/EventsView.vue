<template>
    <div>
        <h2>Event placeholder</h2>
        <ol>
            <li v-for='event in events'>
                <img src="placeholder"><!-- TODO: Reemplazar el placeholder-->
                <h2>{{ event.name}}</h2>
            </li>
        </ol>
    </div>
    
</template>

<script>
    let hostname = 'http://localhost:3000'
    export default {
        name: 'EventsView',
        data () {
            return {
                events: null
            }
        },
        mounted() {
            axios.get(hostname+'/api/')
        }
    }

</script>

<style scoped>

</style>