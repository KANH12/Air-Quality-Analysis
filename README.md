# 🌍 Global Air Quality Dashboard – (Python-Power BI Project)

## 📘 Overview

This project delivers a **comprehensive analysis and visualization of global air quality** using **Power BI** and **Python data preprocessing**.
It combines raw pollutant data, data preprocessing scripts, SQL analysis, and interactive dashboards to deliver insights into global air pollution trends.

---

## 📂 Project Structure

```
├── data/
│   ├── global_air_pollution_data.csv    # Original raw data (pollutant readings, AQI, etc.)
│   └── clean_air_quality.xlsx           # Cleaned dataset ready for Power BI import
│
├── notebooks/
│   └── data_processing.ipynb            # Jupyter notebook for data cleaning and transformation
│
├── dashboard/
│   ├── Project.pbix                     # Power BI dashboard file
│   ├── overview.png                     # Screenshot of the Overview dashboard
│   └── pollutant.png                    # Screenshot of the Pollutant Impact dashboard
│
├── sql.scripts/
│   ├── air_pollutant_share_by_type.sql    
│   ├── countries_and_city_larger_zero.sql
│   ├── global_AQI_value_distribution.sql
│   └── pollutants_with_the_greatest_impact_on_global_average_AQI.sql
│
└── README.md                            # Project documentation
```

---

## 🧩 Data Sources

* **Global Air Quality dataset** – includes pollutant concentration data (PM2.5, Ozone, NO₂, CO) and computed AQI for major global cities.
* Data fields include:

  * `Country`, `City`
  * `Pollutant`

    * `PM2.5 value`, `PM2.5 category`
    * `Ozone`, `Ozone category`
    * `NO₂`, `NO₂ category`
    * `CO`, `CO category`

  * `AQI` and `AQI category`

---

## ⛮ Data Processing

Performed in **`data_processing.ipynb`** using Python libraries:

1. **Data Cleaning**
   * Renamed columns to standardized and readable names.
   * Check duplicate value column `city`
   * Handled missing values by removing, **particularly those with null Country fields**
 
     * `Records with null Country values were removed because, although other columns (including City) had data, each city appeared only once in the raw dataset. Without national reference data or repeated city entries, it was impossible to determine the corresponding country, so these records were excluded.`

   * Filtered out invalid or inconsistent data points to ensure data quality.
2. **Data Transformation" – **Data without additional conversion**
3. **Output** 
  * Export cleaned dataset (**`clean_air_quality.xlsx`**)
  * Loads the same dataset into PostgreSQL for SQL-based analysis.

---

## 🗄️ Database Integration (PostgreSQL)

The project integrates with PostgreSQL to execute analytical queries for deeper air quality exploration.

Folder `sql.scripts/` contains queries for data exploration and analysis:
 * 'air_pollutant_share_by_type.sql' → Compares pollutant proportions by type
 * 'countries_and_city_larger_zero.sql' → Filters valid countries/cities
 * 'global_AQI_value_distribution.sql' → Analyzes global AQI range distributions
 * 'pollutants_with_the_greatest_impact_on_global_average_AQI.sql' → Identifies major pollution drivers
  
💡 All SQL scripts operate on the cleaned dataset loaded into PostgreSQL from the ETL pipeline.

---

## ⚙️ Data Pipeline Overview (ETLV)

This project follows a complete ETLV (Extract – Transform – Load – Visualize) workflow that connects multiple tools for end-to-end data analysis.

1. **Extract**

   * Collected **`global_air_pollution_data.csv`** format from **public data sources**: (`https://www.kaggle.com/datasets/hasibalmuzdadid/global-air-pollution-dataset`)
   * The dataset includes pollutant readings (PM2.5, NO₂, CO, O₃), AQI values, and geographic metadata.

2. **Transform**

   * Cleaned and standardized raw data using Python (Pandas) in **`data_processing.ipynb`**.
   * Task performed:

     * Handle missing values and rename columns
     * Filter invalid values (to avoid meaningless or corrupted data)
     * Prepare structured data for analysis
     
   *`No additional transformations were applied because the dataset already contained all required columns`*
   
