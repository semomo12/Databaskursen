const mysql = require('mysql');
const readline = require('readline');
const config = require("./config/db/exam.json");
const util = require('util');
const connection = mysql.createConnection(config);
const queryAsync = util.promisify(connection.query).bind(connection);

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
    console.log("\nWelcome to the program");
    console.log('\nMenu:');
    console.log('1. visa - Show reports for kraftverk and konsumenter');
    console.log('2. search <searchString> - Search for kraftverk or energikälla');
    console.log('3. report');
    console.log('\n4. help/menu - Show menu');
    console.log('5. exit - Exit the program');
    rl.question('\nEnter your choice: ', handleChoice);
}


function handleChoice(choice) {
    const args = choice.split(' ');

    choice = args[0];

    switch (choice) {
        case 'visa':
            showRapport();
            showMenu();
            break;
        case 'search':
            if (args.length > 1) {
                let searchString = args.slice(1).join(' ');

                searchByString(searchString);
            } else {
                console.log("Please provide a search string after 'search'.");
                showMenu();
            }
            break;
        case 'report':
            showRapport3();
            showMenu();
            break;
        case 'menu':
        case 'help' :
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


async function showRapport() {
    try {
        const results = await queryAsync(`CALL p_rapport1_no_url;`);
        const results2 = await queryAsync(`CALL p_rapport2();`);


        console.log('rapport kraftverk:');
        console.table(results[0]);
        console.log('rapport konsument:');
        console.table(results2[0]);
        showMenu();
    } catch (error) {
        console.error('Error to show rapports:', error);
        return;
    }
}

async function searchByString(searchStr) {
    try {
        const results = await queryAsync('CALL p_rapport_search(?);', [searchStr]);

        const resultSet = results[0];

        if (resultSet.length === 0) {
            console.log('No matching items found.');
            showMenu();
            return;
        }

        console.log(`sökresultat: ${searchStr}):`);
        console.table(resultSet);
        showMenu();
    } catch (error) {
        console.error('Error searching:', error);
        return;
    }
}




async function showRapport3() {
    try {
        const results = await queryAsync(`CALL p_rapport3();`);


        console.log('report:');
        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error to show rapports:', error);
        return;
    }
}



// function cleanReport(reportData) {
//     return reportData.map(row => {
//         let cleanRow = { ...row }; // Kopiera objektet för att inte ändra originalet
//         for (let key in cleanRow) {
//             if (typeof cleanRow[key] === "string") {
//                 // Ta bort webblänkar med en regex som matchar URL:er
//                 cleanRow[key] = cleanRow[key].replace(/https?:\/\/[^\s]+/g, "[LÄNK BORTTAGEN]");
//             }
//         }
//         return cleanRow;
//     });
// }
