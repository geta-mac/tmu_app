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
      getPublics(state.token).then(data => {
        // const { data } = response
        if (!data) {
          reject('Verification failed, please Login again.')
        }
        const publics = data.map(post => {
          return {
            ...post,
            _content: post.content.length > 20 ? post.content.slice(0, 20) + '…' : post.content
          }
        })
        commit('SET_PUBLIC_ALL', publics)
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
