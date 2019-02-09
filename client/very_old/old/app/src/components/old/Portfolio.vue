<template>
    <div class="container">
        <h1 class="title">Portafolio SuitCase</h1>
        <div class="timeline">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" data-year="2015">
                        
                        <div class="swiper-slide-content">
                            <img src="@/assets/fimcbor.jpg" alt="">
                            <span class="timeline-year">2015</span>
                            <h4 class="timeline-title">Creación de SuitCase</h4>
                            <p class="timeline-text">Se crea el club en la faculta de FIMCBOR de la idea de la carrera de Turismo.</p>
                        </div>
                    </div>
                    <div class="swiper-slide"  data-year="2017">
                        <div class="swiper-slide-content">
                            <img src="@/assets/ruta.jpg" alt="">
                            <span class="timeline-year">Octubre 2017</span>
                            <h4 class="timeline-title">Ruta de la Independencia</h4>
                            <p class="timeline-text">SuitCase junto a Turismo organizan la ruta de la Independencia.</p>
                        </div>
                    </div>
                    <div class="swiper-slide"  data-year="2018">
                        <div class="swiper-slide-content">
                            <img src="@/assets/i3week_evento.jpg">
                            <span class="timeline-year"> Noviembre 2018</span>
                            <h4 class="timeline-title">I3Week Espol</h4>
                            <p class="timeline-text">SuitCase colabora como Staff en la semana de la Innovacion </p>
                        </div>
                    </div>
                    
                </div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
</template>
<script>
    import Swiper from 'swiper'
    
    var timelineSwiper = new Swiper ('.timeline .swiper-container', {
        direction: 'vertical',
        loop: false,
        speed: 1600,
        pagination: '.swiper-pagination',
        paginationBulletRender: function (swiper, index, className) {
            var year = document.querySelectorAll('.swiper-slide')[index].getAttribute('data-year');
            return '<span class="' + className + '">' + year + '</span>';
        },
        paginationClickable: true,
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        breakpoints: {
            768: {
                direction: 'horizontal',
            }
        }
    });

    export default {
        name: 'Portfolio'
    }
</script>
<style scoped>
    @import 'normalize.css';
    @import url('https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800');
    @import url('https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.2/css/swiper.min.css');

</style>