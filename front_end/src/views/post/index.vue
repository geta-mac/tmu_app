<template>
  <div class="app-container documentation-container">
    <el-row>
      <router-link :to="'/post/new'" class="el-button el-button--primary">
        <span>新規登録</span>
      </router-link>
    </el-row>
    <PostTable
      :key="key"
      :posts="posts"
      @handleEdit="doUpdate"
      @handleDelete="doDelete"
    />
  </div>
</template>

<script>
import PostTable from './components/PostTable'
import { mapGetters } from 'vuex'

export default {
  name: 'Post',
  components: { PostTable },
  data() {
    return {
      key: 0
    }
  },
  computed: {
    ...mapGetters({
      posts: 'post/postAll'
    })
  },
  mounted() {
    this.$store.dispatch('post/getPosts')
  },
  methods: {
    doUpdate(index, row) {
      this.$router.push({
        name: 'editPost',
        params: { form: row }
      })
    },
    doDelete(index, row) {
      const ans = confirm(this.$t('post.delete_message'))
      if (!ans) return
      this.$store.dispatch('post/deletePost', row)
      this.$nextTick(() => {
        this.$store.dispatch('post/getPosts')
        this.key = this.key ? 0 : 1
      })
    }
  }
}
</script>
