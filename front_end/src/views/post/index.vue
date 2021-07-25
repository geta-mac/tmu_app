<template>
  <div class="app-container documentation-container">
    <el-row>
      <router-link :to="'/customer/new'" class="el-button el-button--primary">
        <span>新規登録</span>
      </router-link>
    </el-row>
    <CustomerTable
      :key="key"
      :customers="customers"
      @handleEdit="doUpdate"
      @handleDelete="doDelete"
    />
  </div>
</template>
