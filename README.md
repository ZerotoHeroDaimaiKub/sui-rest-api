# MySQL Node.js REST API

This project is a RESTful API built using Node.js, Express, and MySQL for managing products for CJStreetwear.

## Prerequisites
- Node.js and npm installed
- MySQL server running

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/mysql-nodejs-rest-api.git
   ```

2. Install Chocolatey (Windows Only):
   Open the Command Prompt or PowerShell as Administrator and run the following command to install Chocolatey:
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   ```

3. Install Node.js and npm using Chocolatey:
   ```bash
   choco install nodejs-lts
   ```

4. Navigate to the project directory:
   ```bash
   cd mysql-nodejs-rest-api
   ```

5. Install dependencies:
   ```bash
   npm install
   ```

## Running the API
1. Start the server:
   ```bash
   node index.js
   ```
   The server will start on port 3000.

## Usage
You can test the API endpoints using tools like Postman or cURL.

## Testing with Postman
1. **Install Postman**: Download and install Postman from [https://www.postman.com/downloads/](https://www.postman.com/downloads/).

2. **Open Postman** and create a new request.

3. **Test the API Endpoints**:
   - **Create a New Product (POST)**:
     - Set the request type to `POST`.
     - Enter the URL: `http://localhost:3000/products`
     - Go to the `Body` tab, select `raw`, and choose `JSON` as the format.
     - Add the product details in JSON format, for example:
       ```json
       {
           "ProductName": "Black Hoodie",
           "Description": "A stylish black hoodie for all occasions.",
           "Price": 29.99,
           "StockLevel": 100,
           "ImageURL": "http://example.com/black-hoodie.jpg"
       }
       ```
     - Click `Send` to add the product.

   - **Retrieve All Products (GET)**:
     - Set the request type to `GET`.
     - Enter the URL: `http://localhost:3000/products`
     - Click `Send` to get a list of all products.

   - **Retrieve a Specific Product by ID (GET)**:
     - Set the request type to `GET`.
     - Enter the URL: `http://localhost:3000/products/{id}` (replace `{id}` with the specific product ID).
     - Click `Send` to get the product details.

   - **Update a Product (PUT)**:
     - Set the request type to `PUT`.
     - Enter the URL: `http://localhost:3000/products/{id}` (replace `{id}` with the specific product ID).
     - Go to the `Body` tab, select `raw`, and choose `JSON` as the format.
     - Add the updated product details in JSON format, for example:
       ```json
       {
           "ProductName": "Updated Black Hoodie",
           "Description": "An updated description for the black hoodie.",
           "Price": 34.99,
           "StockLevel": 80,
           "ImageURL": "http://example.com/updated-black-hoodie.jpg"
       }
       ```
     - Click `Send` to update the product.

   - **Delete a Product (DELETE)**:
     - Set the request type to `DELETE`.
     - Enter the URL: `http://localhost:3000/products/{id}` (replace `{id}` with the specific product ID).
     - Click `Send` to delete the product.

4. **Check Responses**: After sending a request, check the response to ensure that the operations are successful. You should see status codes like `200 OK` for successful operations or `201 Created` for a successful POST request.

With Postman, you can easily test and interact with all the CRUD endpoints of your API.

## Using phpMyAdmin to Manage the Database
1. **Open phpMyAdmin**: Go to [http://localhost/phpmyadmin](http://localhost/phpmyadmin) in your web browser.

2. **Log In**: Use the MySQL credentials you set during installation (e.g., username: `root`, password: `yourpassword`).

3. **Create the Database**:
   - Click on the `New` option in the left sidebar.
   - Enter a name for your database (e.g., `sui`) and click `Create`.

4. **Import the Tables**:
   - Select the database (`sui`) you just created from the left sidebar.
   - Click on the `Import` tab.
   - Click `Choose File` and select your `.sql` file containing the table creation commands.
   - Click `Go` to import the tables.

5. **View and Manage Data**:
   - Click on a table in the left sidebar to view its data.
   - Use the `Browse` tab to see all records.
   - Use the `Insert` tab to add new records manually.
   - Use the `SQL` tab to run custom queries, such as updating or deleting records.

6. **Run SQL Queries**:
   - To run SQL queries like granting privileges or updating records, click on the `SQL` tab.
   - Enter your SQL command and click `Go` to execute it.

phpMyAdmin provides a user-friendly interface to manage and interact with your MySQL database, making it easy to visualize data and perform operations like inserting, updating, and deleting records without needing to use the command line.