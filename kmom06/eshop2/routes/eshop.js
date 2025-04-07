// routes/eshop.js
const express = require("express");
const router = express.Router();

const bodyParser = require("body-parser");
const eshop = require("../src/eshop.js");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
router.use(bodyParser.urlencoded({ extended: false }));

router.get("/index", (req, res) => {
    let data = {
        title: "Welcome | eShop",
    };

    res.render("eshop/partials/index", data);
});

router.get("/about", async (req, res) => {
    let data = {
        title: "About | eShop",
    };

    res.render("eshop/partials/about", data);
});

router.get("/category", async (req, res) => {
    let data = {
        title: "Category | eShop",
    };

    data.res = await eshop.getCategories();
    console.log(data.res);
    res.render("eshop/category/index", data);
});

router.get("/category/create", async (req, res) => {
    let data = {
        title: "Create a category | eShop",
    };

    res.render("eshop/category/create", data);
});

router.get("/category/edit/:id&:edited", async (req, res) => {
    let id = req.params.id;
    let edited = req.params.edited;
    let data = {
        title: "Edit category balance | eShop",
    };

    if (edited) {
        data.edited = true;
    }
    data.res = await eshop.getCategory(id);
    res.render("eshop/category/edit", data);
});

router.get("/category/edit/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: "Edit category balance | eShop",
        edited: false,
    };

    data.res = await eshop.getCategory(id);

    res.render("eshop/category/edit", data);
});

router.get("/category/delete/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: "Delete category | eShop",
    };

    data.res = await eshop.getCategory(id);
    res.render("eshop/category/delete", data);
});

router.post("/category/create", urlencodedParser, async (req, res) => {
    await eshop.createCategory(req.body.name);
    res.redirect(`/eshop/category`);
});

router.post("/category/edit", urlencodedParser, async (req, res) => {
    await eshop.editCategory(req.body.id, req.body.name);
    res.redirect(`/eshop/category/edit/${req.body.id}&edited=true`);
});

router.post("/category/delete", urlencodedParser, async (req, res) => {
    let result = await eshop.deleteCategory(req.body.id);

    if (result.serverStatus !== 2) {
        console.info("category not found.");
    }
    res.redirect(`/eshop/category`);
});

router.get("/product", async (req, res) => {
    let data = {
        title: "Products | eShop",
    };

    data.res = await eshop.getProducts();

    res.render("eshop/product/index", data);
});

router.get("/product/create", async (req, res) => {
    let data = {
        title: "Create a product | eShop",
    };

    res.render("eshop/product/create", data);
});

router.get("/product/edit/:id&:edited", async (req, res) => {
    let id = req.params.id;

    let edited = req.params.edited;

    let data = {
        title: "Edit product balance | eShop",
    };

    if (edited) {
        data.edited = true;
    }

    data.res = await eshop.getProduct(id);

    res.render("eshop/product/edit", data);
});

router.get("/product/edit/:id", async (req, res) => {
    let id = req.params.id;

    console.log("Product ID:", id);
    let data = {
        title: "Edit product balance | eShop",
        edited: false,
    };
    // if (!data.res) {
    //     return res.status(404).send('Product not found');
    // }

    data.res = await eshop.getProduct(id);
    res.render("eshop/product/edit", data);
});

router.get("/product/delete/:id", async (req, res) => {
    let id = req.params.id;

    console.log("Product ID:", id);
    let data = {
        title: "Delete product | eShop",
    };

    data.res = await eshop.getProduct(id);
    if (!data.res) {
        return res.status(404).send('Product not found');
    }

    res.render("eshop/product/delete", data);
});

router.post("/product/create", urlencodedParser, async (req, res) => {
    try {
        const date = new Date();
        const formattedDate = eshop.formatDate(date);
        let eventDescription = `A new product was added with product ID '${req.body.productId}'`;
        let { name, description, price, stock } = req.body;

        const productId = await eshop.createProduct(name, description, price, stock);

        await eshop.addEventLog(productId, eventDescription, formattedDate);

        res.redirect(`/eshop/product`);
    } catch (error) {
        console.error("Error:", error);
        res.status(500).send("An error occurred while creating the product.");
    }
});

router.post("/product/edit", urlencodedParser, async (req, res) => {
    let { id, name, description, price, stock } = req.body;
    const date = new Date();
    const formattedDate = eshop.formatDate(date);
    let eventDescription = `En uppdatering har genomförts på produkten med ID '${req.body.id}'`;

    await eshop.editProduct(id, name, description, price, stock);

    await eshop.addEventLog(req.body.id, eventDescription, formattedDate);
    res.redirect(`/eshop/product/edit/${req.body.id}&edited=true`);
});

