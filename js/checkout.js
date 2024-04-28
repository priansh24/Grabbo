const form = document.getElementById("checkout-form");
const cartItemsContainer = document.querySelector("#cart-items");

document.addEventListener("DOMContentLoaded", function () {
  const cartItems = JSON.parse(localStorage.getItem("cartItems"));
  if (cartItems) {
    displayCartItems(cartItems); // Call a function to display cart items on the checkout page
  } else {
    console.error("Cart items not found in localStorage.");
  }
});

function sendEmail(cartItems) {
  const body = `Thank you for ordering through Grabbo Online! Your order details are mentioned below:
            Name: ${cartItems.name} Phone Number: ${cartItems.phone}    Transaction ID: ${cartItems.transactionId}  Hostel: ${cartItems.hostel} Delivery Type: ${cartItems.delivery}    Items Bought: ${cartItems.cartItems}`;
  const subject = `Grabbo Order by ${cartItems.emailId}`;

  const formData = {
    recipientEmail: cartItems.emailId,
    subject: subject,
    body: body,
  };

  fetch(
    `
    http://localhost:8800/send-email`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    }
  )
    .then((response) => {
      if (response.ok) {
        alert("Order details sent to email successfully!");
      } else {
        throw new Error("Failed to send email.");
      }
    })
    .catch((error) => {
      console.error("Error sending email:", error);
      alert("Failed to send email. Please try again later.");
    });
}

// Function to send a POST request with the array of objects
function sendPostRequest(data) {
  fetch("http://localhost:8800/tableData", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("Failed to send data");
      }
      console.log("Data sent successfully");
    })
    .catch((error) => {
      console.error("Error sending data:", error);
    });
}

// const cartItemsContainer = document.getElementById("cart-items");
// Function to clear cart items
function clearCartItems() {
  window.location.href = "../student.html";
  localStorage.clear(); // Clear cart items from local storage
  cartItemsContainer.innerHTML = "";
}

function displayCartItems(cartItems) {
  if (!cartItemsContainer) {
    console.error("Cart items container not found.");
    return;
  }
  const amount = cartItems.reduce(
    (total, item) => total + item.price * item.quantity,
    0
  );
  // Display cart items on the checkout page
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
                <p class="itemQuantity">Quantity: &nbsp${item.quantity}</p>

                    </div>
            `;
    cartItemsContainer.appendChild(itemElement);
  });

  const amountElement = document.querySelector(".amount");
  amountElement.textContent = "₹" + amount.toFixed(2);
  form.addEventListener("submit", function (event) {
    event.preventDefault();
    const formData = new FormData(form);
    const formObj = {};
    const cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];

    for (const [name, value] of formData.entries()) {
      formObj[name] = value;
    }

    let sanitizedCartItems = cartItems.map((item) => {
      const sanitizedItem = { ...item };
      delete sanitizedItem.id;
      delete sanitizedItem.url;
      return sanitizedItem;
    });

    const checkoutData = {
      ...formObj,
      cartItems: sanitizedCartItems,
    };
    if (checkoutData) {
      sendPostRequest(checkoutData);
      alert("Thank you for the purchase!");
      form.reset();
      clearCartItems();
    }
    // sendEmail(checkoutData);
  });
}
