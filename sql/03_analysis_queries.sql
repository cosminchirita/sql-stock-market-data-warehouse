-- 1. Latest closing price by company
SELECT
    c.ticker,
    c.company_name,
    sp.price_date,
    sp.close_price
FROM stock_prices sp
JOIN companies c ON sp.company_id = c.company_id
WHERE sp.price_date = (
    SELECT MAX(price_date)
    FROM stock_prices
    WHERE company_id = sp.company_id
);

-- 2. Average closing price by company
SELECT
    c.ticker,
    ROUND(AVG(sp.close_price), 2) AS avg_close_price
FROM stock_prices sp
JOIN companies c ON sp.company_id = c.company_id
GROUP BY c.ticker;

-- 3. Daily return percentage
SELECT
    c.ticker,
    sp.price_date,
    sp.close_price,
    LAG(sp.close_price) OVER (
        PARTITION BY c.ticker
        ORDER BY sp.price_date
    ) AS previous_close,
    ROUND(
        (
            sp.close_price - LAG(sp.close_price) OVER (
                PARTITION BY c.ticker
                ORDER BY sp.price_date
            )
        ) / LAG(sp.close_price) OVER (
            PARTITION BY c.ticker
            ORDER BY sp.price_date
        ) * 100,
        2
    ) AS daily_return_pct
FROM stock_prices sp
JOIN companies c ON sp.company_id = c.company_id;

-- 4. Highest volume stocks
SELECT
    c.ticker,
    c.company_name,
    SUM(sp.volume) AS total_volume
FROM stock_prices sp
JOIN companies c ON sp.company_id = c.company_id
GROUP BY c.ticker, c.company_name
ORDER BY total_volume DESC;

-- 5. Technical signal analysis
SELECT
    c.ticker,
    ti.rsi,
    ti.macd,
    ti.ma50,
    ti.ma200,
    CASE
        WHEN ti.rsi < 30 THEN 'Oversold'
        WHEN ti.rsi > 70 THEN 'Overbought'
        ELSE 'Neutral'
    END AS rsi_signal,
    CASE
        WHEN ti.ma50 > ti.ma200 THEN 'Bullish Trend'
        ELSE 'Bearish Trend'
    END AS trend_signal
FROM technical_indicators ti
JOIN companies c ON ti.company_id = c.company_id;

-- 6. News sentiment summary
SELECT
    c.ticker,
    ns.sentiment_label,
    COUNT(*) AS news_count,
    ROUND(AVG(ns.sentiment_score), 2) AS avg_sentiment_score
FROM news_sentiment ns
JOIN companies c ON ns.company_id = c.company_id
GROUP BY c.ticker, ns.sentiment_label;