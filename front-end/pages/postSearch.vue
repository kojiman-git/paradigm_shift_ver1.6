<template>
  <div class="con">
    <MoleculesLogedinHeader>Paradigm Shift</MoleculesLogedinHeader>
      <div>
        <v-app-bar color="#cefffb" class="text-h4">
          <v-row no-gutters align=center>
            <v-col class=center cols="2">
              <v-text-field v-model="keyword"></v-text-field>
            </v-col>
            <v-col >
              <v-btn
              color="#a7f9ff"  class=ml-2 @click="postSearchEvent"
              small
              >search</v-btn>
            </v-col>
            <v-col class=center>
            Posts
            </v-col>
            <v-col class=center>
            </v-col>
            <v-col class=center>
              <v-menu offset-y>
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    color="#a7f9ff"
                    v-bind="attrs"
                    v-on="on"
                    small
                  >
                    filter
                  </v-btn>
                </template>
                <v-list>
                  <v-list-item
                    v-for="(item, index) in items"
                    :key="index"
                    link
                    @click="filterEvent(item.id)"
                  >
                    <v-list-item-title>{{ item.title }}</v-list-item-title>
                  </v-list-item>
                </v-list>
              </v-menu>
            </v-col>
          </v-row>
        </v-app-bar>
      </div>
    <main>
    <v-card v-for="post in PostList" :key="post.post_id">
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
        <v-col cols="1" class="mt-4 likeAndDelete" >
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
    </main>
    <MoleculesUserAndPostSearchBtn/>
    <MoleculesLogedinFooter/>
 </div>
</template>

<script>
import axios from 'axios';
  export default {
    data: () => ({
      items: [
        { title: '英語' ,id:1},
        { title: '数学' ,id:2},
        { title: '国語' ,id:3},
        { title: '理科' ,id:4},
        { title: '社会' ,id:5},
        { title: 'その他' ,id:6},
        { title: '全て' ,id:7},
      ],
      postList:[],
      filter:7,
      keyword:""
    }),
    computed:{
      PostList(){
        return this.$data.postList
      }
    },
    created(){
      axios
      .get(`https://spa-back-paradigm-shift.work/search/narrow_down_by_category?post%5Bm_category_id%5D=${this.filter}`, { withCredentials: true })
      .then(response => {
        this.$data.postList =  response.data 
        console.log(this.$data.postList);
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
          axios
          .get(`https://spa-back-paradigm-shift.work/search/narrow_down_by_category?post%5Bm_category_id%5D=${this.filter}`, { withCredentials: true })
          .then(response => {
            this.$data.postList =  response.data 
            console.log(this.$data.postList);
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
          axios
          .get(`https://spa-back-paradigm-shift.work/search/narrow_down_by_category?post%5Bm_category_id%5D=${this.filter}`, { withCredentials: true })
          .then(response => {
            this.$data.postList =  response.data 
            console.log(this.$data.postList);
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
          axios
          .get(`https://spa-back-paradigm-shift.work/search/narrow_down_by_category?post%5Bm_category_id%5D=${this.filter}`, { withCredentials: true })
          .then(response => {
            this.$data.postList =  response.data 
            console.log(this.$data.postList);
          })
        }
      })     
    },
    filterEvent(ID){
        axios
          .get(`https://spa-back-paradigm-shift.work/search/narrow_down_by_category?post%5Bm_category_id%5D=${ID}`,{ withCredentials: true })
          .then(response => {
            this.filter = ID
            this.$data.postList =  response.data 
            console.log(this.$data.postList);
          })
    },
    postSearchEvent(){
     axios
    .get(`https://spa-back-paradigm-shift.work/search/post_keyword_search?keyword=${this.$data.keyword}`,{ withCredentials: true })
    .then(response => {
      this.$data.postList =  response.data 
      console.log(this.$data.usersList);
    })
    .catch(error => {
      console.error(error);
    });  
   },

  }
}
</script>

<style >

.likeAndDelete{
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

</style>