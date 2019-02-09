<template>
    <div>
        <p>Miembro</p>
        <p>Nombre: {{member.name +' ' + member.last_name}}</p>
    </div>
</template>

<script>
    export default {
        name: 'MemberShow',
        props: ['member']
    }
</script>

<style scoped>
    /* Agregar estilos para show de miembros */
</style>