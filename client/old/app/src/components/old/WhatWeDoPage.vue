<template>
    <div>
        <div class="container">
            <section>
                <article class="queHacemos">
                    <h2>¿Qué hacemos?</h2>
                    
                    <div class ="divisor_seccion">
                        <h3>Descripción del Sitio</h3>
                        <img src="@/assets/espol.png" id=fotoEspol class="foto">
                        <p>Este sitio nace con el objetivo de posicionar a futuro al <b>Club de organizacion de eventos de la Espol(Suitcase).</b> en el mercado ecuatoriano. Actualmente la mayoría de nuestros contratos y colaboraciones son con ESPOL, como plan de acción del año 2019 se lanzará esta página y una capaña en redes sociales para aumentar nuestra cartera de clientes.</p>
                        
                        <p><a href="https://www.facebook.com/ClubSuitcase/" target="_blank">Suitcase</a> actualmente solo consta con una redes sociales para la difusión. Por lo que junto con esta página se propone mostrar a los potenciales clientes los eventos en los que hemos colaborado y realizado</p>
                        
                        <p>El otro objetivo de esta página es facilitar la interaccion entre los miembros del club y su inscripcion en las actividades del mismo. Por lo que la página internamente va a administrar dichas actividades.</b> </p>
                    </div>
                    
                    <div class ="divisor_seccion">
                        <h3>Suitcase</h3>
                        
                        <p>Club de Organizacion de Eventos en Espol, en su inicio pertencía a la Facultar de Ingenieria maritima, Ciencias Biologicas y Recursos Nautales(Fimcbor) cuyo eje central son los estudiantes de la carrera de Licenciatura en Turismo, actualmente por el cambio de Facultad se encuentra bajo supervision de la Facultad de Ciencias Sociales y Humanísticas(FCSH).</p>
                        
                        <p>El club ha pasado por diversos cambios de directivas y tutores, actualmente desde el año 2018 la directiva actual conformada por Alex Subia y su equipo a buscado posicionar el club tanto dentro y fuera de la universidad. Lo que ha sido llevado de una buena manera.</p>
                        
                        <svg></svg>
                        
                        
                    </div>
                    
                    <div class ="divisor_seccion">
                        <h3>Servicios</h3>
                        <p>SuitCase ofrece servicios de pre-evento, evento y post-eventos, con el personal y todo los estudios requeridos. El área de especialidad son eventos academicos cocomo conferencias, exposiciones, visitas, actos de honor, etc. </p>
                        <carousel :per-page=1 :autoplay=true :autoplayTimeout=5000>
                            <slide>
                                <img src="https://via.placeholder.com/150" alt="Slide">
                            </slide>
                            <slide>
                                <img src="https://via.placeholder.com/150" alt="Slide">
                            </slide>
                            <slide>
                                <img src="https://via.placeholder.com/150" alt="Slide">
                            </slide>
                        </carousel>
                    </div>
                    <div class ="divisor_seccion">
                        <h3>Clientes</h3>
                        
                        <p>SuitCase tiene como cliente principal a la academia, ya que por experiencia los eventos de esta area son los que destacan. Adicionalmente tambien realiza festivales, reuniones por lo que tambien tiene clientela algunos locales y empresas medianas.</p>
                    </div>
                    <div class ="divisor_seccion">
                        <h3>Tipos de eventos</h3></p>
                        <ul>
                            <li>Conferencias</li>
                            <li>Charlas</li>
                            <li>Protocolo</li>
                            <li>Festivales</li>
                            <li>etc</li>
                        </ul>
                    </div>
                </article>
            </section>
        </div>
        
    </div>
    
</template>

