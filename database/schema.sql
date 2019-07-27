
DROP DATABASE IF EXISTS trello;
CREATE DATABASE trello;

USE trello;

CREATE TABLE users (
    id VARCHAR(36) UNIQUE NOT NULL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    email_address VARCHAR(254) UNIQUE NOT NULL,
    password VARCHAR(60) UNIQUE NOT NULL
);


CREATE TABLE access_groups (
    id INT AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE users_acess_groups_links (
    rel_type ENUM('OWNER', 'SHARE', 'ORG') NOT NULL,
    access_mod ENUM('ADMIN', 'MEMBER', 'VIEWER') NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    access_group_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (access_group_id) REFERENCES access_groups(id) ON DELETE CASCADE
);

CREATE TABLE boards (
    id INT AUTO_INCREMENT NOT NULL UNIQUE PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE board_access_group_links (
    board_id INT NOT NULL,
    access_group_id INT NOT NULL,
    FOREIGN KEY (board_id) REFERENCES boards(id),
    FOREIGN KEY (access_group_id) REFERENCES access_groups(id)
);

CREATE TABLE notes (
    id INT AUTO_INCREMENT NOT NULL UNIQUE,
    board_id INT NOT NULL,
    title VARCHAR(70) NOT NULL,
    body TEXT,
    FOREIGN KEY (board_id) REFERENCES boards(id) ON DELETE CASCADE
);
