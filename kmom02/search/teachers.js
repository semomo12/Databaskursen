/**
 * Show teachers and their departments.
 */


(async function() {
    const config = require("./config.json");
    const mysql = require("promise-mysql");
    const db = await mysql.createConnection(config);
    let sql;
    let res;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning
        FROM larare
        ORDER BY akronym;
    `;
    res = await db.query(sql);

    console.info(res);

    db.end();
})();
