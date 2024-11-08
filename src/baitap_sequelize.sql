-- Tạo bảng rate_res cho chức năng đánh giá
CREATE TABLE rate_res (
    rate_id INT PRIMARY KEY AUTO_INCREMENT,
    users_id INT,
    foods_id INT,
    amount INT, -- Số điểm đánh giá (ví dụ: 1-5 sao)
    date_rate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (users_id) REFERENCES users(users_id),
    FOREIGN KEY (foods_id) REFERENCES foods(foods_id)
);

-- Thêm dữ liệu mẫu cho bảng rate_res
INSERT INTO rate_res (users_id, foods_id, amount) VALUES
(1, 1, 5),
(1, 2, 4),
(2, 1, 3),
(3, 3, 5),
(4, 2, 4),
(5, 1, 5),
(2, 3, 4),
(3, 2, 3),
(4, 1, 5),
(5, 3, 4);



