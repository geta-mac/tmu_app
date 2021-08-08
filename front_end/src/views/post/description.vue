<template>
  <div class="form">
    <el-row>
      <h1>詳細</h1>
    </el-row>
    <PostDescriptionForm
      :form="form"
      :process="process"
      @handleBack="handleBack"
    />
  </div>
</template>

<script>
import PostDescriptionForm from './components/PostDescriptionForm'
export default {
  components: { PostDescriptionForm },
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
    handleBack() {
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
