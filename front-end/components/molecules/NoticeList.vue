<template>
  <div>
    <v-card v-for="notice in  noticeList" :key="notice.id">
      <v-row  no-gutters >
        <v-col cols="4" class="center">
          <div v-if="notice.subjectuserImage === null">
            <NuxtLink
            :to="`/DrawerMenu/${notice.subjectuserID}/myProfile`">
              <v-img
                  max-height="50"
                  max-width="50"
                  v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
              ></v-img>
            </NuxtLink>
          </div>
          <div v-else>
            <NuxtLink
            :to="`/DrawerMenu/${notice.subjectuserID}/myProfile`">
              <v-img
                  class="user-icon"
                  max-height="50"
                  max-width="50"
                  :src="`${notice.subjectuserImage}`"
              ></v-img>
            </NuxtLink>
          </div>
        </v-col>
        <v-col cols="4">
          <NuxtLink
            :to="`/DrawerMenu/${notice.subjectuserID}/myProfile`">
            <v-card-text class="center">
            {{notice.content}}
            </v-card-text>
          </NuxtLink>
        </v-col>
        <v-col cols="4">
          <v-card-text class="center">
           {{notice.created_at.slice(0,10)}}
          </v-card-text>
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
     noticeList: [{id:"",subjectuserID:"",subjectuserImage:"",content:"",created_at: ""}],
    }
   },
   created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/home_page/news`, { withCredentials: true })
    .then(response => {
      this.$data.noticeList =  response.data 
      console.log(this.$data.noticeList);
    })
    .catch(error => {
      console.error(error);
    });
  },
}
</script>

<style>

</style>