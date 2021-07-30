<template>
  <div class="form">
    <el-row>
      <h1>新規登録</h1>
    </el-row>
    <PostForm
      :form="form"
      :name="name"
      :content="content"
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
        name: '',
        content: ''
      },
      process: 'Create'
    }
  },
  methods: {
    handleSubmit() {
      if (!this.form.name) return
      this.$store.dispatch('post/createPost', this.form)
      this.$router.push({ path: '/post/index' })
    },
    handleCancel() {
      this.$router.push({ path: '/post/index' })
    }
  }
}
</script>

