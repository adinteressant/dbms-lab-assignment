CREATE TABLE demo_checkpoint (
    id SERIAL PRIMARY KEY,
    data TEXT
);

INSERT INTO demo_checkpoint (data) VALUES
('Initial data 1'), ('Initial data 2');

CHECKPOINT;

INSERT INTO demo_checkpoint (data) VALUES ('New data after checkpoint');

CHECKPOINT;


-- See when the last checkpoint occurred
SELECT * FROM pg_stat_bgwriter;

-- Show WAL file activity
SELECT * FROM pg_stat_wal;
