const express = require("express");
const router = express.Router();

const exam = require("../src/exam.js");

// GET /index - Visa välkomstsidan
router.get('/index', (req, res) => {
    res.render('index', { title: 'Welcome to the Minerals' });
});

// GET /visa - Visa rapporter
router.get("/visa", async (req, res) => {
    try {
        let rapportData = await exam.showRapport();

        let data = {
            title: "Rapport",
            mineraler: rapportData.rapport || [],
            res: rapportData
        };

        console.log(data.res);
        res.render("visa.ejs", data);
    } catch (error) {
        // Om ett fel uppstår, logga det och skicka ett felmeddelande till klienten
        console.error("Fel vid hämtning av rapport:", error);
        res.status(500).send("Ett fel uppstod vid hämtning av rapporten.");
    }
});

// GET /search - Visa söksidan med formuläret
router.get("/search", (req, res) => {
    res.render("search", { title: "Search" });
});

// POST /search - Hantera POST-förfrågningar från sökformuläret
router.post("/search", async (req, res) => {
    let searchStr = req.body.searchStr;

    let data = {
        title: "Search",
    };

    data.res = await exam.searchByString(searchStr);

    res.render("visa", {
        title: data.title,
        mineraler: data.res
    });
});

module.exports = router;
