<template>
    <v-container
    fill-height
    fluid
    grid-list-xl>
    
    <v-layout align-center justify-space-around row fill-height>
        
        <v-flex xs12 md4>
        <material-card class="v-card-profile">
            <v-avatar
            slot="offset"
            class="mx-auto d-block"
            size="130"
            >
            <img src="`https://randomuser.me/api/portraits/men/${i + 20}.jpg`" class="image" alt="lorem" width="100%" height="100%">
        </v-avatar>
        <v-card-text class="text-xs-center">
            <h6 class="category text-gray font-weight-thin mb-3">Posición</h6>
            <br>
            <h4 class="card-title font-weight-light">Nombre</h4>
            <br>
            <p class="card-description font-weight-light">About me</p>
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
</v-flex>
<v-flex xs12 md4>
    <p align="center">Hola</p>
</v-flex>
</v-layout>
</v-container>
</template>

<script>
    
</script>