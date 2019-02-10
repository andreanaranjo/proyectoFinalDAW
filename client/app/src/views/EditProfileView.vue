<template>
    <v-container
    fill-height
    fluid
    grid-list-xl>
    <v-layout
      justify-center
      wrap
    >
      <v-flex
        xs12
        md8
      >
        <material-card
          color="green"
          title="Edit Profile"
          text="Complete your profile"
        >
          <v-form>
            <v-container py-0>
              <v-layout wrap>

                <v-flex
                  xs12
                  md6
                >
                  <v-text-field
                    class="purple-input"
                    label="Usuario"
                  />
                </v-flex>
                <v-flex
                  xs12
                  md6
                >
                  <v-text-field
                    label="Email"
                    class="purple-input"/>
                </v-flex>
                <v-flex
                  xs12
                  md4
                >
                  <v-text-field
                    label="Nombre"
                    class="purple-input"/>
                </v-flex>
                <v-flex
                  xs12
                  md4
                >
                  <v-text-field
                    label="Apellido"
                    class="purple-input"/>
                </v-flex>
                <v-flex
                  xs12
                  md4
                >
                  <v-text-field
                    label="Carrera"
                    class="purple-input"/>
                </v-flex>
                <v-flex xs12>
                  <v-textarea
                    class="purple-input"
                    label="About Me"
                  />
                </v-flex>
                  <v-flex
                  xs12
                  text-xs-right
                >
                  <v-btn
                    class="mx-0 font-weight-light"
                    color="success"
                  >
                    Update Profile
                  </v-btn>
                </v-flex>
              </v-layout>
            </v-container>
          </v-form>
        </material-card>
    </v-flex>
    </v-layout>
    </v-container>
</template>
<script>
export default {
    
}
</script>
