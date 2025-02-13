/**
 * A simple test program.
 *
 * @author Mostafa Mohseni
 */
"use strict";

const h = require("./helper.js");

/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function () {
    const res = await h.searchAllTeachers();

    console.info(await h.showAsTable(res));
})();
