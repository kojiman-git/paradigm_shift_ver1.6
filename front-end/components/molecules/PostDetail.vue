<template>
  <div>
    <v-sheet height="75vh">
      <v-sheet height="2vh">
      </v-sheet>
      <v-sheet height="30vh">
        <v-row  no-gutters>
          <v-col cols="1">
          </v-col>
          <v-col cols="3"  class="column text-h6">
            <div v-if="postDetailsInfo.userImage === null">
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
                :src="`${postDetailsInfo.userImage}`"
              ></v-img>
            </div>
            {{postDetailsInfo.user_name}}
          </v-col>
          <v-col cols="4" class= "center text-h4">
            {{postDetailsInfo.term}}
          </v-col>
          <v-col cols="3" class="end text-h4" >
            {{postDetailsInfo.category}}
          </v-col>
          <v-col cols="1" >
          </v-col>
        </v-row> 
      </v-sheet >
      <v-sheet height="34vh">
        <v-row justify="center"  no-gutters>
          <v-col cols="12" class= "center text-h4">
            {{postDetailsInfo.paraphrase}}
          </v-col>
        </v-row>
      </v-sheet >
      <v-sheet height="7vh">
        <v-row justify="space-between"  no-gutters>
          <v-col cols="9" class=start>
              <v-rating
                color="warning"
                empty-icon="mdi-star-outline"
                full-icon="mdi-star"
                hover
                length="5"
                size="25"
                v-model="value"
                v-if=!postDetailsInfo.reviewed
              ></v-rating>
              <v-btn
              color="#a7f9ff" 
              @click="sendReviewEvent"
              v-if=!postDetailsInfo.reviewed
              >send</v-btn>
          </v-col>

          <v-col cols="2" class=center>
            <v-btn icon>
              <v-icon 
              v-if=postDetailsInfo.Liked
              color="red"
              @click="disLikeEvnet">
              mdi-cards-heart</v-icon>
              <v-icon 
              v-else
              @click="LikeEvnet">
              mdi-cards-heart-outline</v-icon>
            </v-btn>
          </v-col>
        </v-row>
        <v-row justify="space-between"  no-gutters>
          <v-col cols="9" class=start>
            <NuxtLink :to="`/Post/${this.$route.params.id}/reviews/`" class=ml-4>
              {{postDetailsInfo.reviewsCount}}件のレビュー
            </NuxtLink>
          </v-col>
        </v-row>
      </v-sheet >
    </v-sheet >
    <AtomsSubHeader>Comments</AtomsSubHeader>
    <v-card v-for="comment in comments" :key="comment.id">
      <v-row  no-gutters >
         <v-col cols="1">
         
        </v-col>
        <v-col cols="2" >
          <div v-if="comment.userImage === null">
            <v-img
              max-height="50"
              max-width="50"
              v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
            ></v-img>
          </div>
          <div v-else>
              <v-img
              class="user-icon"
              max-height="50"
              max-width="50"
              :src="`${comment.userImage}`"
            ></v-img>
          </div>
         {{comment.user_name}}
        </v-col>
        <v-col cols="7" class="mt-4">
         {{comment.comment}}
        </v-col>
        <v-col cols="2" class="mt-4">
         {{comment.created_at.slice(0,10)}}
        </v-col>
      </v-row> 
    <v-divider></v-divider>
    </v-card>
    <v-container>
     <v-row justify="center">
      <v-col class=center cols="9">
        <v-text-field 
        placeholder="この投稿にコメントしてみましょう"
        v-model="comment"
        ></v-text-field>
      </v-col>
      <v-col cols="2">
        <v-btn
        color="#a7f9ff" 
        @click="sendCommentEvent"
        block
        >send</v-btn>
      </v-col>
     </v-row>
    </v-container>
  </div>
</template>

<script>
import axios from 'axios';
export default {
   data(){
    return{
      postDetailsInfo: {post_id:"",user_id:"",user_name:"",term:"",paraphrase:"",category:"",created_at: "",reviewsCount:"",userImage:"",Liked:"",comments:[]},
      comment:"",
      value:0
    }
  },
  methods: {
    sendCommentEvent() {
        const params = {comment:{comment:this.$data.comment,post_id:this.$route.params.id}}
     axios
        .post('https://spa-back-paradigm-shift.work/post_details',params, { withCredentials: true })
        .then(response => {
          if (response.data.message === "コメント生成しました") {
            this.$data.comment = "" 
            axios
            .get(`https://spa-back-paradigm-shift.work/post_details/${this.$route.params.id}`, { withCredentials: true })
            .then(response => {
              this.$data.postDetailsInfo =  response.data  
            }) 
          }
        })     
    },
    
    sendReviewEvent(){
        const params = {review:{post_id:this.$route.params.id,score:this.$data.value}}
      axios
        .post(`https://spa-back-paradigm-shift.work/post_details/${this.$route.params.id}/reviews`,params, { withCredentials: true })
        .then(response => {
          if (response.data.message === "レビューを生成しました") {
            axios
            .get(`https://spa-back-paradigm-shift.work/post_details/${this.$route.params.id}`, { withCredentials: true })
            .then(response => {
              this.$data.postDetailsInfo =  response.data  
            }) 
            axios
              .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
              .then(response => {
                this.$store.dispatch('followingPost/setEvent',response.data)
              })
          }
        })     
    },
    disLikeEvnet(){
        const params = {post_id:this.$route.params.id}
      axios
        .get(`https://spa-back-paradigm-shift.work/posts/${this.$route.params.id}/des`,{ withCredentials: true },params)
        .then(response => {
          if (response.data.message === "お気に入り解除できました") {
            axios
            .get(`https://spa-back-paradigm-shift.work/post_details/${this.$route.params.id}`, { withCredentials: true })
            .then(response => {
              this.$data.postDetailsInfo =  response.data  
            }) 
            axios
              .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
              .then(response => {
                this.$store.dispatch('followingPost/setEvent',response.data)
              })
          }
        })     
    },
    LikeEvnet(){
        const params = {post_id:this.$route.params.id}
      axios
        .get(`https://spa-back-paradigm-shift.work/posts/${this.$route.params.id}/cre`,{ withCredentials: true },params)
        .then(response => {
          if (response.data.message === "お気に入り登録できました") {
            axios
            .get(`https://spa-back-paradigm-shift.work/post_details/${this.$route.params.id}`, { withCredentials: true })
            .then(response => {
              this.$data.postDetailsInfo =  response.data  
            }) 
            axios
              .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
              .then(response => {
                this.$store.dispatch('followingPost/setEvent',response.data)
              })
          }
        })     
    },
    
 },

   computed:{
     comments(){
     return this.$data.postDetailsInfo.comments
   },
     reviewsCount(){
     return this.$data.postDetailsInfo.reviewsCount
   }
  },
  
  created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/post_details/${this.$route.params.id}`, { withCredentials: true })
    .then(response => {
      this.$data.postDetailsInfo =  response.data  
      console.log(this.$data.postDetailsInfo)
    })
    .catch(error => {
      console.error(error);
    });
  }

}
</script>

<style scoped>
.center {
 display: flex;
 justify-content: center;
}
.start {
 display: flex;
 justify-content: start;
}
.end {
 display: flex;
 justify-content: end;
}
.column {
 display: flex;
 flex-flow: column;
}
</style>