<template>
  <div>
    <el-row>
      <router-link :to="'/dashboard'" class="el-button el-button--primary">
        <span>ログイン</span>
      </router-link>
    </el-row>
    <p>public index</p>
    <PublicTable />
  </div>
</template>

<script>
import PublicTable from './components/PublicTable'

export default {
  components: {
    PublicTable
  }
}
</script>
