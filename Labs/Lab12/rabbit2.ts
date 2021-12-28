var name2: string = "Monty";
var r;
function Rabbit(name: string) {
    this.name = name;
}

r = new Rabbit("Python");

console.log(r.name);  // ERROR!!!
console.log(name2);    // Prints "Python"