<template>
  <el-menu
    :default-active="activeIndex2"
    class="el-menu-demo"
    mode="horizontal"
    background-color="#545c64"
    text-color="#fff"
    active-text-color="#ffd04b"
    @select="handleSelect"
  >
    <el-menu-item index="1">Processing Center</el-menu-item>
    <el-submenu index="2">
      <template slot="title">登録団体一覧</template>
      <el-menu-item>学生自治会 執行委員会</el-menu-item>
      <el-menu-item index="2-2">学生ホール管理運営委員会</el-menu-item>
      <el-menu-item index="2-3">体育会本部</el-menu-item>
      <el-menu-item>文化部連合</el-menu-item>
    </el-submenu>
    <el-menu-item index="3" disabled>Info</el-menu-item>
    <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">Orders</a></el-menu-item>
    <el-menu-item index="5">
      <router-link :to="'/post'">
        <span>ログイン</span>
      </router-link>
    </el-menu-item>
  </el-menu>
</template>
<script>
export default {
  data() {
    return {
      activeIndex: '1',
      activeIndex2: '1'
    }
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath)
    }
  }
}
</script>
Hide
¶
