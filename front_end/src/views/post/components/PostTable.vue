<template>
  <el-table
    :data="posts"
    style="width: 100%"
  >
    <el-table-column
      prop="content"
      :label="$t('post.contetnt')"
      width="180"
      height="100"
    />
    <el-table-column>
      <template slot-scope="scope">
        <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">Edit</el-button>
        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">Delete</el-button>
      </template>
    </el-table-column>
  </el-table>
</template>
