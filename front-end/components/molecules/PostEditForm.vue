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
          <v-btn  color="#cefffb" block class=mt-12 @click="userCreateEvents" :disabled="ObserverProps.invalid || !ObserverProps.validated">
            Post
          </v-btn>
        </v-col>
      </v-row>
    </validation-observer>
  </v-container >
</template>

<script>
export default {
 data(){
    return {
      term:"",
      select: null,
      paraphrase:"",
      errorMessage:"",
      category: [
        '英語',
        '数学',
        '国語',
        '理科',
        '社会',
        'その他',
      ],
    }
  },
}
</script>

<style>

</style>