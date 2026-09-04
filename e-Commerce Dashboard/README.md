# e-Commerce Intelligence Dashboard
e-Commerce Intelligence Dashboard
e-Commerce Intelligence is a two-page Power BI dashboard developed to evaluate the commercial performance and operational risk of an e-commerce order dataset. The report converts 1,200 order records into an executive view of revenue, product contribution, acquisition-channel performance, cancellations, returns, payment-method risk, and coupon effectiveness.

The dashboard builds on the cleaned and validated dataset produced during an earlier data-cleaning and exploratory-analysis project.

## Dashboard Objectives

The dashboard was designed to answer the following questions:

1. How much revenue was generated, and what was the average value per order?
2. Which products contributed the most revenue?
3. Which referral sources generated the most revenue and orders?
4. What proportion of orders was cancelled or returned?
5. Which products and payment methods exceeded the overall risk baseline?
6. Did coupon usage materially affect average order value or order risk?

## Dashboard Preview

### Page 1 — Revenue & Growth Overview

![Revenue and Growth Overview](images/page-1-revenue-growth.png)

Page 1 presents the principal commercial KPIs, product revenue contribution, and referral-source performance.

### Page 2 — Risk & Retention Intelligence

![Risk and Retention Intelligence](images/page-2-risk-retention.png)

Page 2 examines cancellation and return exposure across products, payment methods, and coupon groups. Conditional formatting identifies categories above, near, and below the overall risk baseline.

## Key Performance Indicators

| KPI | Result | Definition |
|---|---:|---|
| Total Revenue | ₦1,264,761.96 | Sum of `TotalPrice` across all orders |
| Total Orders | 1,200 | Distinct count of `OrderID` |
| Average Order Value | ₦1,053.97 | Total revenue divided by total orders |
| Fulfilled/Non-risk Rate | 58.58% | Orders not classified as Cancelled or Returned |
| Overall Risk Rate | 41.42% | Orders classified as Cancelled or Returned |

> **Metric note:** In this report, the card labelled **Fulfilled Rate** represents the complement of the cancellation/return risk rate. It therefore includes Pending, Shipped, and Delivered orders. It should not be interpreted as Delivered orders only.

## Key Findings

### Revenue and growth

- Total revenue was **₦1.26 million** across **1,200 orders**.
- Average order value was approximately **₦1.05K**.
- Chair and Printer were the leading products by revenue, each generating approximately **₦196K**.
- Phone recorded the lowest product revenue at approximately **₦152K**.
- Instagram was the strongest acquisition source, contributing **259 orders** and approximately **₦0.28M** in revenue.
- Referral recorded the lowest order volume and revenue among the five acquisition sources.

### Risk and retention

- **497 orders** were cancelled or returned, producing an overall risk rate of **41.42%**.
- Monitor, Tablet, and Laptop recorded risk rates above the overall baseline.
- Gift Card had the highest payment-method risk rate at **44.35%**.
- Online payment had the lowest payment-method risk rate at **35.27%**.
- Coupon groups showed only modest variation in average order value.
- WINTER15 recorded the highest coupon-group risk rate, while SAVE10 recorded the lowest.

## Business Recommendations

1. Investigate checkout, fulfilment, and post-purchase processes because the high cancellation/return rate is distributed across several product and payment segments.
2. Review Monitor, Tablet, and Laptop orders to identify recurring fulfilment, product-description, delivery, or customer-expectation issues.
3. Examine Gift Card, Credit Card, and Cash transactions for authentication, payment-completion, and refund-process friction.
4. Maintain or expand Instagram acquisition activity while testing improvements to the Referral programme.
5. Evaluate coupon codes using incremental revenue and promotional cost, as the available data does not show a strong improvement in order value or risk.

## Dashboard Design

The report uses a consistent executive visual system:

- Navy report headers and white visual containers
- Blue and teal for commercial performance
- Red for risk above the 41.42% baseline
- Amber for categories within two percentage points below the baseline
- Green for categories more than two percentage points below the baseline
- A shared 0%–50% axis across the product and payment risk charts

## Tools and Techniques

- **Power Query:** data import and type validation
- **Power BI:** data modelling, interactive reporting, and visual design
- **DAX:** KPI, revenue, order, and risk calculations
- **Conditional formatting:** dynamic risk classification

## Repository Structure

```text
e-commerce-powerbi-dashboard/
│
├── README.md
├── dashboard/
│   └── e-commerce-Intelligence-Dashboard.pbix
├── data/
│   └── ecommerce-cleaned-data.xlsx
├── images/
│   ├── page-1-revenue-growth.png
│   └── page-2-risk-retention.png
├── documentation/
│   ├── dax-measures.md
└── LICENSE
```

## Limitations

- The dataset contains 1,200 records and may not represent the transaction patterns of a real commercial operation.
- Revenue represents recorded order value and does not account for product cost, discounts, refunds, taxes, or shipping expense.
- The dataset does not contain profit, customer demographics, geographical regions, or promotional cost.
- The fulfilled/non-risk rate includes Pending orders because it is defined as orders that were neither Cancelled nor Returned.
- The dashboard identifies descriptive patterns and does not establish causal relationships.

## Author

**Muhammed Suleiman**  

---

*Mavora is a fictional portfolio brand created for this analytical project.*
