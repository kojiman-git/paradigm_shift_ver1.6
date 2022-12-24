

export const state = {
  postData:[
    { "post_id": "", 
      "user_id": "", 
      "user_name": "", 
      "term": "", 
      "paraphrase": "", 
      "category": "", 
      "created_at": "", 
      "avg_score": "",
      "reviewsCount": "",
      "reviewScorePercentage": "", 
      "userImage": "" ,
      "Liked":"",
      "sameID":"",
    }
  ]
}

export const getters = {
  GetFollowingPost: state => state.postData
}

export const actions = {
  setEvent({ commit },followingPostData) {
    commit('setPostData', followingPostData);  // mutationを呼び出す
  }
}

export const mutations = {
  setPostData: (state, followingPostData) => (state.postData = followingPostData),
}
