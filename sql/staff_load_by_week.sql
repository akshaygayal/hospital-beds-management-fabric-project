SELECT
    week,
    COUNT(DISTINCT staff_id) AS num_staff,
    SUM(present) AS total_presence
FROM staff_schedule
GROUP BY week
HAVING COUNT(DISTINCT staff_id) >= 5
ORDER BY total_presence DESC;
