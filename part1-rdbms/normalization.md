## Anomaly Analysis

**1. Insert Anomaly:** 
To add a new Sales Representative (e.g., Kriththika) who hasn't made a sale yet, we would have to leave `order_id`, `customer_id`, and `product_id` as NULL. If the system requires an `order_id` for every row, we simply cannot record the new employee's details.
**2. Update Anomaly:** 
Sales Rep Anita Desai (SR02) is listed with the office address "Delhi Office, Connaught Place, New Delhi - 110001". If the Delhi office moves, we must update every single row where Anita is mentioned. Missing even one row leads to data inconsistency where the same person appears to work in two places.
**3. Delete Anomaly:**
If we delete the only order for "Pen Set" (e.g., ORD1114), we also lose the product information like (Category: Stationery, Price: 250) from our records entirely if no other orders exist for that item.

## Normalization Justification

While keeping everything in one big sheet may look simpler, it’s really like building a house on a shaky foundation. Our data in orders_flat.csv shows the problem clearly: the same information is repeated over and over. For example, Anita Desai (SR02) has her full office address copied into every row where she made a sale.

If Anita’s office moves, we’d have to update her address in 50 different rows. Miss even one, and suddenly the database shows two conflicting addresses for the same person. This is an Update Anomaly. In a normalized design, her address lives in the SalesReps table, change it once, and it’s consistent everywhere.

Flat files also create awkward situations. Hiring a new Sales Rep with no orders? We can’t add them without faking an order or leaving half a row blank. Deleting the only order for a “Laptop”? We risk erasing the laptop’s price and category entirely. These are Insert/Delete Anomalies. By separating Products and SalesReps, their information exists independently of orders.

Repeating long strings like “South Zone, MG Road, Bangalore…” thousands of times wastes storage and slows queries. Normalization replaces bulky text with compact IDs, keeping the database lean and efficient.

I believe, Normalization isn’t over-engineering, it’s the foundation of accuracy, reliability, and efficiency. Every piece of data lives in exactly one place, preventing errors, saving storage, and ensuring managers get reports they can trust.
