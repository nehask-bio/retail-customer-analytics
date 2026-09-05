# Data Dictionary

This document describes the main tables and columns used in the Olist retail analytics project.

## orders

Grain: one row per order

Primary key: order\_id

Foreign key: customer\_id

|Column|Description|
|-|-|
|order\_id|Unique identifier for each order|
|customer\_id|Identifier linking the order to a customer|
|order\_status|Current status of the order, such as delivered or shipped|
|order\_purchase\_timestamp|Date and time when the customer placed the order|

## order\_items

Grain: one row per item within an order

Primary key: combination of order\_id and order\_item\_id

Foreign keys:

* order\_id → links to orders
* product\_id → links to products
* seller\_id → links to sellers

|Column|Description|
|-|-|
|order\_id|Identifier of the order this item belongs to|
|order\_item\_id|Item number within the order|
|product\_id|Identifier of the product purchased|
|seller\_id|Identifier of the seller|
|shipping\_limit\_date|Deadline for the seller to ship the item|
|price|Selling price of the item|
|freight\_value|Freight or shipping charge for the item|

## customers

Grain: one row per customer record linked to an order

Primary key: customer\_id

Business customer identifier: customer\_unique\_id

|Column|Description|
|-|-|
|customer\_id|Identifier used to link the customer record to an order|
|customer\_unique\_id|Persistent identifier used to recognise the same customer across multiple orders|
|customer\_zip\_code\_prefix|Prefix of the customer's postal code|
|customer\_city|Customer's city|
|customer\_state|Customer's state|



## products

Grain: one row per product

Primary key: product\_id

|Column|Description|
|-|-|
|product\_id|Unique identifier for each product|
|product\_category\_name|Product category name|
|product\_name\_length|Number of characters in the product name|
|product\_description\_length|Number of characters in the product description|
|product\_photos\_qty|Number of product photos|
|product\_weight\_g|Product weight in grams|
|product\_length\_cm|Product length in centimetres|
|product\_height\_cm|Product height in centimetres|
|product\_width\_cm|Product width in centimetres|



