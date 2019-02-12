<template>
    <div>
        <v-list-tile-content>
            <v-list-tile-title>{{a.title}}</v-list-tile-title>
        </v-list-tile-content>

        <v-list-tile-action>
            <v-icon :color="item.active ? 'teal' : 'grey'">fas fa-edit</v-icon>
            <v-icon :color="item.active ? 'teal' : 'grey'">remove_circle</v-icon>
        </v-list-tile-action>
    </div>
</template>

<script>
export default {
    name: 'MyAnnouncementsShow',
    props: ['a']   
}
</script><