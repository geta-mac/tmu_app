<template>
  <el-table
    :data="posts"
    style="width: 100%"
  >
    <el-table-column
      prop="id"
      label="ID"
      width="80"
    />

  </el-table>
</template>

<script>
export default {
  props: {
    posts: {
      type: Array,
      default() {
        return []
      }
    }
  },
  methods: {
    handleEdit(index, row) {
      this.$emit('handleEdit', index, row)
    },
    handleDelete(index, row) {
      this.$emit('handleDelete', index, row)
    }
  }
}
</script>
