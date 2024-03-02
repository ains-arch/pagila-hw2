/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */
SELECT
    feature as special_features,
    COUNT(*)
FROM (
    SELECT unnest(special_features) as feature
    FROM film
) AS features
GROUP BY feature
ORDER BY feature;
