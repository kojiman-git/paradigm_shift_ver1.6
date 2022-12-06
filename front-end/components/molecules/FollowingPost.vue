<template>
  <div>
    <v-card >
      <v-row  no-gutters justify="space-around">
        <v-col cols=" 3" class="mt-4 ml-4" >
          <v-img
              max-height="100"
              max-width="100"
              v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
          ></v-img><br>
          <v-card-text class="ml-2">
           <NuxtLink to=myProfile>{{postData[0].user_name}}</NuxtLink>
          </v-card-text>
        </v-col>
        <v-col cols="8" class="mt-4">
          <v-card-text >
            {{postData[0].category}}
            <br>
            <br>
            {{postData[0].term}}
            <br>
            <br>
            {{postData[0].paraphrase}}
            <br>
            <br>
            平均評価{{postData[0].avg_score}}/5（{{postData[0].reviewsCount}}件のレビュー）
          </v-card-text>
        </v-col>
        <v-col cols="1" class="mt-4">
          <v-btn icon>
            <v-icon>mdi-delete</v-icon>
          </v-btn>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <v-btn icon>
            <v-icon 
            v-if=postData[0].Liked
            color="red">
            mdi-cards-heart</v-icon>
            <v-icon v-else>mdi-cards-heart-outline</v-icon>
          </v-btn>
        </v-col>
      </v-row> 
    </v-card>
  </div>
</template>

<script>
import axios from 'axios';
export default {
 data(){
    return {
     postData:[{ "post_id": "", "user_id": "", "user_name": "", "term": "", "paraphrase": "", "category": "", "created_at": "", "avg_score": "", "reviewsCount": "", "reviewScorePercentage": "", "userImage": "" ,Liked:""}]
    }
  },
   created(){
   axios
        .get('http://localhost:3000/home_page/home', { withCredentials: true })
        .then(response => {
          console.log(response.data)
          this.$data.postData = response.data
          
        })
        .catch(error => {
          console.error(error);
        });
  },

    methods: {
    OutPutEvents() {
    console.log(this.postData[0].Liked)
    console.log(this.postData[0].term)
    console.log(this.$store.state.currentUser.name)
    
  },
 }

} 

</script>

<style scoped>

</style>