const express = require("express");
const router = express.Router();




// Add a route for the path /
router.get("/", (req, res) => {
    console.log("root router");
    res.send(" root");
});

// Add a route for the path /about
router.get("/about", (req, res) => {
    res.send("<h1>About </h1>");
});

//test
router.get("/test/:name/:cours", (req, res) => {
    console.log(req.params);
    res.send("test");
});


router.get("/error", (req, res) => {
    //console.log("<h1>error</h1>");
    res.send("<h1>error</h1>");
}
);

module.exports = router;
