<template>
    <div class="topnav" id="myTopnav">
        <router-link to="/">Suitcase</router-link>
        <router-link to="/about">¿Quienes somos?</router-link>
        <router-link to="/what-we-do">¿Que hacemos?</router-link>
        <router-link to="/upcoming-events">Proximos Eventos</router-link>
        <router-link to="/portfolio">Portafolio</router-link>
        <router-link to="/contact">Contacto</router-link>
        <router-link to="/app/login">Iniciar sesión</router-link>
        <a href="javascript:void(0);" class="icon" onclick="myFunction()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</template>

<script>
    export default {
        name: 'TopNav'
    }
</script>

<style scoped>
    @import url('https://use.fontawesome.com/releases/v5.7.1/css/all.css');

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

    @media screen and (max-width: 900px) {
        .topnav.responsive {position: relative;}
        .topnav.responsive .icon {
            position: absolute;
            right: 0;
            top: 0;
        }
        .topnav.responsive a {
            float: none;
            display: block;
            text-align: left;
        }
        .topnav a:hover {
            color: #f8b500;
            font-size: 30px;
        }
    }

    @media screen and (max-width: 900px) {
        .topnav a:not(:first-child) {display: none;}
        .topnav a.icon {
            float: right;
            display: block;
        }
    }
</style>