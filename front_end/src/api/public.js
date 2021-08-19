import request from '@/utils/request'

export function getPublics(token) {
  return request({
    url: 'public',
    method: 'get',
    params: { token }
  })
}

