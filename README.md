# Grabbo

Grabbo's - An Online Departmental Store.

The website displays the products in the database along with it's image, name, price and quantity. It also allows you to make purchases from the Grabbo store itself.
Tech Stacks Used: HTML, CSS, JavaScript, Node.js, Express.js, MySQL.

All the endpoints are handled in the 'server.js' file. To run that, go in the root directory in the terminal and type the command - npm start. It will start the server at port 8800.

The database connection is done using the 'connection.js' file and the connection variable is exported to 'server.js'.

Database sql file is inside at 'Database/grabbo.sql' from the root directory of this project.

All the dependencies are added in the 'package.json' file and can be downloaded along with all the necessary node_modules using the command - npm install.

Coming to the website:

The first page is asks the user whether it is a student or admin. Files - index.html, index.css.

1. Student View

If user chooses Student option then it is met with a screen which displays a quote which is randomly generated by the frontend and a search bar. This is the home page of student view.
The user can search for the item/product, he wants from grabbo and if it is in the database, then it will be dynamically displayed on the screen along with the above said properties. These items will be fetched from the backend and database.

The user can add the items to cart in order to make a purchase.
File - Student.html, student.css, student.js

There is navbar which contains 5 options:

1. Home button - takes the website to the home page of the student view.
2. Categories - it is a dropdown nav option which contains different categories of items present in the database. Choosing any of the categories will display all the products in the form of product cards of the said categories. These are dynamically generated from 'student.js' which is fetching these products from the server using 'server.js' file.
3. My Cart - It displays all the products that are present in the cart of the user along with options to increase/decrease the items quantity. It also displays the total price of the cart. It also has 2 options, one to clear the cart and the other to go to the checkout page. Files - cast.html, cart.css, cart.js.
4. Contact - Takes you to the footer which contains social media buttons where we can add grabbo's social media handles.
   Icons taken from - https://fontawesome.com/
5. About Us - Gives information about why we chose this project along with team members. Files - aboutus.css. Images of members are present inside the 'image' folder. html is generated dynamically from student.js

The Checkout page which is accessible from the My Cart page consists of a form which contains the UPI ID and QR of the shopkeeper, along with text fields like Name, Phone Number, Email ID, Hostel and the Transaction ID of the user. It is also displaying all the items that the user is purchasing along with the total price that the user has to pay.

It is working on the assumption that the user has paid the total amount to the Grabbo via the above given UPI ID/QR code. Upon doing so, a unique transaction ID is generated for each payment, that transaction ID the user has to put inside the ""Transaction ID" field of the form which the admin will confirm from the admin control.

The basic Product Cards components are taken from - https://uiverse.io/akshat-patel28/smart-termite-33
I have made several changes on this template to make the card look what it is looking on the website.

2. Admin View

Asks the user to authenticate himself. For now the username and password is 'admin' & 'admin' respectively.
files - login.html, login.css, util.css, login.js

when authenticated, the will be a screen with 4 options - Add Product, Update Product, Delect Product & Verify Transactions
Files - admin.html, admin.css, admin.js

1. Add Product - Admin can add a product by entering all the fields on the displayed form. Files - addProduct.html, addProduct.css, addProduct.js
2. Update Product - Admin can Update the quantity or price of an existing product by choosing the category of the product, after choosing the category, all the items of that category will be fetched from the database and displayed in the dropdown and the admin can choose any product and whether he wants to update the price or quantity of that product. Files - updateProduct.html, updateProduct.css, updateProduct.js.
3. Delete Product - Admin can delete an existing product by choosing the category of the product, after choosing the category, all the items of that category will be fetched from the database and displayed in the dropdown and the admin can choose any product he wants to delete from the database. Files - deleteProduct.html, deleteProduct.css, deleteProduct.js.
4. Verify Transactions - All the orders along with information regarding each orders will be present in the form of a table. The admin can verify each order manually by checking each order's "Transaction ID" and whether they have received the right amount from that Transaction ID. Once the admin verifies the orders, the transaction is completed and the database is updated accordingly. Files - verifyTransaction.html, verifyTransaction.css, verifyTransaction.js

All these changes will be reflected on the student view as soon as the admin makes any change in the database.

Team Members:

- Priyansh Singhal - 2110110397 - Frontend & Backend Development of the website
- Yagay Khatri - 2110110605 - Database Administrator
