/**
 * Route for bank.
 */
"use strict";

const express = require("express");
const router = express.Router();
const bank = require("../src/bank.js");

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | The Bank",
    };

    res.render("bank/index", data);
});

router.get("/balance", async (req, res) => {
    let data = {
        title: "Account balance | The Bank",
    };

    data.res = await bank.showBalance();

    res.render("bank/balance", data);
});

router.get("/move-to-adam", async (req, res) => {
    let data = {
        title: "Move to Adam | The Bank",
    };

    data.res = await bank.MoveMoney("Eva", "Adam");
    if (data.res.transactionOk) {
        data.message = `Hej Eva! Tack för att du flyttade 1.5 pengar till mig!` +
            `\nVänliga hälsningar,\nAdam!`;
    } else {
        data.message = `Eva har inte tillräckligt med pengar för att överföra till Adam`;
    }
    res.render("bank/move-to-adam", data);
});

module.exports = router;
