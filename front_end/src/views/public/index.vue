<template>
  <div>
    <el-row>
      <router-link :to="'/dashboard'" class="el-button el-button--primary">
        <span>ログイン</span>
      </router-link>
    </el-row>
    <div style="display: flex;">
      <Sidebar />
      <PublicList
        :key="key"
        :publics="publics"
      />
    </div>
    <div>
      <a class="twitter-timeline" href="https://twitter.com/bot29742534?ref_src=twsrc%5Etfw">Tweets by bot29742534</a>
      <script async src="https://platform.twitter.com/widgets.js" charset="utf-8" />
    </div>
  </div>
</template>

<script>
import Sidebar from './components/Sidebar'
import PublicList from './components/PublicList'
import { mapGetters } from 'vuex'

export default {
  name: 'Public',
  components: {
    PublicList,
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
