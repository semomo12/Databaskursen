// Importera mysql-modulen som använder löften (promises)
const mysql = require("promise-mysql");
// Importera konfigurationsfilen för databasen
const config = require("../config/db/exam.json");

let db;


(async function () {
    // Skapar en anslutning till databasen med hjälp av konfigurationsfilen
    db = await mysql.createConnection(config);

    // När processen avslutas, stäng anslutningen till databasen
    process.on("exit", () => {
        db.end();
    });
})();

// Funktion för att hämta rapporter från databasen
async function showRapport() {
    try {
        // SQL-frågor som anropar de lagrade procedurerna för att hämta rapporter
        let sql1 = `CALL p_rapport1();`;  // Rapport 1
        let sql2 = `CALL p_rapport2();`;  // Rapport 2

        // Kör SQL-frågorna asynkront och vänta på svaren
        let res1 = await db.query(sql1);
        let res2 = await db.query(sql2);

        // Returnera de två rapporterna som ett objekt
        return { rapport1: res1[0], rapport2: res2[0] };
    } catch (error) {
        // Om ett fel inträffar vid hämtningen, logga felet och kasta ett undantag
        console.error("Fel vid hämtning av rapport:", error);
        throw error;
    }
}

// Funktion för att söka i rapporterna baserat på en söksträng
async function searchByString(searchStr) {
    // SQL-fråga som anropar den lagrade proceduren för sökning
    let sql = `CALL p_rapport_search(?);`;

    // Kör SQL-frågan med hjälp av den angivna söksträngen
    let res = await db.query(sql, [searchStr]);

    // Returnera resultatet från sökningen
    return res[0];
}

// Exportera funktionerna så att de kan användas i andra delar av applikationen
module.exports = {
    showRapport: showRapport,
    searchByString: searchByString,
};
