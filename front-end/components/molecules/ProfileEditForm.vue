<template>
  <div>
    <v-container>
      <v-row justify="center" no-gutters>
        <v-col cols="10">
          <v-text-field
          v-model="userInfo.name"
          label="Name"
          required
          ></v-text-field>
        </v-col>
      </v-row> 
      <v-row justify="center" no-gutters>
        <v-col cols="10">
          <v-text-field
          v-model="userInfo.email"
          label="E-mail"
          required
          ></v-text-field>
        </v-col>
      </v-row> 
      <v-row justify="center" no-gutters>
        <v-col cols="10">
          <v-text-field
          v-model="userInfo.intoroduction"
          label="Intoroductioon"
          required
          ></v-text-field>
        </v-col>
      </v-row> 
      <v-row justify="center" no-gutters>
        <v-col cols="10" >
          <v-text-field 
          v-model="userInfo.password"
          label="Password" 
          type="password" 
          required 
          ></v-text-field>
        </v-col>
      </v-row> 
      <v-row justify="center" no-gutters>
        <v-col cols="10" >
          <v-text-field 
          v-model="userInfo.confirmation"
          label="Confirmation" 
          type="password" 
          required 
          ></v-text-field>
        </v-col>
      </v-row>
      <v-row justify="center" no-gutters>
        <v-col cols="10" >
          <v-file-input
          accept="image/jpg, image/jpeg, image/gif, image/png"
          label="Profile Image"
          placeholder="画像を投稿"
          type="file"
          @change="setImage"
        ></v-file-input>
        </v-col>
      </v-row>
      <v-row justify="center" no-gutters>
        <v-col cols="10" >
          <v-btn  color="#cefffb" block  @click="UpdateEvents">
            Update
          </v-btn>
        </v-col>
      </v-row>
    </v-container >
  </div>
</template>

<script>
import axios from 'axios';
export default {
  data(){
    return {
      userInfo:{
      name:"",
      email:"",
      intoroduction:"",
      password:"",
      confirmation:"",
      image:[],
      }
    }
  },
    created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/edit`, { withCredentials: true })
    .then(response => {
      this.$data.userInfo =  response.data  
      console.log(response.data )
      console.log(this.$data.userInfo)
    })
    .catch(error => {
      console.error(error);
    });
  },
  methods: {
     setImage (e) {
      this.$data.userInfo.image = e
    },
      UpdateEvents(){
    const formData = new FormData();
    formData.append('user[name]', this.$data.userInfo.name);
    formData.append('user[email]', this.$data.userInfo.email);
    formData.append('user[intoroduction]', this.$data.userInfo.intoroduction);
    formData.append('user[password]', this.$data.userInfo.password);
    formData.append('user[password_confirmation]', this.$data.userInfo.confirmation);
    formData.append('user[image]', this.$data.userInfo.image);
    this.$axios.patch(`https://spa-back-paradigm-shift.work/users/${this.$route.params.id}/`,
     formData,{ withCredentials: true }
    )
    // 成功時の処理
    .then(response => {
      if (response.data.message === "ユーザーを更新しました") {
      axios
        .get(`https://spa-back-paradigm-shift.work/users/currentUser`,{ withCredentials: true })
        .then(response => {
              this.$store.dispatch('loginEvent',response.data)
           axios
              .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
              .then(response => {
                this.$store.dispatch('followingPost/setEvent',response.data)
              })
              .catch(error => {
                console.error(error);
              });
        }).then(this.$router.push(`/DrawerMenu/${this.$route.params.id}/myProfile`))   
      }
    })
    // 失敗時の処理
    .catch((error) => {
       console.error(error);
    })
   }
  
    
  }
}

</script>

<style>

</style>