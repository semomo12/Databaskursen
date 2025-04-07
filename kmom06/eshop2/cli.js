const mysql = require('mysql');
const readline = require('readline');
const config = require("./config/db/eshop.json");

const util = require('util');
const connection = mysql.createConnection(config);
const queryAsync = util.promisify(connection.query).bind(connection);

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

connection.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database');

    showMenu();
});

function exitProgram(code) {
    code = code || 0;
    connection.end();
    rl.close();
    console.info("Exiting with status code " + code);
    process.exit(code);
}


function showMenu() {
    console.log("Welcome to the eSHOP");
    console.log('\nmenu:');
    console.log('1. about');
    console.log('2. log <number>');
    console.log('3. product');
    console.log('4. shelf');
    console.log('5. inv');
    console.log('6. inv <str>');
    console.log('7. invadd <productid> <shelf> <number>');
    console.log('8. invdel <productid> <shelf> <number>');
    console.log('9. order <search>.');
    console.log('10. picklist <orderid>');
    console.log('11. ship <orderid>');
    console.log('12. orderstatus <orderid>');
    console.log('\n13. help/menu');
    console.log('14. exit');
    rl.question('\nEnter your choice: ', handleChoice);
}


function handleChoice(choice) {
    const args = choice.split(' ');
    let id = 0;
    let delargs=0;
    let logNumber=0;
    let log="";

    let addArgs=0;

    choice = args[0];

    switch (choice) {
        case 'about':
            log="About: This program is created by Seyed Mostafa Mohseni";
            console.log(log);
            showMenu();
            break;
        case 'log':
            logNumber = parseInt(args[1]);

            displayLog(logNumber);
            break;
        case 'product':
            displayProducts();
            break;
        case 'shelf':
            displayShelfLocations();
            break;
        case 'inv':
            if (args.length === 0) {
                displayInventory();
            } else {
                const filterstring = args.slice(1).join(' ');

                filterInventory(filterstring);
            }
            break;
        case 'invadd':
            addArgs = args.slice(1);

            addProductToStock(addArgs);
            break;
        case 'invdel':
            delargs = args.slice(1);

            removeProductfromStock(delargs);
            break;
        case 'order':
            if (args.length === 1) {
                getOrders();
            } else if (args.length > 1 && args[1]) {
                const filter = args.slice(1).join(' ');

                displayOrderId(filter);
            }
            break;
        case 'picklist':
            id = args.slice(1);
            pickList(id);
            break;
        case 'ship':
            id = args.slice(1);
            updateOrderStatusToShipped(id);
            break;
        case 'orderstatus':
            id = args.slice(1);
            getOrderStatus(id);
            break;
        case 'menu':
        case 'help'  :
            showMenu();
            break;
        case 'exit':
        case 'q'  :
            exitProgram();
            break;
        default:
            console.log('Invalid choice. Please enter a valid command.');
            showMenu();
            break;
    }
}



async function displayLog(logNumber) {
    try {
        const results = await queryAsync('CALL p_display_log(?)', [logNumber]);

        console.log(`Displaying last ${logNumber} log entries:`);
        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error fetching log:', error);
        return;
    }
}

async function displayProducts() {
    try {
        const results = await queryAsync('CALL p_display_products()');

        console.log('Displaying products:');
        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error fetching products:', error);
        return;
    }
}


async function displayShelfLocations() {
    try {
        const results = await queryAsync('CALL p_display_shelf_locations()');

        console.log('Displaying shelf locations:');
        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error fetching shelf locations:', error);
        return;
    }
}

async function displayInventory() {
    try {
        const results = await queryAsync('CALL p_display_inventory()');

        console.log('Displaying stock:');
        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error fetching stock:', error);
        return;
    }
}

async function filterInventory(filterstring) {
    try {
        const results = await queryAsync('CALL p_filter_stock(?)', [filterstring]);

        const resultSet = results[0];

        if (resultSet.length === 0) {
            console.log('No matching items found.');
            showMenu();
            return;
        }

        console.log(`Filtered stock (Filter: ${filterstring}):`);
        console.table(resultSet);
        showMenu();
    } catch (error) {
        console.error('Error fetching filtered stock:', error);
        return;
    }
}


function addProductToStock(args) {
    const [productId, shelf, quantity] = args;

    connection.query('CALL p_add_product_to_stock(?, ?, ?)',
        [productId, shelf, quantity], (error) => {
            if (error) {
                console.error('Error adding product to inventory:', error);
                return;
            }
            console.log(`Added ${quantity} of product ${productId} to shelf ${shelf}`);
            showMenu();
        });
}

function removeProductfromStock(args) {
    const [productId, shelf, quantity] = args;

    connection.query(
        'CALL p_remove_product_from_stock(?, ?, ?)',
        [productId, shelf, quantity],
        (error) => {
            if (error) {
                console.error('Error removing product from inventory:', error);
                return;
            }
            console.log(`Removed ${quantity} of product ${productId} from shelf ${shelf}`);
            showMenu();
        });
}

async function displayOrderId(filter) {
    try {
        const results = await queryAsync('CALL p_show_order_with_totals_custom(?)', [filter]);

        console.log(`Displaying order with ID ${filter}:`);
        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error fetching order information:', error);
        showMenu();
    }
}

async function getOrders() {
    try {
        const results = await queryAsync('CALL p_show_order_with_totals()');

        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error fetching order information:', error);
        showMenu();
    }
}



async function updateOrderStatusToShipped(logNumber) {
    try {
        const results = await queryAsync('CALL p_update_order_status_to_shipped(?)', [logNumber]);

        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error updating order status:', error);
        return;
    }
}

async function pickList(logNumber) {
    try {
        const results = await queryAsync('CALL p_plocklist(?)', [logNumber]);

        console.log(`Generating picklist for order with ID ${logNumber}:`);
        console.table(results[0]);
        showMenu();
    } catch (error) {
        console.error('Error generating picklist:', error);
        return;
    }
}

async function getOrderStatus(logNumber) {
    try {
        const results = await queryAsync('CALL p_get_order_status(?)', [logNumber]);

        if (results[0].length > 0) {
            console.log(`Displaying order status for order with ID ${logNumber}:`);
            console.table(results[0]);
        } else {
            console.log('No order found with the given ID');
        }

        showMenu();
    } catch (error) {
        console.error('Error fetching order status:', error);
        showMenu();
    }
}
