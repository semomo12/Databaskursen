/**
 * Route for Home page.
 */
"use strict";

const express = require("express");
const router  = express.Router();

router.get("/", (req, res) => {
    let data = {
        title: "Welcome | Website"
    };

    console.log("Home page");

    res.render("eshop/partials/index.ejs", data);
});


router.use((req, res) => {
    let data = {
        title: "Nothing found | Website"
    };

    res.status(404).render('eshop/partials/error404', data);
});

module.exports = router;
