<template>
  <el-form ref="form" :model="form" label-width="120px">
    <el-form-item :label="$t('post.title')">
      <el-input v-model="form.title" />
    </el-form-item>
    <el-form-item :label="$t('post.content')">
      <el-input v-model="form.content" />
    </el-form-item>
    <el-form-item>
      <el-upload
        ref="upload"
        class="upload-demo"
        drag
        action="#"
        :on-preview="handlePreview"
        :on-remove="handleRemove"
        :auto-upload="false"
      >
        <i class="el-icon-upload" />
        <div class="el-upload__text">Drop file here or <em>click to upload</em></div>
        <div slot="tip" class="el-upload__tip">jpg/png files with a size less than 500kb</div>
      </el-upload>
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
  data() {
    return {
      fileList: []
    }
  },
  methods: {
    onSubmit() {
      if (!this.form.title) return
      // store/modules/postのアクシpostCustomerを呼び出し、
      this.$store.dispatch('post/createPost', this.form)
      this.$router.push({ path: '/post/index' })
    },
    handleSubmit() {
      this.$emit('handleSubmit', this.$refs.upload.uploadFiles)
    },
    handleCancel() {
      this.$emit('handleCancel')
    },
    // リストのバッテンを押下した時
    handleRemove(file, fileList) {
      this.fileList = fileList
    },
    handlePreview(file) {
      console.log(file)
    }
  }
}
</script>
