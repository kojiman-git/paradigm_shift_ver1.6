<template>
  <div>
    <v-card v-for="post in posts" :key="post.post_id">
      <v-row  no-gutters justify="space-around">
        <v-col cols="3" class="mt-4 ml-4" >
          <v-img
              max-height="75"
              max-width="75"
              v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
          ></v-img><br>
          <NuxtLink
          :to="`/DrawerMenu/${post.user_id}/myProfile`">
          <v-card-text >
           {{post.user_name}}
          </v-card-text>
          </NuxtLink>
          
        </v-col>
        <v-col cols="7" class="mt-4">
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
export default {
 computed:{
   posts(){
     return this.$store.state.followingPost.postData
   }
 }
 

} 

</script>

<style scoped>

</style>