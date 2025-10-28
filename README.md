# 🏊‍♂️ Swimming Club Management System (SQL)

This project represents a **database design and implementation** for a **swimming club management system**, created as part of the **Practicum in SQL** course.  
The goal is to model, normalize, and implement a database that supports the management of swimmers, coaches, training sessions, competitions, and membership payments.

---

## 📘 Overview

The system is designed for a swimming club to manage:
- Member registration and categories  
- Training schedules and attendance tracking  
- Competition organization and results  
- Membership payments and methods  
- Location and postal data for venues  

The project includes:
- Conceptual and logical database design  
- Normalization to **3NF** and **BCNF**  
- SQL DDL & DML implementation  
- User-defined functions and stored procedures for data analysis  

---

## 🧱 Database Structure

Main entities:

| Table | Description |
|-------|-------------|
| **Plivac** | Stores swimmer personal data, membership info, and category |
| **Trener** | Coaches responsible for training sessions |
| **Trening** | Training sessions with date, time, coach, and location |
| **Prisutnost** | Attendance tracking (many-to-many: swimmers ↔ trainings) |
| **Natjecanje** | Competitions with name, date, and location |
| **Rezultati** | Results of swimmers per competition |
| **Uplata** | Payment records (amount, date, method) |
| **Lokacija** | Training or competition locations |
| **Naselje** | Postal codes and place names |

---

## 🧩 Database Features

- ✅ **Normalization:**  
  Achieved up to **3NF** and **BCNF**, ensuring no redundancy and maintaining data integrity.  

- ⚙️ **Constraints and Checks:**  
  - Category and gender validations  
  - Payment method restriction (`Gotovina`, `Kartica`, `Uplatnica`)  

- 📊 **Functions:**  
  - `fn_BrojPobjeda(@OIB)` → counts wins for a swimmer  
  - `fn_PrisutnostNaTreninzima()` → returns attendance rate per swimmer  
  - `fn_RasponStarosti(@DatumPocetak, @DatumKraj)` → filters swimmers by birth date range  

- 🧮 **Stored Procedures:**  
  - `sp_DodajPlivaca`, `sp_BrisiSveIzSvihTablica`, etc. for managing data and resetting tables  

- 🔗 **Foreign Keys:**  
  Relationships ensure consistency between swimmers, coaches, trainings, competitions, and payments.  

---

## 🗄️ Example Entity Relationships

```
Plivac (1)───(∞) Prisutnost (∞)───(1) Trening (∞)───(1) Trener
  │                                      │
  │                                      └──(1) Lokacija──(1) Naselje
  │
  ├──(∞) Rezultati (∞)───(1) Natjecanje──(1) Lokacija
  │
  └──(∞) Uplata
```

---

## ⚙️ How to Run the Project

1️⃣ **Open SQL Server Management Studio (SSMS)**  
2️⃣ Run `PIS_Seminarski_Leon-Serka.sql` to create the database `PlivackiKlub`.  
3️⃣ Review tables, constraints, and preloaded data.  
4️⃣ Test provided functions and procedures, for example:
   ```sql
   SELECT dbo.fn_BrojPobjeda(11);
   SELECT * FROM dbo.fn_PrisutnostNaTreninzima();
   EXEC dbo.sp_BrisiSveIzSvihTablica;
   ```
5️⃣ Use the included `.sql` files (`vj1.sql` – `vj6.sql`) for additional exercises and queries.

---

## 🧠 Learning Objectives

- Database design based on user requirements  
- Understanding functional dependencies and normalization  
- Implementation of **constraints**, **foreign keys**, and **relationships**  
- Writing **user-defined functions** and **stored procedures**  
- Performing **data analysis** and **reporting** with SQL  

---

## 🧰 Technologies Used

- 🗄️ **Microsoft SQL Server**
- 🧩 **T-SQL (Transact-SQL)**
- 📊 **ER Modeling / Normalization**
- 🧠 **Functional Dependency Analysis**

---

## 🚧 Future Improvements

More features coming soon — such as stored procedures for ranking swimmers by performance, and automatic report generation for competitions and trainings.

---

## 📄 License

This project is open-source and intended for **educational purposes**.

---

## ✍️ Author

**Leon Serka**  
GitHub: [https://github.com/leonserka](https://github.com/leonserka)
