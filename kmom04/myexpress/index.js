const express = require("express");
const app = express();
const port = 1337;
const indexroutes = require("./router/indexroutes");
const adminroutes = require("./router/adminroutes");


function logger(req, res, next) {
    console.info(`${new Date().toLocaleString()} -Got request on ${req.path} (${req.method}).`);
    next();
}



// // Add a route for the path /
// app.get("/", (req, res) => {
//     console.log("root router");
//     res.send("Hello World");
// });

// // Add a route for the path /about
// app.get("/about", (req, res) => {
//     res.send("<h1>About something</h1>");
// });

// app.get("/error", (req, res) => {
//     //console.log("<h1>error</h1>");
//     res.send("<h1>error</h1>");
// }
// );

app.use(logger);
app.use(indexroutes);
app.use("/admin", adminroutes);

app.listen(port, () => {
    console.log(`using port: ${port}`);
});
