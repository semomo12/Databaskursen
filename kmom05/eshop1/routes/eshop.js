// routes/eshop.js
const express = require("express");
const router = express.Router();

const bodyParser = require("body-parser");
const eshop = require("../src/eshop.js");
const urlencodedParser = bodyParser.urlencoded({ extended: false });


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

    if (!name || name.trim() === '' && !description || description.trim() === '') {
        name = '';
        description = '';
    }

    if ((stock === '' || stock === undefined || isNaN(stock)) &&
    (price === '' || price === undefined || isNaN(price))) {
        stock = 0;
        price = 0.0;
    }

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


module.exports = router;  //exportera router
