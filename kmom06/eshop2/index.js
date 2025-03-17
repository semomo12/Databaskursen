const port    = process.env.DBWEBB_PORT || 1337;
const express = require("express");
const app  = express();
const routeEshop  = require("./routes/eshop.js");
const routeHome  = require("./routes/home.js");


app.set("view engine", "ejs");
app.use(express.static("public"));
app.use("/eshop", routeEshop);
app.use("/", routeHome);

app.listen(port, logStartUpDetailsToConsole);



function logStartUpDetailsToConsole() {
    let routes = [];

    // Find what routes are supported
    app._router.stack.forEach((middleware) => {
        if (middleware.route) {
            // Routes registered directly on the app
            routes.push(middleware.route);
        } else if (middleware.name === "router") {
            // Routes added as router middleware
            middleware.handle.stack.forEach((handler) => {
                let route;

                route = handler.route;
                route && routes.push(route);
            });
        }
    });

    console.info(`Server is listening on port ${port}.`);
    console.info("Available routes are:");
    console.info(routes);
}
