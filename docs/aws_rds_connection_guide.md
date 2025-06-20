# AWS RDS Connection Guide (PostgreSQL + pgAdmin)

This guide documents how the Music Store database was deployed to AWS RDS and accessed using pgAdmin.

---

## 1. Database Setup in AWS RDS

- Chose PostgreSQL as the engine.
- Allocated minimal resources suitable for testing.
- Created a database instance named `musicstore-db`.
- Set master username and password.

---

## 2. Security Configuration

- Edited the inbound rules of the security group to allow access from my IP.
- Port `5432` (PostgreSQL default) was enabled for access.

---

## 3. Connecting via pgAdmin

- Opened **pgAdmin 4**.
- Right-clicked on `Servers → Create → Server`.
- Under **Connection tab**, filled in:
  - Host name/address: `<RDS endpoint>`
  - Port: `5432`
  - Username: `<master username>`
  - Password: `<master password>`

---

## 4. Importing Data

- Once connected, SQL scripts were run via pgAdmin's **Query Tool**.
- All 11 tables were created and populated using cleaned CSVs.

---

## 5. Verification

- Successfully ran all SQL queries on the AWS-hosted database.
- Screenshots of each step are provided in the `docs/` folder.

---

