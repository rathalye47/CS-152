var name = "Monty";
var r;
function Rabbit(name) {
    this.name = name;
}

r = new Rabbit("Python");

console.log(r.name);  // ERROR!!!
console.log(name);    // Prints "Python"
