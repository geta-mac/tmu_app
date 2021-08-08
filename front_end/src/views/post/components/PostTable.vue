<template>
  <el-table
    :data="posts"
    style="width: 100%"
  >
    <el-table-column
      prop="title"
      :label="$t('post.title')"
      width="180"
    />
    <el-table-column
      prop="content"
      :label="$t('post.content')"
      width="180"
      height="100"
    />
    <el-table-column
      prop="_created_at"
      :label="$t('post.created_at')"
      width="180"
    />
    <el-table-column
      prop="_updated_at"
      :label="$t('post.updated_at')"
      width="180"
    />
    <el-table-column>
      <template slot-scope="scope">
        <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
        <el-button size="mini" @click="handleDescription(scope.$index, scope.row)">詳細</el-button>
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
    },
    handleDescription(index, row) {
      this.$emit('handleDescription', index, row)
    }
  }
}
</script>
