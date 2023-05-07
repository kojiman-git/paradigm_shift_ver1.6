<template>
  <div>
    <div class = btn>
      <v-btn  id="login_button" color="#cefffb" to="/login">
      ログインはこちら
      </v-btn>
      <v-btn  id="login_button" color="#cefffb" @click="guestUserLoginEvents">
      ゲストユーザーとしてログイン
      </v-btn>
    </div>
    <div id="newuser">
      <NuxtLink to="signUp">新規会員登録はこちら!!</NuxtLink>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
export default {
  methods: {
   guestUserLoginEvents() {
     const params = {session:{email:"guest@gmail.com",password:24169757}}  
      axios
        .post('https://spa-back-paradigm-shift.work/login',params, { withCredentials: true })
        .then(response => {
          if (response.data.message === "ログインしました。") {
              this.$store.dispatch('loginEvent',response.data)
              console.log(response.data)
         axios
              .get('https://spa-back-paradigm-shift.work/home_page/home', { withCredentials: true })
              .then(response => {
                this.$store.dispatch('followingPost/setEvent',response.data)
                .then(this.$router.push('/home'))
                
              })
              .catch(error => {
                console.error(error);
              });
          }else{
              this.$data.errormessage = response.data.message
              this.$data.isDisplay = true
          }
        })
        .catch(error => {
          console.error(error);
        });
    },
 }

}
</script>

<style scoped>
#login_button{
  margin-top: 10vh;
  width: 70vw;
  text-align: center;
  display: inline-block;
}

.btn{
  text-align: center;
}

#newuser{
  text-align: center;
  margin-top: 10vh;
}


</style>