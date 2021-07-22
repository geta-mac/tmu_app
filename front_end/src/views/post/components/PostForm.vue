<template>
  <el-form ref="form" :model="form" label-width="120px">
    <el-form-item :label="$t('post.content')">
      <textarea v-model="form.content" placeholder="投稿内容を記入してください" />
    </el-form-item>
    <el-form-item>
      <!-- クリックでonSubmitイベントが発火 -->
      <el-button type="primary" @click="handleSubmit">{{ process }}</el-button>
      <el-button @click="handleCancel">Cancel</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  props: {
    form: {
      type: Object,
      default() {
        return {
          content: ''
        }
      }
    },
    process: {
      type: String,
      default() {
        return ''
      }
    }
  },
  methods: {
    onSubmit() {
      if (!this.form.name) return
      // store/modules/postのアクションcreatePostを呼び出し、
      this.$store.dispatch('post/createPost', this.form)
      this.$router.push({ path: '/post/index' })
    },
    handleSubmit() {
      this.$emit('handleSubmit')
    },
    handleCancel() {
      this.$emit('handleCancel')
    }
  }
}
</script>
