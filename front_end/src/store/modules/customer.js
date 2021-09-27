import i18n from '@/lang'
import {
  getCustomers,
  createCustomer,
  editCustomer,
  deleteCustomer
} from '@/api/customer'

const state = {
  customerAll: []
}

const mutations = {
  SET_CUSTOMER_ALL: (state, data) => {
    state.customerAll = data
  }
}

const getters = {
  customerAll: state => state.customerAll
}

const actions = {
  getCustomers({ commit, state, rootState }) {
    return new Promise((resolve, reject) => {
      getCustomers(state.token).then(response => {
        const { data } = response
        if (!data) {
          reject('Verification failed, please Login again.')
        }
        const customers = data.map(customer => {
          // pはオブジェクトのいち行目が入る
          const club = customer.club_id ? rootState.settings.clubs.find(p => p.value === customer.club_id) : {}
          return {
            // スプレッド構文
            // 配列の省略 カスターマーの一行目の情報（オブジェクト）
            ...customer,
            clubname: i18n.t(club.text)
          }
        })
        commit('SET_CUSTOMER_ALL', customers)
        resolve(customers)
      }).catch(error => {
        reject(error)
      })
    })
  },
  createCustomer({ commit, state }, data) {
    return new Promise((resolve, reject) => {
      createCustomer(data).catch(error => {
        reject(error)
      })
    })
  },
  editCustomer({ commit, state }, data) {
    return new Promise((resolve, reject) => {
      editCustomer(data).catch(error => {
        reject(error)
      })
    })
  },
  deleteCustomer({ commit, state }, data) {
    return new Promise((resolve, reject) => {
      deleteCustomer(data).catch(error => {
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
