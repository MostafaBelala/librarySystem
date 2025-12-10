
### member
-- CREATE TABLE member (
--     member_id int PRIMARY KEY AUTO_INCREMENT,
--     member_name VARCHAR(100),
--     phone VARCHAR(20) UNIQUE,
--     email VARCHAR(100) UNIQUE
-- );

### book
-- CREATE TABLE book (
--     book_id int PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(200),
--     author VARCHAR(100),
--     publisher VARCHAR(100),
--     category VARCHAR(100),
--     total_copies INT,
--     available_copies INT
-- );

### borrow
-- CREATE TABLE borrow (
--     borrow_id int PRIMARY KEY AUTO_INCREMENT,
--     member_id int,
--     borrow_date DATE default (CURRENT_DATE),
--     due_date DATE default (CURRENT_DATE + interval 2 month),
--     book_id int,

--     CONSTRAINT fk_borrow_member
--         FOREIGN KEY (member_id) REFERENCES member(member_id),
--     
--     CONSTRAINT fk_borrow_book
--         FOREIGN KEY (book_id) REFERENCES book(book_id)
-- );

### Return
-- CREATE TABLE return_book (
--     return_id int PRIMARY KEY AUTO_INCREMENT,
--     borrow_id int,
--     return_date DATE default (CURRENT_DATE),
--     fine_amount DECIMAL(10,2),

--     CONSTRAINT fk_return_borrow
--         FOREIGN KEY (borrow_id) REFERENCES borrow(borrow_id)
-- );

select * from borrow;


