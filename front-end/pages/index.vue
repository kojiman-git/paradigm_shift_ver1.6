<template>
 <div class="con">
    <AtomsNoLoginHeaderAndFooter>Paradigm Shift</AtomsNoLoginHeaderAndFooter>
    <main>
    <AtomsAppExplanation/>
    <MoleculesLoginAndSignUpBtn/>
    </main>
   <AtomsNoLoginHeaderAndFooter>世界が変わる瞬間</AtomsNoLoginHeaderAndFooter>
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