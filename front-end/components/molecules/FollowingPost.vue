<template>
  <div>
    <v-card v-for="post in posts" :key="post.post_id">
      <v-row  no-gutters justify="space-around">
        <v-col cols="2" class="mt-4 ml-4" >
          <div v-if="post.userImage === null" class="center">
            <NuxtLink
            :to="`/DrawerMenu/${post.user_id}/myProfile`">
              <v-img
                  max-height="75"
                  max-width="75"
                  v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
              ></v-img>
            </NuxtLink>
          </div>
          <div class="center" v-else>
            <NuxtLink
            :to="`/DrawerMenu/${post.user_id}/myProfile`">
              <v-img
                class="user-icon"
                max-height="75"
                max-width="75"
                :src="`${post.userImage}`"
              ></v-img>
            </NuxtLink>
          </div>         
          <v-card-text class="center phone-font">
           {{post.user_name}}
          </v-card-text>
        </v-col>
        <v-col cols="8" class="mt-4" >
        <NuxtLink :to="`/Post/${post.post_id}/PostDetail/`" tag="div" class="c-p">
          <v-card-text class="phone-font">
            {{post.category}}
            <br>
            <br>
            {{post.term}}
            <br>
            <br>
            {{post.paraphrase}}
            <br>
            <br>
            評価{{post.avg_score}}/5（{{post.reviewsCount}}件のレビュー）
          </v-card-text >
        </NuxtLink>
        </v-col>
        <v-col cols="1" class="likeAndDelete" >
          <v-btn 
          icon 
          v-show=post.sameID 
          @click="deleteEvent(post.post_id)"
          >
            <v-icon >mdi-delete</v-icon>
          </v-btn>
          <br>
          <v-btn icon>
            <v-icon 
            v-if="post.Liked"
            color="red"
            @click="disLikeEvnet(post.post_id)">
            mdi-cards-heart</v-icon>
            <v-icon 
            v-else
            @click="LikeEvnet(post.post_id)"
            >mdi-cards-heart-outline</v-icon>
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
    return {
      dialog:false,
    }
  },
  computed:{
   posts(){
     return this.$store.state.followingPost.postData
   }
  },
  created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/home_page/home`, { withCredentials: true })
    .then(response => {
        this.$store.dispatch('followingPost/setEvent',response.data)
     })
    .catch(error => {
      console.error(error);
    });
  },
  methods: {
    deleteEvent(id) {
       axios
    .delete(`https://spa-back-paradigm-shift.work/posts/${id}/`, { withCredentials: true })
    .then(response => {
       if (response.data.message === "削除完了です") {
          axios
          .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
          .then(response => {
            this.$store.dispatch('followingPost/setEvent',response.data)
          })
        }    
      })
    },
    disLikeEvnet(ID){
      const params = {post_id:ID}
      axios
      .get(`https://spa-back-paradigm-shift.work/posts/${ID}/des`,{ withCredentials: true },params)
      .then(response => {
        if (response.data.message === "お気に入り解除できました") { 
          axios
            .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
            .then(response => {
              this.$store.dispatch('followingPost/setEvent',response.data)
            })
        }
      })     
    },
    LikeEvnet(ID){
        const params = {post_id:ID}
      axios
      .get(`https://spa-back-paradigm-shift.work/posts/${ID}/cre`,{ withCredentials: true },params)
      .then(response => {
        if (response.data.message === "お気に入り登録できました") {
          axios
            .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
            .then(response => {
              this.$store.dispatch('followingPost/setEvent',response.data)
            })
        }
      })     
    },

  }
}
</script>
         
          
          

<style scoped>
.c-p{
 cursor: pointer;
}

.likeAndDelete{
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

</style>