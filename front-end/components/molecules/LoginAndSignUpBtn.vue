<template>
  <div>
    <div class = btn>
      <v-btn  id="login_button" color="#cefffb" to="/login">
      ログインはこちら
      </v-btn>
      <v-btn  id="login_button" color="#cefffb">
      ゲストユーザーとしてログイン
      </v-btn>
    </div>
    <div id="newuser">
      <NuxtLink to="signUp">新規会員登録はこちら!!</NuxtLink>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>
#login_button{
  margin-top: 10vh;
  width: 70vw;
  text-align: center;
  display: inline-block;
}

.btn{
  text-align: center;
}

#newuser{
  text-align: center;
  margin-top: 10vh;
}


</style>