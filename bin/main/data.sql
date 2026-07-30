-- 초기 사용자 데이터
INSERT INTO users (username, password, email, balance, created_at, updated_at) VALUES
('user1', 'password1', 'user1@example.com', 1000000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user2', 'password2', 'user2@example.com', 2000000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user3', 'password3', 'user3@example.com', 3000000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user4', 'password4', 'user4@example.com', 1500000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user5', 'password5', 'user5@example.com', 2500000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user6', 'password6', 'user6@example.com', 500000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 초기 주식 데이터
INSERT INTO stocks (code, name, current_price, previous_price, created_at, updated_at) VALUES
('005930', '삼성전자', 70000, 69000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('000660', 'SK하이닉스', 120000, 118000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('035420', 'NAVER', 200000, 195000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('035720', '카카오', 50000, 48000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('051910', 'LG화학', 450000, 440000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('005380', '현대차', 240000, 235000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('006400', '삼성SDI', 380000, 390000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('207940', '삼성바이오로직스', 850000, 840000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('068270', '셀트리온', 180000, 182000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('105560', 'KB금융', 75000, 74000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('055550', '신한지주', 48000, 47500, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('012330', '현대모비스', 260000, 255000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('028260', '삼성물산', 150000, 148000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('066570', 'LG전자', 95000, 97000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('003670', '포스코퓨처엠', 320000, 315000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('096770', 'SK이노베이션', 130000, 128000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 초기 포트폴리오(보유 종목) 데이터
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 10, 68000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '005930';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 3, 190000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '035420';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 1, 385000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '006400';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 5, 115000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user2' AND s.code = '000660';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 20, 47000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user2' AND s.code = '035720';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 1, 430000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user3' AND s.code = '051910';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 15, 69500, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user3' AND s.code = '005930';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 1, 830000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user4' AND s.code = '207940';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 6, 179000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user4' AND s.code = '068270';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 25, 73000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user5' AND s.code = '105560';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 12, 96000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user5' AND s.code = '066570';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 4, 258000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user6' AND s.code = '012330';
INSERT INTO portfolios (user_id, stock_id, quantity, average_price, created_at, updated_at)
SELECT u.id, s.id, 6, 149000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP FROM users u, stocks s WHERE u.username = 'user6' AND s.code = '028260';

-- 초기 거래 내역 데이터
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 10, 68000, 680000, DATEADD('DAY', -20, CURRENT_TIMESTAMP), DATEADD('DAY', -20, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '005930';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 3, 190000, 570000, DATEADD('DAY', -18, CURRENT_TIMESTAMP), DATEADD('DAY', -18, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '035420';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 1, 385000, 385000, DATEADD('DAY', -14, CURRENT_TIMESTAMP), DATEADD('DAY', -14, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '006400';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 2, 110000, 220000, DATEADD('DAY', -21, CURRENT_TIMESTAMP), DATEADD('DAY', -21, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '000660';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'SELL', 2, 119000, 238000, DATEADD('DAY', -5, CURRENT_TIMESTAMP), DATEADD('DAY', -5, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '000660';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 5, 115000, 575000, DATEADD('DAY', -19, CURRENT_TIMESTAMP), DATEADD('DAY', -19, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user2' AND s.code = '000660';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 20, 47000, 940000, DATEADD('DAY', -17, CURRENT_TIMESTAMP), DATEADD('DAY', -17, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user2' AND s.code = '035720';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 1, 195000, 195000, DATEADD('DAY', -21, CURRENT_TIMESTAMP), DATEADD('DAY', -21, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user2' AND s.code = '035420';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'SELL', 1, 198000, 198000, DATEADD('DAY', -3, CURRENT_TIMESTAMP), DATEADD('DAY', -3, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user2' AND s.code = '035420';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 2, 430000, 860000, DATEADD('DAY', -22, CURRENT_TIMESTAMP), DATEADD('DAY', -22, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user3' AND s.code = '051910';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 15, 69500, 1042500, DATEADD('DAY', -16, CURRENT_TIMESTAMP), DATEADD('DAY', -16, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user3' AND s.code = '005930';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'SELL', 1, 445000, 445000, DATEADD('DAY', -2, CURRENT_TIMESTAMP), DATEADD('DAY', -2, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user3' AND s.code = '051910';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 1, 830000, 830000, DATEADD('DAY', -15, CURRENT_TIMESTAMP), DATEADD('DAY', -15, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user4' AND s.code = '207940';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 8, 179000, 1432000, DATEADD('DAY', -13, CURRENT_TIMESTAMP), DATEADD('DAY', -13, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user4' AND s.code = '068270';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'SELL', 2, 185000, 370000, DATEADD('DAY', -4, CURRENT_TIMESTAMP), DATEADD('DAY', -4, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user4' AND s.code = '068270';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 30, 73000, 2190000, DATEADD('DAY', -25, CURRENT_TIMESTAMP), DATEADD('DAY', -25, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user5' AND s.code = '105560';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'SELL', 5, 76000, 380000, DATEADD('DAY', -6, CURRENT_TIMESTAMP), DATEADD('DAY', -6, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user5' AND s.code = '105560';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 12, 96000, 1152000, DATEADD('DAY', -10, CURRENT_TIMESTAMP), DATEADD('DAY', -10, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user5' AND s.code = '066570';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 4, 258000, 1032000, DATEADD('DAY', -8, CURRENT_TIMESTAMP), DATEADD('DAY', -8, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user6' AND s.code = '012330';
INSERT INTO transactions (user_id, stock_id, type, quantity, price, total_amount, transaction_date, created_at)
SELECT u.id, s.id, 'BUY', 6, 149000, 894000, DATEADD('DAY', -1, CURRENT_TIMESTAMP), DATEADD('DAY', -1, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user6' AND s.code = '028260';

-- 초기 거래 감사 로그 데이터
INSERT INTO trade_audit_logs (user_id, stock_id, type, message, total_assets, total_return_rate, created_at)
SELECT u.id, s.id, 'BUY', '매수 처리 완료: 삼성전자 10주 매수', 1620000, 3.5, DATEADD('DAY', -20, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '005930';
INSERT INTO trade_audit_logs (user_id, stock_id, type, message, total_assets, total_return_rate, created_at)
SELECT u.id, s.id, 'SELL', '매도 처리 완료: SK하이닉스 2주 매도', 1580000, 2.1, DATEADD('DAY', -5, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user1' AND s.code = '000660';
INSERT INTO trade_audit_logs (user_id, stock_id, type, message, total_assets, total_return_rate, created_at)
SELECT u.id, s.id, 'BUY', '매수 처리 완료: 카카오 20주 매수', 2410000, 1.8, DATEADD('DAY', -17, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user2' AND s.code = '035720';
INSERT INTO trade_audit_logs (user_id, stock_id, type, message, total_assets, total_return_rate, created_at)
SELECT u.id, s.id, 'SELL', '매도 처리 완료: 삼성바이오로직스 관련 포트폴리오 조정', 3210000, -0.4, DATEADD('DAY', -2, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user3' AND s.code = '051910';
INSERT INTO trade_audit_logs (user_id, stock_id, type, message, total_assets, total_return_rate, created_at)
SELECT u.id, s.id, 'BUY', '매수 처리 완료: 셀트리온 8주 매수', 1890000, 4.2, DATEADD('DAY', -13, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user4' AND s.code = '068270';
INSERT INTO trade_audit_logs (user_id, stock_id, type, message, total_assets, total_return_rate, created_at)
SELECT u.id, s.id, 'BUY', '매수 처리 완료: KB금융 30주 매수', 2760000, 6.7, DATEADD('DAY', -25, CURRENT_TIMESTAMP) FROM users u, stocks s WHERE u.username = 'user5' AND s.code = '105560';
