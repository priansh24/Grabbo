let categoryDropdown = document.getElementById("category");
const productDropdown = document.getElementById("product");
const form = document.querySelector("form");

if (categoryDropdown) {
  categoryDropdown.addEventListener("change", fetchProducts);
} else {
  console.error("No element found with ID 'category'");
}

function fetchProducts() {
  let category = categoryDropdown.value.toLowerCase();

  // Adjust category names as needed
  if (category === "instant food") category = "instant_food";
  if (category === "personal care") category = "personal_care";
  if (category === "namkeen & snacks") category = "snacks";
  try {
    // Fetch products from the backend based on the selected category
    fetch(`http://localhost:8800/products/${category}`)
      // fetch(
      //         `https://grabbodbmsproject-priansh24.onrender.com/products/${category}`
      //     )
      .then((response) => response.json())
      .then((data) => {
        // Populate product dropdown based on the fetched products
        productDropdown.innerHTML =
          '<option value="" selected disabled>Select Product</option>';
        // console.log(data.json());
        data.forEach((productName) => {
          // console.log(productName);
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

function confirmDelete(productData) {
  const result = confirm("Are you sure you want to delete this item?");
  if (result) {
    fetch("http://localhost:8800/deleteProduct", {
      //   fetch("https://grabbodbmsproject-priansh24.onrender.com/deleteProduct", {
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
  }
}

form.addEventListener("submit", function (e) {
  e.preventDefault();
  const category = categoryDropdown.value;
  const productName = productDropdown.value;
  const productData = {
    name: productName,
    category: category,
  };
  confirmDelete(productData);
});
