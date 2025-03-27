const express = require("express");
const router = express.Router();
const exam = require("../src/exam.js");



router.get('/index', (req, res) => {
    res.render('index', { title: 'Welcome to the exam' });
});



router.get("/visa", async (req, res) => {
    try {
        let rapportData = await exam.showRapport();

        let data = {
            title: "Rapporter",
            kraftverk: rapportData.rapport1 || [],
            konsumenter: rapportData.rapport2 || [],
            res: rapportData
        };

        console.log(data.res);
        res.render("visa.ejs", data);
    } catch (error) {
        console.error("Fel vid hämtning av rapport:", error);
        res.status(500).send("Ett fel uppstod vid hämtning av rapporten.");
    }
});


// Route för att visa sökformuläret
router.get("/search", (req, res) => {
    res.render("search", { title: "Sök" });
});

// Route för att hantera POST-förfrågningar från sökformuläret
router.post("/search", async (req, res) => {
    let searchStr = req.body.searchStr;  // Hämta söksträngen från formuläret
    let data = {
        title: "Söka",
    };

    // Hämta resultatet från databasen genom att anropa den uppdaterade searchByString-funktionen
    data.res = await exam.searchByString(searchStr);
    // Anropa funktionen för att hämta filtrerade resultat
    // Rendera resultatet i visa.ejs (rapporten)
    res.render("visa", {
        title: data.title,
        kraftverk: data.res,  // Sätt kraftverken som data
        konsumenter: data.res // Konsumenter är också samma här om du vill visa dem, annars justera
    });
});

module.exports = router;
