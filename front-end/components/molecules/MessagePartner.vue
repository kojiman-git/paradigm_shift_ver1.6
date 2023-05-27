<template>
  <div>
    <v-card v-for="message in messagePartners" :key="message.id">
      <v-row  no-gutters>
        <v-col cols="4" class="center">
         <div v-if="message.userImage === null">
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
              :src="`${message.userImage}`"
            ></v-img>
          </div>
        </v-col>
        <v-col cols="4" class="mt-4 center text-h5">
           <NuxtLink :to="`/Message/${message.roomId}/directMessage`">
            {{message.userName}}とのトークルームへ移動
          </NuxtLink>
        </v-col>
        <v-col cols="4" class="mt-4 center text-h5">
          
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
     messagePartners: [],
    }
   },

   created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/home_page/direct_message`, { withCredentials: true })
    .then(response => {
      this.$data.messagePartners =  response.data 
      console.log(this.$data.messagePartners);
    })
    .catch(error => {
      console.error(error);
    });
  },

}
</script>

<style>

</style>