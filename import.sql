-- Tạo cơ sở dữ liệu nếu chưa tồn tại
CREATE DATABASE IF NOT EXISTS win68;
USE win68;

-- Tạo bảng users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    is_admin BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng transactions
CREATE TABLE IF NOT EXISTS transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    type ENUM('deposit', 'withdraw') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    bank_name VARCHAR(100),
    account_number VARCHAR(50),
    account_holder VARCHAR(100),
    transaction_code VARCHAR(50),
    status ENUM('pending', 'completed', 'rejected') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tạo bảng chart_results
CREATE TABLE IF NOT EXISTS chart_results (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dice1 INT NOT NULL,
    dice2 INT NOT NULL,
    dice3 INT NOT NULL,
    sum INT NOT NULL,
    result VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng current_bets
CREATE TABLE IF NOT EXISTS current_bets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    bet_type VARCHAR(50) NOT NULL,
    bet_amount DECIMAL(15, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Tạo bảng bet_history
CREATE TABLE IF NOT EXISTS bet_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    bet_amount DECIMAL(15, 2) NOT NULL,
    bet_choice VARCHAR(50) NOT NULL,
    result ENUM('Thắng', 'Thua') NOT NULL,
    win_amount DECIMAL(15, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);