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


async function showrapport() {
    let sql = `CALL p_rapport();`;

    let res = await db.query(sql);

    return res[0];
}

async function searchByString() {
    let sql = `CALL p_rapport();`;

    let res = await db.query(sql);

    return res[0];
}




module.exports = {
    showrapport: showrapport,
    searchByString: searchByString,
};
