<template>
  <div>
    <v-card v-for="follower in  FollowersList" :key="follower.id">
      <v-row  no-gutters >
        <v-col cols="3" class="mt-4 ml-4">
         <div class="center" v-if="follower.userImage === null">
            <NuxtLink
            :to="`/DrawerMenu/${follower.user_id}/myProfile`">
            <v-img
              max-height="75"
              max-width="75"
              v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
            ></v-img>
            </NuxtLink>
         </div>
         <div class="center" v-else>
            <NuxtLink
            :to="`/DrawerMenu/${follower.user_id}/myProfile`">
            <v-img
              class="user-icon"
              max-height="75"
              max-width="75"
              :src="`${follower.userImage}`"
            ></v-img>
            </NuxtLink>
          </div>
          <br>
          <v-card-text class="center">
           {{follower.user_name}}
          </v-card-text>
        </v-col>
        <v-col cols="6" >
          <v-card-text >
           自己紹介
          </v-card-text>
          <br>
          <v-card-text >
           {{follower.intoroduction}}
          </v-card-text>
        </v-col>
        <v-col cols="2" class="center mt-4">
          <v-btn small v-if=follower.follow color="#999999" @click="unfollowEvent(follower.user_id)">
            unfollow
          </v-btn> 
          <v-btn small v-else color="#a7f9ff" @click="followEvent(follower.user_id)">
            follow 
          </v-btn>
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
     followersList: [{user_id:"",user_name:"",userImage:"",intoroduction:"",follow:""}],
    }
   },

  computed:{
   FollowersList(){
     return this.$data.followersList
   }
 },

   created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/followers`, { withCredentials: true })
    .then(response => {
      this.$data.followersList =  response.data 
      console.log(this.$data.followersList);
    })
    .catch(error => {
      console.error(error);
    });
  },

  methods: {
    unfollowEvent(id) {
       axios
    .delete(`https://spa-back-paradigm-shift.work/relationships/${id}/`, { withCredentials: true })
    .then(response => {
       if (response.data.message === "フォロー解除しました") {
            axios
          .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/followers`, { withCredentials: true })
          .then(response => {
            this.$data.followersList =  response.data 
          })
          }
            axios
          .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
          .then(response => {
            this.$store.dispatch('followingPost/setEvent',response.data)
          })
        })     
   },
    followEvent(userId) {
       const params = {id:userId}  
       axios
    .post(`https://spa-back-paradigm-shift.work/relationships/`,params, {withCredentials: true })
    .then(response => {
       if (response.data.message === "フォロー生成しました") {
            axios
          .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/followers`, { withCredentials: true })
          .then(response => {
            this.$data.followersList =  response.data 
          })
          }
            axios
          .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
          .then(response => {
            this.$store.dispatch('followingPost/setEvent',response.data)
          })
        })     
   }
  }


}
</script>

<style>
.center {
 display: flex;
 justify-content: center;
}
</style>