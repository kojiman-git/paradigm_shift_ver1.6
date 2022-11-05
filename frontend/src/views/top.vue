
<template>
  <div class="container">
    <h1 id="app-titel">Paradigm Shift</h1>
    <main>
      <div class = up>
        <p id = "app-explanation">このアプリはアクティブラーニングで重要な要素である再言語化</p>
        <p id = "app-explanation">と想起を元にした学習を支援するSNSサービスになります</p>
      </div>
      <div>
          <div class = btn>
            <h2 onclick="location.href='/login'" id="login_button">ログインはこちら</h2>
            <h2 onclick="location.href='static_pages/guest_sign_in'"   id="login_button">ゲストユーザーとしてログイン</h2>
          </div>
          <div id="newuser">
            <a href= "users/new"  >新規会員登録はこちら!!</a>
          </div>
      </div>
    </main>
   <h1 id="app-titel">世界が変わる瞬間</h1>
   <!-- 2. template層コンポーネントを呼び出し、このコンポーネントに1で取得したデータをpropsで渡すようにします -->
  </div>
</template>

  <script>
  // 1. トップレベルの階層でバックエンドにリクエストを投げてレンダリングするデータを取得します
  </script>

<style>


#app-titel{
  text-align: center;
  border: solid 1px #000000;
  background-color:#a7f9ff ;
}

.up{
  margin-top: 10vh;
  text-align: center;
}


#app-explanation{
  
  font-size: 3vw;
}

#login_button{
  margin-top: 10vh;
  width: 70vw;
  text-align: center;
  display: inline-block;
}

.btn{
  text-align: center;
}

h2{
  appearance: none;
  border: 0;
  border-radius: 25px;
  background: #76f6ff;
  color: rgb(0, 0, 0);
  padding: 8px 16px;
  font-size: 16px;
}

h2:hover {
  background: #1d49aa;
}
 
h2:focus {
  outline: none;
  box-shadow: 0 0 0 4px #cbd6ee;
}

#newuser{
  text-align: center;
  margin-top: 10vh;
}

  
  </style>