const express = require("express");
const app = express();
const port = 1337;

app.listen(port, () => {
    console.log(`using port: ${port}`);
});

app.use((req, res, next) => {
    console.info(`Got request on ${req.path} (${req.method}).`);
    next();
});

// Add a route for the path /
app.get("/", (req, res) => {
    res.send("Hello World");
});

// Add a route for the path /about
app.get("/about", (req, res) => {
    res.send("About something");
});
