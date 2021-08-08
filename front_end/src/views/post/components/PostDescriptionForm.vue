<template>
  <el-form ref="form" :model="form" label-width="120px">
    <el-form-item :label="$t('post.title')">
      <el-input v-model="form.title" />
    </el-form-item>
    <el-form-item :label="$t('post.content')">
      <el-input v-model="form.content" />
    </el-form-item>
    <el-form-item>
      <!-- クリックでonSubmitイベントが発火 -->
      <el-button @click="handleBack">Back</el-button>
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
          title: '',
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
    handleBack() {
      this.$emit('handleBack')
    }
  }
}
</script>
