

export const state = {
  currentUser:{
    id:'',
    name:'',
    email:'',
    intoroduction:'',
    profile_url:'',
    image:'',
  },
}

export const getters = {
  currentUser: state => state.currentUser
}

export const actions = {
  loginEvent({ commit },loginUser) {
    commit('setCurrentUser', loginUser);  // mutationを呼び出す
  },
  logoutEvent({ commit }) {
    commit('removeCurrentUser');  // mutationを呼び出す
  }
}

export const mutations = {
  setCurrentUser: (state, loginUser) => (state.currentUser = loginUser),
  removeCurrentUser: (state) => (state.currentUser = null)
}

