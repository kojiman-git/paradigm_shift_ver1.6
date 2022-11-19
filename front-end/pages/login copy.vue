<template>
  <div class="con">
    <AtomsNoLoginHeader/>
    <main>
    
  
    <v-btn @click=" fetchEvents">login</v-btn>
    
    </main>
    <AtomsNoLoginFooter/>
 </div>
</template>

<script>
import axios from 'axios';
const params = {email:"kojima@gmail.com",password:"2416975"}  
export default {
  methods: {
    fetchEvents() {
      axios
        .post('http://localhost:3000/login',params)
        .then(response => {
          if (response.data.message === "ログインしました。") {
              this.$router.push('/signUp')
          }else{
              this.$router.push('/')
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