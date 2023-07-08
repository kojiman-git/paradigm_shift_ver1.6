<template>
  <div class="con">
    <MoleculesLogedinHeader>Paradigm Shift</MoleculesLogedinHeader>
    <AtomsSubHeader>Direct Message</AtomsSubHeader>
    <main>
    <div>
      <v-card v-for="Message in MessageList" :key="Message.id">
        <v-row  no-gutters justify="space-around">
          <v-col cols="1" class="mt-4" >
            <div class="center"  v-if="Message.userImage === null">
              <NuxtLink
              :to="`/DrawerMenu/${Message.userID}/myProfile`">
                <v-img
                    max-height="75"
                    max-width="75"
                    v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
                ></v-img>
              </NuxtLink>
            </div>
            <div class="center" v-else>
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
            <v-card-text class="center">
            {{Message.userName}}
            </v-card-text>
          </v-col>
          <v-col cols="6" class="mt-4" >
            <v-card-text >
              {{Message.Message}}
            </v-card-text>
          </v-col>
          <v-col cols="2" class="mt-4">
            <v-card-text class="center">
              {{Message.created_at.slice(0,10)}}
            </v-card-text>
          </v-col>
        </v-row> 
       <v-divider></v-divider>
      </v-card>
    </div>
    </main>
    <v-container>
     <v-row justify="center">
      <v-col class=center cols="9">
        <v-text-field 
        placeholder="メッセージを送ってみましょう"
        v-model="message"
        ></v-text-field>
      </v-col>
      <v-col cols="2">
        <v-btn
        color="#a7f9ff" 
        @click="sendMessageEvent"
        small
        >send</v-btn>
      </v-col>
     </v-row>
    </v-container>
    <MoleculesLogedinFooter/>
 </div>
</template>

<script>
import axios from 'axios';
export default {
   data(){
    return{
     messageList:[],
     message:""
    }
  },
  
  computed:{
    MessageList(){
     return this.$data.messageList
    }
  },

  created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/rooms/${this.$route.params.id}`, { withCredentials: true })
    .then(response => {
              this.$data.messageList =  response.data  
              console.log(this.$data.messageList)
    })
    .catch(error => {
      console.error(error);
    });
  },
  methods: {
   sendMessageEvent() {
     const params = {message:{message:this.$data.message,room_id:this.$route.params.id}}  
      axios
        .post('https://spa-back-paradigm-shift.work/messages',params, { withCredentials: true })
        .then(response => {
          if (response.data.message === "メッセージ作成できました") {
             axios
              .get(`https://spa-back-paradigm-shift.work/rooms/${this.$route.params.id}`, { withCredentials: true })
              .then(response => {
                    this.$data.messageList =  response.data 
                    this.$data.message = ""
              })
              .catch(error => {
                console.error(error);
              });
          }
        })
        .catch(error => {
          console.error(error);
        });
    },
 }
}
</script>

