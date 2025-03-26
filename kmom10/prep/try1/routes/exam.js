const express = require("express");
const router = express.Router();

const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });

const exam = require("../src/exam.js");



router.get('/index', (req, res) => {
    res.render('index', { title: 'Welcome to the exam' });
});



router.get("/visa", async (req, res) => {
    let data = {
        title: "Show | Exam",
    };

    data.res = await exam.showRapport();
    console.log(data.res);
    res.render("visa.ejs", data);
});

router.get("search", async (req, res) => {
    let data = {
        title: "Search | Exam",
    };

    res.render("search.ejs", data);
});



router.post("/search", urlencodedParser,async (req, res) => {
 await exam.showRapport(req.body.name);
    res.redirect(`search.ejs`);
});
module.exports = router;
