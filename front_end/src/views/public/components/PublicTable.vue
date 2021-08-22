<template>
  <el-table
    :data="publics"
    style="width: 100%"
  >
    <el-table-column
      prop="title"
      :label="$t('post.title')"
      width="180"
    />
    <el-table-column
      prop="_content"
      :label="$t('post.content')"
      width="320"
      height="100"
    />
  </el-table>
</template>

<script>
export default {
  props: {
    publics: {
      type: Array,
      default() {
        return []
      }
    }
  }
}
</script>
