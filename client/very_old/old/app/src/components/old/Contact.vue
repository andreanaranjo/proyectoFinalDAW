<template>
        <div class="container">
                <section>
                    <h2>Formulario</h2>
                    <form method="post">
                        <div>
                            <label for="nombres">Nombres:</label>
                            <input type="text" placeholder="Nombres" id="nombres" name="nombres_usuario" />
                        </div>
                        <div>
                            <label for="apellidos">Apellidos:</label>
                            <input type="text" placeholder="Apellidos" id="apellidos" name="apellidos_usuario" />
                        </div>
                        <div>
                            <label for="correo">Correo electrónico:</label>
                            <input type="email" placeholder="johndoe@gmail.com" id="correo" name="correo_usuario" />
                        </div>
                        <div>
                            <label for="telefono">Telefono:</label>
                            <input type="text" placeholder="2123456 ó 0987654321" id="telefono" name="telefono_usuario" />
                        </div>
                        <div>
                            <label for="mensaje">Mensaje:</label>
                            <textarea id="mensaje" placeholder="Motivo de querer contactarse" name="mensaje_usuario"></textarea>
                        </div>
                        <div>
                            <label for="imagen">Imagen de contacto:</label>
                            <input id="imagen" type="file" name="pic" accept="image/*">
                        </div>
                        <div class="button">
                            <button id="botonForm" type="submit">Enviar</button>
                        </div>
                    </form>
                </section>
            </div>
        </body>
</template>