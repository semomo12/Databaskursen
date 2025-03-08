const express = require("express");
const router = express.Router();




// Add a route for the path /
router.get("/", (req, res) => {
    console.log("admin root router");
    res.send(" root");
});

// Add a route for the path /about
router.get("/about", (req, res) => {
    res.send("<h1>admin About </h1>");
});

module.exports = router;
