var print = console.log;

function Student(firstName, lastName, studentID) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.studentID = studentID;
    this.display = function () {
        print(this.firstName + " " + this.lastName + " " + this.studentID);
    }
}

var students = [];

students.push(new Student("Michael", "Scott", 10));
students.push(new Student("Jim", "Halpert", 11));
students.push(new Student("Pam", "Halpert", 12));
students.push(new Student("Dwight", "Schrute", 13));

var creed = new Student("Creed", "Bratton", 14);
creed.graduated = true;
students.push(creed);

var kevin = {
    firstName: "Kevin",
    lastName: "Malone",
    studentID: 15,
    __proto__: new Student
};

students.push(kevin);

for (let i = 0; i < students.length; i++) {
    students[i].display();
}
