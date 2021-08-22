<template>
  <div>
    <el-row>
      <router-link :to="'/dashboard'" class="el-button el-button--primary">
        <span>ログイン</span>
      </router-link>
    </el-row>
    <div class="aa">
      <Sidebar />
      <PublicTable
        :key="key"
        :publics="publics"
      />
    </div>
  </div>
</template>

<script>
import Sidebar from './components/Sidebar'
import PublicTable from './components/PublicTable'
import { mapGetters } from 'vuex'

export default {
  name: 'Public',
  components: {
    PublicTable,
    Sidebar
  },
  data() {
    return {
      key: 0
    }
  },
  computed: {
    ...mapGetters({
      publics: 'public/publicAll'
    })
  },
  mounted() {
    this.$store.dispatch('public/getPublics')
  }
}
</script>

<style>
.aa {
  display: flex;
}
</style>
