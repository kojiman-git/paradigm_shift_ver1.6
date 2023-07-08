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
              <v-col cols="4">
                <div v-if="this.$store.state.quizChallenge.quizList.length !== 0">
                  <div class ="center" v-if="this.$store.state.quizChallenge.quizList[this.count].userImage === null">
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
                  <div class ="center">
                    {{this.$store.state.quizChallenge.quizList[this.count].user_name}}
                  </div>
                </div>
              </v-col>
              <v-col cols="4" class="center">
                <div class="pc-font" v-if="this.$store.state.quizChallenge.quizList.length !== 0">
                  {{this.$store.state.quizChallenge.quizList[this.count].term}}
                </div>
              </v-col>
              <v-col cols="4" class="center">
                <v-menu offset-y>
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn
                      color="#a7f9ff"
                      v-bind="attrs"
                      v-on="on"
                      class="phone-font"
                    >
                      filter
                    </v-btn>
                  </template>
                  <v-list>
                    <v-list-item
                      v-for="(item, index) in items"
                      :key="index"
                      link
                      @click="filterEvent(item.id)"
                    >
                      <v-list-item-title>{{ item.title }}</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </v-col>
            </v-row> 
          </v-sheet >
          <v-sheet height="36vh">
            <v-row justify="center"  no-gutters>
              <v-col cols="12" class= "center pc-font">
                <div v-if="this.$store.state.quizChallenge.quizList.length !== 0">
                  <v-container>
                    <div v-if="this.hide" >
                      上記用語の意味を思い出してみましょう
                    </div>
                    <div v-else >
                      {{this.$store.state.quizChallenge.quizList[this.count].paraphrase}}
                    </div>
                  </v-container>
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
      items: [
        { title: '英語' ,id:1},
        { title: '数学' ,id:2},
        { title: '国語' ,id:3},
        { title: '理科' ,id:4},
        { title: '社会' ,id:5},
        { title: 'その他' ,id:6},
        { title: '全て' ,id:7},
      ],
     quizList: [],
     count:0,
     hide:true,
    }
  },
  created(){
    axios
    .get(`https://spa-back-paradigm-shift.work/home_page/quiz`, { withCredentials: true })
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
    filterEvent(ID){
    axios
      .get(`https://spa-back-paradigm-shift.work/home_page/quiz_filter?post%5Bm_category_id%5D=${ID}`,{ withCredentials: true })
      .then(response => {
        this.$store.dispatch('quizChallenge/setEvent',response.data)
      })
    },
  }
}  
</script>

<style scoped>

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