<template>
  <div>
    <v-card v-for="Message in MessageList" :key="Message.id">
      <v-row  no-gutters justify="space-around">
        <v-col cols="3" class="mt-4 ml-4" >
          <div v-if="Message.userImage === null">
            <NuxtLink
            :to="`/DrawerMenu/${Message.userID}/myProfile`">
              <v-img
                  max-height="75"
                  max-width="75"
                  v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
              ></v-img>
            </NuxtLink>
          </div>
          <div v-else>
            <NuxtLink
            :to="`/DrawerMenu/${Message.userID}/myProfile`">
              <v-img
                class="user-icon"
                max-height="75"
                max-width="75"
                :src="`${Message.userImage}`"
              ></v-img>
            </NuxtLink>
          </div>
          <br>
          <v-card-text >
           {{Message.userName}}
          </v-card-text>
        </v-col>
        <v-col cols="5" class="mt-4" >
          <v-card-text >
            {{Message.Message}}
          </v-card-text>
        </v-col>
        <v-col cols="3" class="mt-4 ">
          <v-card-text >
            {{Message.created_at.slice(0,10)}}
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
     messageList:[]
    }
  },
  
  computed:{
    MessageList(){
     return this.$data.messageList
    }
  },

  created(){
    
    axios
    .get(`http://localhost:3000/rooms/${this.$route.params.id}`, { withCredentials: true })
    .then(response => {
          if (response.data[0].message === "部屋にいる") {
              this.$data.messageList =  response.data  
              console.log(this.$data.messageList)
          }
    })
    .catch(error => {
      console.error(error);
    });
  }

}
</script>

<style>

</style>