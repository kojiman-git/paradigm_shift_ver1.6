<template>
  <div class="con">
    <AtomsNoLoginHeaderAndFooter>Paradigm Shift</AtomsNoLoginHeaderAndFooter>
    <AtomsSubHeader>Login Form</AtomsSubHeader>
    <main>
      <v-container class=mt-12>
        <v-row justify="center" no-gutters>
          <v-col cols="10">
            <div v-show="isDisplay">
              <v-alert
                color="red"
                type="warning"
              >{{errormessage}}
              </v-alert>
            </div>
            <v-text-field
            v-model="email"
            label="E-mail"
            required
            class=mt-12
            ></v-text-field>
          </v-col>
        </v-row> 
        <v-row justify="center" no-gutters>
          <v-col cols="10" >
            <v-text-field 
            v-model="password"
            label="Password" 
            type="password" 
            required 
            class=mt-16
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row justify="center" no-gutters>
          <v-col cols="10" >
            <v-btn  color="#cefffb" block class=mt-16 @click="LoginEvents">
              login
            </v-btn>
          </v-col>
        </v-row>
        <v-row justify="center" no-gutters>  
          <NuxtLink to="signUp" class=mt-16>New user ? Sign up now!</NuxtLink>
        </v-row>
      </v-container >
    </main>
    <AtomsNoLoginHeaderAndFooter>世界が変わる瞬間</AtomsNoLoginHeaderAndFooter>
 </div>
</template>

<script>
import axios from 'axios'
export default {
 data(){
    return {
      email:"",
      password:"",
      errormessage:"",
      isDisplay:""
    }
  },
  methods: {
    OutPutEvents() {
    console.log(this.$data)
    console.log(this.$data.email)
  },
   LoginEvents() {
     const params = {session:{email:this.$data.email,password:this.$data.password}}  
      axios
        .post('https://spa-back-paradigm-shift.work/login',params, { withCredentials: true})
        .then(response => {
          if (response.data.message === "ログインしました。") {
              this.$store.dispatch('loginEvent',response.data)
              console.log(response.data)
         axios
              .get('https://spa-back-paradigm-shift.work/home_page/home',{ withCredentials: true})
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


          
             
          
          
           