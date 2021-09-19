<template>
  <el-form ref="form" :model="form" :rules="rules" label-width="120px">
    <el-form-item :label="$t('user.name')" prop="name">
      <el-input v-model="form.name" />
    </el-form-item>
    <el-form-item :label="$t('user.nickname')">
      <el-input v-model="form.nickname" />
    </el-form-item>
    <el-form-item :label="$t('user.email')" prop="email">
      <el-input v-model="form.email" />
    </el-form-item>
    <el-form-item :label="$t('user.password')" prop="password">
      <el-input v-model="form.password" />
    </el-form-item>
    <el-form-item :label="$t('user.password_confirmation')">
      <el-input v-model="form.password_confirmation" />
    </el-form-item>
    <el-form-item :label="$t('user.url')" prop="url">
      <el-input v-model="form.url" type="textarea" />
    </el-form-item>
    <el-form-item :label="$t('user.club_id')">
      <el-select v-model="form.club_id" placeholder="Select">
        <el-option label="学生自治会 執行委員会" value="2" />
      </el-select>
    </el-form-item>
    <el-form-item>
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
          url: '',
          club_id: ''
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
      rules: {
        name: [
          { required: true, message: '名前を入力してください。', trigger: 'blur' }
        ],
        email: [
          { required: true, message: 'メールアドレスを入力してください。', trigger: 'blur' },
          { type: 'email', message: '正しいメールアドレスを入力してください。', trigger: 'blur' }
        ],
        password: [
          { required: true, message: 'パスワードを入力してください。', trigger: 'blur' },
          { min: 6, max: 20, message: '6文字以上20文字以内で入力してください。', trigger: 'blur' }
        ],
        url: [
          { type: 'url', message: '正しいURLを入力してください。', trigger: 'blur' }
        ]
      },
      value: ''
    }
  },
  methods: {
    handleSubmit() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          this.$emit('handleSubmit')
        }
      })
    },
    handleCancel() {
      this.$emit('handleCancel')
    }
  }
}
</script>
