import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import router from './router';
Vue.use(Vuex)

let host = process.env.NODE_ENV === 'production' ? '' : "http://localhost:3000/"

export default new Vuex.Store({
  state: {
    token: "",
    error: null,
    loading: false,
    logged_in: false,
    member_id: 0,
    user: {}
  },
  mutations: {
    setToken (state, payload){
      state.token = payload
    },
    setError (state, payload){
      state.error = payload
    },
    setLoading (state, payload){
      state.loading = payload
    },
    setLoggedIn(state, payload){
      state.logged_in = payload
    },
    setMemberID(state,payload){
      state.member_id = payload
    },
    setUser(state,payload){
      state.user = payload
    }
  },
  actions: {
    userSignIn ({commit}, payload) {

      commit('setLoading', true)
      axios.post(host+"/authenticate",{
        'username': payload.user,
        'password': payload.password
      }).then(response => {
        commit('setToken', response.data["auth_token"])
        // Guardar el token en localStorage.
        localStorage.setItem('APIToken',response.data["auth_token"])
        commit('setLoading', false)
        commit('setError', null)
        commit('setLoggedIn',true)
        router.push("/dashboard")
      }).catch(error => {
        commit('setError', error.message + " " + JSON.stringify(error.response.data))
        commit('setLoading', false)
        commit('setLoggedIn',false)
      })
      this.getters.api.get('get_id').then(response => {
        commit('setMemberID', response.data["member_id"])
      })
      this.getters.api.get(`members/${this.state.member_id}`).then(response => {
        commit('setMember', response.data)
      }).catch(error => {
        console.error(error)
      })
    },
    userLogout ({commit}){
      commit('setToken',"")
      commit('setLoggedIn', false)
      localStorage.removeItem('APIToken')
      router.push("/")
    }
  },
  getters: {
    api: (state) => {
      return axios.create({
        baseURL: host +'/api/v1/',
        timeout: 1000,
        headers: {Authorization: `Bearer ${state.token}`}
      })
    }
  }
})
