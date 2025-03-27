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


async function showRapport() {
    try {
        let sql1 = `CALL p_rapport1();`;
        let sql2 = `CALL p_rapport2();`;

        let res1 = await db.query(sql1);
        let res2 = await db.query(sql2);

        return { rapport1: res1[0], rapport2: res2[0] };
    } catch (error) {
        console.error("Fel vid hämtning av rapport:", error);
        throw error;
    }
}

async function searchByString(searchStr) {
    let sql = `CALL p_rapport_search(?);`;
    let res = await db.query(sql, [searchStr]);

    return res[0];
}



module.exports = {
    showRapport: showRapport,
    searchByString: searchByString,
};
