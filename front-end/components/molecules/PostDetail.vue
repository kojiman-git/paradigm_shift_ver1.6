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
            <v-img
              max-height="75"
              max-width="75"
              v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
            ></v-img>
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
      <v-sheet height="38vh">
        <v-row justify="center"  no-gutters>
          <v-col cols="12" class= "center text-h4">
            {{postDetailsInfo.paraphrase}}
          </v-col>
        </v-row>
      </v-sheet >
      <v-sheet height="5vh">
        <v-row justify="space-between"  no-gutters>
          <v-col cols="2" class=center>
            評価
          </v-col>

          <v-col cols="2" class=center>
            <v-btn icon>
              <v-icon 
              v-if=postDetailsInfo.Liked
              color="red">
              mdi-cards-heart</v-icon>
              <v-icon v-else>mdi-cards-heart-outline</v-icon>
            </v-btn>
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
         <v-img
              max-height="50"
              max-width="50"
              v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
         ></v-img>
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
    }
  },
  methods: {
    sendCommentEvent() {
    const params = {comment:{comment:this.$data.comment,post_id:this.$route.params.id}}
     axios
        .post('http://localhost:3000/post_details',params, { withCredentials: true })
        .then(response => {
          if (response.data.message === "コメント生成しました") {
            this.$data.comment = "" 
            axios
            .get(`http://localhost:3000/post_details/${this.$route.params.id}`, { withCredentials: true })
            .then(response => {
              this.$data.postDetailsInfo =  response.data  
            }) 
           }
        })     
  }
 },

   computed:{
     comments(){
     return this.$data.postDetailsInfo.comments
   }
  },
  
  created(){
    axios
    .get(`http://localhost:3000/post_details/${this.$route.params.id}`, { withCredentials: true })
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
.end {
 display: flex;
 justify-content: end;
}
.column {
 display: flex;
 flex-flow: column;
}
</style>