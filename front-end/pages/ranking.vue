<template>
  <div class="con">
    <MoleculesLogedinHeader>Paradigm Shift</MoleculesLogedinHeader>
    <AtomsSubHeader>Rankig</AtomsSubHeader>
    <main>
      <div>
        <v-card v-for="post in PostList" :key="post.post_id">
          <v-row  no-gutters justify="space-around">
            <v-col cols="1">
              <div v-if="post.Rank === 1">
                <v-card-text class="center mt-4">
                  <v-icon color="#FFD700">mdi-medal-outline</v-icon>{{post.Rank}}位
                </v-card-text>
              </div>
              <div v-else-if="post.Rank === 2">
                <v-card-text class="center mt-4">
                  <v-icon color="#C0C0C0">mdi-medal-outline</v-icon>{{post.Rank}}位
                </v-card-text>
              </div>
              <div v-else-if="post.Rank === 3">
                <v-card-text class="center mt-4">
                  <v-icon color="#816D46">mdi-medal-outline</v-icon>{{post.Rank}}位
                </v-card-text>
              </div>
              <div v-else>
                <v-card-text class="center mt-4">
                  {{post.Rank}}位
                </v-card-text>
              </div>
            </v-col>
            <v-col cols="1" class="mt-4 ml-4" >
              <div v-if="post.userImage === null">
                <NuxtLink
                :to="`/DrawerMenu/${post.user_id}/myProfile`">
                  <v-img
                      max-height="75"
                      max-width="75"
                      v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
                  ></v-img>
                </NuxtLink>
              </div>
              <div v-else>
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
              <br>   
              <v-card-text >
              {{post.user_name}}
              </v-card-text>  
            </v-col>
            <v-col cols="8" class="mt-4" >
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
          </v-row> 
          <v-divider></v-divider>
        </v-card>
      </div>
    </main>
      <div>
        <v-divider></v-divider>
        <v-row align=end no-gutters>
          <v-col cols="2" >
            <v-btn   color="#cefffb" block @click="getRankingData(1)">
            英
            </v-btn>
          </v-col>
          <v-col cols="2" >
            <v-btn   color="#cefffb" block @click="getRankingData(2)">
            数
            </v-btn>
          </v-col>
          <v-col cols="2" >
            <v-btn   color="#cefffb" block @click="getRankingData(3)">
            国
            </v-btn>
          </v-col>
          <v-col cols="2" >
            <v-btn   color="#cefffb" block @click="getRankingData(4)">
            理
            </v-btn>
          </v-col>
          <v-col cols="2" >
            <v-btn   color="#cefffb" block @click="getRankingData(5)">
            社
            </v-btn>
          </v-col>
          <v-col cols="2" >
            <v-btn   color="#cefffb" block @click="getRankingData(6)">
            他
            </v-btn>
          </v-col>
        </v-row>
      </div>
    <MoleculesLogedinFooter/>
 </div>
</template>

<script>
import axios from 'axios';

  export default {
    data: () => ({
      postList:[],
      subjectId:1,
    }),
    computed:{
      PostList(){
        return this.$data.postList
      }
    },
    created(){
      axios
      .get(`https://spa-back-paradigm-shift.work/posts/getDefaultRankingData`, { withCredentials: true })
      .then(response => {
        this.$data.postList =  response.data 
        console.log(this.$data.postList);
      })
      .catch(error => {
        console.error(error);
      });
    },
    methods: {
      getRankingData(id) {
       
        const params = {subjectId:id}
        axios
      .post(`https://spa-back-paradigm-shift.work/posts/getRankingData`,params, { withCredentials: true })
         .then(response => {
        this.$data.postList =  response.data 
        this.$data.subjectId = id
        console.log(this.$data.postList);
      })
      .catch(error => {
        console.error(error);
      });
    },

  }
}
</script>