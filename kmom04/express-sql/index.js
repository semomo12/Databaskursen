/**
 * A sample Express server with static resources.
 */
"use strict";

const path = require("path");
const express = require("express");
const app = express();
const port = 1337;
const routeBank = require("./route/bank.js");
const routeIndex = require("./route/index.js");
const middleware = require("./middleware/index.js");

app.use(middleware.logIncomingToConsole);
app.set("view engine", "ejs");
app.use(express.static(path.join(__dirname, "public")));
app.use("/", routeIndex);
app.use("/bank", routeBank);
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
}
