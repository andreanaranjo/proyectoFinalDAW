import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import router from './router';
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    token: null,
    error: null,
    loading: false,
    logged_in: false
  },
  mutations: {
    setToken (state, payload){
      state.token = {
        headers: `Bearer ${payload}`
      }
    },
    setError (state, payload){
      state.error = payload
    },
    setLoading (state, payload){
      state.loading = payload
    }
  },
  actions: {
    userSignIn ({commit}, payload) {
      let host = "http://localhost:3000"
      commit('setLoading', true)
      axios.post(host+"/authenticate",{
        'user': payload.user,
        'password': payload.password
      }).then(response => {
        commit('setToken', response.data["auth_token"])
        // Guardar el token en localStorage.
        localStorage.setItem('APIToken',JSON.stringify($state.token))
        commit('setLoading', false)
        commit('setError', null)
        router.push("/dashboard")
      }).catch(error => {
        commit('setError', error.message)
        commit('setLoading', false)
      })
      /*
      firebase.auth().signInWithEmailAndPassword(payload.email, payload.password)
      .then(firebaseUser => {
        commit('setUser', {email: firebaseUser.user.email})
        commit('setLoading', false)
        commit('setError', null)
        router.push('/home')
      })
      .catch(error => {
        commit('setError', error.message)
        commit('setLoading', false)
      })
      */
    }
  }
})
