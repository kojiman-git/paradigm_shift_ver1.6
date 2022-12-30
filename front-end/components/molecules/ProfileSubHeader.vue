<template>
  <div>
    <v-app-bar color="#cefffb" class="text-h4">
      <div v-show="vueProfile.currentUser">
      <v-btn  id="login_button" color="#a7f9ff" :to="`/DrawerMenu/${this.$route.params.id}/editMyProfile`">
      Edit
      </v-btn>
      </div>
      <v-spacer />
        Profile
      <v-spacer />
    </v-app-bar>
  </div>
</template>

<script>
import axios from 'axios';
export default {
   data(){
    return{
     vueProfile: [],
    }
   },
   created(){
    axios
    .get(`http://localhost:3000/users/${this.$route.params.id}/`, { withCredentials: true })
    .then(response => {
      this.$data.vueProfile =  response.data 
      console.log(this.$data.vueProfile);
    })
    .catch(error => {
      console.error(error);
    });
  },

}
</script>

<style>

</style>