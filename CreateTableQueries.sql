DROP DATABASE IF EXISTS mobile_operator_db;
CREATE DATABASE IF NOT EXISTS mobile_operator_db;
USE mobile_operator_db;

CREATE TABLE admins (
id INT AUTO_INCREMENT PRIMARY KEY,
admin_name VARCHAR(50),
admin_pass VARCHAR(50)
);

CREATE TABLE clients (
id INT AUTO_INCREMENT PRIMARY KEY,
client_name VARCHAR(50) NOT NULL,
client_pass VARCHAR(50) NOT NULL
);

CREATE TABLE services (
id INT AUTO_INCREMENT PRIMARY KEY,
service_name ENUM('MB', 'MIN', 'SMS') NOT NULL,
service_limit DOUBLE NOT NULL,
bill DOUBLE NOT NULL
);

CREATE TABLE contracts (
id INT AUTO_INCREMENT PRIMARY KEY,
signing_date DATE NOT NULL,
expiry_date DATE NOT NULL,
payment_date INT NOT NULL,
phone VARCHAR(10) UNIQUE NOT NULL,
client_id INT NOT NULL,
FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE contracts_services (
contract_id INT NOT NULL,
service_id INT NOT NULL,
CONSTRAINT FOREIGN KEY (contract_id) REFERENCES contracts(id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE RESTRICT ON UPDATE CASCADE,
PRIMARY KEY (contract_id, service_id),
consumption DOUBLE NOT NULL
);

CREATE TABLE debtors(
id INT AUTO_INCREMENT PRIMARY KEY,
contract_id INT UNIQUE NOT NULL,
CONSTRAINT FOREIGN KEY (contract_id) REFERENCES contracts(id) ON DELETE RESTRICT ON UPDATE CASCADE,
contract_status ENUM('paid', 'not paid') NOT NULL,
pay_date INT NULL
);