<template>
  <div class="con">
    <MoleculesLogedinHeader>Paradigm Shift</MoleculesLogedinHeader>
    <div>
      <v-app-bar color="#cefffb" class="text-h4">
          <v-row no-gutters align=center>
            <v-col class=center>
            </v-col>
            <v-col class=center>
            </v-col>
            <v-col class=center>
            </v-col>
            <v-col class=center>
              Users
            </v-col>
            
            <v-col class=center cols="3">
              <v-text-field v-model="keyword"></v-text-field>
            </v-col>
            <v-col >
              <v-btn
              color="#a7f9ff"  class=ml-2 @click="userSearchEvent"
              small
              >search</v-btn>
            </v-col>
          </v-row>
      </v-app-bar>
    </div>
    <main>
      <div>
        <v-card v-for="user in usersList" :key="user.userID">
          <v-row  no-gutters >
            <v-col cols="2" class="mt-4">
              <div class="center" v-if="user.image === null">
                <NuxtLink :to="`/DrawerMenu/${user.userID}/myProfile`">
                  <v-img
                    max-height="75"
                    max-width="75"
                    v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
                  ></v-img>
                </NuxtLink>
              </div>
              <div class="center" v-else>
                <NuxtLink :to="`/DrawerMenu/${user.userID}/myProfile`">
                  <v-img
                    class="user-icon"
                    max-height="75"
                    max-width="75"
                    :src="`${user.image}`"
                  ></v-img>
                </NuxtLink>
              </div>
              
              <div class="center phone-font">
               {{user.userName}}
              </div>
            </v-col>
            <v-col cols="8" >
              <v-card-text class="phone-font">
              自己紹介
              </v-card-text>
              <br>
              <v-card-text class="phone-font">
              {{user.intoroduction}}
              </v-card-text>
            </v-col>
            <v-col cols="1" class="center mt-4">
              <div v-if= !user.currentUser>
                <v-btn small  v-if= user.followingJudgment color="#999999" @click="unfollowEvent(user.userID)">
                  unfollow
                </v-btn> 
                <v-btn small v-else color="#a7f9ff" @click="followEvent(user.userID)">
                  follow 
                </v-btn>
              </div>
           </v-col>
          </v-row> 
          <v-divider></v-divider>
        </v-card>
      </div>
    </main>
    <MoleculesUserAndPostSearchBtn/>
    <MoleculesLogedinFooter/>
 </div>
</template>

<script>
import axios from 'axios';
export default {
 data(){
    return {
     usersList:[],
     keyword:""
    }
  },
 created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/home_page/search`, { withCredentials: true })
    .then(response => {
      this.$data.usersList =  response.data 
      console.log(this.$data.usersList);
    })
    .catch(error => {
      console.error(error);
    });
 },
  methods: {
  userSearchEvent(){
     
     axios
    .get(`https://spa-back-paradigm-shift.work/search/user_search?keyword=${this.$data.keyword}`,{ withCredentials: true })
    .then(response => {
      this.$data.usersList =  response.data 
      console.log(this.$data.usersList);
    })
    .catch(error => {
      console.error(error);
    });  
   },

    unfollowEvent(id) {
       axios
    .delete(`https://spa-back-paradigm-shift.work/relationships/${id}/`, { withCredentials: true })
    .then(response => {
       if (response.data.message === "フォロー解除しました") {
            axios
          .get(`https://spa-back-paradigm-shift.work/home_page/search`, { withCredentials: true })
          .then(response => {
            this.$data.usersList =  response.data 
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
    .post(`https://spa-back-paradigm-shift.work/relationships/`,params,{withCredentials: true })
    .then(response => {
       if (response.data.message === "フォロー生成しました") {
            axios
          .get(`https://spa-back-paradigm-shift.work/home_page/search`, { withCredentials: true })
          .then(response => {
            this.$data.usersList =  response.data 
          })
          }
            axios
          .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
          .then(response => {
            this.$store.dispatch('followingPost/setEvent',response.data)
          })
        })     
   },


  }
}
</script>

