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

module.exports = router;
