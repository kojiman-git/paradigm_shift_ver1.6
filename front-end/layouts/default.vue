<template>
 <v-app>
  <Nuxt />
 </v-app>
</template>

<script>

</script>

<style>
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

@media (max-width:600px) {
  .phone-font{ font-size: 12px;} 
}

@media (min-width:600px) {
  .pc-font{ font-size: 25px;} 
}

</style>