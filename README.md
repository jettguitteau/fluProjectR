# Flu Trends vs Outpatient Visits

This project explores the correlation between Google Trends searches for "flu symptoms" and CDC Influenza-Like Illness (ILI) outpatient visits, to see if an accurate linear regression model can be used to predict ILI visits from Google searches.

---

## Project Overview

- **Goal:** Examine whether Google Trends data can predict flu activity and how COVID-19 changed that relationship.
- **Data sources:**
  - **Google Trends:** Searches for "flu symptoms" in the US from 2014–2026 using the `gtrendsR` package
  - **CDC ILI Data:** Weekly outpatient visit data aggregated by month (2015–2026)
- **Analysis:** 
  - Linear regression on aggregated data  
  - Train/test split to evaluate predictive performance  
  - Correlation comparisons pre- and post-COVID
- **Visualization:** Trends over time of ILI visits and Google trends, scatterplot comparing search hits and mean ILI activity, plotted ML model with LOESS smoother.

---

## How to View the Report

The full report contains all code, plots, and analysis. It is rendered in HTML using Quarto and hosted via GitHub Pages:

[View the live report](https://jettguitteau.github.io/fluProjectR/)

---

## File Structure

- `scripts/` — R scripts and Quarto `.qmd` file  
- `index.html` — rendered report (GitHub Pages)  

---

## Notes

- The HTML report is **self-contained**, so it can be opened locally without missing assets.  
- All analysis was performed in R using `tidyverse`, `ggplot2`, `lubridate`, and `gtrendsR`.
