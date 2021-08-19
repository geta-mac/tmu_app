<template>
  <div>
    <el-row>
      <router-link :to="'/dashboard'" class="el-button el-button--primary">
        <span>ログイン</span>
      </router-link>
    </el-row>
    <p>public index</p>
    <PublicTable
      :key="key"
      :publics="publics"
    />
  </div>
</template>

<script>
import PublicTable from './components/PublicTable'
import { mapGetters } from 'vuex'

export default {
  name: 'Public',
  components: { PublicTable },
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
