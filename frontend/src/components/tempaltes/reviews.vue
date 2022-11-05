<template>
  <div v-for="review in reviews">
    <div>
      {{ review.id }}
    </div>
    <button type="submit" @submit="handleSubmit">submit</button>
  </div>
</template>

<script>
// Vuex(状態管理)はほとんど使わない
// なぜならどのページでも使うような情報はほぼない、認証ぐらい
// グローバル変数に近いものなので、アクセスできるコンポーネント(organismとtemplate、page)に限ってあげないと、いろんなところに依存が発生する
// -> vuexの修正をしようとしたら、いろんなところに影響が出てしまう -> 改修しにくい
// 最近vuexは下火、https://pinia.vuejs.org/ が主流になってきている
export default {
  props: {
    reviews: {
      type: Array,
      default: [],
    }
  },
  methods: {
    handleSubmit() {
      this.$emit('onSubmit', {})
    }
  }
}
</script>