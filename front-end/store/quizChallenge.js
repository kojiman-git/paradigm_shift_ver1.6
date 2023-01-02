export const state = {
  quizList:[
    { "post_id": "", 
      "user_name": "", 
      "term": "", 
      "paraphrase": "", 
      "category": "", 
      "userImage": "" ,
    }
  ]
}

export const getters = {
  GetQuizList: state => state.quizList
}

export const actions = {
  setEvent({ commit },quizListData) {
    commit('setQuizList', quizListData);  // mutationを呼び出す
  }
}

export const mutations = {
  setQuizList: (state, quizListData) => (state.quizList = quizListData),
}
