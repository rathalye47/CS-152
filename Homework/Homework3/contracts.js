// NOTE: This library uses non-standard JS features (although widely supported).
// Specifically, it uses Function.name.

function any(v) {
  return true;
}

function isNumber(v) {
  return !Number.isNaN(v) && typeof v === 'number';
}
isNumber.expected = "number";

function isBoolean(v){
    if (v === true || v === false) {
      return true;
    }

    else {
      return false;
    }
}
isBoolean.expected = "boolean";

function isDefined(v){
    if (v !== null && v !== undefined) {
      return true;
    }

    else {
      return false;
    }
}
isDefined.expected = "defined";

function isString(v){
    if (isDefined(v) && (v instanceof String || typeof v === 'string')) {
      return true;
    }

    else {
      return false;
    }
}
isString.expected = "string";

function isNegative(v){
    if (isNumber(v) && v < 0) {
      return true;
    }

    else {
      return false;
    }
}
isNegative.expected = "negative number";

function isPositive(v){
    if (isNumber(v) && v > 0) {
      return true;
    }

    else {
      return false;
    }
}
isPositive.expected = "positive number";


// Combinators:

function and() {
  let args = Array.prototype.slice.call(arguments);
  let cont = function(v) {
    for (let i in args) {
      if (!args[i].call(this, v)) {
        return false;
      }
    }
    return true;
  }
  cont.expected = expect(args[0]);
  for (let i=1; i<args.length; i++) {
    cont.expected += " and " + expect(args[i]);
  }
  return cont;
}

function or(){
  let args = Array.prototype.slice.call(arguments);
  let cont = function(v) {
    for (let i in args) {
      if (args[i].call(this, v)) {
        return true;
      }
    }
    return false;
  }
  cont.expected = expect(args[0]);
  for (let i=1; i<args.length; i++) {
    cont.expected += " or " + expect(args[i]);
  }
  return cont;
};

function not(originalCont){
    let oppositeCont = function(v) {
        let res = originalCont.call(this, v);
        return !res;
    }

    oppositeCont.expected = "not " + originalCont.expected;
    return oppositeCont;
}

// Utility function that returns what a given contract expects.
function expect(f) {
  // For any contract function f, return the "expected" property
  // if it is specified.  (This allows developers to specify what
  // the expected property should be in a more readable form.)
  if (f.expected) {
    return f.expected;
  }
  // If the function name is available, use that.
  if (f.name) {
    return f.name;
  }
  // In case an anonymous contract is specified.
  return "ANONYMOUS CONTRACT";
}


function contract (preList, post, f) {
    return function() {
		for (let index = 0; index < preList.length; index++) {
			let preconditionMet = preList[index].call(this, arguments[index]);

			if (!preconditionMet) {
        throw new Error("Contract violation in position " + index + ". Expected " + preList[index].expected + " but received " + arguments[index] + ".  Blame -> Top-level code");
      }
		}
		
		let funcResult = f.apply(this, arguments);

		if (!post(funcResult)) {
      throw new Error("Contract violation. Expected " + post.expected + " but returned " + funcResult + ".  Blame -> " + f.name);
    }
			
		return funcResult;
	}
}

module.exports = {
  contract: contract,
  any: any,
  isBoolean: isBoolean,
  isDefined: isDefined,
  isNumber: isNumber,
  isPositive: isPositive,
  isNegative: isNegative,
  isInteger: Number.isInteger,
  isString: isString,
  and: and,
  or: or,
  not: not,
};
