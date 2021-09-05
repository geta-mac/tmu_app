<template>
  <div class="pageContainer">
    <Header />
    <div class="content">
      <img class="university_image" src="@/assets/university_images/castle-336498_1920.jpg" alt="大学の写真">
      <PublicList
        :key="key"
        :publics="publics"
      />
    </div>
  </div>
</template>

<script>
import Header from './components/Header'
import PublicList from './components/PublicList'
import { mapGetters } from 'vuex'

export default {
  name: 'Public',
  components: {
    PublicList,
    Header
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
.pageContainer {
  position: relative;
  min-height: 100%;
}

.university_image{
  width: 100%;
}
</style>
