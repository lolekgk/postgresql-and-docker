CREATE TABLE IF NOT EXISTS country (
	country_id SERIAL PRIMARY KEY,
	country VARCHAR
);

CREATE TABLE IF NOT EXISTS city (
	city_id SERIAL PRIMARY KEY,
	city VARCHAR,
	country_id INT NOT NULL,
	FOREIGN KEY (country_id)
		REFERENCES country (country_id)
);

CREATE TABLE IF NOT EXISTS address (
	address_id SERIAL PRIMARY KEY,
	address VARCHAR NOT NULL,
	address2 VARCHAR,
	city_id INT NOT NULL,
	postal_code VARCHAR(7) NOT NULL,
	phone VARCHAR NOT NULL,
	FOREIGN KEY (city_id)
		REFERENCES city (city_id)
);

CREATE TABLE IF NOT EXISTS participator (
	participator_id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL,
	surname VARCHAR(30) NOT NULL,
	email VARCHAR(50),
	address_id INT NOT NULL,
	FOREIGN KEY (address_id)
		REFERENCES address (address_id)
);

CREATE TABLE IF NOT EXISTS events (
	event_id SERIAL PRIMARY KEY,
	event_name VARCHAR(50) UNIQUE NOT NULL,
	start_date TIMESTAMP NOT NULL,
	end_date TIMESTAMP NOT NULL,
	participator_id INT NOT NULL,
	address_id INT NOT NULL,
	FOREIGN KEY (participator_id)
		REFERENCES participator (participator_id),
	FOREIGN KEY (address_id)
		REFERENCES address (address_id)
);