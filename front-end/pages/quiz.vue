<template>
  <div class="con">
    <MoleculesLogedinHeader>Paradigm Shift</MoleculesLogedinHeader>
    <AtomsSubHeader>Quiz Challenge</AtomsSubHeader>
    <main>
      <div>
        <v-sheet height="75vh">
          <v-sheet height="2vh">
          </v-sheet>
          <v-sheet height="30vh">
            <v-row  no-gutters>
              <v-col cols="1">
              </v-col>
              <v-col cols="3"  class="column text-h6">
                <div v-if="this.$store.state.quizChallenge.quizList.length !== 0">
                  <div v-if="this.$store.state.quizChallenge.quizList[this.count].userImage === null">
                    <v-img
                      max-height="75"
                      max-width="75"
                      v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
                    ></v-img>
                  </div>
                  <div v-else>
                    <v-img
                      class="user-icon"
                      max-height="75"
                      max-width="75"
                      :src="`${this.$store.state.quizChallenge.quizList[this.count].userImage}`"
                    ></v-img>
                  </div>
                  {{this.$store.state.quizChallenge.quizList[this.count].user_name}}
                </div>
              </v-col>
              <v-col cols="4" class= "center text-h4">
                <div v-if="this.$store.state.quizChallenge.quizList.length !== 0">
                  {{this.$store.state.quizChallenge.quizList[this.count].term}}
                </div>
              </v-col>
              <v-col cols="3" class="end text-h4" >
                <div v-if="this.$store.state.quizChallenge.quizList.length !== 0">
                  {{this.$store.state.quizChallenge.quizList[this.count].category}}
                </div>
              </v-col>
              <v-col cols="1" >
              </v-col>
            </v-row> 
          </v-sheet >
          <v-sheet height="36vh">
            <v-row justify="center"  no-gutters>
              <v-col cols="12" class= "center text-h4">
                <div v-if="this.$store.state.quizChallenge.quizList.length !== 0">
                  <div v-if="this.hide">
                    上記の用語がどんな意味だったか思い出してみましょう
                  </div>
                  <div v-else>
                    {{this.$store.state.quizChallenge.quizList[this.count].paraphrase}}
                  </div>
                </div>
              </v-col>
            </v-row>
          </v-sheet >
        </v-sheet > 
      </div>
    </main>
    <div>
      <v-divider></v-divider>
      <v-row align=end no-gutters>
        <v-col cols="4" >
          <v-btn   color="#cefffb" block @click="answerEvents">
          Answer
          </v-btn>
        </v-col>
        <v-col cols="4" >
          <v-btn   color="#cefffb" block @click="hideEvents">
          Hide 
          </v-btn>
        </v-col>
        <v-col cols="4" >
          <v-btn   color="#cefffb" block @click="nextEvents">
          Next 
          </v-btn>
        </v-col>
      </v-row>
    </div>
    <MoleculesLogedinFooter/>
 </div>
</template>

<script>
import axios from 'axios';
export default {
 data(){
    return {
     quizList: [],
     count:0,
     hide:true,
    }
  },
  created(){
    axios
    .get(`http://localhost:3000//home_page/quiz`, { withCredentials: true })
    .then(response => {
        this.$store.dispatch('quizChallenge/setEvent',response.data)
     })
    .catch(error => {
      console.error(error);
    });
  },
    methods: {
    answerEvents() {
      this.hide = false
   },
    hideEvents() {
      this.hide = true
   },
    nextEvents() {
      if (this.count < this.$store.state.quizChallenge.quizList.length -1) {
        this.count ++
        this.hide = true
      }else{
        this.count = 0
        this.hide = true
      }   
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

.center {
 display: flex;
 justify-content: center;
}
.start {
 display: flex;
 justify-content: start;
}
.end {
 display: flex;
 justify-content: end;
}
.column {
 display: flex;
 flex-flow: column;
}

</style>