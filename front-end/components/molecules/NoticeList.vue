<template>
  <div>
    <v-card v-for="notice in  noticeList" :key="notice.id">
      <v-row  no-gutters >
        <v-spacer />
        <v-col cols="6">
         <v-card-text >
           {{notice.content}}
         </v-card-text>
        </v-col>
        <v-col cols="4">
          <v-card-text >
           {{notice.created_at.slice(0,10)}}
          </v-card-text>
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
     noticeList: [],
    }
   },
   created(){
    axios
    .get(`http://localhost:3000//home_page/news`, { withCredentials: true })
    .then(response => {
      this.$data.noticeList =  response.data 
      console.log(this.$data.noticeList);
    })
    .catch(error => {
      console.error(error);
    });
  },
}
</script>

<style>

</style>