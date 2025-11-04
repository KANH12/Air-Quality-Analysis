# 🌍 Global Air Quality Dashboard – (Python-Power BI Project)

## 📘 Overview

This project provides a comprehensive **data visualization and analysis of global air quality** using **Power BI**.
It combines raw pollutant data, data preprocessing scripts, and interactive dashboards to deliver key insights into air pollution trends across countries and cities worldwide.

---

## 📂 Project Structure

```
├── clean_air_quality.xlsx           # Cleaned dataset ready for Power BI import
├── global_air_pollution_data.csv    # Original raw data (pollutant readings, AQI, etc.)
├── data_processing.ipynb            # Jupyter notebook for data cleaning and transformation
├── dashboard.pbix                   # (Not included here) Power BI file with dashboards
└── README.md                        # Project documentation
```

---

## 🧩 Data Sources

* **Global Air Quality dataset** – includes pollutant concentration data (PM2.5, Ozone, NO₂, CO) and computed AQI for major global cities.
* Data fields include:

  * `Country`, `City`
  * `PM2.5`, `Ozone`, `NO₂`, `CO`
  * `AQI` and AQI category
  * Timestamps and measurement details

---

## ⚙️ Data Processing

The **`data_processing.ipynb`** notebook performs the following key steps:

1. **Data Cleaning**

   * Handles missing values, duplicates, and inconsistent units.
   * Converts timestamps and standardizes pollutant concentration scales.
2. **Data Transformation**

   * Computes **AQI values** per city and country.
   * Aggregates pollutant averages for comparative visualization.
3. **Output**

   * Saves a clean, analysis-ready dataset (`clean_air_quality.xlsx`) for Power BI.

---

## 📊 Power BI Dashboards

The project contains two interactive dashboards, designed for **multi-dimensional analysis** of air quality metrics.

### **1. Overview Dashboard**

*(https://raw.githubusercontent.com/KANH12/Air-Quality-Analysis/main/dashboard/overview.png)*
**Purpose:** Provide a global-level summary of air quality distribution.

**Main Visuals:**

* **Country & City Filters:** Dynamic filtering by geography and AQI status.
* **KPI Cards:**

  * Country count
  * City count
  * Average AQI
* **Line Chart:** AQI distribution by value range.
* **Map Visualization:** Global AQI levels by region.
* **Treemap:** Distribution of AQI categories (Good, Moderate, Unhealthy, etc.).

---

### **2. Pollutant Impact Dashboard**

*(https://raw.githubusercontent.com/KANH12/Air-Quality-Analysis/main/dashboard/pollutant.png)*
**Purpose:** Analyze air quality by pollutant types and their relative contributions.

**Main Visuals:**

* **KPI Cards:**

  * Average PM2.5, Ozone, NO₂, CO concentrations
  * Active pollutants count
* **Bar Chart:** Average pollutant values per pollutant type.
* **Pie Chart:** Pollutant share by type.
* **Interactive Filters:** Country, City, and Pollutant filters for drill-down exploration.

---

## 🧠 Insights

* Identify **regions with highest AQI levels** and potential pollution hotspots.
* Compare **pollutant contributions** across different areas.
* Track **average pollutant values** and AQI distributions over time or geography.
* Enable **decision-makers** to prioritize air quality interventions.

---

## 🛠️ Tools & Technologies

* **Power BI** – for dashboard creation and visualization.
* **Python (Pandas, NumPy, Matplotlib)** – for data cleaning and preprocessing.
* **Excel / CSV** – for data storage and transformation.

---

## 📈 Future Enhancements

* Integration with real-time air quality APIs (e.g., OpenAQ).
* Time-series forecasting of AQI using machine learning.
* Regional comparison dashboards with user-defined filters.

---

## 👨‍💻 Author

**Khang [khngzx]**
Data Analyst & Visualization Enthusiast
📧 Contact: *baokhang1608@gmail.com*

---

## 📎 Notes

* Screenshots in this documentation correspond to the Power BI dashboard views:

  * Left: *Overview Dashboard*
  (https://raw.githubusercontent.com/KANH12/Air-Quality-Analysis/main/dashboard/overview.png)
  * Right: *Global Air Quality by Pollutant and Country*
  (https://raw.githubusercontent.com/KANH12/Air-Quality-Analysis/main/dashboard/pollutant.png)
* Ensure the file paths are correct when connecting `clean_air_quality.xlsx` to Power BI.

---

**© 2025 Khang – All Rights Reserved**
