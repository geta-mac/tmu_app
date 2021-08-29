<template>
  <div class="pageContainer">
    <div class="side set_sidebar">
      <div class="position">
        <ul>
          <li>部活動</li>
        </ul>
      </div>
    </div>
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
// import Sidebar from './components/Sidebar'
import PublicList from './components/PublicList'
import { mapGetters } from 'vuex'

export default {
  name: 'Public',
  components: {
    PublicList
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

.set_sidebar {
  position: absolute;
  width: 200px;
  height: 100%;
  background-color: black;
  color: white;
}

.content {
  padding-left: 200px;
}

.university_image{
  width: 100%;
}
</style>
