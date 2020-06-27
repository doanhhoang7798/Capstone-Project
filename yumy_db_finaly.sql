use `fpt-food-development`;
select * from users;
select * from posts;
select * from reactions;


 SELECT count(post_id) as totals, post_id From reactions GROUP BY post_id  ORDER BY totals DESC limit 1;
 
 
select * from posts join (SELECT count(post_id) as totals, post_id From reactions GROUP BY post_id  ORDER BY totals DESC limit 2 ) as able on posts.id  = able.post_id;

CREATE USER 'fpt-web-development'@'localhost' IDENTIFIED BY 'fpt-web-development';
GRANT ALL PRIVILEGES ON * . * TO 'fpt-web-development'@'localhost';

CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fullname` varchar(255),
  `email` varchar(255) UNIQUE,
  `password` varchar(255),
  `phone` varchar(255) UNIQUE,
  `age` int,
  `gender` int DEFAULT 1,
  `role` int DEFAULT 1,
  `birthday` varchar(255),
  `country` varchar(255),
  `provider` varchar(255),
  `bio` text,
  `image` varchar(255),
  `block_date` varchar(255),
  `status` int DEFAULT 1,
  `created_at` timestamp 
);

CREATE TABLE `posts` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `overview` text NOT NULL,
  `making` text NOT NULL,
  `material` text NOT NULL,
  `time` int NOT NULL,
  `ration` int NOT NULL,
  `kind` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `nation` varchar(255) NOT NULL,
  `holiday` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `suitable` varchar(255) NOT NULL,
  `view_conter` bigint DEFAULT 0,
  `created_at` timestamp ,
  `deleted_at` varchar(255)
);

CREATE TABLE `comments` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` varchar(255) NOT NULL
);

CREATE TABLE `reactions` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp 
);

CREATE TABLE `reports` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `comment_id` int
);

CREATE TABLE `commons` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `type` int 
);


ALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `comments` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `comments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `reactions` ADD FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

ALTER TABLE `reactions` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `reports` ADD FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

ALTER TABLE `commons` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;