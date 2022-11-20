<template>
  <div class="con">
    <AtomsNoLoginHeaderAndFooter>Paradigm Shift</AtomsNoLoginHeaderAndFooter>
    <AtomsSubHeader>Sign Up</AtomsSubHeader>
    <main>
      <v-container>
        <validation-observer ref="obs" v-slot="ObserverProps">
        <v-row justify="center" no-gutters>
          <v-col cols="10">
            <div v-show="isDisplay">
              <v-alert
                color="red"
                type="warning"
              >{{errorMessage}}
              </v-alert>
            </div>
            <ValidationProvider v-slot="{ errors }" rules="max:40|required" name="Name">
              <v-text-field
              v-model="name"
              label="Name"
              :error-messages="errors"
              class=mt-6
              ></v-text-field>
            </ValidationProvider>
          </v-col>
        </v-row> 
        <v-row justify="center" no-gutters>
          <v-col cols="10">
          <ValidationProvider v-slot="{ errors }" rules="required|email" name="E-mail">
            <v-text-field
            v-model="email"
            label="E-mail"
            :error-messages="errors"
            class=mt-6
            ></v-text-field>
          </ValidationProvider>
          </v-col>
        </v-row> 
       <v-row justify="center" no-gutters>
          <v-col cols="10" >
            <ValidationProvider v-slot="{ errors }" rules="required|min:8|max:15" name="Password">
              <v-text-field 
              v-model="password"
              label="Password" 
              type="password" 
              :error-messages="errors"
              class=mt-6
              ></v-text-field>
            </ValidationProvider>
          </v-col>
        </v-row>
        <v-row justify="center" no-gutters>
          <v-col cols="10" >
            <ValidationProvider v-slot="{ errors }" rules="required|min:8|max:15" name="Confirmation">
              <v-text-field 
              v-model="password_confirmation"
              label="Confirmation" 
              type="password" 
              :error-messages="errors"
              class=mt-6
              ></v-text-field>
            </ValidationProvider>
          </v-col>
        </v-row>
        <v-row justify="center" no-gutters>
          <v-col cols="10" >
            <v-btn  color="#cefffb" block class=mt-12 @click="userCreateEvents" :disabled="ObserverProps.invalid || !ObserverProps.validated">
              Create my account
            </v-btn>
          </v-col>
        </v-row>
        </validation-observer>
      </v-container >
     </main>
    <AtomsNoLoginHeaderAndFooter>世界が変わる瞬間</AtomsNoLoginHeaderAndFooter>
 </div>
</template>

<script>
import axios from 'axios';
export default {
 data(){
    return {
      name:"",
      email:"",
      password:"",
      password_confirmation:"",
      errorMessage:"",
      isDisplay:""
    }
  },
  methods: {
   userCreateEvents() {
      const params = {name:this.$data.name,email:this.$data.email,password:this.$data.password,password_confirmation:this.$data.password_confirmation}
      if (this.$data.password === this.$data.password_confirmation) {
        axios
          .post('http://localhost:3000//users',params)
          .then(response => {
            if (response.data.message === "ユーザーを作ってログインしました。") {
                this.$router.push('/home')
            }else{
                console.log(response.data.message)
            }
          })
          .catch(error => {
            console.error(error);
          });
      }else{
        this.$data.errorMessage = "passwordとconfirmationが一致していません"
        this.$data.isDisplay = true
      }
   }
 }
}
</script>

<style scoped>
.con {
  display: flex;
  flex-direction: column;
  width: 100vw;
  height: 100vh;  
}

main {
  flex: 1;
  background-color: rgb(255, 255, 255);
  overflow-y: scroll; 
}

</style>