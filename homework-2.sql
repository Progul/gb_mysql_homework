DROP TABLE IF EXISTS activity_status;
CREATE TABLE activity status(
active_user_id SERIAL PRIMARY KEY NOT NULL,
activity status ENUM('Online', 'Offline'),
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
INDEX active_user_id_idx(active_user_id),
INDEX updated_at_idx(updated_at),
FOREIGN KEY fk_active_user_id(active_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS musics;
CREATE TABLE IF NOT EXISTS musics(
id SERIAL,
media_types_id BIGINT UNSIGNED NOT NULL,
user_id BIGINT UNSIGNED NOT NULL,
author_name VARCHAR(255),
audio_name VARCHAR(255),
metadata JSON,
created_at DATETIME DEFAULT NOW(),

FOREIGN KEY (user_id) REFERENCES users(id),
);

DROP TABLE IF EXISTS dislikes;
CREATE TABLE IF NOT EXISTS dislikes (
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT UNSIGNED NOT NULL, 
post_id INT UNSIGNED NOT NULL, 
comment TEXT NOT NULL, 
created_at DATETIME DEFAULT CURRENT_TIMESTAMP, 
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
); 