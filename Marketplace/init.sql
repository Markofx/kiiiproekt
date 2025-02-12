DO
$$
BEGIN
   IF NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = 'marketplace-db') THEN
      EXECUTE 'CREATE DATABASE "marketplace-db";';
END IF;
END
$$;

\c marketplace-db;

CREATE TABLE IF NOT EXISTS category (
                                        id SERIAL PRIMARY KEY,
                                        name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
    );

INSERT INTO category (name, description)
VALUES
    ('Живеалиште', 'Category for living accommodations'),
    ('Работа', 'Category for job postings'),
    ('Автомобили', 'Category for vehicles'),
    ('Електроника', 'Category for electronics')
    ON CONFLICT (name) DO NOTHING;