<script>
    import TopNav from './TopNav'
    import { Carousel, Slide} from 'vue-carousel'
    
    var d3 = Object.assign({},require("d3"),require("d3-tip"));
    
    export default {
        name: 'WhatWeDo',
        components: {
            Slide,
            Carousel
        },
        mounted() {
            console.log("Montado WhatWeDo")
            d3.json("/static/horas_participacion.json", function(error, json) {
                if (error) {
                    return console.warn(error);
                }
                renderData(json);
            });
        }
    }
    
    var config = { columnWidth: 20, columnHeight: 235, columnGap: 5, padding: 100};
    var ES_es = d3.locale ({
        "decimal": ",",
        "thousands": ".",
        "grouping": [3],
        "currency": ["", " €"],
        "dateTime": "%a %b %e %X %Y",
        "date": "%d/%m/%Y",
        "time": "%H:%M:%S",
        "periods": ["AM", "PM"],
        "days": ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
        "shortDays": ["Dom", "Lun", "Mar", "Mi", "Jue", "Vie", "Sab"],
        "months": ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
        "shortMonths": ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"]
    });
    var _format = ES_es.numberFormat("h,0f");
    
    function renderData(datos){
        var NUM_COLUMNAS = datos.length;
        config.width = NUM_COLUMNAS * (config.columnWidth + config.columnGap) + (2 * config.padding);
        config.height = config.columnHeight + 2 * config.padding;
        
        var Horas_Max = d3.max(datos, function(d) { return +d.horas; });
        
        var x = d3.scale.ordinal()
        .rangeRoundBands([0, config.width - 2 * config.padding])
        .domain(datos.map(function(d) { return d.nombre; }));
        
        var y = d3.scale.linear()
        .range([0, config.columnHeight])
        .domain([0, Horas_Max]);
        
        var rangeY = d3.scale.linear()
        .range([config.columnHeight, 0])
        .domain([0, Horas_Max]);
        
        
        var ejeX = d3.svg.axis()
        .scale(x)
        .orient("bottom");
        
        var ejeY = d3.svg.axis()
        .scale(rangeY)
        .tickFormat(_format)
        .orient("left");
        
        
        var svg = d3.select("svg")
        .attr("width", config.width)
        .attr("height", config.height);
        
        
        
        svg.append("g")
        .attr("class", "eje")
        .attr("transform", "translate(" + config.padding + "," + (10 + config.padding + config.columnHeight) + ")")
        .call(ejeX)
        .selectAll("text")
        .attr("transform", "rotate(90)")
        .attr("x", "10")
        .attr("y", "-3")
        .style("text-anchor", "start");
        
        
        svg.append("g")
        .attr("class", "eje")
        .attr("transform", "translate(" + (config.padding - 10) + "," + config.padding + ")")
        .call(ejeY);
        
        svg.selectAll("rect")
        .data(datos)
        .enter().append("rect")
        .attr("width", config.columnWidth)
        .attr("x", function(d,i) { return config.padding + x(d.nombre) })
        .attr("y", function(d,i) { return config.padding + config.columnHeight - y(d.horas) })
        .attr("height", function(d,i) { return y(d.horas) })
        .attr("data-nombre", function(d,i) { return d.nombre })
        .attr("data-horas", function(d,i) { return _format(+d.horas) })
        
    }
    
</script>

<style scoped>
    @import 'bootstrap';
    @import url('https://use.fontawesome.com/releases/v5.7.1/css/all.css');
    
    svg {
        border: 1px solid #000000;
        max-width: 70%;
    }
    rect {
        stroke: SteelBlue;
        stroke-width: 2;
        fill: LightSteelBlue  ;
    }
    
    rect:hover {
        fill: SteelBlue ;
    }
    
    .eje text{
        font: 10px sans-serif;
    }
    
    .eje path, .eje line {
        fill: none;
        stroke: #000;
        shape-rendering: crispEdges;
    }
    
    .tooltip {
        font-family: Arial, helvetica, sans-serif;
        font-size: 10px;
        padding: 8px;
        background: rgba(0, 0, 0, 0.7);
        border: 1px solid #FFFFFF;
        box-shadow: rgba(0, 0, 0, 0.5) 1px 1px 4px;
        color: #FFFFFF;
        border-radius: 4px;
    }
    
    .prox{
        width: 50%;
        margin-left: auto;
        margin-right: auto;
        display: block;
    }
    
    
</style>