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
    },
    setLoggedIn(state, payload){
      state.logged_in = payload
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
        commit('setLoggedIn',true)
        router.push("/dashboard")
      }).catch(error => {
        commit('setError', error.message)
        commit('setLoading', false)
      })
      
    }
  },
})
