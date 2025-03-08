/**
 * General routes.
 */
"use strict";

var express = require('express');
var router  = express.Router();

// Add a route for the path /
router.get('/', (req, res) => {
    let data = {
        title: "Welcome | The Bank"
    };

    res.render("index/index", data);
});

// // Add a route for the path /about
// router.get("/about", (req, res) => {
//     res.send("About something");
// });

module.exports = router;
