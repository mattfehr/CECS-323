# 🍕 Pizza Database Schemas

This repository contains the database schema definitions for a fictional pizza ordering and delivery system. It supports both **NoSQL (MongoDB)** and **relational (SQL)** implementations, allowing for exploration of different data modeling approaches.

---

## 📦 Contents

- `schema/` — SQL schema files exported from **DataGrip**.
- `project3/validators/` — JSON schema validators exported from **MongoDB Compass / Shell**.

---

## 🧮 Relational Database (SQL via DataGrip)

### 📌 Overview
The SQL schema defines normalized tables and relationships suitable for relational database systems like **PostgreSQL** or **MySQL**.

### 📁 Folder: `schema/`
This folder contains the DDL scripts generated using JetBrains **DataGrip**. These files include `CREATE TABLE` statements and relevant constraints.

### 🛠️ How to Use
1. Make sure PostgreSQL or MySQL is installed.
2. Create a database:
   ```bash
   createdb pizza_project
   ```
3. Run the schema file:
   ```bash
   psql -d pizza_project -f schema.sql
   ```

> The schema is designed to be re-runnable (`CREATE IF NOT EXISTS`), ignores ownership, and skips grants for portability.

---

## 🍃 NoSQL Database (MongoDB)

### 📌 Overview
The NoSQL implementation uses **MongoDB**, modeling the same pizza-ordering system using nested documents and arrays.

### 📁 Folder: `project3/validators/`
This directory contains JSON schema validators used for document validation in MongoDB collections.

### 📋 Collections and Their Schemas

| Collection   | File                               | Description                              |
|--------------|------------------------------------|------------------------------------------|
| `customers`  | `customers.validator.json`         | Tracks customer info and their orders    |
| `deliveries` | `deliveries.validator.json`        | Stores delivery records and driver info  |
| `drivers`    | `drivers.validator.json`           | Maintains driver info and deliveries     |
| `ingredients`| `ingredients.validator.json`       | Inventory and nutritional info for toppings |
| `orders`     | `orders.validator.json`            | Online/in-store orders and pizza details |

### 🛠️ How to Use
To apply validation rules in MongoDB:
```js
db.createCollection("customers", {
  validator: <paste contents of customers.validator.json>
});
```

Or, update an existing collection:
```js
db.runCommand({
  collMod: "customers",
  validator: <your-validator-object>
});
```

> You can preview or modify validators in **MongoDB Compass** or the **Mongo Shell** (`mongosh`).

---

## 🔧 Development Notes

- MongoDB schema prioritizes flexibility and nesting (e.g., embedded pizzas and toppings).
- SQL schema emphasizes normalization and foreign keys.
- Both versions are suitable for learning, prototyping, or comparisons of relational vs. document-based modeling.

---

## 📜 License

This project is intended for educational use.
