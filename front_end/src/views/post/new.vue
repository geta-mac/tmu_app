<template>
  <div class="form">
    <el-row>
      <h1>新規登録</h1>
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
      process: 'Create'
    }
  },
  methods: {
    handleSubmit() {
      if (!this.form.title) return
      this.$store.dispatch('post/createPost', this.form)
      this.$router.push({ path: '/post/index' })
    },
    handleCancel() {
      this.$router.push({ path: '/post/index' })
    }
  }
}
</script>