router.post("/product/delete", urlencodedParser, async (req, res) => {
    let result = await eshop.deleteProduct(req.body.id);

    console.log("Product ID:", req.body.id);

    const date = new Date();
    const formattedDate = eshop.formatDate(date);
    let eventDescription = `en borttagning har genomförts på produkt ID '${req.body.id}'`;

    await eshop.addEventLog(req.body.id, eventDescription, formattedDate);
    if (result.serverStatus !== 2) {
        console.info("Product not found.");
    }
    res.redirect("/eshop/product");
});



////////////////////////777


router.get("/order", async (req, res) => {
    let data = {
        title: "Order | eShop",
    };

    data.res = await eshop.getOrders();
    console.log(data.res);
    res.render("eshop/order/order", data);
});

router.get("/customer", async (req, res) => {
    let data = {
        title: "customer | eShop",
    };

    data.res = await eshop.getCustomers();
    console.log(data.res);
    res.render("eshop/customer/customer", data);
});


router.get("/show/pro/:customer_id", async (req, res) => {
    const customerId = req.params.customer_id; // Retrieve customer_id from route parameter

    try {
        let data = {
            title: "Show | eShop",
        };

        // Your logic to fetch customer details using the customerId
        // For example:
        data.res = await eshop.getCustomerById(customerId); // Assuming you have a Customer model
        res.render("eshop/customer/customerinfo", data);
    } catch (error) {
        console.error("Error fetching customer details:", error);
        res.status(500).send("Internal Server Error");
    }
});


router.get('/order/create/:id', async (req, res) => {
    try {
        // Extract data from the request body
        const CustomerID  = req.params.id; // Use req.params

        //to get the  CustomerID from the URL parameter
        const date = new Date();
        const formattedDate = eshop.formatDate(date);

        const status = "Created";
        const TotalPrice = 0;

        // Call function to create the order in the database
        await eshop.createOrder(formattedDate, TotalPrice,  CustomerID, status);

        // Redirect to a success page or render a success message
        res.redirect('/eshop/order'); // Corrected the URL for redirect
    } catch (error) {
        console.error("Error creating order:", error);
        res.status(500).send("Internal Server Error");
    }
});

router.get('/order/show/:id');

router.get("/order/show/:order_id", async (req, res) => {
    try {
        const orderId = req.params.order_id;

        const data = {
            title: "Add product | eShop",
            orderId: orderId // Include orderId in the data object
        };

        data.res = await eshop.getProductDetails(orderId); // Assuming you have a
        // function to fetch order details
        res.render("eshop/order/addproduct", data); // Pass data object to render function
    } catch (error) {
        console.error("Error fetching order details:", error);
        res.status(500).send("Internal Server Error");
    }
});


router.get("/order/addtocart/:order_id", async (req, res) => {
    try {
        const orderId = req.params.order_id;

        const data = {
            title: "Add product | eShop",
            orderId: orderId
        };

        data.res = await eshop.getProducts(); // Assuming you have a function to fetch products
        res.render("eshop/order/addtocart", data);
    } catch (error) {
        console.error("Error fetching order details:", error);
        res.status(500).send("Internal Server Error");
    }
});


router.post('/order/show/create/:order_id', async (req, res) => {
    const orderId = req.params.order_id;

    const { product_id: pID, price, quantity } = req.body;

    try {
        await eshop.insertOrderItem(orderId, pID, price, quantity);

        res.redirect(`/eshop/order`);
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Failed to add product to order.');
    }
});

router.get('/order/status/:order_id', async (req, res) => {
    try {
        const orderId = req.params.order_id;

        const data = {
            title: "Add product | eShop",
        };

        await eshop.updateOrderStatus(orderId);

        res.render(`eshop/order/thankyou`, data);
    } catch (error) {
        console.error('Error fetching order status:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/order/delete/:order_id', async (req, res) => {
    const orderId = req.params.order_id;

    try {
        await eshop.softDeleteOrder(orderId);
        res.redirect("/eshop/order");
    } catch (error) {
        console.error('Error deleting product from order:', error);
        res.status(500).send('Failed to delete product from order.');
    }
});

router.get('/products/under/:category_id', async (req, res) => {
    const categoryId = req.params.category_id;
    const data = {
        title: "Add product | eShop",
    };

    data.res = await eshop.getundercategory(categoryId);

    res.render('eshop/category/categoryproduct', data);
});














module.exports = router;  //exportera router
