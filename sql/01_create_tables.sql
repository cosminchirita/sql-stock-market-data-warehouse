CREATE TABLE companies (
    company_id INTEGER PRIMARY KEY AUTOINCREMENT,
    ticker TEXT NOT NULL UNIQUE,
    company_name TEXT NOT NULL,
    sector TEXT,
    exchange TEXT
);

CREATE TABLE stock_prices (
    price_id INTEGER PRIMARY KEY AUTOINCREMENT,
    company_id INTEGER NOT NULL,
    price_date DATE NOT NULL,
    open_price REAL,
    high_price REAL,
    low_price REAL,
    close_price REAL,
    volume INTEGER,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE technical_indicators (
    indicator_id INTEGER PRIMARY KEY AUTOINCREMENT,
    company_id INTEGER NOT NULL,
    indicator_date DATE NOT NULL,
    ma50 REAL,
    ma200 REAL,
    rsi REAL,
    macd REAL,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE news_sentiment (
    news_id INTEGER PRIMARY KEY AUTOINCREMENT,
    company_id INTEGER NOT NULL,
    news_date DATE NOT NULL,
    headline TEXT,
    sentiment_score REAL,
    sentiment_label TEXT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);