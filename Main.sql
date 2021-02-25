/* do not change the following two lines! */
.header on
.mode column
/* do not change the above two lines! */


/*Task One: List the name of each product included in order 20006 with its price and the quantity ordered. The order number and total cost of each item should be shown.*/

SELECT Product.name, Product.price, quantity, orderNumber, Product.price*quantity AS totalCost
FROM Product, OrderProduct
WHERE Product.productID = OrderProduct.productID
AND orderNumber = '20006';


/*Task Two: List all of the products supplied by the supplier called ‘Fun and Games’. The listing should show the name of each product together with its price and discounted price (Fun and Games plans to offer a seasonal discount of 10% on all of its products). */

SELECT Product.name, Product.price, ROUND(Product.price*0.9, 2) AS discountedPrice
FROM Product;


/*Task Three: List each of the products included in order 20007 with its productID and quantity ordered. The query should show the increased quantity should the customer increase the quantity of all ‘bean bag’ products in the order by 20. */

SELECT name, Product.productID, quantity, 
CASE
  WHEN(name LIKE '%bean bag%') THEN quantity+20 
  ELSE quantity 
END AS increasedQuantity
FROM OrderProduct, Product
WHERE orderNumber = '20007'
AND OrderProduct.productID = Product.productID;

/*Task Four: The shop called ‘The Toy Store’ wants to increase the number of each type of bean bag in its order by 25.*/
/*Use a query to list the name of the shop with the name of its contact person, the original quantity, price, description and the updated quantity of all bean bags in the order. */

SELECT shopName AS [Shop Name], contactName AS [Contact Person], quantity AS [Original Quantity], price AS Price, description AS Description, quantity+25 AS [Updated Quantity]
FROM Customer, OrderProduct, Product, CustomerOrder
WHERE name LIKE '%bean bag%'
AND shopName = 'The Toy Store'
AND Customer.customerID = CustomerOrder.customerID
AND CustomerOrder.orderNumber = OrderProduct.orderNumber
AND OrderProduct.productID = Product.productID;


