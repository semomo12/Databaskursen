/**
 * A simple test program.
 *
 * @author Mostafa Mohseni
 */
"use strict";

const h = require("./helper.js");

// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function () {
    // Ask question and handle answer in async arrow function callback.
    rl.question("What to search for? ", async (search) => {
        const res = await h.searchTeachers(search);

        console.info(await h.showAsTable(res));

        rl.close();
    });
})();
