<template>
  <div>
    <v-card >
      <v-row  no-gutters justify = space-around>
        <v-col cols="3" class="mt-4">
          <div class="center" v-if="vueProfile.image === null">
            <v-img
                max-height="75"
                max-width="75"
                v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
            ></v-img>
          </div>
          <div class="center" v-else>
            <v-img
                class="user-icon"
                max-height="75"
                max-width="75"
                :src="`${vueProfile.image}`"
            ></v-img>
          </div>
          <br>
          <v-card-text class="center">
           {{vueProfile.userName}}
          </v-card-text>
          <v-row  no-gutters justify = space-between>
            <v-col cols="12" >
              <NuxtLink :to="`/DrawerMenu/${this.$data.vueProfile.userID}/following`" class="c-p center" tag="span">
              {{vueProfile.following}} following
              </NuxtLink>
              <NuxtLink :to="`/DrawerMenu/${this.$data.vueProfile.userID}/followers`" class="c-p ml-2 center" tag="span">
              {{vueProfile.follower}} follower
              </NuxtLink>
            </v-col>
          </v-row>
        </v-col>
        <v-col cols="6" >
          <v-card-text >
           自己紹介
          </v-card-text>
          <br>
          <v-card-text >
           {{vueProfile.intoroduction}}
          </v-card-text>
        </v-col>
        <v-col cols="2" class=" mt-4 mr-8" >
          <div v-show=!vueProfile.currentUser>
          <v-btn small v-if=vueProfile.followingJudgment color="#999999" @click="unfollowEvent(vueProfile.userID)">
            unfollow
          </v-btn> 
          <v-btn small v-else color="#a7f9ff" @click="followEvent(vueProfile.userID)">
            follow 
          </v-btn>
          <br>
          <v-btn small color="#a7f9ff" class=" mt-4" @click="messageEvent">
            message
          </v-btn>
          </div>
        </v-col>
      </v-row> 
    <v-divider></v-divider>
    </v-card>
    <v-card v-for="post in vueProfile.userPosts" :key="post.post_id">
      <v-row  no-gutters justify="space-around">
        <v-col cols="3" class="mt-4" >
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
        <v-col cols="7" class="mt-4" >
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
    return{
     vueProfile: [],
    }
   },
   created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/`, { withCredentials: true })
    .then(response => {
      this.$data.vueProfile =  response.data 
      console.log(this.$data.vueProfile);
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
          .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/`, { withCredentials: true })
          .then(response => {
            this.$data.vueProfile =  response.data 
            console.log(this.$data.vueProfile);
          })
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
            .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/`, { withCredentials: true })
            .then(response => {
              this.$data.vueProfile =  response.data 
              console.log(this.$data.vueProfile);
            })
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
            .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/`, { withCredentials: true })
            .then(response => {
              this.$data.vueProfile =  response.data 
              console.log(this.$data.vueProfile);
            })
          axios
            .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
            .then(response => {
              this.$store.dispatch('followingPost/setEvent',response.data)
            })
        }
      })     
    },
    unfollowEvent(id) {
       axios
    .delete(`https://spa-back-paradigm-shift.work/relationships/${id}/`, { withCredentials: true })
    .then(response => {
       if (response.data.message === "フォロー解除しました") {
            axios
            .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/`, { withCredentials: true })
            .then(response => {
              this.$data.vueProfile =  response.data 
              console.log(this.$data.vueProfile);
            })
            }
            axios
          .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
          .then(response => {
            this.$store.dispatch('followingPost/setEvent',response.data)
          })
        })   
   },
    followEvent(userId) {
       const params = {id:userId}  
       axios
    .post(`https://spa-back-paradigm-shift.work/relationships/`,params, {withCredentials: true })
    .then(response => {
       if (response.data.message === "フォロー生成しました") {
            axios
            .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/`, { withCredentials: true })
            .then(response => {
              this.$data.vueProfile =  response.data 
              console.log(this.$data.vueProfile);
            })
            }
            axios
          .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
          .then(response => {
            this.$store.dispatch('followingPost/setEvent',response.data)
          })
        })     
   },
    messageEvent() {
      if (this.$data.vueProfile.IsRoom) {
          this.$router.push(`/Message/${this.$data.vueProfile.RoomId}/directMessage`)
      }else{
       const params = {entry:{user_id:this.$data.vueProfile.userID}}  
      axios
        .post('https://spa-back-paradigm-shift.work/rooms',params, { withCredentials: true })
        .then(response => {
           this.$router.push(`/Message/${response.data.RoomId}/directMessage`)
        })
        .catch(error => {
          console.error(error);
        });
      }
   }

  }
 
}
</script>

<style>
.c-p{
 cursor: pointer;
}

.user-icon {
  border-radius: 100px;
}

.likeAndDelete{
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
</style>