3. **Load**
   
   * Exported transformed data to:
     * **`clean_air_quality.xlsx`** → used in Power BI for visualization
     * **PostgreSQL** → used for intermediate SQL analysis (queries in **`/sql.scripts/`**)

4. **Visualize**

   * Built interactive dashboards in **Power BI** using the cleaned dataset.
   * Dashboards highlight trends, pollutant impacts, and geographic air quality differences.

---

## 🔄 Workflow Summary

                            Raw CSV 
                               ↓
                         Python (Cleaning)
                         ↓               ↓
    [1] PostgreSQL (SQL Analysis)       [2] Excel (.xlsx)
                       ↓                    ↓
                      Power BI (Visualization)
                      
*Note: No additional transformation was applied as each city record was unique.*

---

## 📊 Power BI Dashboards

The project contains two interactive dashboards, designed for **multi-dimensional analysis** of air quality metrics.

### **1. Overview Dashboard**

![Dashboard Overview](https://github.com/KANH12/Air-Quality-Analysis/blob/main/dashboard/overview.png?raw=true)
**Purpose:** Provide a global-level summary of air quality distribution.

**Key Visuals:**

* **Country & City & Status Filters:** Dynamic filtering by geography and AQI status.
* **KPI Cards:**

  * Country count
  * City count
  * Average AQI
* **Area Chart:** AQI distribution by value range.
* **Map Visualization:** Global AQI levels by region.
* **Treemap:** Distribution of AQI categories (Good, Moderate, Unhealthy, etc.).

---

### **2. Pollutant Impact Dashboard**

![Pollutant Impact Dashboard](https://github.com/KANH12/Air-Quality-Analysis/blob/main/dashboard/pollutant.png?raw=true)
**Purpose:** Analyze air quality by pollutant types and their relative contributions.

**Key Visuals:**

* **Country & City & Pollutants Filters:** Dynamic filtering by geography and each pollutant.
* **KPI Cards:**
  
  * Countries and Cities recorded
  * Average PM2.5, Ozone, NO₂, CO concentrations
  * Active pollutants count
* **Pie Chart:** Pollutant share by type.
* **Tree map:** Block size and color indicate average concentration, highlighting the major contributors to  air quality.


---

## 🧠 Key Insights

* Identify regions with highest AQI levels and pollution hotspots
* Compare pollutant contributions across regions
* Support data-driven environmental policy and awareness

---

## 🛠️ Tools & Technologies

| Category       | Tools                     | Desciption 
| -------------- | ------------------------- | -----------------
| Visualization  | Power BI                  | Data visualization and dashboard building
| Programming    | Python                    | Data preprocessing and scripting
| Library        | Pandas, NumPy             | Data cleaning, manipulation, and analysis
| Data Formats   | Excel, CSV                | Data storage and export formats
| Query Language | SQL (PostgreSQL, MySQL)   | Data querying and analysis

---

## 🔮 Future Enhancements

* Integrate real-time air quality data from public APIs to enable live dashboard updates.
* Automate the ETL process using Python scripts and schedule with Apache Airflow or Cron.
* Deploy the dashboard on Power BI Service or Streamlit for public accessibility.

---

## 👨‍💻 Author

**Khang [khngzx]**
Data Analyst & Visualization Enthusiast
📧 Contact: *baokhang1608@gmail.com*

---

## 📎 Notes

* Screenshots in this documentation correspond to the Power BI dashboard views:

  *Overview Dashboard* ![Dashboard Overview](https://github.com/KANH12/Air-Quality-Analysis/blob/main/dashboard/overview.png?raw=true)
    
  *Global Air Quality by Pollutant and Country* ![Pollutant Impact Dashboard](https://github.com/KANH12/Air-Quality-Analysis/blob/main/dashboard/pollutant.png?raw=true)
* Ensure the file paths are correct when connecting `clean_air_quality.xlsx` to Power BI.

---

**© 2025 Khang – All Rights Reserved**
