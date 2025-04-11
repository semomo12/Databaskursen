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
    let sql = `CALL p_get_products();`;

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
    const eventInstanceId = await generateEventID(id);

    const sql = 'CALL p_add_log(?, ?, ?)';

    const result = await db.query(sql, [ eventInstanceId, eventDescription, eventDate]);

    return result;
}




function getProductIDByProductName(productName) {
    return new Promise((resolve, reject) => {
        const query = 'SELECT product_id FROM product WHERE product_name = ?';

        db.query(query, [productName], (error, results) => {
            if (error) {
                reject(error);
            } else {
                const productId = results.length > 0 ? results[0].product_id : null;

                resolve(productId);
            }
        });
    });
}

// get all customers
async function getCustomers() {
    let sql = `CALL p_show_all_customers();`;
    let res = await db.query(sql);

    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

//get all orders
async function getOrders() {
    let sql = `CALL p_show_orders_with_totals();`;

    let res = await db.query(sql);

    return res[0];
}


async function getCustomerById(customerId) {
    const sql = 'CALL p_show_customer_by_id(?)';

    let res;

    res = await db.query(sql, [customerId]);
    return res[0];
}

async function createOrder(ORDERDATE, TotalPrice, CustomerID, status) {
    let sql = `CALL p_insert_order(?, ?, ?, ?);`;

    let res = await db.query(sql, [ORDERDATE, TotalPrice, CustomerID, status]);

    return res;
}
async function getProductDetails(customerId) {
    const sql = 'CALL p_show_order_details(?);';

    let res;

    res = await db.query(sql, [customerId]);
    return res[0];
}

async function insertOrderItem(orderId, productId, price, itemCount) {
    const result = await db.query(
        'INSERT INTO order_item (order_id, product_id, price, item_count) VALUES (?, ?, ?, ?)',
        [orderId, productId, price, itemCount]
    );

    return result;
}


async function updateOrderStatus(id) {
    let sql = `CALL p_change_order_status(?);`;

    await db.query(sql, [id]);

    return 0;
}

async function softDeleteOrder(id) {
    let sql = ` CALL p_soft_delete_order(?);`;

    await db.query(sql, [id]);

    return 0;
}

async function getundercategory(id) {
    let sql = `CALL p_get_products_by_category(?);`;

    let res = await db.query(sql, [id]);

    return res[0];
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
    getProductIDByProductName: getProductIDByProductName,
    getCustomers: getCustomers,
    getOrders: getOrders,
    getCustomerById: getCustomerById,
    createOrder: createOrder,
    getProductDetails: getProductDetails,
    insertOrderItem: insertOrderItem,
    updateOrderStatus: updateOrderStatus,
    softDeleteOrder: softDeleteOrder,
    getundercategory: getundercategory,
};
