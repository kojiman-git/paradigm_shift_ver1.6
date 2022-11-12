(function() {
  'use strict';


 
  let term = document.getElementById('term');
  let para = document.getElementById('para');
  let answer = document.getElementById('answer-btn');
  let hide = document.getElementById('hide-btn');
  let name = document.getElementById('name');
   answer.addEventListener('click', function() {
     open_answer();
   });
   hide.addEventListener('click', function() {
     hide_answer();
   });
   
  let num = Math.floor(Math.random() * words.length);
   
  function set_quiz() {
    para.innerHTML = words[num]['Hide the answer'];
    term.innerHTML = words[num]['term'];
    name.innerHTML = words[num]['name'];
  }
  function open_answer() {
    para.innerHTML = words[num]['para'];
  }
  function hide_answer() {
    para.innerHTML = words[num]['Hide the answer'];
  }
  
  set_quiz();
  
  
   })();