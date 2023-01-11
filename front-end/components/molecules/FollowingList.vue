<template>
  <div>
    <v-card v-for="following in FollowingList" :key="following.id">
      <v-row  no-gutters >
        <v-col cols="3" class="mt-4 ml-4">
         <div v-if="following.image.thumb.url === null">
            <NuxtLink
            :to="`/DrawerMenu/${following.id}/myProfile`">
            <v-img
              max-height="75"
              max-width="75"
              v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
            ></v-img>
            </NuxtLink>
         </div>
         <div v-else>
            <NuxtLink
            :to="`/DrawerMenu/${following.id}/myProfile`">
            <v-img
              class="user-icon"
              max-height="75"
              max-width="75"
              :src="`http://localhost:3000${following.image.thumb.url}`"
            ></v-img>
            </NuxtLink>
          </div>
          <br>
          <v-card-text >
           {{following.name}}
          </v-card-text>
        </v-col>
        <v-col cols="5" >
          <v-card-text >
           自己紹介
          </v-card-text>
          <br>
          <v-card-text >
           {{following.intoroduction}}
          </v-card-text>
        </v-col>
        <v-col cols="3" class="center mt-4 ml-4">
          <v-btn  color="#999999" @click="unfollowEvent(following.id)">
            unfollow
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
     followingList: [],
    }
   },

  computed:{
   FollowingList(){
     return this.$data.followingList
   }
 },

   created(){
    axios
    .get(`http://localhost:3000/users/${this.$route.params.id}/following`, { withCredentials: true })
    .then(response => {
      this.$data.followingList =  response.data 
      console.log(this.$data.followingList);
    })
    .catch(error => {
      console.error(error);
    });
  },

  methods: {
    unfollowEvent(id) {
       axios
    .delete(`http://localhost:3000/relationships/${id}/`, { withCredentials: true })
    .then(response => {
       if (response.data.message === "フォロー解除しました") {
            axios
          .get(`http://localhost:3000/users/${this.$route.params.id}/following`, { withCredentials: true })
          .then(response => {
            this.$data.followingList =  response.data 
          })
          }
          axios
          .get('http://localhost:3000/home_page/home', { withCredentials: true })
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