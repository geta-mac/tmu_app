<template>
  <el-form ref="form" :model="form" label-width="120px">
    <el-form-item :label="$t('user.name')">
      <el-input v-model="form.name" />
    </el-form-item>
    <el-form-item :label="$t('user.nickname')">
      <el-input v-model="form.nickname" />
    </el-form-item>
    <el-form-item :label="$t('user.email')">
      <el-input v-model="form.email" />
    </el-form-item>
    <el-form-item :label="$t('user.password')">
      <el-input v-model="form.password" />
    </el-form-item>
    <el-form-item :label="$t('user.password_confirmation')">
      <el-input v-model="form.password_confirmation" />
    </el-form-item>
    <el-form-item :label="$t('user.url')">
      <el-input v-model="form.url" type="textarea" />
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
          name: '',
          nickname: '',
          email: '',
          password: '',
          password_confirmation: '',
          url: ''
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
      // store/modules/customerのアクションcreateCustomerを呼び出し、
      this.$store.dispatch('customer/createCustomer', this.form)
      this.$router.push({ path: '/customer/index' })
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
