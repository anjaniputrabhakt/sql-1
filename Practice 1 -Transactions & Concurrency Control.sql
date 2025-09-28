DROP TABLE IF EXISTS FeePayments;

CREATE TABLE FeePayments (
    payment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) CHECK (amount > 0),
    payment_date DATE NOT NULL
);

START TRANSACTION;
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES 
    (1, 'Ashish', 5000.00, '2024-06-01'),
    (2, 'Smaran', 4500.00, '2024-06-02'),
    (3, 'Vaibhav', 5500.00, '2024-06-03');
COMMIT;

START TRANSACTION;
INSERT IGNORE INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES 
    (4, 'Kiran', 4800.00, '2024-06-04'),
    (1, 'Ashish', -3000.00, '2024-06-05');
COMMIT;

START TRANSACTION;
INSERT IGNORE INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES 
    (5, 'Mehul', 6000.00, '2024-06-06'),
    (6, NULL, 7000.00, '2024-06-07');
COMMIT;

START TRANSACTION;
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES 
    (7, 'Sneha', 4700.00, '2024-06-08'),
    (8, 'Arjun', 4900.00, '2024-06-09');
COMMIT;

SELECT payment_id, student_name, amount, payment_date
FROM FeePayments
WHERE payment_id IN (1,2,3,7,8)
ORDER BY payment_id;
