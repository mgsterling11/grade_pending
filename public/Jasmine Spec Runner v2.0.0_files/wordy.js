'use strict';

function WordProblem(question){
  this.answer = function() {
  var translate = {
     'plus': "+",
     'minus': "-",
     'multiplied by': "*",
     'divided by': "/"
     'What is ': " ",
     '?': " "
   };

    for (var key in translate) {
        question = question.replace(new RegExp(key, "ig"), translate[key]);
    }
    return eval(question);
  }
}
}
