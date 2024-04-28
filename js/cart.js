document.addEventListener("DOMContentLoaded", function () {
  const cartItemsContainer = document.getElementById("cart-items");
  const totalPriceSpan = document.getElementById("total-price");
  const clearCartButton = document.getElementById("clear-cart-btn");

  // Retrieve cart items from local storage
  let cartItems = JSON.parse(localStorage.getItem("cart")) || [];

  // Display cart items on the page
  function displayCartItems() {
    cartItemsContainer.innerHTML = ""; // Clear existing items
    let totalPrice = 0;
    cartItems.forEach((item) => {
      const itemElement = document.createElement("div");
      itemElement.classList.add("cart-item");
      itemElement.innerHTML = `
            <img src="${item.url}" alt = "${item.name}" class = "img">
            <div class="textBox">
                <div class="textContent">
                    <p class="itemName">${item.name}</p>
                    <p class="cart-item-price itemPrice">₹${
                      item.price * item.quantity.toFixed(2)
                    }</p>
                </div>
                <div class="cart-item-quantity">
                    <button class="decrease-quantity-btn" data-item-id="${
                      item.id
                    }">-</button>

                    <input type="number" class = "inputQuantity" id="quantity-${
                      item.id
                    }" value= "${item.quantity}" min="1" readonly>
                        <button class="increase-quantity-btn" data-item-id="${
                          item.id
                        }">+</button>
                        <button class="remove-item-btn" data-item-id="${
                          item.id
                        }"><i class="fa-solid fa-trash"></i></button>

                    </div>
            `;
      cartItemsContainer.appendChild(itemElement);
      totalPrice += item.price * item.quantity;
    });
    totalPriceSpan.textContent = `₹${totalPrice.toFixed(2)}`;
  }

  // Initial display of cart items
  displayCartItems();

  // Clear cart button click event
  clearCartButton.addEventListener("click", function () {
    // Clear local storage
    localStorage.clear();
    // Clear cart items array
    cartItems = [];
    // Update UI
    displayCartItems();
  });

  // Quantity increase button click event listener
  cartItemsContainer.addEventListener("click", function (event) {
    if (event.target.matches(".increase-quantity-btn")) {
      const itemId = event.target.getAttribute("data-item-id");
      const itemIndex = cartItems.findIndex((item) => item.id === itemId);
      if (itemIndex !== -1) {
        const selectedItem = cartItems[itemIndex];
        // Check if the current quantity is less than the total quantity available
        if (selectedItem.quantity < selectedItem.total) {
          selectedItem.quantity++;
          localStorage.setItem("cart", JSON.stringify(cartItems));
          displayCartItems(); // Update UI
          const inputField = document.getElementById(`quantity-${itemId}`);
          if (inputField) {
            inputField.value = selectedItem.quantity;
          }
        } else {
          // Handle case where quantity exceeds total quantity available
          alert("Maximum quantity reached for this item.");
        }
      }
    }
  });

  // Quantity decrease button click event listener
  cartItemsContainer.addEventListener("click", function (event) {
    if (event.target.matches(".decrease-quantity-btn")) {
      const itemId = event.target.getAttribute("data-item-id");
      const itemIndex = cartItems.findIndex((item) => item.id === itemId);
      if (itemIndex !== -1 && cartItems[itemIndex].quantity > 1) {
        cartItems[itemIndex].quantity--;
        localStorage.setItem("cart", JSON.stringify(cartItems));
        displayCartItems(); // Update UI
        const inputField = document.getElementById(`quantity-${itemId}`);
        if (inputField) {
          inputField.value = cartItems[itemIndex].quantity;
        }
      } else if (itemIndex !== -1 && cartItems[itemIndex].quantity === 1) {
        // If quantity is 1, remove the item from the cart
        cartItems.splice(itemIndex, 1);
        localStorage.setItem("cart", JSON.stringify(cartItems));
        displayCartItems(); // Update UI
      }
    }
  });
  // Remove item button click event listener
  cartItemsContainer.addEventListener("click", function (event) {
    if (event.target.matches(".remove-item-btn")) {
      const itemId = event.target.getAttribute("data-item-id");
      const updatedCartItems = cartItems.filter((item) => item.id !== itemId);
      localStorage.setItem("cart", JSON.stringify(updatedCartItems));
      // Update cart items array reference
      cartItems = updatedCartItems;
      // Update UI
      displayCartItems();
    }
  });

  // Assuming cartItems is an array containing the items in the cart
  document
    .getElementById("checkout-button")
    .addEventListener("click", function () {
      localStorage.setItem("cartItems", JSON.stringify(cartItems));
      window.location.href = "checkout.html"; // Redirect to the checkout page
    });
});
