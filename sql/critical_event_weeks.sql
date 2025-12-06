WITH weekly_services AS (
    SELECT
        week,
        SUM(patients_request) AS total_requests,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        ROUND(AVG(patient_satisfaction), 2) AS avg_service_satisfaction,
        MAX(event) AS event
    FROM services_weekly
    GROUP BY week
),
weekly_patients AS (
    SELECT
        WEEKOFYEAR(arrival_date) AS week,
        COUNT(*) AS num_patients,
        ROUND(AVG(satisfaction), 2) AS avg_patient_satisfaction
    FROM patients
    GROUP BY WEEKOFYEAR(arrival_date)
)
SELECT
    ws.week,
    ws.total_requests,
    ws.total_admitted,
    ws.total_refused,
    ws.avg_service_satisfaction,
    ws.event,
    wp.num_patients,
    wp.avg_patient_satisfaction,
    (ws.total_requests - ws.total_admitted) AS pressure_score
FROM weekly_services ws
LEFT JOIN weekly_patients wp
    ON ws.week = wp.week
WHERE ws.total_requests > 250
   OR ws.event = 'flu'
ORDER BY ws.week ASC;
