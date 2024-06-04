CREATE TABLE tb_user (
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    age INT,
    role VARCHAR(20)
);

CREATE TABLE tb_questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT NOT NULL,
    option1 VARCHAR(255) NOT NULL,
    option2 VARCHAR(255) NOT NULL,
    option3 VARCHAR(255) NOT NULL,
    option4 VARCHAR(255) NOT NULL,
    answer INT NOT NULL
);

CREATE TABLE scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(20),
    score INT,
    date TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES tb_user(id)
);
