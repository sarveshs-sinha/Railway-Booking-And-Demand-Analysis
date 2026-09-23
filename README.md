# 🚆 Railway Ticket Confirmation Analysis

> **End-to-End Data Analytics Project using Python, Pandas, Visualization & PostgreSQL**

An end-to-end data analytics project that analyzes **railway ticket bookings, passenger demand, confirmation rates, waitlisting, train performance, routes, and seasonal patterns**.

**Workflow:**
`Raw Data → Cleaning → Feature Engineering → EDA → Business Analysis → PostgreSQL`

---

## 📌 Project Overview

The goal of this project is to transform raw railway booking data into meaningful business insights.

The analysis focuses on:

* 🎫 Ticket confirmation & waitlisting
* 🚆 Train and route demand
* 📅 Monthly & seasonal booking trends
* 💺 Seat availability
* 🏷️ Travel class & quota performance
* 📱 Booking channel analysis
* ⏱️ Booking lead time

---

## 🛠️ Tech Stack

**Languages & Libraries**

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn

**Database**

* PostgreSQL
* SQL
* SQLAlchemy

**Tools**

* Jupyter Notebook
* VS Code
* Git & GitHub

---

## 🔄 Project Workflow

### 1️⃣ Data Cleaning

* Handled missing values based on business meaning
* Removed/validated inconsistent records
* Converted date columns
* Checked duplicates and invalid values

### 2️⃣ Feature Engineering

Created useful analytical features such as:

* Booking Lead Time
* Route
* Journey Month
* Was Waitlisted
* Waitlist Category
* Distance Category
* Passenger Group Size

### 3️⃣ Exploratory Data Analysis

Analyzed:

* Booking & passenger demand
* Confirmation and waitlist rates
* Train performance
* Route performance
* Monthly trends
* Seat availability
* Peak vs non-peak demand

### 4️⃣ Business Analysis

Developed KPIs including:

```text
Total Bookings
Total Passengers
Confirmation Rate
Waitlist Rate
Average Seat Availability
Average Booking Lead Time
```

---

## 🐘 PostgreSQL & SQL Analysis

The processed dataset was loaded into PostgreSQL for deeper business analysis.

SQL analysis includes:

* Overall KPIs
* Booking status distribution
* Confirmation by travel class
* Confirmation by quota
* Booking channel performance
* Monthly demand
* Top trains
* Top routes
* Waitlist analysis
* Peak vs non-peak analysis

Example:

```sql
SELECT
    COUNT(*) AS total_bookings,
    SUM("Number of Passengers") AS total_passengers,
    ROUND(AVG(("Is Confirmed")::int) * 100, 2) AS confirmation_rate,
    ROUND(AVG(("Was Waitlisted")::int) * 100, 2) AS waitlist_rate
FROM "4_Railway_Buisness";
```

---

## 📊 Key Business Questions

This project answers questions such as:

* Which months have the highest booking demand?
* Which trains and routes receive the most passengers?
* How does waitlisting affect confirmation?
* Which travel classes have higher confirmation rates?
* How does quota affect confirmation and waitlisting?
* Which booking channels generate higher confirmation rates?
* How does peak season affect demand and availability?

---

## 📁 Project Structure

```text
Railway-Ticket-Confirmation-Analysis/
│
├── notebooks/
│   ├── 1_Railway_Cleaning.ipynb
│   ├── 2_Railway_Featuring.ipynb
│   ├── 3_Railway_EDA.ipynb
│   └── 4_Railway_Business.ipynb
│
├── data/
│   └── Railway_Ticket_Confirmation.csv
│
├── sql/
│   └── Railway_Analyzed.sql
│
└── README.md
```

---

## 💡 Skills Demonstrated

**Python • SQL • PostgreSQL • Data Cleaning • EDA • Feature Engineering • Data Visualization • KPI Analysis • Business Analysis**

---

## 🎤 Interview Summary

> *"I developed an end-to-end railway booking analytics project where I cleaned and transformed raw data, created analytical features, performed EDA and business analysis using Python, and used PostgreSQL to calculate KPIs and analyze booking demand, confirmation, waitlisting, trains, routes, and seasonal patterns."*

---

## 👨‍💻 Author

**Sarvesh Sinha**
Aspiring Data Analyst | Python | SQL | PostgreSQL | Data Visualization

⭐ **If you find this project useful, consider giving the repository a star!**
