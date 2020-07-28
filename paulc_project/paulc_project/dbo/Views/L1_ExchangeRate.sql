create view L1_ExchangeRate
AS
	SELECT
			erev.ExchangeRate1 / 100 ExchangeRate,
			erev.FromCurrencyCode,
			erev.ValidFrom,
			erev.ValidTo,
			erev.[Partition]
		FROM
			dbo.ExchangeRateEffectiveView erev
			JOIN dbo.ExchangeRateType ert ON erev.ExchangeRateType = ert.RecId
		WHERE
			ert.Name = 'Default'
			AND erev.FromCurrencyCode <> 'USD'
			AND erev.ToCurrencyCode = 'USD'