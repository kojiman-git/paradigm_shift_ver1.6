<template>
  <div>
    <v-app-bar color="#cefffb" class="text-h4">
        <v-row no-gutters align=center>
          <v-col class=center>
          </v-col>
          <v-col class=center>
          </v-col>
          <v-col class=center>
          </v-col>
          <v-col class=center>
            Users
          </v-col>
          
          <v-col class=center cols="3">
            <v-text-field ></v-text-field>
          </v-col>
          <v-col >
            <v-btn
            color="#a7f9ff"  class=ml-2
            >search</v-btn>
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