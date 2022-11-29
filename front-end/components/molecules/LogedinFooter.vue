<template>
   <div>
    <v-app-bar color="#a7f9ff" class="text-h6">
        <v-row justify="space-around"  no-gutters class=mt-2 >
          <v-col class=center>
           <router-link to="/home">
            <v-img
                max-height="100"
                max-width="90"
                v-bind:src="require('@/assets/image/undraw_at_home_octe.svg')"
            ></v-img>
           </router-link>   
          </v-col>
          <v-col class=center>
            <router-link to="/quiz">
              <v-img
                max-height="100"
                max-width="70"
                v-bind:src="require('@/assets/image/undraw_questions_re_1fy7.svg')"
              ></v-img>
            </router-link> 
          </v-col>
          <v-col class=center>
            <router-link to="/userSearch">
              <v-img
                max-height="50"
                max-width="50"
                v-bind:src="require('@/assets/image/undraw_people_search_re_5rre.svg')"
              ></v-img>
            </router-link> 
          </v-col>
          <v-col class=center>
            <router-link to="/notice">
              <v-img
                max-height="70"
                max-width="70"
                v-bind:src="require('@/assets/image/undraw_notify_re_65on.svg')"
              ></v-img>
            </router-link>
          </v-col>
          <v-col class=center>
            <router-link to="/message">
              <v-img
                max-height="50"
                max-width="60"
                v-bind:src="require('@/assets/image/undraw_opened_re_i38e.svg')"
              ></v-img>
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
</style>