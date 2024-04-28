const contentSection = document.querySelector(".content-section");
const searchInput = document.querySelector(".search-input");
const resultsContainer = document.getElementById("resultsContainer");
const searchContainer = document.querySelector(".search-container");

const navbarBrandSec = document.querySelector(".navbar-brand");
const homeButton = document.querySelector(".home-button");
const footerTitleButton = document.querySelector(".title-name");
const aboutUsButton = document.querySelector(".aboutUs-button");
const myCartButton = document.querySelector(".myCart-button");

const snacks = document.querySelector(".snacks");
const instantFood = document.querySelector(".instantFood");
const dairy = document.querySelector(".dairy");
const categoryButtons = document.querySelectorAll(".category-button");

const getRandomNumber = function (min, max) {
  const randomDecimal = Math.random();
  const randomInRange = randomDecimal * (max - min) + min;
  return Math.floor(randomInRange);
};

const generateQuote = function () {
  const quotes = [
    "I'm not saying Maggi is the answer to all of life's problems, but it's definitely the answer to most of them.",
    "They say you can't buy happiness, but you can buy Maggi, and that's pretty much the same thing.",
    "There are two types of people in this world: those who love Jim Jams and those who haven't tried them yet.",
    "My relationship status: In a committed and steamy relationship with ramen.",
  ];
  const randomNum = getRandomNumber(0, quotes.length);
  //   return quotes[randomNum];
  const quote = document.querySelector(".quote");
  quote.textContent = quotes[randomNum];
};

const generateAboutUs = function (e) {
  e.preventDefault();
  const html = `<div class="about-us">
  <div class="section__title">
      <h2 class="section__description">Why Built this?</h2>
      <h5 class="section__header">
      Ever been excited to grab something at Grabbo, only to be let down when it's not there? Or thought they wouldn't have what you wanted, only to find out they did? It's a bummer, especially when Grabbo is a trek from the hostels. So, we had this idea – what if there was a way for you to check if Grabbo has what you need before making the journey? That way, you can save yourself the hassle and decide if it's worth the trip to the arcade. Cool, right? </h5>
  </div>

  <div class="section__title">
      <h2 class="section__description team-title">Meet the Team</h2>
  </div>
  <div class="about-the-team">
      <img src="images/Priyansh2.jpg" data-src="img/digital.jpg" alt="Priyansh" class="member__img1 lazy-img" />
      <div class="member-description1">
          <h5 class="member-name">Priyansh Singhal</h5>
          <p class="member-paragraph">
          </p>
      </div>

      <div class="member-description2">
          <h5 class="member-name">Yagay Khatri</h5>
          <p class="member-paragraph">
          </p>
      </div>
      <img src="images/Yagay.jpg" data-src="img/grow.jpg" alt="Yagay" class="member__img2 lazy-img" />
  </div> -->
</div>`;

  contentSection.innerHTML = html;
};

aboutUsButton.addEventListener("click", generateAboutUs);

// const quote = document.querySelector(".quote");
// quote.textContent = generateQuote();
generateQuote();
// init();
const generateHomePage = function (e) {
  if (e) e.preventDefault();
  const html = `<div class="search-container">
  <div class = "heading-container">
  <div class="heading">
        <h3 class="quote">
        </h3>
        </div>
    <div class="search-bar-section">

    <form class="form search-bar">
                            <button>
                                <svg width="17" height="16" fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                    role="img"
                                    aria-labelledby="search">
                                    <path
                                        d="M7.667 12.667A5.333 5.333 0 107.667 2a5.333 5.333 0 000 10.667zM14.334 14l-2.9-2.9"
                                        stroke="currentColor"
                                        stroke-width="1.333"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"></path>
                                </svg>
                            </button>
                            <input class="input search-input"
                                placeholder="Search for your favourite item"
                                required type="text">
                            <button class="reset" type="reset">
                            </button>
                        </form>
                        </div>
                        </div>
                        </div>`;
  contentSection.innerHTML = html;
};

const init = function () {
  generateHomePage();
  //   generateQuote();
  setUpSearchBar();
};

homeButton.addEventListener("click", init);
// navbarBrandSec.addEventListener("click", init);
footerTitleButton.addEventListener("click", init);

