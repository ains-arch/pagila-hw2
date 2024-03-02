/*
 * Create a report that shows the total revenue per month and year.
 *
 * HINT:
 * This query is very similar to the previous problem,
 * but requires an additional JOIN.
 */
SELECT
    EXTRACT(YEAR FROM rental_year_month) AS "Year",
    EXTRACT(MONTH FROM rental_year_month) AS "Month",
    SUM(p.amount) AS "Total Revenue"
FROM (
    SELECT
        DATE_TRUNC('month', rental_date) AS rental_year_month,
        rental_id
    FROM
        rental
) AS rental_years_months
LEFT JOIN payment p ON rental_years_months.rental_id = p.rental_id
GROUP BY
    ROLLUP("Year", "Month")
ORDER BY
    "Year", "Month";
