# **Exploratory Data Analysis**

_Exploratory Data Analysis_ (EDA) is a professional seeting not about randomly generating charts to see what looks interesting. It is a disciplined, systematic interrogation of the dataset to uncover underlying structures, test assumptions, and translate raw numbers into actionable business strategy.

In The industry, the difference between a junior and senior data professional lies in intent. A junior plot everything; an industry-level analyst approaches the data with specific hypotheses and follows a rigorous, four-pillar framework.

### **1. Univariate Analysis (The Foundation)**

Before comparing variables, we must understand them in isolation, this phase is about determining the "Shape" of our data.

- **Numerical Data (e.g., CostPerUnit)**: We measure central tendency (mean, median) and dispersion (standard deviation, variance). We look for skewness and identify severe outliers using histograms and boxplots.

- **Categorical Data (e.g., DeliveryStatus, Region)**: We analyze frequency distributions. If 90% of our shipments are in the "North" region, that imbalance dictates how we interpret all subsequent regional metrics.


### **2. Bivariate & Multivariate Analysis (The Relationships)**

This is where we begin connecting the dots to see how variables influence one another.

- **Numeric vs. Numeric**: Using scatter plots and correlation matrices to find relationships (e.g., does a higher `QuantityReview` correlate with a lower `CostPerUnit` due to bulk discounts?).

- **Numeric vs. Categorical:** Using grouped bar charts or violin plots to compare distributions across groups (e.g., comparing the average `CostPerUnit` across different `ProductCategory` types).

- **Categorical vs. Categorical**: Using staked bar charts or contignecy tables to see if certain categories frequently co-occur (e.g., does the 'West' region have a disproportionately high rate of 'Delayed' statuses?).


### **3. Temporal Analysis (The Logistic Reality)**

In logistics and supply chain data, time is often the most critical dimension.

- We plot metrics along a time axis (using our `DateReview` column) to identify trends, seasonality, or sudden bottlenecks.

- We ask process-oriented questions: Are shipping costs spiking in specific months? Are delays happening more frquently at the end of the quarter?


### **4. Business Hypothesis Testing**

The final phase ties the mathematical findings directly to the business bottom line. We stop asking "What does that data do?" and start asking "Why does the business care?" If we find a cluster of delayed shipments in the East region, we calculate the financial impact of those delays to prioritize a solution.