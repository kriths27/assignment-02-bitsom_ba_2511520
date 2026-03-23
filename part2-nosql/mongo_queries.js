// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  { "product_id": "ELC-001", "name": "Quantum X15 Laptop", "category": "Electronics", "price": 85000, "specifications": { "voltage": "240V", "warranty_period": "2 years" } },
  { "product_id": "CLO-002", "name": "Classic Denim Jacket", "category": "Clothing", "price": 3500, "attributes": { "size": ["S", "M", "L"] } },
  { "product_id": "GRO-003", "name": "Organic Almond Milk", "category": "Groceries", "price": 250, "details": { "expiry_date": "2027-12-15" } }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ "category": "Electronics", "price": { "$gt": 20000 } });

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({ "category": "Groceries", "details.expiry_date": { "$lt": "2025-01-01" } });

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne({ "product_id": "ELE-101" }, { "$set": { "discount_percent": 10 } });

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ "category": 1 });
/?Reasoning: This optimizes query performance for the most common filter. Without an index, MongoDB performs a collection scan (checking each and every document). Since the catalog is partitioned by category, an index allows for targeted B-tree lookups, reducing latency.
