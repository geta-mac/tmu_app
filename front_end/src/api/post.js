import request from '@/utils/request'

export function getPosts(token) {
  return request({
    url: 'posts',
    method: 'get',
    params: { token }
  })
}

export function createPost(data) {
  return request({
    url: 'posts',
    method: 'post',
    data
  })
}

export function editPost(data) {
  return request({
    url: `posts/${data.id}`,
    method: 'put',
    data
  })
}

export function deletePost(data) {
  return request({
    url: `posts/${data.id}`,
    method: 'delete'
  })
}
