<template>
    <div class="topnav" id="myTopnav">
        <a href="principal.html"> Suitcase</a>
        <a href="quienes_somos.html">¿Quienes somos?</a>
        <a href="que_hacemos.html">¿Que hacemos?</a>
        <a href="prox_eventos.html">Proximos Eventos</a>
        <a href="portafolio.html">Portafolio</a>
        <a href="contacto.html">Contacto</a>
        <a href="javascript:void(0);" class="icon" onclick="myFunction()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</template>

<script>
    export default {
        name: 'NavBar',
        data () {
            return {}
        }
    }
</script>

<style scoped>
    .topnav {
        overflow: hidden;
        background: #00adb5;
        box-shadow: 0 0 0.15em 0 rgba(0, 0, 0, 0.1);
        line-height: 3em;
        font-family: Satisfy;
        text-shadow: 2px 0 0 #000, -2px 0 0 #000, 0 2px 0 #000, 0 -2px 0 #000, 1px 1px #000, -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000;
        border-radius: 15px;
        align-items: center;
        text-align: center; 	
    }
    
    .topnav a {
        float: left;
        display: block;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        color: #ece8d9;
        font-size: 25px;
        margin-right: 5px;
        margin-top: 0;
        padding-top:10px;
        margin-left: 20px;
    }
    
    .topnav a:hover {
        color: #f8b500;
        font-size: 30px;
    }
    
    .active {
        background-color: #4CAF50;
        color: white;
    }
    
    .topnav .icon {
        display: none;
    }
    
</style>