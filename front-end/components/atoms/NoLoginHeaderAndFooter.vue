<template>
   <div>
    <v-app-bar color="#a7f9ff" class="text-h4">
      <v-spacer />
        <slot></slot>
      <v-spacer />
    </v-app-bar>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>

h1 {
  text-align: center;
  border: solid 1px #000000;
  background-color:#a7f9ff ;
}

</style>