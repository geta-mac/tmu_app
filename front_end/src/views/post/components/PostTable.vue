<template>
  <el-table
    :data="posts"
    style="width: 100%"
  >
    <el-table-column
      prop="content"
      :label="$t('post.content')"
      width="180"
      height="100"
    />
    <el-table-column
      prop="name"
      :label="$t('post.name')"
      width="180"
    />
    <el-table-column>
      <template slot-scope="scope">
        <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
      </template>
    </el-table-column>
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
