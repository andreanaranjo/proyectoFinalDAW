# README

Hola, esta es una aplicación web desarrollada para el curso de Desarrollo de Aplicaciones Web dictado en ESPOL FIEC.

Para utilizar este repo necesitas ruby 2.6.0 y Rails 5.2.2

Para hacer deploy del front-end necesitas nodejs y npm

Pasos para configurar el front-end para deployment:

* Hacer npm install en client/app
* Hacer npm run build en el mismo directorio anterior

Los archivos se colocarán directamente donde serán servidos por Rails dev server (o en caso de mover Rails a producción, por el servidor responsable), en el directorio /public/app y serán minificados

Para configurar el proyecto de Rails se necesita hacer lo siguiente:

* bundle install
* rails db:schema:load db:seed

Para hostear un servidor development de Rails, se ejecuta rails s


