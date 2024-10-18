--  bảng users (người dùng)
CREATE TABLE users (
    users_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    pass_word VARCHAR(255)
);

--  bảng foods (món ăn)
CREATE TABLE foods (
    foods_id INT PRIMARY KEY AUTO_INCREMENT,
    foods_name VARCHAR(255),
    description VARCHAR(255)
);

--  bảng orders (đơn hàng)
CREATE TABLE orders (
    orders_id INT PRIMARY KEY AUTO_INCREMENT,
    users_id INT,
    foods_id INT,
    FOREIGN KEY (users_id) REFERENCES users(users_id),
    FOREIGN KEY (foods_id) REFERENCES foods(foods_id)
);

--  bảng like_res (lượt thích nhà hàng)
CREATE TABLE like_res (
    user_id INT,
    res_id INT,
    date_like DATETIME,
    PRIMARY KEY (user_id, res_id),
    FOREIGN KEY (user_id) REFERENCES users(users_id)
);

--  bảng restaurant (nhà hàng)
CREATE TABLE restaurant (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(255),
    image VARCHAR(255),
    description VARCHAR(255)
);

-- bảng rate_res (đánh giá nhà hàng)
CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(users_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- 2

--  dữ liệu vào bảng users
INSERT INTO users (full_name, email, pass_word) VALUES
('Nguyen Van A', 'A@gmail.com', '1234'),
('Nguyen Van B', 'B@gmail.com', '1234'),
('Nguyen Van C', 'C@gmail.com', '1234'),
('Nguyen Van D', 'D@gmail.com', '1234'),
('Nguyen Van E', 'E@gmail.com', '1234'),
('Nguyen Van F', 'F@gmail.com', '1234'),
('Nguyen Van G', 'G@gmail.com', '1234'),
('Nguyen Van H', 'H@gmail.com', '1234'),
('Nguyen Van W', 'W@gmail.com', '1234'),
('Nguyen Van Z', 'Z@gmail.com', '1234');

--  dữ liệu vào bảng foods
INSERT INTO foods (foods_name, description) VALUES
('Bánh su kem', 'Bánh được làm từ kem'),
('Gỏi gà', 'Gỏi được làm từ gà'),
('Gỏi vịt', 'Gỏi được làm từ vịt'),
('Gỏi cá', 'Gỏi được làm từ cá'),
('Gỏi heo', 'Gỏi được làm từ heo');

-- T dữ liệu vào bảng orders
INSERT INTO orders (users_id, foods_id) VALUES
(1, 2),
(3, 1),
(2, 5),
(1, 3),
(3, 2);

--  dữ liệu vào bảng like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, NOW()),
(1, 2, NOW()),
(2, 1, NOW()),
(3, 3, NOW()),
(4, 2, NOW());


-- GIẢI BÀI TẬP
-- 1. Tìm 5 người đã like nhà hàng nhiều nhất
SELECT user_id, COUNT(*) AS like_count
FROM like_res
GROUP BY user_id
ORDER BY like_count DESC
LIMIT 5;

-- 2. Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT res_id, COUNT(*) AS like_count
FROM like_res
GROUP BY res_id
ORDER BY like_count DESC
LIMIT 2;

-- 3. Tìm người đã đặt hàng nhiều nhất
SELECT users_id, COUNT(*) AS order_count
FROM orders
GROUP BY users_id
ORDER BY order_count DESC
LIMIT 1;

-- 4. Tìm người dùng không hoạt động trong hệ thống
SELECT u.users_id, u.full_name
FROM users u
LEFT JOIN orders o ON u.users_id = o.users_id
LEFT JOIN like_res lr ON u.users_id = lr.user_id
LEFT JOIN rate_res rr ON u.users_id = rr.user_id
WHERE o.users_id IS NULL 
  AND lr.user_id IS NULL 
  AND rr.user_id IS NULL;
