// Function to fetch JSON data from the backend and generate the table
function fetchAndGenerateTable() {
  fetch("http://localhost:8800/tableData")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Failed to fetch data");
      }
      return response.json();
    })
    .then((orders) => {
      generateTable(orders);
    })
    .catch((error) => {
      console.error("Error fetching data:", error);
    });
}

function generateTable(orderData) {
  const items = orderData.cartItems.map((item) => item.name);
  const amount = orderData.cartItems.reduce(
    (total, item) => total + item.price * item.quantity,
    0
  );

  const tableContainer = document.getElementById("table-container");
  const table = document.createElement("table");

  table.classList.add("custom-table"); // Add custom class to table element

  // Create table header
  const headerRow = document.createElement("tr");
  const headers = [
    "Transaction ID",
    "Name",
    "Email ID",
    "Phone Number",
    "Hostel",
    "Delivery Type",
    "Order",
    "Amount",
    "Confirmation",
  ];
  for (let header of headers) {
    const th = document.createElement("th");
    th.textContent = header;
    headerRow.appendChild(th);
  }
  table.appendChild(headerRow);

  const orders = (({ cartItems, ...rest }) => rest)(orderData);
  const row = document.createElement("tr");
  const values = [
    orders.transactionId,
    orders.name,
    orders.emailId,
    orders.phone,
    orders.hostel,
    orders.delivery,
    items.join(", "),
    amount,
  ];
  for (let value of values) {
    const cell = document.createElement("td");
    cell.textContent = value;
    row.appendChild(cell);
  }
  table.appendChild(row);

  tableContainer.appendChild(table);
}

// Call the function to generate the table
fetchAndGenerateTable();
