-- 1. Bảng Users
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(128) NOT NULL,
    PRIMARY KEY (`id`)
);

-- 2. Bảng Schools
CREATE TABLE `schools` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `founded_year` INT NOT NULL,
    PRIMARY KEY (`id`)
);

-- 3. Bảng Companies
CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL UNIQUE,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

-- 4. Bảng Connections (Gộp chung theo yêu cầu README)
CREATE TABLE `connections` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `school_id` INT DEFAULT NULL,
    `company_id` INT DEFAULT NULL,
    `title` VARCHAR(255),
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
);
