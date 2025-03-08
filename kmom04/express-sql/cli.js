/**
 * Guess my number, a sample CLI client.
 */
"use strict";

// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});
const bank = require("./src/bank.js");


/**
 * Main function.
 *
 * @returns void
 */
function main() {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    showMenu();

    rl.setPrompt("\nBank: ");
    rl.prompt();
}
main();

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
 * Show the menu on that can be done.
 *
 * @returns {void}
 */
function showMenu() {
    console.clear();
    console.info(
        ` You can choose from the following commands.\n` +
        `  exit ------------------------> quit, ctrl-d - to exit the program.\n` +
        `  help, menu ------------------> to show this menu.\n` +
        `  move ------------------------> Move 1.5 peng from Adam to Eva.\n` +
        `  move <amount> <from> <to> ---> Move amount peng from one person to another.\n`+
        `  balance ---------------------> Overview of the accounts available and the account balance..\n`);
}




// menu options
async function handleInput(input) {
    input = input.trim();

    let inputParts = input.split(" ");

    switch (inputParts[0]) {
        case "quit":
        case "exit":
            exitProgram();
            break;

        case "help":
        case "menu":
            showMenu();
            break;

        case "move": {
            let amount = 1.5,
                from = "",
                to = "",
                ok = false;

            switch (inputParts.length) {
                case 1:
                    from = "Adam";
                    to = "Eva";
                    ok = true;
                    break;
                case 2:
                    amount = parseFloat(inputParts[1]);
                    from = "Adam";
                    to = "Eva";
                    ok = true;
                    break;
                case 4:
                    amount = parseFloat(inputParts[1]);
                    from = inputParts[2];
                    to = inputParts[3];
                    ok = true;
                    break;
                default:
                    console.info("Arguments are not right.");
            }

            if (ok) {
                let { fromAccount, toAccount, transactionOk } = await bank.MoveMoney(from, to, amount);
                if (transactionOk) {
                    console.info(`(flytta ${amount} pengar från ${fromAccount.id} till ${toAccount.id}.)`);
                    console.info(`${toAccount.name} fick ${amount} pengar, from ${fromAccount.name}.`);
                } else {
                    console.info(`${fromAccount.name} har ej tillräckligt med pengar att överföra till ${toAccount.name}`);
                }
            }
            break;
        }

        case "balance": {
            let balance = await bank.showBalance();
            console.info(`Adam har ${balance[0].balance} och Eva har ${balance[1].balance} pengar.`);
            break;
        }

        default:
            console.info("Unknown command. Type 'help' for available commands.");
    }

    rl.prompt();
}
