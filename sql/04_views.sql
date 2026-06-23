CREATE VIEW company_market_summary AS
SELECT
    c.ticker,
    c.company_name,
    c.sector,
    c.exchange,
    MAX(sp.price_date) AS latest_date,
    ROUND(AVG(sp.close_price), 2) AS avg_close_price,
    SUM(sp.volume) AS total_volume
FROM companies c
JOIN stock_prices sp ON c.company_id = sp.company_id
GROUP BY c.ticker, c.company_name, c.sector, c.exchange;

CREATE VIEW technical_dashboard AS
SELECT
    c.ticker,
    c.company_name,
    ti.indicator_date,
    ti.ma50,
    ti.ma200,
    ti.rsi,
    ti.macd,
    CASE
        WHEN ti.rsi < 30 THEN 'Oversold'
        WHEN ti.rsi > 70 THEN 'Overbought'
        ELSE 'Neutral'
    END AS rsi_status,
    CASE
        WHEN ti.ma50 > ti.ma200 THEN 'Bullish'
        ELSE 'Bearish'
    END AS trend_status
FROM technical_indicators ti
JOIN companies c ON ti.company_id = c.company_id;