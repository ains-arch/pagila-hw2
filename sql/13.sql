/*
 * Create a report that shows the total number of rentals per year and month.
 *
 * HINT:
 * The ROLLUP clause is a convenient syntactic sugar for complicated combinations of GROUP BY and UNION clauses.
 * Although we won't cover this syntax in class, there is a great tutorial at
 * <https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-rollup/>.
 * The tutorial is based off of the pagila database's rental table,
 * and contains a query that almost solves this problem.
 */
SELECT
    EXTRACT(YEAR FROM rental_year_month) AS "Year",
    EXTRACT(MONTH FROM rental_year_month) AS "Month",
    COUNT(*) AS "Total Rentals"
FROM (
    SELECT
        DATE_TRUNC('month', rental_date) AS rental_year_month
    FROM
        rental
) AS rental_years_months
GROUP BY
    ROLLUP("Year", "Month")
ORDER BY
    "Year", "Month";
