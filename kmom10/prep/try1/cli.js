const mysql = require('mysql');
const readline = require('readline');
const config = require("./config/db/exam.json");
const connection = mysql.createConnection(config);


const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

connection.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database');

    showMenu();
});

function exitProgram(code) {
    code = code || 0;
    connection.end();
    rl.close();
    console.info("Exiting with status code " + code);
    process.exit(code);
}


function showMenu() {
    console.log("Welcome to the program");
    console.log('\nMenu:');
    console.log('1. visa');
    console.log('\n13. help/menu');
    console.log('14. exit');
    rl.question('\nEnter your choice: ', handleChoice);
}


function handleChoice(choice) {
    const args = choice.split(' ');
    // let id = 0;
    let log="";


    choice = args[0];

    switch (choice) {
        case 'visa':
            log="visa";
            console.log(log);
            showMenu();
            break;
        case 'menu':
        case 'help'  :
            showMenu();
            break;
        case 'exit':
        case 'q'  :
            exitProgram();
            break;
        default:
            console.log('Invalid choice. Please enter a valid command.');
            showMenu();
            break;
    }
}

