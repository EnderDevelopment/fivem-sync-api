CREATE TABLE IF NOT EXISTS square_sync_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    data TEXT NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO square_sync_data (player_id, data) VALUES (1, '{"example": "data"}');