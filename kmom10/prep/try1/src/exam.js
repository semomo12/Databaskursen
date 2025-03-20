//mina funktioner
const mysql = require("promise-mysql");
const config = require("../config/db/exam.json");

let db;

(async function () {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();



module.exports = {};
