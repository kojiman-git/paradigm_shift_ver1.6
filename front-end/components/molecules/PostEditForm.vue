<template>
  <v-container>
    <validation-observer ref="obs" v-slot="ObserverProps">
      <v-row justify="center" no-gutters>
        <v-col cols="10">
          <ValidationProvider v-slot="{ errors }" rules="max:40|required" name="用語">
            <v-text-field
            :counter="40"
            v-model="term"
            label="理解したい用語を入れてみよう"
            :error-messages="errors"
            class=mt-6
            ></v-text-field>
          </ValidationProvider>
        </v-col>
      </v-row> 
      <v-row justify="center" no-gutters>
        <v-col cols="10">
          <ValidationProvider v-slot="{ errors }" rules="required" name="カテゴリー">
             <v-select
              v-model="select"
              :items="category"
              :error-messages="errors"
              label="カテゴリーを選択してください"
              class=mt-6
            ></v-select>
          </ValidationProvider>
        </v-col>
      </v-row> 
      <v-row justify="center" no-gutters>
        <v-col cols="10">
          <ValidationProvider v-slot="{ errors }" rules="max:400|required" name="言い換え">
            <v-textarea
              v-model="paraphrase"
              :counter="400"
              label="その用語を自分の言葉で言い換えるとどんな感じ？"
              :error-messages="errors"
              class=mt-6
            ></v-textarea>
          </ValidationProvider>
        </v-col>
      </v-row> 
      <v-row justify="center" no-gutters>
        <v-col cols="10" >
          <v-btn  color="#cefffb" block class=mt-12 @click="postCreateEvents" :disabled="ObserverProps.invalid || !ObserverProps.validated">
            Post
          </v-btn>
        </v-col>
      </v-row>
    </validation-observer>
  </v-container >
</template>

<script>
import axios from 'axios';
export default {
 data(){
    return {
      term:"",
      select: null,
      paraphrase:"",
      errorMessage:"",
      category: ["英語","数学","国語","社会","理科","その他"],
      m_category_id: null,
    }
  },

    methods: {
      postCreateEvents() {
        switch (this.$data.select){
          case '英語':
            this.$data.m_category_id = 1
            break;
          case '数学':
            this.$data.m_category_id = 2
            break;
          case '国語':
            this.$data.m_category_id = 3
            break;
          case '理科':
            this.$data.m_category_id = 4
            break;
          case '社会':
            this.$data.m_category_id = 5
            break;
          case 'その他':
            this.$data.m_category_id = 6
            break;
          default:
            console.log('失敗');
        }


        const params = {post:{paraphrase:this.$data.paraphrase,term:this.$data.term,m_category_id:this.$data.m_category_id}}  
          axios
            .post('http://localhost:3000/posts',params, { withCredentials: true })
            .then(response => {
              if (response.data.message === "投稿完了です") {
              axios
              .get('http://localhost:3000/home_page/home', { withCredentials: true })
              .then(response => {
                this.$store.dispatch('followingPost/setEvent',response.data)
                .then(this.$router.push('/home'))
              })

            }
        })
        .catch(error => {
          console.error(error);
        });
  
        
    }
 }
}
</script>

<style>

</style>