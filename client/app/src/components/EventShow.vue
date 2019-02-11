<template>
    <div>
        <h3 class="headline mb-0">{{event.name}}</h3>
        <p>Día del evento: {{nicedate}}</p>
    </div>
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
        }
    }
</script>

