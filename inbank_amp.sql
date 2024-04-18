SELECT
	trim_scale(SUM("sum")) AS "SUM(AMOUNT_EUR)",
	transaction_date AS "TRANSACTION_DATE"
FROM
	(SELECT
	 	SUM(amount) * COALESCE(cr.exchange_rate_to_eur, 1) AS "sum",
	 	transaction_date

	FROM payments pay
		LEFT JOIN currencies cur ON pay.currency = cur.currency_id
		LEFT JOIN blacklist bl ON pay.user_id_sender = bl.user_id
		LEFT JOIN currency_rates cr ON
	 		(cur.currency_id = cr.currency_id
			 AND cr.exchange_date = pay.transaction_date)

	WHERE cur.end_date IS null
	 	AND (bl.blacklist_code IS null
			 OR bl.blacklist_start_date > transaction_date)
	GROUP BY
	 transaction_date,
	 cr.exchange_rate_to_eur)

GROUP BY transaction_date
ORDER BY transaction_date ASC