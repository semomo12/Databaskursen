/**
 * General routes.
 */
"use strict";

var express = require('express');
var router  = express.Router();

// Add a route for the path /
router.get('/', (req, res) => {
    let data = {
        title: "Welcome | exam"
    };

    console.log("Home page");

    res.render("index.ejs", data);
});



module.exports = router;
