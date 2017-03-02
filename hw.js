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

var isPrime = function(num) {
  for(let i=2; i<=num/2; i++) {
    if (num % i === 0) {
      console.log(false);
      return false;
    }
  }
  console.log(num);
  return true
}

// isPrime(10);
// isPrime(17);

var sumOfNPrimes = function(n) {
  var count = 0;
  var sum = 0;
  var i = 2;
  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
    i++;
  }
  console.log(sum);
}

sumOfNPrimes(4);
