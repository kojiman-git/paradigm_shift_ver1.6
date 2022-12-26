<template>
  <div class="con">
    <MoleculesLogedinHeader>Paradigm Shift</MoleculesLogedinHeader>
    <AtomsSubHeader>Edit My Profile</AtomsSubHeader>
    <main>
       <MoleculesProfileEditForm/>
    </main>
    <MoleculesLogedinFooter/>
 </div>
</template>

<script>
export default {
 data(){
    return {
     
    }
  },
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