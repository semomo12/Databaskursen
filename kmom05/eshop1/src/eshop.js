//mina funktioner
const mysql = require("promise-mysql");
const config = require("../config/db/eshop.json");
const { v4: uuidv4 } = require('uuid');


let db;

(async function () {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();


async function generateEventID() {
    return uuidv4();
}




async function createCategory(name) {
    let sql = `CALL p_create_category(?);`;

    let res = await db.query(sql, [name]);

    return res;
}


async function getCategories() {
    let sql = `CALL p_get_categories();`;

    let res = await db.query(sql);

    return res[0];
}


async function getCategory(id) {
    let sql = `CALL p_get_category(?);`;

    let res = await db.query(sql, [id]);

    return res[0][0];
}


async function editCategory(id, name) {
    let sql = `CALL p_edit_category(?, ?);`;

    let res = await db.query(sql, [id, name]);


    return res;
}



async function deleteCategory(id) {
    let sql = `CALL p_delete_category(?);`;

    let res = await db.query(sql, [id]);

    console.info(`SQL: ${sql} got ${res.length} rows.`);
    return res;
}



async function createProduct(name, description, price, stock) {
    let sql = `CALL p_add_product(?, ?, ?, ?);`;

    await db.query(sql, [name, description, price, stock]);

    let productIdQuery = 'SELECT @productId AS productId;';

    let productIdResult = await db.query(productIdQuery);

    console.log('productIdResult:', productIdResult[0].productId);

    return productIdResult[0].productId;
}



async function getProducts() {
    let sql = `CALL p_get_products;`;

    let res = await db.query(sql);

    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


async function getProduct(id) {
    let sql = `CALL p_get_product(?);`;

    let res = await db.query(sql, [id]);

    console.log(res); // debug

    if (res[0].length > 0) {
        return res[0][0];
    } else {
        return null;
    }
}


async function editProduct(id, name, description, price, stock) {
    if ((!name || name.trim() === '') && (!description || description.trim() === '')) {
        name = '';
        description = '';
    }

    if ((stock === '' || stock === undefined || isNaN(stock)) &&
    (price === '' || price === undefined || isNaN(price))) {
        stock = 0;
        price = 0.0;
    }
    let sql = `CALL p_edit_product(?, ?, ?, ?, ?);`;

    let res = await db.query(sql, [id, name, description, price, stock]);

    return res;
}



async function deleteProduct(id) {
    let sql = `CALL p_delete_product(?);`;

    let res = await db.query(sql, [id]);

    console.info(`SQL: ${sql} got ${res.length} rows.`);
    return res;
}



async function addEventLog(id, eventDescription, eventDate) {
    // Generate Event_instance_id
    const eventInstanceId = await generateEventID(id);

    const sql = 'CALL p_add_log(?, ?, ?)';

    const result = await db.query(sql, [ eventInstanceId, eventDescription, eventDate]);

    return result;
}



function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    const hours = String(date.getHours()).padStart(2, "0");
    const minutes = String(date.getMinutes()).padStart(2, "0");
    const seconds = String(date.getSeconds()).padStart(2, "0");

    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}


module.exports = {
    createCategory: createCategory,
    getCategories: getCategories,
    getCategory: getCategory,
    editCategory: editCategory,
    deleteCategory: deleteCategory,
    createProduct: createProduct,
    getProducts: getProducts,
    getProduct: getProduct,
    editProduct: editProduct,
    deleteProduct: deleteProduct,
    addEventLog: addEventLog,
    formatDate: formatDate,
};
