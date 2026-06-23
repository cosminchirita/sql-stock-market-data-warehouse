INSERT INTO companies (ticker, company_name, sector, exchange)
VALUES
('AAPL', 'Apple Inc.', 'Technology', 'NASDAQ'),
('MSFT', 'Microsoft Corporation', 'Technology', 'NASDAQ'),
('NVDA', 'NVIDIA Corporation', 'Technology', 'NASDAQ'),
('TSLA', 'Tesla Inc.', 'Consumer Cyclical', 'NASDAQ');

INSERT INTO stock_prices (
    company_id, price_date, open_price, high_price, low_price, close_price, volume
)
VALUES
(1, '2026-01-01', 180, 185, 178, 184, 75000000),
(1, '2026-01-02', 184, 188, 182, 187, 69000000),
(1, '2026-01-03', 187, 190, 185, 189, 72000000),

(2, '2026-01-01', 390, 395, 388, 392, 42000000),
(2, '2026-01-02', 392, 398, 391, 397, 45000000),
(2, '2026-01-03', 397, 402, 394, 400, 47000000),

(3, '2026-01-01', 850, 870, 840, 865, 55000000),
(3, '2026-01-02', 865, 890, 860, 885, 58000000),
(3, '2026-01-03', 885, 900, 875, 895, 60000000),

(4, '2026-01-01', 240, 248, 235, 245, 90000000),
(4, '2026-01-02', 245, 252, 242, 250, 87000000),
(4, '2026-01-03', 250, 260, 248, 258, 93000000);

INSERT INTO technical_indicators (
    company_id, indicator_date, ma50, ma200, rsi, macd
)
VALUES
(1, '2026-01-03', 181.50, 170.20, 58.4, 1.25),
(2, '2026-01-03', 392.30, 370.80, 61.2, 1.80),
(3, '2026-01-03', 870.10, 790.40, 67.8, 2.90),
(4, '2026-01-03', 246.70, 230.50, 55.1, 0.95);

INSERT INTO news_sentiment (
    company_id, news_date, headline, sentiment_score, sentiment_label
)
VALUES
(1, '2026-01-03', 'Apple reports strong services growth', 0.65, 'Bullish'),
(2, '2026-01-03', 'Microsoft expands AI cloud business', 0.72, 'Bullish'),
(3, '2026-01-03', 'NVIDIA demand remains strong for AI chips', 0.81, 'Bullish'),
(4, '2026-01-03', 'Tesla faces margin pressure in EV market', -0.35, 'Bearish');