<template>
  <div class="form">
    <el-row>
      <h1>変更</h1>
    </el-row>
    <PostForm
      :form="form"
      :process="process"
      @handleSubmit="handleSubmit"
      @handleCancel="handleCancel"
    />
  </div>
</template>

<script>
import PostForm from './components/PostForm'
export default {
  components: { PostForm },
  data() {
    return {
      form: {
        title: '',
        content: ''
      },
      process: 'Edit'
    }
  },
  created() {
    // サーバから最新データを取得する
    this.form = this.$route.params.form
  },
  methods: {
    handleSubmit() {
      if (!this.form.title) return
      // store/modules/postのアクションeditPostを呼び出し、
      this.$store.dispatch('post/editPost', this.form)
      this.$router.push({ path: '/post/index' })
    },
    handleCancel() {
      this.$router.push({ path: '/post/index' })
    }
  }
}
</script>

<style lang="scss" scoped>
.form {
  width: 800px;
  margin: 20px;
}
</style>
