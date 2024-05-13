
-- Create the database
CREATE DATABASE  library;

-- Use the database
USE library;

-- Create the Branch table
CREATE TABLE  Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(50),
    Contact_no VARCHAR(15)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES (1, 101, '123 Main St', '123-456-7890'),(2, 102, '456 Elm St', '987-654-3210'),
(3, 103, '789 Oak St', '555-555-5555'),(4, 104, '321 Maple St', '111-222-3333'),
(5, 105, '567 Pine St', '444-444-4444');

select * from Branch;

-- Create the Employee table
CREATE TABLE  Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'John Doe', 'Librarian', 50000.00, 1),(202, 'Jane Smith', 'Assistant Librarian', 40000.00, 1),
(203, 'Bob Johnson', 'Librarian', 52000.00, 2),(204, 'Emily Davis', 'Assistant Librarian', 42000.00, 2),
(205, 'David Wilson', 'Librarian', 55000.00, 3),(206, 'Sarah Brown', 'Assistant Librarian', 45000.00, 3),
(207, 'Michael Lee', 'Librarian', 48000.00, 4),(208, 'Jennifer Taylor', 'Assistant Librarian', 38000.00, 4);

select * from Employee;

-- Create the Books table
CREATE TABLE  Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('9780132350884', 'Introduction to Algorithms', 'Computer Science', 30.00, 'yes', 'Thomas H. Cormen', 'MIT Press'),
('9780201835953', 'The Art of Computer Programming', 'Computer Science', 35.00, 'yes', 'Donald E. Knuth', 'Addison-Wesley'),
('9780321751041', 'Clean Code: A Handbook of Agile Software Craftsmanship', 'Software Development', 25.00, 'yes', 'Robert C. Martin', 'Prentice Hall'),
('9780132350885', 'To Kill a Mockingbird', 'Fiction', 20.00, 'yes', 'Harper Lee', 'HarperCollins'),
('9780451524935', '1984', 'Fiction', 22.00, 'yes', 'George Orwell', 'Signet Classic'),
('9780743273565', 'The Great Gatsby', 'Fiction', 18.00, 'no', 'F. Scott Fitzgerald', 'Scribner'),
('9780743273566', 'The Catcher in the Rye', 'Fiction', 19.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('9780743273567', 'Lord of the Flies', 'Fiction', 21.00, 'yes', 'William Golding', 'Faber and Faber');

select * from Books;

-- Create the Customer table
CREATE TABLE  Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Alice Johnson', '456 Park Ave', '2023-01-15'),
(302, 'Bob Smith', '789 Lake St', '2023-02-20'),
(303, 'Charlie Brown', '123 Forest Rd', '2023-03-25'),
(304, 'Diana Williams', '789 River Dr', '2023-04-30'),
(305, 'Eva Taylor', '101 Hillside Ave', '2023-05-05'),
(306, 'Frank Wilson', '555 Sunset Blvd', '2023-06-10'),
(307, 'Grace Lee', '333 Ocean View Dr', '2023-07-15'),
(308, 'Henry Martinez', '777 Mountain Rd', '2023-08-20');

select * from Customer;

-- Create the IssueStatus table
CREATE TABLE  IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(401, 301, 'The Great Gatsby', '2023-01-20', '9780743273565'),
(402, 302, 'To Kill a Mockingbird', '2023-02-25', '9780132350885'),
(403, 303, '1984', '2023-03-30', '9780451524935'),
(404, 304, 'Introduction to Algorithms', '2023-04-05', '9780132350884'),
(405, 305, 'Lord of the Flies', '2023-05-10', '9780743273567'),
(406, 306, 'The Catcher in the Rye', '2023-06-15', '9780743273566'),
(407, 307, 'The Art of Computer Programming', '2023-07-20', '9780201835953'),
(408, 308, 'Clean Code: A Handbook of Agile Software Craftsmanship', '2023-08-25', '9780321751041');

select * from IssueStatus;

-- Create the ReturnStatus table
CREATE TABLE  ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, 'The Great Gatsby', '2023-01-25', '9780743273565'),
(502, 302, 'To Kill a Mockingbird', '2023-02-28', '9780132350885'),
(503, 303, '1984', '2023-04-02', '9780451524935'),
(504, 304, 'Introduction to Algorithms', '2023-04-10', '9780132350884'),
(505, 305, 'Lord of the Flies', '2023-05-15', '9780743273567'),
(506, 306, 'The Catcher in the Rye', '2023-06-20', '9780743273566'),
(507, 307, 'The Art of Computer Programming', '2023-07-25', '9780201835953'),
(508, 308, 'Clean Code: A Handbook of Agile Software Craftsmanship', '2023-08-30', '9780321751041');

select * from ReturnStatus;

#Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

#List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

#Retrieve the book titles and the corresponding customers who have issued those books.
SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issued_cust = C.Customer_Id
ORDER BY C.Customer_name;

# Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

#Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

#List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT DISTINCT C.Customer_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issued_cust IS NULL;

#Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(Emp_Id) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

#Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE I.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#Retrieve book_title from book table containing history.
SELECT Book_title
FROM Books
WHERE Category LIKE '%history%';

#Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;