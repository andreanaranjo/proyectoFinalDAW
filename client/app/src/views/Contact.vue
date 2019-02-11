<template>
    <v-container grid-list-xl>
        <v-layout v-bind="binding">
             <v-flex>
                <v-form
                    ref="form"
                    v-model="valid"
                    lazy-validation
                >
                    <h2 align="center">Contacto</h2>
                    <v-text-field
                    v-model="name"
                    :counter="30"
                    :rules="nameRules"
                    label="Nombre"
                    required
                    ></v-text-field>

                    <v-text-field
                    v-model="email"
                    :rules="emailRules"
                    label="E-mail"
                    required
                    ></v-text-field>

                    <v-textarea
                    name="comment"
                    box
                    label="Comentario"
                    auto-grow
                    value=""
                    background-color = "undefined"
                    ></v-textarea>

                    <div class="text-xs-center">

                        <v-btn
                        :disabled="!valid"
                        color="success"
                        @click="validate"
                        >
                        Enviar
                        </v-btn>

                        <v-btn
                        color="error"
                        @click="reset"
                        >
                        Limpiar
                        </v-btn>
                    </div>

                </v-form>
             </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
  export default {
    data: () => ({
      valid: true,
      name: '',
      nameRules: [
        v => !!v || 'El nombre es requerido',
        v => (v && v.length <= 30) || 'El nombre debe tener menos de 30 caracteres'
      ],
      email: '',
      emailRules: [
        v => !!v || 'El e-mail es requerido',
        v => /.+@.+/.test(v) || 'El correo debe ser válido'
      ],
    }),

    methods: {
      validate () {
        if (this.$refs.form.validate()) {
          this.snackbar = true
        }
      },
      reset () {
        this.$refs.form.reset()
      }
    }
  }
</script>