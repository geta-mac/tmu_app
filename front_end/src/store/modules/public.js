import {
  getPublics
} from '@/api/public'

const state = {
  publicAll: []
}

const mutations = {
  SET_PUBLIC_ALL: (state, data) => {
    state.publicAll = data
  }
}

const getters = {
  publicAll: state => state.publicAll
}

const actions = {
  getPublics({ commit, state, rootState }) {
    return new Promise((resolve, reject) => {
      getPublics(state.token).then(response => {
        const { data } = response
        if (!data) {
          reject('Verification failed, please Login again.')
        }
        commit('SET_PUBLIC_ALL', data)
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}
