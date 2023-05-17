SELECT
    RT.CAR_ID,
    RT.CAR_TYPE,
    ROUND(DAILY_FEE * 30 * ((100 - IFNULL(DISCOUNT_RATE, 0)) / 100), 0) AS 'FEE'
    
FROM CAR_RENTAL_COMPANY_CAR RT
    JOIN (
        SELECT *
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        GROUP BY CAR_ID
        HAVING MAX(END_DATE) < '2022-11-01'
    ) H ON RT.CAR_ID = H.CAR_ID
    LEFT JOIN (
        SELECT CAR_TYPE, DURATION_TYPE, DISCOUNT_RATE
        FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
        WHERE DURATION_TYPE = 30
    ) DC ON RT.CAR_TYPE = DC.CAR_TYPE

WHERE
    RT.CAR_TYPE IN ('세단', 'SUV')
    AND (DAILY_FEE * 30 * ((100 - IFNULL(DISCOUNT_RATE, 0)) / 100)) BETWEEN 500000 AND 2000000

ORDER BY FEE DESC, RT.CAR_TYPE ASC, RT.CAR_ID DESC