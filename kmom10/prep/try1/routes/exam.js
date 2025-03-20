const express = require("express");
const router = express.Router();
const exam = require("../src/exam.js");


router.use("/", exam);

router.get('/exam/index', (req, res) => {
    res.render('index', { title: 'Välkommen till Exam' });
});

module.exports = router;
