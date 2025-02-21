/**
 * A module for functions for my commands.
 */
"use strict";

const config =require("../config.json");
const mysql = require("promise-mysql");

class Teacher {
    /**
     * @constructor
     */
    constructor() {}

    async ShowAllTeachers() {
        const db = await mysql.createConnection(config);

        let sql = `
            SELECT
                *
            FROM
                v_all_with_age
            `;
        let res = await db.query(sql);

        db.end();
        let data = [["Akronym", "Avdelning", "Namn", "kon", "Lön", "Komp", "Ålder"]];

        for (const row of res) {
            data.push([
                row.akronym,
                row.avdelning,
                row.fornamn + " " + row.efternamn,
                row.kon,
                row.lon.toString(),
                row.kompetens.toString(),
                row.Ålder.toString()
            ]);
        }
        return data;
    }

    async kompetensUpdate() {
        const db = await mysql.createConnection(config);
        let sql = `
            SELECT
                l.akronym as akronym,
                l.kompetens as kompetens,
                lp.kompetens as kompetens_pre,
                l.kompetens - lp.kompetens as diff
            FROM
                larare as l
            JOIN
                larare_pre as lp
            ON
                l.akronym = lp.akronym
            `;
        let res = await db.query(sql);

        db.end();

        let data = [["akronym", "kompetens", "kompetens_pre", "diff"]];

        for (const row of res) {
            data.push([
                row.akronym,
                row.kompetens,
                row.kompetens_pre,
                row.diff,
            ]);
        }
        return data;
    }

    async salaryDifference() {
        const db = await mysql.createConnection(config);

        let sql = `
            SELECT
                l.akronym as akronym,
                l.lon as lon,
                lp.lon as lon_pre,
                l.lon - lp.lon as diff
            FROM
                larare as l join
                larare_pre as lp
            ON
                l.akronym = lp.akronym
            `;
        let res = await db.query(sql);

        db.end();

        let data = [["akronym", "kompetens", "kompetens_pre", "diff"]];

        for (const row of res) {
            data.push([
                row.akronym,
                row.lon,
                row.lon_pre,
                row.diff,
            ]);
        }
        return data;
    }

    async searchInfoByStrang(what) {
        const db = await mysql.createConnection(config);

        let sql = `
            SELECT
                *
            FROM
                larare
            WHERE
                akronym LIKE ?
                OR fornamn LIKE ?
                OR efternamn LIKE ?
                OR avdelning LIKE ?
                OR kon LIKE ?
                OR lon LIKE ?
                OR kompetens LIKE ?
            `;
        let res = await db.query(sql, [
            `%${what}%`,
            `%${what}%`,
            `%${what}%`,
            `%${what}%`,
            `%${what}%`,
            `%${what}%`,
            `%${what}%`
        ]);

        db.end();
        return res;
    }

    async updateSalary(akronym, lon) {
        const db = await mysql.createConnection(config);

        let sql = `
            UPDATE larare
            SET lon = ?
            WHERE akronym = ?
            `;
        let res = await db.query(sql, [lon, akronym]);

        db.end();
        return res;
    }
}
module.exports = Teacher;
