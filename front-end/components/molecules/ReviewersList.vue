<template>
  <div>
    <v-card v-for="review in reviewsList" :key="review.id">
      <v-row  no-gutters>
        <v-col cols="4" class="center">
         <div v-if="review.userImage === null">
          <v-img
            max-height="75"
            max-width="75"
            v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
          ></v-img>
         </div>
         <div v-else>
            <v-img
              class="user-icon"
              max-height="75"
              max-width="75"
              :src="`${review.userImage}`"
            ></v-img>
          </div>
        </v-col>
        <v-col cols="4" class="mt-4 center text-h5">
          {{review.user_name}}
        </v-col>
        <v-col cols="4" class="mt-4 center text-h5">
          score:{{review.score}}
        </v-col>
      </v-row> 
     <v-divider></v-divider>
    </v-card>
  </div>
</template>

<script>
import axios from 'axios';
export default {

   data(){
    return{
     reviewsList: {id:"",user_name:"",userImage:"",score:""},
    }
   },

   created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/post_details/${this.$route.params.id}/reviews`, { withCredentials: true })
    .then(response => {
      this.$data.reviewsList =  response.data  
    })
    .catch(error => {
      console.error(error);
    });
  }

}
</script>

<style>
.center {
 display: flex;
 justify-content: center;
}
</style>