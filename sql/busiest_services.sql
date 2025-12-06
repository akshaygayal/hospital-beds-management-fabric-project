SELECT
    service,
    COUNT(*) AS num_patients,
    ROUND(AVG(satisfaction), 2) AS avg_satisfaction
FROM patients
GROUP BY service
ORDER BY num_patients DESC;
