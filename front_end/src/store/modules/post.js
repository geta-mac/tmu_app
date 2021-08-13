import {
  getPosts,
  createPost,
  editPost,
  deletePost
} from '@/api/post'
import moment from 'moment'

const state = {
  postAll: []
}

const mutations = {
  SET_POST_ALL: (state, data) => {
    state.postAll = data
  }
}

const getters = {
  postAll: state => state.postAll
}

const actions = {
  getPosts({ commit, state, rootState }) {
    return new Promise((resolve, reject) => {
      getPosts(state.token).then(response => {
        const { data } = response
        if (!data) {
          reject('Verification failed, please Login again.')
        }
        const posts = data.map(post => {
          return {
            ...post,
            _created_at: moment(post.created_at).format('YYYY-MM-DD HH:mm:ss'),
            _updated_at: moment(post.updated_at).format('YYYY-MM-DD HH:mm:ss'),
            _content: post.content.length > 20 ? post.content.slice(0, 20) + '…' : post.content
          }
        })
        commit('SET_POST_ALL', posts)
        console.log(posts)
        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },
  createPost({ commit, state }, data) {
    return new Promise((resolve, reject) => {
      createPost(data).catch(error => {
        reject(error)
      })
    })
  },
  editPost({ commit, state }, data) {
    return new Promise((resolve, reject) => {
      editPost(data).catch(error => {
        reject(error)
      })
    })
  },
  deletePost({ commit, state }, data) {
    return new Promise((resolve, reject) => {
      deletePost(data).catch(error => {
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
