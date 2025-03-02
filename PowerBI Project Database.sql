CREATE DATABASE FreelanceDB;
USE FreelanceDB;

-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    role ENUM('customer', 'freelancer'),
    phone VARCHAR(15),
    joined_date DATE
);

INSERT INTO Users (user_id, name, email, role, phone, joined_date) VALUES
(1, 'Alice Smith', 'alice@gmail.com', 'customer', '1234567890', '2024-01-10'),
(2, 'Bob Johnson', 'bob@gmail.com', 'freelancer', '9876543210', '2023-12-20'),
(3, 'Charlie Doe', 'charlie@gmail.com', 'customer', '5556667777', '2024-02-05'),
(4, 'Dave Clark', 'dave@gmail.com', 'freelancer', '1112223333', '2023-11-15'),
(5, 'Emma Brown', 'emma@gmail.com', 'customer', '7778889999', '2024-01-25'),
(6, 'Frank White', 'frank@gmail.com', 'freelancer', '3334445555', '2023-10-12'),
(7, 'Grace Adams', 'grace@gmail.com', 'customer', '2223334444', '2024-03-01'),
(8, 'Henry Scott', 'henry@gmail.com', 'freelancer', '6667778888', '2023-09-28'),
(9, 'Ivy Baker', 'ivy@gmail.com', 'customer', '9990001111', '2024-02-15'),
(10, 'Jack Wilson', 'jack@gmail.com', 'freelancer', '5556667771', '2023-08-21'),
(11, 'Kate Johnson', 'kate@gmail.com', 'customer', '7778889992', '2024-01-30'),
(12, 'Liam Ford', 'liam@gmail.com', 'freelancer', '3334445556', '2023-07-15'),
(13, 'Mia Davis', 'mia@gmail.com', 'customer', '2223334447', '2024-02-20'),
(14, 'Noah Smith', 'noah@gmail.com', 'freelancer', '6667778889', '2023-06-05'),
(15, 'Olivia Clarke', 'olivia@gmail.com', 'customer', '9990001113', '2024-03-10');

-- Services Table
CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(255),
    description TEXT,
    price_range VARCHAR(20)
);

INSERT INTO Services (service_id, service_name, description, price_range) VALUES
(1, 'Graphic Design', 'Logo, branding, UI/UX design', '50-500'),
(2, 'Web Development', 'Frontend & backend development', '100-1000'),
(3, 'Content Writing', 'Blogs, articles, copywriting', '30-300'),
(4, 'Digital Marketing', 'SEO, social media ads, campaigns', '50-600'),
(5, 'Video Editing', 'Promotional and YouTube videos', '70-700'),
(6, 'App Development', 'Android & iOS app creation', '200-2000'),
(7, 'Data Analysis', 'Statistical and ML models', '80-900'),
(8, 'Social Media Management', 'Handling business accounts', '40-400'),
(9, 'Translation', 'Multi-language translations', '30-350'),
(10, 'UI/UX Design', 'Mobile & web design', '90-950'),
(11, 'Voice Over', 'Commercial and narration', '60-600'),
(12, 'Resume Writing', 'Professional CV and cover letters', '40-250'),
(13, 'Virtual Assistance', 'Administrative tasks and scheduling', '35-300'),
(14, 'Presentation Design', 'Pitch decks & business presentations', '50-450'),
(15, 'Illustration', 'Custom artwork and designs', '70-800');

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    freelancer_id INT,
    service_id INT,
    booking_date DATE,
    status ENUM('Pending', 'In Progress', 'Completed'),
    FOREIGN KEY (customer_id) REFERENCES Users(user_id),
    FOREIGN KEY (freelancer_id) REFERENCES Users(user_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

INSERT INTO Bookings (booking_id, customer_id, freelancer_id, service_id, booking_date, status) VALUES
(101, 1, 2, 1, '2025-02-10', 'Completed'),
(102, 3, 4, 2, '2025-02-15', 'Pending'),
(103, 5, 6, 3, '2025-02-18', 'In Progress'),
(104, 7, 8, 4, '2025-02-20', 'Completed'),
(105, 9, 10, 5, '2025-02-22', 'Pending'),
(106, 11, 12, 6, '2025-02-25', 'Completed'),
(107, 13, 14, 7, '2025-02-28', 'In Progress'),
(108, 15, 2, 8, '2025-03-02', 'Completed'),
(109, 1, 4, 9, '2025-03-05', 'Pending'),
(110, 3, 6, 10, '2025-03-07', 'Completed'),
(111, 5, 8, 11, '2025-03-07', 'Completed'),
(112, 7, 10, 12, '2025-03-12', 'In Progress'),
(113, 9, 12, 13, '2025-03-15', 'Pending'),
(114, 11, 14, 14, '2025-03-18', 'Completed'),
(115, 13, 2, 15, '2025-03-20', 'Completed');

-- Reviews Table
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    service_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    FOREIGN KEY (customer_id) REFERENCES Users(user_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

INSERT INTO Reviews (review_id, customer_id, service_id, rating, review_text) VALUES
(201, 1, 1, 5, 'Great logo design, very professional!'),
(202, 3, 2, 4, 'Website was well-built, but minor issues.'),
(203, 5, 3, 5, 'Amazing writing, very engaging content!'),
(204, 7, 4, 3, 'SEO campaign helped, but expected better.'),
(205, 9, 5, 5, 'Excellent video editing, highly recommend!'),
(206, 11, 6, 4, 'App was good, but UI could be improved.'),
(207, 13, 7, 5, 'Best data analysis service, very insightful.'),
(208, 15, 8, 4, 'Social media growth improved significantly.'),
(209, 1, 9, 3, 'Translation was accurate but slow delivery.'),
(210, 3, 10, 5, 'Loved the UI/UX design, very intuitive!'),
(211, 5, 11, 4, 'Great voice-over, but took longer than expected.'),
(212, 7, 12, 5, 'Perfect resume, got me multiple interviews!'),
(213, 9, 13, 4, 'Virtual assistant was helpful and organized.'),
(214, 11, 14, 5, 'Excellent presentation, very creative!'),
(215, 13, 15, 5, 'Amazing illustrations, exceeded expectations!');

SELECT * FROM Reviews