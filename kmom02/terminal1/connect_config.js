
/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    const config = require("./config.json");
    const mysql = require("promise-mysql");
    const db = await mysql.createConnection(config);

    let sql = "SELECT 1+1 AS Sum";
    let res = await db.query(sql);

    console.info(res);

    db.end();
    // rest of code
})();
