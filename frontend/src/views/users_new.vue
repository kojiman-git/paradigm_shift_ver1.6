<template>
    <div class="container">
    <h1 id="app-titel">Paradigm Shift</h1>
    <h1 id="titel">Sign up</h1>
    <main>
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <form class="sign-area" action="/users" accept-charset="UTF-8" method="post"><input type="hidden" name="authenticity_token" value="OsQZgM8wirNzu5qWFMIFdpORdxk7b4hIYN9OR0nCsChpgQVSc0KAJz-2Aciai3bXPN0JZg9thHHAUolSmUvosw" autocomplete="off" />
            


            <label for="user_name">Name</label>
            <input class="form-control" type="text" name="user[name]" id="user_name" />

            <label for="user_email">Email</label>
            <input class="form-control" type="email" name="user[email]" id="user_email" />

            <label for="user_password">Password</label>
            <input class="form-control" type="password" name="user[password]" id="user_password" />

            <label for="user_password_confirmation">Confirmation</label>
            <input class="form-control" type="password" name="user[password_confirmation]" id="user_password_confirmation" />

            <input type="submit" name="commit" value="Create my account" class="btn form-control" data-disable-with="Create my account" />
            
          </form>        
        </div>
      </div>
    </main>
   <h1 id="app-titel">世界が変わる瞬間</h1>
  </div>

</template>

<script>
  
</script>

<style>
#app-titel{
  text-align: center;
  border: solid 1px #000000;
  background-color:#a7f9ff ;
}


.sign-area{
  display: flex;
  flex-direction: column;
  width: 65%;
  margin-left : auto;
  margin-right : auto;
  margin-top: 6vh;
}

.form-control{
 height: 4vh;
 margin-bottom: 7vh;
 width: 100%;
}


.btn{
 background-color: #cefffb ;
}

.alert{
  color: red;
}


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