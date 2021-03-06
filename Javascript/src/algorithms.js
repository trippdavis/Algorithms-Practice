(function () {
if(typeof Algorithms === "undefined") {
  window.Algorithms = {};
}

// Write a method, digital_root(num).
// It should sum the digits of a positive integer.
// If it is greater than or equal to 10, sum the digits of the resulting number.
// Keep repeating until there is only one digit in the result, called the "digital root".
// Do not use string conversion within your method.
Algorithms.digitalRoot = function (number) {
  while (number >= 10) {
    var remainder = number % 10;
    number = remainder + Algorithms.digitalRoot(Math.floor(number / 10));
  }

  return number;
};

// Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet.
// Assume lowercase and no punctuation.
// Preserve spaces.
Algorithms.caesarCipher = function (string, shift) {
  var ciphered = "";
  for (var i = 0; i < string.length; i++) {
    var char = string[i];
    var code = char.charCodeAt(0);
    if (char === " ") {
      ciphered += " ";
    } else {
      var newCode = code + shift;
      if (newCode > 122) {
        newCode = ((newCode % 122) + 96);
      }
      ciphered += String.fromCharCode(newCode);
    }
  }
  return ciphered;
};

// Write a function that takes two strings and returns the lenght of the longest common substring.
Algorithms.commonSubstrings = function (stringOne, stringTwo) {
  var short, long;
  if (stringOne.length <= stringTwo.length) {
    short = stringOne;
    long = stringTwo;
  } else {
    short = stringTwo;
    long = stringOne;
  }

  var length = short.length;
  while (length > 0) {
    var subs1 = Algorithms.substrings(short, length);
    var subs2 = Algorithms.substrings(long, length);
    for (var i = 0; i < subs1.length; i++) {
      for (var j = 0; j < subs2.length; j++) {
        if (subs1[i] === subs2[j]) {
          return length;
        }
      }
    }
    length--;
  }
  return "";
};

Algorithms.substrings = function (string, length) {
  var subs = [];
  for (var i = 0; i <= string.length - length; i++) {
    subs.push(string.slice(i, i + length));
  }

  return subs;
};

// Write a function that takes an array of integers and returns their sum.
// Use recursion.
Algorithms.sumRec = function (numbers) {
  if (numbers.length === 0) {
    return 0;
  }
  var number = numbers.pop();
  return number + Algorithms.sumRec(numbers);
};

// Write a function which returns the first n elements from the fibonnacci sequence, given n.
Algorithms.fibs = function (number) {
  if (number === 0) {
    return [];
  } else if (number === 1) {
    return [0];
  } else if (number === 2) {
    return [0, 1];
  } else {
    var prev_fibs = Algorithms.fibs(number - 1);
    var new_fib = prev_fibs[prev_fibs.length - 1] + prev_fibs[prev_fibs.length - 2];
    prev_fibs.push(new_fib);
    return prev_fibs;
  }
};

// Write a function that takes a string and returns true if it's a palindrome, false if it's not.
// Your solution should take less time and memory than rebuilding the string backward and comparing the two.
Algorithms.isPalindrome = function (string) {
  for (var i = 0; i < Math.floor(string.length / 2); i++) {
    if (string[i] !== string[string.length - 1 - i]) {
      return false;
    }
  }
  return true;
};

// Implement the Folding Cipher.
// It folds the alphabet in half and uses the adjacent letter.
// a <=> z, b <=> y, c <=> x, m <=> n.
Algorithms.foldingCipher = function (string) {
  var ciphered = "";
  for (var i = 0; i < string.length; i++) {
    var oldCode = string[i].charCodeAt(0);
    var newCode = 219 - oldCode;
    ciphered += String.fromCharCode(newCode);
  }
  return ciphered;
};

// Write a method that finds all the unique substrings for a word.
Algorithms.uniqSubs = function (string) {
  var subs = [];
  var prev_subs = {};
  for (var start = 0; start < string.length; start++) {
    for (var end = start; end < string.length; end++) {
      var sub = string.slice(start, end + 1);
      if (!prev_subs[sub]) {
        prev_subs[sub] = true;
        subs.push(sub);
      }
    }
  }

  return subs;
};


// Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).
// You can solve this trivially in O(n**2) time by considering all subarrays.
// Try to solve it in O(n) time with O(1) memory.
Algorithms.lcs = function (array) {
  var lcs = 0;
  var current = 0;
  for (var i = 0; i < array.length; i++) {
    if (current + array[i] > 0) {
      current += array[i];
      if (current > lcs) {
        lcs = current;
      }
    } else {
      current = 0;
    }
  }

  return lcs;
};

// Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition:
// the first two digits summed with the last two digits are equal to the middle two digits.
Algorithms.sillyYears = function (number) {
  var years = [];
  while (years.length < 10) {
    var year = String(number);
    if (Number(year.slice(0, 2)) + Number(year.slice(2)) === Number(year.slice(1, 3))) {
      years.push(number);
    }
    number++;
  }

  return years;
};

// Given an array of integers, return all pairs that sum up to a specified value k.
// List the pairs in [min, max] order.
// Time complexity: O(n).
// Return an array.
Algorithms.pairSum = function (array, k) {
  var pairs = [];
  var numbers = {};
  for (var i = 0; i < array.length; i++) {
    var number = array[i];
    var target = k - number;
    if (numbers[target]) {
      pairs.push(number < target ? [number, target] : [target, number]);
      numbers[target]--;
    } else {
      if (numbers[number]) {
        numbers[number]++;
      } else {
        numbers[number] = 1;
      }
    }
  }

  return pairs;
};

// Given a matrix of integers and coordinates of a rectangular region within the matrix.
// Find the sum of numbers falling inside the rectangle.
// Time complexity: O(number of rows * number of columns).
Algorithms.matrixRegionSum = function (matrix, topLeftCoords, bottomRightCoords) {
  var sum = 0;
  for (var i = topLeftCoords[0]; i <= bottomRightCoords[0]; i++) {
    for (var j = topLeftCoords[1]; j <= bottomRightCoords[1]; j++) {
      sum += matrix[i][j];
    }
  }

  return sum;
};

})();
