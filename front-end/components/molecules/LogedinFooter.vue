<template>
   <div>
    <v-divider></v-divider>
    <v-app-bar color="#a7f9ff" class="text-h6">
        <v-row justify="space-around"  no-gutters class=mt-2 >
          <v-col class=center>
           <router-link to="/home" class="routerLink">
            <v-icon large color="black">mdi-home</v-icon>
            <div class="phone-font">Home</div>
           </router-link> 
          </v-col>
          <v-col class=center>
            <router-link to="/quiz" class="routerLink">
              <v-icon large color="black">mdi-quora</v-icon>
              <div class="phone-font">Quiz</div>
            </router-link>
          </v-col>
          <v-col class=center>
            <router-link to="/userSearch" class="routerLink">
              <v-icon large color="black">mdi-magnify</v-icon>
              <div class="phone-font">Serch</div>
            </router-link> 
          </v-col>
          <v-col class=center>
            <router-link to="/ranking" class="routerLink">
              <v-icon large color="black">mdi-medal</v-icon>
              <div class="phone-font">Ranking</div>
            </router-link> 
          </v-col>
          <v-col class=center>
            <router-link to="/notice" class="routerLink">
              <v-icon large color="black">mdi-exclamation-thick</v-icon>
              <div class="phone-font">Notice</div>
            </router-link>
          </v-col>
          <v-col class=center>
            <router-link to="/message" class="routerLink">
              <v-icon large color="black">mdi-message-text</v-icon>
              <div class="phone-font">DM</div>
            </router-link>
          </v-col>
          
        </v-row> 
    </v-app-bar>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>
.center {
 display: flex;
 justify-content: center;
}

.routerLink{
     text-decoration: none;
 }
</style>