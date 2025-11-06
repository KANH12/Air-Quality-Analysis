# 🌍 Global Air Quality Dashboard – (Python-Power BI Project)

![Python](https://img.shields.io/badge/Python-3.11.9-blue)
![Power BI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Completed-success)

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
├── sql_scripts/
│   ├── air_pollutant_share_by_type.sql    
│   ├── countries_and_city_larger_zero.sql
│   ├── global_AQI_value_distribution.sql
│   └── pollutants_with_the_greatest_impact_on_global_average_AQI.sql
│
└── README.md                            # Project documentation
```

---

## ⚙️ Setup Environment

Before running the project, make sure you have the following installed:

  * **`Python (>=3.10 recommended)`** – [**Download**](https://www.python.org/downloads/)

  * **`Jupyter Notebook`**:

    * Option 1 (Recommend): Open the project folder in [VS Code](https://code.visualstudio.com/docs/setup/windows#_install-vs-code-on-windows), then open the notebook [**`data_processing.ipynb`**](https://github.com/KANH12/Air-Quality-Analysis/blob/main/notebooks/data_processing.ipynb).  

    * Option 2 (Optional): Jupyter Notebook (web interface via CMD/Terminal)
      
      * Open cmd/terminal and run: **`pip install jupyter`**
      * After install move on folder project with: **`cd path/to/Air-Quality-Analysis`**
      * Run Notebook: **`jupyter notebook notebooks/data_processing.ipynb`**
      * Run each cell to preprocess by using (Shift + Enter)

  * **Required Python libraries**:
    * All libraries are listed in requirements.txt, including
      * pandas 
      * sqlalchemy
      * openpyxl 
    * They will be automatically installed when running the notebook
    * Or you can install them manually using: `pip install -r requirements.txt`

  * **Power BI Desktop (for dashboards)** – [**Download**](https://www.microsoft.com/en-us/download/details.aspx?id=58494)

  * **(Optional) PostgreSQL**: Needed only if you want to run SQL scripts in sql_scripts/.

---

## 📝 How to Use 

I. **Terminal**
  1. **Clone the repository**:   `      git clone https://github.com/KANH12/Air-Quality-Analysis.git      `

  2. **Navigate to the project directory**:   `      cd Air-Quality-Analysis      `

  3. **Check the raw data**

     * Ensure the file [**`global_air_pollution_data.csv`**](https://github.com/KANH12/Air-Quality-Analysis/blob/main/data/global_air_pollution_data.csv) exists.
     * This is the input dataset for all processing.

II. **Open the Notebook**

🗺️ Open the notebook file in one of the following ways:

  * **Option A: Jupyter Notebook (Web Interface)**: 

    - `jupyter notebook notebooks/data_processing.ipynb` → This will open the notebook in your default web browser.
    - Run each cell (Shift + Enter) to preprocess and clean the data.
    
  * **Option B: Visual Studio Code**

    - Open the folder in VS Code
    - Open `notebooks/data_processing.ipynb`
    - Run the notebook using the “Run All” button or `Shift + Enter` per cell.

---

## 🧩 Data Sources

* The dataset [**`global_air_pollution_data.csv`**](https://github.com/KANH12/Air-Quality-Analysis/blob/main/data/global_air_pollution_data.csv) – includes pollutant concentration data (PM2.5, Ozone, NO₂, CO) and computed AQI for major global cities.
* Data fields include:

  * `Country`, `City`
  * `Pollutant`

    * `PM2.5 value`, `PM2.5 category`
    * `Ozone value`, `Ozone category`
    * `NO₂ value`, `NO₂ category`
    * `CO value`, `CO category`

  * `AQI value` and `AQI category`

---

## ⛮ Data Processing

Performed in [**`data_processing.ipynb`**](https://github.com/KANH12/Air-Quality-Analysis/blob/main/notebooks/data_processing.ipynb) using Python libraries:

1. **Data Cleaning**
   * Renamed columns to standardized and readable names.
   * Check duplicate value column `city`
   * Handled missing values by removing, **particularly those with null Country fields**
 
     * `Records with null Country values were removed because, although other columns (including City) had data, each city appeared only once in the raw dataset. Without national reference data or repeated city entries, it was impossible to determine the corresponding country, so these records were excluded.`

   * Filtered out invalid or inconsistent data points to ensure data quality.
2. **Data Transformation** – **No additional data conversion was required.**
3. **Output** 
  * Export cleaned dataset (**`clean_air_quality.xlsx`**)
  * Loads the same dataset into PostgreSQL for SQL-based analysis.

---

## 🗄️ Database Integration (PostgreSQL)

The project integrates with PostgreSQL to execute analytical queries for deeper air quality exploration.

Folder [`sql_scripts/`](https://github.com/KANH12/Air-Quality-Analysis/tree/main/sql_scripts) contains queries for data exploration and analysis:
 * [`air_pollutant_share_by_type.sql`](https://github.com/KANH12/Air-Quality-Analysis/blob/main/sql_scripts/air_pollutant_share_by_type.sql) → Compares pollutant proportions by type
 * [`countries_and_city_larger_zero.sql`](https://github.com/KANH12/Air-Quality-Analysis/blob/main/sql_scripts/countries_and_city_larger_zero.sql) → Filters valid countries/cities
 * [`global_AQI_value_distribution.sql`](https://github.com/KANH12/Air-Quality-Analysis/blob/main/sql_scripts/global_AQI_value_distribution.sql) → Analyzes global AQI range distributions
 * [`pollutants_with_the_greatest_impact_on_global_average_AQI.sql`](https://github.com/KANH12/Air-Quality-Analysis/blob/main/sql_scripts/pollutants_with_the_greatest_impact_on_global_average_AQI.sql) → Identifies major pollution drivers
  
💡 All SQL scripts operate on the cleaned dataset loaded into PostgreSQL from the ETL pipeline.

---

## ⚙️ Data Pipeline Overview (ETLV)

This project follows a complete ETLV (Extract – Transform – Load – Visualize) workflow that connects multiple tools for end-to-end data analysis.

1. **Extract**

   * Collected [**`global_air_pollution_data.csv`**](https://github.com/KANH12/Air-Quality-Analysis/blob/main/data/global_air_pollution_data.csv) format from [**Global Air Quality dataset**](https://www.kaggle.com/datasets/hasibalmuzdadid/global-air-pollution-dataset)
   * The dataset includes pollutant readings (PM2.5, NO₂, CO, O₃), AQI values, and geographic metadata.

2. **Transform and Cleaning**

   * Cleaned and standardized raw data using Python (Pandas) in [**`data_processing.ipynb`**](https://github.com/KANH12/Air-Quality-Analysis/blob/main/notebooks/data_processing.ipynb).
   * Task performed:

     * Handle missing values and rename columns
     * Filter invalid values (to avoid meaningless or corrupted data)
     * Prepare structured data for analysis
     
   *`No further transformation was required since the dataset already contained all necessary columns.`*
   
3. **Load**
   
   * Exported transformed data to:
     * [**`clean_air_quality.xlsx`**](https://github.com/KANH12/Air-Quality-Analysis/blob/main/data/clean_air_quality.xlsx) → used in Power BI for visualization
     * **PostgreSQL** → used for intermediate SQL analysis (queries in [**`/sql_scripts/`**](https://github.com/KANH12/Air-Quality-Analysis/tree/main/sql_scripts))

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

The project contains two interactive dashboards, designed for multi-dimensional analysis that highlights key air quality metrics.

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

## 📦 Output Files

  * **Excel**: [**`clean_air_quality.xlsx`**](https://github.com/KANH12/Air-Quality-Analysis/blob/main/data/clean_air_quality.xlsx) 
  * **SQL**: [`sql_scripts/`](https://github.com/KANH12/Air-Quality-Analysis/tree/main/sql_scripts) runs on PostgreSQL
  * **Power BI**: [dashboard.pbix](https://github.com/KANH12/Air-Quality-Analysis/blob/main/dashboard/dashboard.pbix) 

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

**Le Nguyen Bao Khang [Khngzxz]**

*Data Analyst | Skilled in Python, SQL & Power BI*

 * 📧 **baokhang1608@gmail.com**
 * 🔗 [GitHub](https://github.com/KANH12) |  [Linkedln](https://www.linkedin.com/in/khang-le-310131329/)
   
---

## 📎 Notes

* Screenshots in this documentation correspond to the Power BI dashboard views:

  *Overview Dashboard* ![Dashboard Overview](https://github.com/KANH12/Air-Quality-Analysis/blob/main/dashboard/overview.png?raw=true)
    
  *Global Air Quality by Pollutant and Country* ![Pollutant Impact Dashboard](https://github.com/KANH12/Air-Quality-Analysis/blob/main/dashboard/pollutant.png?raw=true)
* Ensure the file paths are correct when connecting [`clean_air_quality.xlsx`](https://github.com/KANH12/Air-Quality-Analysis/blob/main/data/clean_air_quality.xlsx) to Power BI.

---

**© 2025 Khang – All rights reserved**
