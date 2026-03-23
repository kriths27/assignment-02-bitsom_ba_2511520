## Storage Systems

To meet the hospital’s diverse goals, a Polyglot Persistence strategy is required:

Goal 1 (Readmission Risk): I chose a Cloud Data Warehouse (e.g., Snowflake). It allows us to aggregate longitudinal patient history and run complex SQL-based feature engineering for machine learning models.

Goal 2 (Plain English Queries): I selected a Vector Database (e.g., Pinecone) alongside a Large Language Model (LLM). Patient records are converted into "embeddings" (numerical representations of meaning), allowing doctors to query semantic concepts like "cardiac event" even if the specific word isn't in the chart.

Goal 3 (Monthly Reports): This also utilizes the Data Warehouse. Its columnar storage is optimized for the heavy aggregations needed to calculate department-wise costs and occupancy trends.

Goal 4 (Real-time Vitals): I chose a Time-Series Database (e.g., InfluxDB) or a NoSQL store (e.g., MongoDB). ICU vitals generate high-velocity, high-volume data that would be too expensive and slow to write into a standard relational database in real-time.

## OLTP vs. OLAP Boundary

The OLTP (Online Transactional Processing) system ends at the hospital’s primary Electronic Health Record (EHR) database. This system is designed for "point-of-care" tasks—updating a single patient's chart or checking a current heart rate.

The OLAP (Online Analytical Processing) boundary begins at the Ingestion/ETL layer. Once data is extracted from the EHR and moved into the Data Warehouse or Data Lake, it is no longer being used for "live" patient treatment updates. Instead, it is transformed into a read-optimized format for high-level analysis, risk prediction, and historical auditing.

## Trade-offs

A significant trade-off in this design is Latency vs. Consistency regarding the real-time vitals.

By using a streaming architecture to handle ICU data, there is a risk that the data used for the management reports (OLAP) might be slightly out of sync with the live monitors (OLTP) due to processing lags. To mitigate this, I implemented a Lambda Architecture. The "Speed Layer" provides immediate, raw alerts to doctors, while the "Batch Layer" cleans and reconciles that data every hour to ensure that the management reports are 100% accurate and verified against the official medical records.
