let categoryDropdown = document.getElementById("category");
let updateDropdown = document.getElementById("update");
const form = document.querySelector("form");
const productDropdown = document.getElementById("product");
let productData;
if (categoryDropdown) {
    categoryDropdown.addEventListener("change", fetchProducts);
} else {
    console.error("No element found with ID 'category'");
}

function getCategory() {
    let category = categoryDropdown.value.toLowerCase();

    // Adjust category names as needed
    if (category === "instant food") category = "instant_food";
    if (category === "personal care") category = "personal_care";
    if (category === "namkeen & snacks") category = "snacks";

    return category;
}

function fetchProducts() {
    let category = getCategory();
    // let category = categoryDropdown.value.toLowerCase();

    // Adjust category names as needed
    // if (category === "instant food") category = "instant_food";
    // if (category === "personal care") category = "personal_care";
    // if (category === "namkeen & snacks") category = "snacks";
    try {
        // Fetch products from the backend based on the selected category
        fetch(
                `http://localhost:8800/products/${category}`
                // `https://grabbodbmsproject-priansh24.onrender.com/products/${category}`
            )
            .then((response) => response.json())
            .then((data) => {
                // Populate product dropdown based on the fetched products
                productDropdown.innerHTML =
                    '<option value="" selected disabled>Select a Product</option>';
                data.forEach((productName) => {
                    const option = document.createElement("option");
                    option.value = productName;
                    option.textContent = productName;
                    productDropdown.appendChild(option);
                });
            })
            .catch((error) => {
                console.error("Error fetching products:", error);
            });
    } catch (error) {
        console.error("Error fetching products:", error);
    }
}

function fetchProductsUsingName() {
    // Fetch products from the backend based on the selected Product's name
    const productName = productDropdown.value;
    let category = getCategory();

    // const productName = encodeURIComponent(productDropdown.value);
    fetch(
            // `https://grabbodbmsproject-priansh24.onrender.com/products/${category}/${productName}`
            `http://localhost:8800/products/${category}/${productName}`
        )
        .then((response) => response.json())
        .then((data) => {
            productData = data[0];
            productData.category = category;
        })
        .catch((error) => {
            console.error("Error fetching products:", error);
        });
}

form.addEventListener("submit", function(e) {
    e.preventDefault();
    const productName = productDropdown.value;
    const update = updateDropdown.value;
    console.log(productData);
    // const category = categoryDropdown.value;

    console.log(productName, update);
    if (update === "price") {
        const priceVal = Number(
            prompt(`Current Price: ₹${productData.price}\nNew Price:`)
        );
        if (priceVal !== null && priceVal !== undefined && priceVal > 0) {
            productData.price = priceVal;
            fetch(
                    // "https://grabbodbmsproject-priansh24.onrender.com/updateProductPrice",
                    "http://localhost:8800/updateProductPrice", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                        },
                        body: JSON.stringify(productData),
                    }
                )
                .then((response) => response.json())
                .then((data) => {
                    console.log(data);
                    // Handle the response from the server (e.g., display a success message)
                    alert(data.message);
                    form.reset(); // Assuming the server sends a JSON response with a "message" property
                })
                .catch((error) => {
                    console.error("Error:", error.message);
                });
        }
    }

    if (update === "quantity") {
        const newQuantity = Number(
            prompt(`Old Quantity: ${productData.quantity} \nNew Quantity:`)
        );
        console.log(newQuantity);
        if (newQuantity !== null && newQuantity !== undefined && newQuantity >= 0) {
            productData.quantity = newQuantity;
            fetch(
                "http://localhost:8800/updateProductQuantity",
                // "https://grabbodbmsproject-priansh24.onrender.com/updateProductQuantity", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(productData),
            }
        )
        .then((response) => response.json())
            .then((data) => {
                // Handle the response from the server (e.g., display a success message)
                alert(data.message);
                form.reset(); // Assuming the server sends a JSON response with a "message" property
            })
            .catch((error) => {
                console.error("Error:", error.message);
            });
    } else {
        alert("Error: Invalid Data Entry");
    }
}
});