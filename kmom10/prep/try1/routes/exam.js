// Importera express-modulen och skapa en router
const express = require("express");
const router = express.Router();

// Importera de funktioner som vi skapade för att hämta data från databasen
const exam = require("../src/exam.js");

// GET /index - Visa välkomstsidan
router.get('/index', (req, res) => {
    // Rendera 'index' vy och skicka med en titel till vyn
    res.render('index', { title: 'Welcome to the exam' });
});

// GET /visa - Visa rapporter
router.get("/visa", async (req, res) => {
    try {
        // Anropa exam.showRapport() för att hämta de två rapporterna
        let rapportData = await exam.showRapport();

        // Skapa ett objekt med data som ska skickas till vyn
        let data = {
            title: "Rapporter",  // Titeln för vyn
            kraftverk: rapportData.rapport1 || [],  // Sätt rapport1 som kraftverk
            konsumenter: rapportData.rapport2 || [],  // Sätt rapport2 som konsumenter
            res: rapportData  // Sätt hela rapportData för eventuell felsökning
        };

        // Logga resultatet för felsökning
        console.log(data.res);

        // Rendera 'visa.ejs' vyn och skicka med datan
        res.render("visa.ejs", data);
    } catch (error) {
        // Om ett fel uppstår, logga det och skicka ett felmeddelande till klienten
        console.error("Fel vid hämtning av rapport:", error);
        res.status(500).send("Ett fel uppstod vid hämtning av rapporten.");
    }
});

// GET /search - Visa söksidan med formuläret
router.get("/search", (req, res) => {
    // Rendera 'search' vyn för att visa sökformuläret
    res.render("search", { title: "Sök" });
});

// POST /search - Hantera POST-förfrågningar från sökformuläret
router.post("/search", async (req, res) => {
    // Hämta söksträngen från formuläret
    let searchStr = req.body.searchStr;  // Söksträngen från formuläret

    // Skapa ett objekt för att lagra data som ska skickas till vyn
    let data = {
        title: "Söka",  // Sätt titel på sidan
    };

    // Anropa funktionen för att söka efter strängen i databasen
    data.res = await exam.searchByString(searchStr);  // Hämta filtrerade resultat från databasen

    // Rendera 'visa' vyn och skicka med resultatet
    res.render("visa", {
        title: data.title,  // Titel för sidan
        kraftverk: data.res,  // Sätt de sökande kraftverken som data för vyn
        konsumenter: data.res // Sätt de sökande konsumenterna som data (kan justeras om det behövs)
    });
});

// Exportera routern för användning i applikationen
module.exports = router;
