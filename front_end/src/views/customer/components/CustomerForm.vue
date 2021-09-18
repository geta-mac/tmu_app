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
    <el-select v-model="selected" placeholder="Select">
      <el-option
        v-for="cus in customers"
        :key="cus.id"
        :label="user.club_id"
        :value="cus.value"
      />
    </el-select>
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
      options: [{
        value: 'Option1',
        label: 'Option1'
      }, {
        value: 'Option2',
        label: 'Option2'
      }, {
        value: 'Option3',
        label: 'Option3'
      }, {
        value: 'Option4',
        label: 'Option4'
      }, {
        value: 'Option5',
        label: 'Option5'
      }],
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
