CREATE USER 'syzoj' IDENTIFIED BY '123456';
CREATE DATABASE `syzoj` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `syzoj`.* TO 'syzoj';
FLUSH PRIVILEGES;
