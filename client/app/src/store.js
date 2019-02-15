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
    async userSignIn ({commit}, payload) {
      try {
        commit('setLoading', true)
        const response = await axios.post(host+"/authenticate",{
          'username': payload.user,
          'password': payload.password
        });

        commit('setToken', response.data["auth_token"]);
        localStorage.setItem('APIToken',response.data["auth_token"])
        let p1 = await this.getters.api.get('get_id')
        let p2 = await this.getters.api.get(`members/${p1.data.member_id}`)
        commit('setMemberID', p1.data.member_id)
        commit('setMember', p2.data)
        commit('setError', null)
        commit('setLoggedIn',true)
        commit('setLoading', false)
        router.push("/dashboard")
      }catch (error) {
        commit('setError', error.message)
        commit('setLoading', false)
        commit('setLoggedIn',false)
      }
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
  },
  methods: {
    async retrieveMemberID(){
      try {
        const response = await this.getters.api.get("get_id");
        commit('set')
        const member_data = await this.getters.api.get(`members/`)

      }catch (e) {
        console.log(e)
      }
    }
  }
})
