/**
 * a program that acts as an infinite command loop
 * where you can enter commands that the program executes.
 */

const Teacher = require("./src/functions");
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

const teachers = new Teacher();

/**
 * Main function.
 *
 * @returns void
 */
function startProgram() {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    showMenu();
    rl.setPrompt("\nwhat do you want to do? ");
    rl.prompt();
}
startProgram();


//show menu
function showMenu() {
    console.clear();
    console.info(
        `  You can choose from the following commands.\n` +
        `  exit,quit,done ---------> exit the program.\n` +
        `  menu,help --------------> to show this menu.\n` +
        `  larare -----------------> all info about the teachers.\n` +
        `  kompetens --------------> report, about the competence.\n` +
        `  lon --------------------> report, about the salary.\n` +
        `  sok <sokstrang> --------> shows the teachers who match the search string. .\n` +
        `  nylon <akronym> <lon> --> update the salary.\n`);
}

/**
 * Close down program and exit with a status code.
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}



/**
 * Handle input as a command and send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 *
 * @returns {void}
 */
async function handleInput(input) {
    input = input.trim();

    let inputParts = input.split(" ");

    switch (inputParts[0]) {
        case "quit":
        case "done":
        case "exit":
            exitProgram();
            break;
        case "help":
        case "menu":
            showMenu();
            break;
        case "larare":{
            let allTeachers = await teachers.ShowAllTeachers();

            console.table(allTeachers);
            break;}
        case "kompetens":{
            let kompetens = await teachers.kompetensUpdate();

            console.table(kompetens);
            break;}
        case "lon":{
            let lon = await teachers.salaryDifference();

            console.table(lon);
            break;}
        case "sok":{
            let sok = await teachers.searchInfoByStrang(inputParts[1]);

            console.table(sok);
            break;}
        case "nylon":{
            let nylon = await teachers.updateSalary(inputParts[1], inputParts[2]);

            console.table(nylon);
            break;}
        default:
            showMenu();
            break;
    }

    rl.prompt();
}
