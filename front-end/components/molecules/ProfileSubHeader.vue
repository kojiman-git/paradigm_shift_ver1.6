<template>
  <div>
    <v-app-bar color="#cefffb" class="text-h4">
      <v-btn  id="login_button" color="#a7f9ff" :to="`/DrawerMenu/${this.$route.params.id}/editMyProfile`">
      Edit
      </v-btn>
      <v-spacer />
        Profile
      <v-spacer />
    </v-app-bar>
  </div>
</template>

<script>
export default {

}
</script>

<style>

</style>