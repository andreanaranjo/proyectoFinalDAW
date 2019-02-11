<template>
    <material-card class="v-card-profile">
        <v-avatar
        slot="offset"
        class="mx-auto d-block"
        size="130"
        >
        <img
        src="https://demos.creative-tim.com/vue-material-dashboard/img/marc.aba54d65.jpg"
        >
    </v-avatar>
    <v-card-text class="text-xs-center">
        <h6 class="category text-gray font-weight-thin mb-3">{{}}</h6>
        <br>
        <h4 class="card-title font-weight-light">{{}}</h4>
        <br>
        <p class="card-description font-weight-light">{{}}}</p>
        <br>
        <router-link to="/profile/edit" >
            <v-btn
            color="success"
            round
            class="font-weight-light"
            >Editar Perfil
            </v-btn>
        </router-link>
    </v-card-text>
</material-card>
</template>

<script>
    export default {
        name: 'ProfileShow',
        props: ['member'],
    }
</script>
