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
        let sql = `CALL p_rapport();`;

        let res1 = await db.query(sql);

        return { rapport: res1[0]};
    } catch (error) {
        console.error("Fel vid hämtning av rapport:", error);
        throw error;
    }
}

// Funktion för att söka i rapporterna baserat på en söksträng
async function searchByString(searchStr) {
    let sql = `CALL p_rapport_search(?);`;

    let res = await db.query(sql, [searchStr]);

    return res[0];
}

module.exports = {
    showRapport: showRapport,
    searchByString: searchByString,
};
