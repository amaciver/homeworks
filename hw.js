var MadLib = function(verb, adj, noun) {
  var out = "We shall " + verb.toUpperCase()+ " the "
  + adj.toUpperCase() + " " + noun.toUpperCase();
  console.log(out);
};

// MadLib("make", "best", "guac");
var isSubstring = function(string, sub) {
  for(let i=0; i<string.length; i++) {
    for(let j = i; j <= string.length; j++) {
      if (string.substring(i, j) === sub) {
        console.log(true);
        return;
      }
    }
  }
  console.log(false);
};

// isSubstring("time to program", "program");

var fizzBuzz = function(array) {
  var newArray = [];
  for(let i=0; i<array.length; i++) {
    if (!(array[i] % 3 === 0 && array[i] % 5 === 0) && (array[i] % 3 === 0 || array[i] % 5 === 0)) {
      newArray.push(array[i]);
    }
  }
  console.log(newArray);
};

// fizzBuzz([2,3,4,5,9,10,15]);
