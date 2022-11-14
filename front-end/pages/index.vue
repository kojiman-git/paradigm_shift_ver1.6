<template>
 <div class="con">
    <AtomsNoLoginHeader/>
    <main>
    <AtomsAppExplanation/>
    <MoleculesLoginAndSignUpBtn/>
    </main>
   <AtomsNoLoginFooter/>
 </div>
</template>

<script>

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