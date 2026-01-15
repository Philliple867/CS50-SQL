-- 1. Bảng Users (Người dùng)
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
);

-- 2. Bảng Schools (Trường học)
CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `year_founded` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

-- 3. Bảng Companies (Công ty)
CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`)
);

-- 4. Kết nối giữa Người với Người
CREATE TABLE `connections_people` (
    `user_a_id` INT,
    `user_b_id` INT,
    FOREIGN KEY(`user_a_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_b_id`) REFERENCES `users`(`id`)
);

-- 5. Kết nối giữa Người với Trường học
CREATE TABLE `connections_schools` (
    `user_id` INT,
    `school_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `degree` VARCHAR(255),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

-- 6. Kết nối giữa Người với Công ty
CREATE TABLE `connections_companies` (
    `user_id` INT,
    `company_id` INT,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `title` VARCHAR(255),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
