/**
 * A module exporting functions to access the bank database.
 */
"use strict";

const mysql  = require("promise-mysql");
const config = require("../config/db/bank.json");
let db;


/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();


// show in table
 async function findAllInTable(table) {
    let sql = `SELECT * FROM ??;`;
    let res;

    res = await db.query(sql, [table]);

    return res;
}


// Show the balance of all accounts.
async function showBalance() {
    return findAllInTable("account");
}



// Move money from one account to another.
async function startTransaction(fromAccount, toAccount, amount) {
    let res = false;


    if (fromAccount.balance > amount) {
        let sql = `
        START TRANSACTION;

        UPDATE account
        SET
            balance = balance - ?
        WHERE
            id = ?;

        UPDATE account
        SET
            balance = balance + ?
        WHERE
            id = ?;

        COMMIT;`;

        res = await db.query(sql, [amount, fromAccount.id, amount, toAccount.id]);
        if (res) {
            res = true;
        }
    }

    return res;
}


// Move money from one account to another.
async function MoveMoney(from, to, amount) {
    amount = amount || 1.5;
    if (amount < 0) {
        amount = 0;
    }

    const accounts = await findAllInTable("account");
    let fromAccount = accounts.find(acc => acc.name.toLowerCase() === from.toLowerCase());
    let toAccount = accounts.find(acc => acc.name.toLowerCase() === to.toLowerCase());
    let res = await startTransaction(fromAccount, toAccount, amount);

    if (res) {
        return { fromAccount, toAccount, transactionOk: true };
    }
    return { fromAccount, toAccount, transactionOk: false };
}




module.exports = {
    showBalance: showBalance,
    MoveMoney: MoveMoney,
};
