<template>
  <el-table
    :data="customers"
    style="width: 100%"
  >
    <el-table-column
      prop="id"
      label="ID"
      width="80"
    />
    <el-table-column
      prop="name"
      :label="$t('customer.name')"
      width="180"
    />
    <el-table-column
      prop="email"
      :label="$t('customer.email')"
    />
    <el-table-column
      prop="url"
      :label="$t('customer.url')"
    />
    <el-table-column
      prop="clubname"
      :label="$t('customer.club_id')"
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
    customers: {
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