const generateProductsOnPage = function (category) {
  // Fetch product data from the server
  fetch(`http://localhost:8800/student/products/${category}`)
    // fetch(
    //         `https://grabbodbmsproject-priansh24.onrender.com/student/products/${category}`
    //     )
    .then((response) => response.json())
    .then((data) => {
      // Generate product cards on the page
      displayResults(data);
    })
    .catch((error) => {
      console.error("Error fetching data:", error);
    });
};

categoryButtons.forEach((button) => {
  button.addEventListener("click", () => {
    const category = button.dataset.category;
    generateProductsOnPage(category);
  });
});

// Dropdown functionality
const toggleDropdownButton = document.querySelector(".dropdown-toggle");
const dropdownMenu = document.querySelector(".dropdown-menu");
let isDropdownVisible = false;

// Function to toggle the dropdown
function toggleDropdown() {
  if (isDropdownVisible) {
    dropdownMenu.style.display = "none";
  } else {
    dropdownMenu.style.display = "block";
  }
  isDropdownVisible = !isDropdownVisible;
}

// Toggle the dropdown when clicking the "Categories" button
toggleDropdownButton.addEventListener("click", function (e) {
  e.stopPropagation(); // Prevent the parent menu item from following the link
  toggleDropdown();
});

// Hide the dropdown when clicking any dropdown item or the "Categories" button again
dropdownMenu.addEventListener("click", function (e) {
  if (e.target.classList.contains("dropdown-item")) {
    toggleDropdown();
  }
});

document.addEventListener("click", function (e) {
  if (e.target !== toggleDropdownButton && isDropdownVisible) {
    toggleDropdown();
  }
});

// Search Bar Results Section
const headingElement = document.querySelector(".heading");
const searchBarSection = contentSection.querySelector(".search-bar-section");

const setUpSearchBar = function (e) {
  if (e) e.preventDefault();
  searchInput.addEventListener("input", function () {
    const searchTerm = searchInput.value.trim();
    if (searchTerm !== "") {
      // Fetch results from the backend
      //     fetch(
      //             `https://grabbodbmsproject-priansh24.onrender.com/search?term=${encodeURIComponent(
      //   searchTerm
      // )}`
      //         )
      fetch(
        `http://localhost:8800/search?term=${encodeURIComponent(searchTerm)}`
      )
        .then((response) => response.json())
        .then((data) => {
          displayResults(data);
        })
        .catch((error) => console.error("Error fetching results:", error));
    } else {
      // If the search term is empty, clear the results
      resultsContainer.innerHTML = "";
    }
  });
};

const displayResults = function (results) {
  if (headingElement) {
    // Remove the element with the class name "heading"
    headingElement.remove();
    searchContainer.style.top = "-15%";
  }

  // Clear previous results
  resultsContainer.innerHTML = "";

  if (results.length == 0) {
    contentSection.insertBefore(headingElement, searchBarSection);
    searchContainer.style.top = "-8%";
  }

  // Insert new results
  const productsHtml = results
    .map(
      (product) => `
      <div class="card">
        <div class="card-image-container">
          <img src="${product.url}" alt="${product.name}" class="card-image">
        </div>
        <p class="card-title">${product.name}</p>
        <p class="card-des">
          Quantity:&nbsp${product.quantity}
        </p>
        <button class="card-btn"  data-product='${JSON.stringify(product)}'> ₹${
        product.price
      }</button>
      </div>
    `
    )
    .join("");

  // Insert the generated HTML inside the "resultsContainer" div
  resultsContainer.innerHTML = `
  <div class="show-products">
    <div class="products">${productsHtml}</div>
  </div>
`;
  document.querySelectorAll(".card-btn").forEach((button) => {
    button.addEventListener("click", () => {
      button.textContent = "Added to Cart";
      const product = JSON.parse(button.getAttribute("data-product"));
      // Retrieve existing cart items from local storage
      const cartItems = JSON.parse(localStorage.getItem("cart")) || [];
      product.total = product.quantity;
      const existingItemIndex = cartItems.findIndex(
        (item) => item.id === product.id
      );

      if (existingItemIndex !== -1) {
        if (cartItems[existingItemIndex].quantity < product.quantity) {
          // If the item is already in the cart, increment its quantity
          cartItems[existingItemIndex].quantity++;
        } else {
          cartItems[existingItemIndex].quantity;
        }
      } else {
        // If the item is not in the cart, add it with quantity 1
        product.quantity = 1;
        cartItems.push(product);
      }

      // Store the updated cart items back to local storage
      localStorage.setItem("cart", JSON.stringify(cartItems));
    });
  });
};

setUpSearchBar();
