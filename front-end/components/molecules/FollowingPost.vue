<template>
  <div>
    <v-card v-for="post in posts" :key="post.post_id">
      <v-row  no-gutters justify="space-around">
        <v-col cols="3" class="mt-4 ml-4" >
          <NuxtLink
          :to="`/DrawerMenu/${post.user_id}/myProfile`">
            <v-img
                max-height="75"
                max-width="75"
                v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
            ></v-img>
          </NuxtLink>
          <br>
          <NuxtLink
          :to="`/DrawerMenu/${post.user_id}/myProfile`">
          <v-card-text >
           {{post.user_name}}
          </v-card-text>
          </NuxtLink>
          
        </v-col>
        <v-col cols="7" class="mt-4" >
        <NuxtLink :to="`/Post/${post.post_id}/PostDetail/`" tag="div" class="c-p">
          <v-card-text >
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
          </v-card-text>
        </NuxtLink>
        </v-col>
        <v-col cols="1" class="mt-4">
          <v-btn 
          icon 
          v-show=post.sameID 
          @click="deleteEvent(post.post_id)"
          >
            <v-icon >mdi-delete</v-icon>
          </v-btn>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <v-btn icon>
            <v-icon 
            v-if="post.Liked"
            color="red">
            mdi-cards-heart</v-icon>
            <v-icon v-else>mdi-cards-heart-outline</v-icon>
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
  methods: {
    deleteEvent(id) {
       axios
    .delete(`http://localhost:3000/posts/${id}/`, { withCredentials: true })
    .then(response => {
       if (response.data.message === "削除完了です") {
          axios
          .get('http://localhost:3000/home_page/home', { withCredentials: true })
          .then(response => {
            this.$store.dispatch('followingPost/setEvent',response.data)
          })
        }    
      })
    }

  }
}
</script>
         
          
          

<style scoped>
.c-p{
 cursor: pointer;
 
}
</style>