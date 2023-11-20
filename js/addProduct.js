// addProduct.js
const form = document.querySelector("form");

// Event listener for the form submission
form.addEventListener("submit", function(e) {
    e.preventDefault(); // Prevent the default form submission behavior

    //Elements
    const productNameEL = document.querySelector("#product_name");
    const productIdEL = document.querySelector("#product_id");
    const productCategoryEL = document.querySelector("#category");
    const productQuantityEL = document.querySelector("#quantity");
    const productImageEL = document.querySelector("#image");
    const productPriceEL = document.querySelector("#price");
    const productClassEL = document.querySelector("#product_class");
    const productSubClassEL = document.querySelector("#product_subclass");

    //Values
    const name = productNameEL.value;
    const id = productIdEL.value;
    let category = productCategoryEL.value.toLowerCase();
    const price = productPriceEL.value;
    const productClass = productClassEL.value;
    const productSubclass = productSubClassEL.value;
    const quantity = productQuantityEL.value;
    const image = productImageEL.value;

    if (category === "personal care") category = "personal_care";
    if (category === "namkeen & snacks") category = "snacks";
    if (category === "instant food") category = "instant_food";
    console.log(category);

    // Create a data object to send to the server
    const productData = {
        id: id,
        name: name,
        category: category,
        price: price,
        class: productClass,
        subclass: productSubclass,
        quantity: quantity,
        image: image,
    };

    console.log(productData);
    // Send the data to the server for database storage
    // fetch("http://localhost:8800/addProduct", {
    fetch("https://grabbodbmsproject-priansh24.onrender.com/addProduct", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(productData),
        })
        .then((response) => response.json())
        .then((data) => {
            // Handle the response from the server (e.g., display a success message)
            alert(data.message);
            form.reset(); // Assuming the server sends a JSON response with a "message" property
        })
        .catch((error) => {
            console.error("Error:", error.message);
        });
});