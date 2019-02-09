<template>
    <div>
        <p>{{event.name}}</p>
        <p>{{event.desc}}</p>
        <p>{{nicedate}}</p>
    </div>
</template>

<script>
    export default {
        name: 'EventShow',
        props: ['event'],
        computed: {
            nicedate: function(){
                return new Date(this.event.due_time)
            }
        }
    }
</script>

