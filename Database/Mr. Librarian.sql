--
-- CREATE TABLE member (
--     member_id VARCHAR(10) PRIMARY KEY,
--     member_name VARCHAR(100),
--     phone VARCHAR(20) UNIQUE,
--     email VARCHAR(100) UNIQUE
-- );

-- 
-- CREATE TABLE book (
--     book_id VARCHAR(10) PRIMARY KEY,
--     title VARCHAR(200),
--     author VARCHAR(100),
--     publisher VARCHAR(100),
--     category VARCHAR(100),
--     total_copies INT,
--     available_copies INT
-- );

-- 
-- CREATE TABLE borrow (
--     borrow_id VARCHAR(10) PRIMARY KEY,
--     member_id VARCHAR(10),
--     borrow_date DATE DEFAULT (CURRENT_DATE),
--     due_date DATE DEFAULT (CURRENT_DATE + INTERVAL 2 MONTH),
--     book_id VARCHAR(10),

--     CONSTRAINT fk_borrow_member
--         FOREIGN KEY (member_id) REFERENCES member(member_id),
--     
--     CONSTRAINT fk_borrow_book
--         FOREIGN KEY (book_id) REFERENCES book(book_id)
-- );

-- 
-- CREATE TABLE return_book (
--     return_id VARCHAR(10) PRIMARY KEY,
--     borrow_id VARCHAR(10),
--     return_date DATE DEFAULT (CURRENT_DATE),
--     fine_amount DECIMAL(10,2),

--     CONSTRAINT fk_return_borrow
--         FOREIGN KEY (borrow_id) REFERENCES borrow(borrow_id)
-- );

--
-- CREATE TABLE user_validation (
--     username VARCHAR(50) NOT NULL,
--     password VARCHAR(255) NOT NULL
-- );

### Default IDs:
-- DELIMITER $$

-- CREATE TRIGGER trg_member_id
-- BEFORE INSERT ON member
-- FOR EACH ROW
-- BEGIN
--     DECLARE last_id INT;

--     SELECT IFNULL(MAX(CAST(SUBSTRING(member_id, 2) AS UNSIGNED)), 0)
--     INTO last_id
--     FROM member;

--     SET NEW.member_id = CONCAT('M', LPAD(last_id + 1, 3, '0'));
-- END$$

-- DELIMITER ;

-- DELIMITER $$

-- CREATE TRIGGER trg_book_id
-- BEFORE INSERT ON book
-- FOR EACH ROW
-- BEGIN
--     DECLARE last_id INT;

--     SELECT IFNULL(MAX(CAST(SUBSTRING(book_id, 2) AS UNSIGNED)), 0)
--     INTO last_id
--     FROM book;

--     SET NEW.book_id = CONCAT('B', LPAD(last_id + 1, 3, '0'));
-- END$$

-- DELIMITER ;

-- DELIMITER $$

-- CREATE TRIGGER trg_borrow_id
-- BEFORE INSERT ON borrow
-- FOR EACH ROW
-- BEGIN
--     DECLARE last_id INT;

--     SELECT IFNULL(MAX(CAST(SUBSTRING(borrow_id, 3) AS UNSIGNED)), 0)
--     INTO last_id
--     FROM borrow;

--     SET NEW.borrow_id = CONCAT('BR', LPAD(last_id + 1, 3, '0'));
-- END$$

-- DELIMITER ;

-- DELIMITER $$

-- CREATE TRIGGER trg_return_id
-- BEFORE INSERT ON return_book
-- FOR EACH ROW
-- BEGIN
--     DECLARE last_id INT;

--     SELECT IFNULL(MAX(CAST(SUBSTRING(return_id, 2) AS UNSIGNED)), 0)
--     INTO last_id
--     FROM return_book;

--     SET NEW.return_id = CONCAT('R', LPAD(last_id + 1, 3, '0'));
-- END$$

-- DELIMITER ;

-- SET SQL_SAFE_UPDATES = 0;

-- UPDATE return_book rb
-- JOIN borrow b ON rb.borrow_id = b.borrow_id
-- SET rb.fine_amount = IF(DATEDIFF(CURDATE(), b.borrow_date) > 1,
--                         DATEDIFF(CURDATE(), b.borrow_date)/5,
--                         0.00);

-- SET SQL_SAFE_UPDATES = 1;

select * from return_book;


