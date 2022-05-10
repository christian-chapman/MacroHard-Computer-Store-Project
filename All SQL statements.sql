CREATE DATABASE macrohard;

CREATE TABLE `macrohard`.`department` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `department_id_UNIQUE` (`department_id` ASC) VISIBLE,
  UNIQUE INDEX `department_name_UNIQUE` (`department_name` ASC) VISIBLE,
  PRIMARY KEY (`department_id`));

CREATE TABLE `macrohard`.`unit` (
  `model_num` INT NOT NULL,
  `manufacturer` VARCHAR(255) NULL,
  `quantity` INT NULL,
  `tags` VARCHAR(255) NULL,
  `serial_num` VARCHAR(255) NULL,
  `price` DOUBLE NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`model_num`),
  UNIQUE INDEX `model_num_UNIQUE` (`model_num` ASC) VISIBLE,
  INDEX `unit.department_id_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `unit.department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `macrohard`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    

CREATE TABLE `macrohard`.`employee` (
  `emp_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NULL,
  `role` VARCHAR(255) NOT NULL,
  UNIQUE INDEX `emp_id_UNIQUE` (`emp_id` ASC) VISIBLE,
  PRIMARY KEY (`emp_id`),
  INDEX `employee.department_id_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `employee.department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `macrohard`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `macrohard`.`customeraccount` (
  `accountID` INT NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NULL,
  `phoneNum` VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  `homeAddress` VARCHAR(255) NULL,
  `paymentMethod` VARCHAR(255) NULL,
  PRIMARY KEY (`accountID`),
  UNIQUE INDEX `accountID_UNIQUE` (`accountID` ASC) VISIBLE);
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);


CREATE TABLE `macrohard`.`customerorder` (
  `OrderNum` INT NOT NULL,
  `accountID` INT NOT NULL,
  PRIMARY KEY (`OrderNum`),
  INDEX `CustomerOrder.accountID_idx` (`accountID` ASC) VISIBLE,
  UNIQUE INDEX `OrderNum_UNIQUE` (`OrderNum` ASC) VISIBLE,
  CONSTRAINT `CustomerOrder.accountID`
    FOREIGN KEY (`accountID`)
    REFERENCES `macrohard`.`customeraccount` (`accountID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `macrohard`.`transaction` (
  `TransactionID` INT NOT NULL,
  `orderNum` INT NULL,
  `paymentMethod` VARCHAR(255) NOT NULL,
  `date` VARCHAR(255) NULL,
  `time` VARCHAR(255) NULL,
  `total` DOUBLE NOT NULL,
  `emp_id` INT NOT NULL,
  PRIMARY KEY (`TransactionID`),
  UNIQUE INDEX `TransactionID_UNIQUE` (`TransactionID` ASC) VISIBLE,
  INDEX `Transaction.orderNum_idx` (`orderNum` ASC) VISIBLE,
  CONSTRAINT `Transaction.orderNum`
    FOREIGN KEY (`orderNum`)
    REFERENCES `macrohard`.`customerorder` (`OrderNum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	
  CONSTRAINT `Transaction.emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `macrohard`.`employee` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `macrohard`.`rewards` (
  `accountID` INT NOT NULL,
  `Points` INT NULL,
  INDEX `Rewards.accountID_idx` (`accountID` ASC) VISIBLE,
  CONSTRAINT `Rewards.accountID`
    FOREIGN KEY (`accountID`)
    REFERENCES `macrohard`.`customeraccount` (`accountID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

insert into department (department_id, department_name) values (1, 'Engineering');
insert into department (department_id, department_name) values (2, 'Services');
insert into department (department_id, department_name) values (3, 'Operations');
insert into department (department_id, department_name) values (4, 'Sales');
insert into department (department_id, department_name) values (5, 'Inventory');
insert into department (department_id, department_name) values (6, 'Human Resources');
insert into department (department_id, department_name) values (7, 'Support');
insert into department (department_id, department_name) values (8, 'Business Development');
insert into department (department_id, department_name) values (9, 'Marketing');
insert into department (department_id, department_name) values (10, 'Information Technology');
insert into department (department_id, department_name) values (11, 'Loss Prevention');
insert into department (department_id, department_name) values (12, 'Research and Development');

insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (1, 'Bednar-Lakin', 118, 'aenean fermentum donec ut', '0429427603', 5625.91, 1);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (2, 'Moore, Fritsch and Greenholt', 643, 'nulla suspendisse potenti cras', '0237225255', 5351.46, 2);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (3, 'Wisoky-Legros', 909, 'odio porttitor id consequat in', '6297483124', 3774.68, 3);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (4, 'Volkman-Hirthe', 145, 'vel dapibus at diam nam', '4669870165', 8500.63, 4);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (5, 'Collins Inc', 718, 'integer ac neque duis', '6398725360', 3603.79, 5);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (6, 'Kreiger Inc', 406, 'velit vivamus vel', '3584851653', 7168.13, 6);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (7, 'Russel, Schaden and Miller', 63, 'sapien sapien non mi integer', '0004261909', 6358.07, 7);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (8, 'Walsh-Stroman', 294, 'tellus in sagittis', '5785879123', 1100.3, 8);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (9, 'Dietrich, Pfeffer and Nader', 125, 'posuere cubilia', '7330942219', 1062.16, 9);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (10, 'Heidenreich, Walsh and Hettinger', 885, 'vestibulum quam', '2190178568', 8178.9, 10);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (11, 'O''Keefe Inc', 23, 'interdum mauris', '3095151640', 9133.55, 11);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (12, 'Hayes-Hilll', 732, 'varius nulla facilisi', '6617915003', 5368.92, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (13, 'Deckow and Sons', 455, 'condimentum neque sapien placerat', '1571310002', 1371.87, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (14, 'Kessler and Sons', 909, 'orci luctus', '7728594621', 2321.62, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (15, 'Becker LLC', 334, 'id nulla', '8487233627', 1642.55, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (16, 'Kutch LLC', 293, 'cubilia curae', '8026353722', 7281.46, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (17, 'Reichel-Wehner', 559, 'velit nec nisi vulputate', '9529695632', 2501.08, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (18, 'Hane-Maggio', 39, 'sed augue aliquam erat', '5593693633', 3783.48, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (19, 'Koss LLC', 779, 'phasellus sit', '0000678953', 2619.09, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (20, 'Walker, Schaefer and Barton', 575, 'posuere nonummy integer non', '4301588205', 2288.49, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (21, 'Shields-Leuschke', 479, 'lobortis vel', '3159180352', 7558.05, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (22, 'Moore, Lubowitz and Beahan', 178, 'vestibulum rutrum rutrum neque aenean', '9133614415', 706.81, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (23, 'Lueilwitz Inc', 19, 'quis turpis eget elit', '7450449455', 5695.36, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (24, 'Wehner Group', 908, 'augue a suscipit', '5157490437', 9475.54, 12);
insert into unit (model_num, manufacturer, quantity, tags, serial_num, price, department_id) values (25, 'Smitham-Wuckert', 334, 'integer ac neque duis bibendum', '7458032812', 1419.12, 12);

insert into employee (emp_id, department_id, first_name, last_name, role) values (1, 1, 'Filbert', 'Killingworth', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (2, 2, 'Darsey', 'Frosch', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (3, 3, 'Tracy', 'Brunone', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (4, 4, 'Cross', 'Furzer', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (5, 5, 'Alvy', 'Essery', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (6, 6, 'Dukey', 'Castro', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (7, 7, 'Jacobo', 'Kamena', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (8, 8, 'Sherri', 'Conradie', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (9, 9, 'Valenka', 'Brownill', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (10, 10, 'Mauricio', 'Andreaccio', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (11, 11, 'Clarance', 'Leil', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (12, 12, 'Lynnea', 'Sturmey', 'Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (13, 11, 'Gay', 'Symmons', 'Security');
insert into employee (emp_id, department_id, first_name, last_name, role) values (14, 2, 'Rozalin', 'Sautter', 'Project Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (15, 4, 'Nan', 'Eveling', 'Cashier');
insert into employee (emp_id, department_id, first_name, last_name, role) values (16, 4, 'Myriam', 'Gammett', 'Cashier');
insert into employee (emp_id, department_id, first_name, last_name, role) values (17, 4, 'Innis', 'Zammitt', 'Cashier');
insert into employee (emp_id, department_id, first_name, last_name, role) values (18, 3, 'Cecilla', 'Dreus', 'Accountant');
insert into employee (emp_id, department_id, first_name, last_name, role) values (19, 5, 'Aaren', 'Lukianovich', 'Shipping Manager');
insert into employee (emp_id, department_id, first_name, last_name, role) values (20, 4, 'Boyce', 'Flitcroft', 'Cashier');
insert into employee (emp_id, department_id, first_name, last_name, role) values (21, 7, 'Fremont', 'Dan', 'Tech Support');
insert into employee (emp_id, department_id, first_name, last_name, role) values (22, 6, 'Laina', 'Ellison', 'Human Resources');
insert into employee (emp_id, department_id, first_name, last_name, role) values (23, 9, 'Margaretta', 'Arni', 'Marketer');
insert into employee (emp_id, department_id, first_name, last_name, role) values (24, 10, 'Darcee', 'Woliter', 'IT');
insert into employee (emp_id, department_id, first_name, last_name, role) values (25, 3, 'Norby', 'Wyllis', 'Janitor');

insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (1, 'Amalea', 'Varnam', '591-805-3832', 'ch784fb7njvs@email.com', '5949 Fallview Way', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (2, 'Thomasa', 'Terbrugge', '957-823-6174', 'vnqwivunri@email.com', '9 Moulton Point', 'laser');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (3, 'Patience', 'Halversen', '161-197-2830', 'uwtebvqvr@email.com', '41741 Westend Parkway', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (4, 'Corbet', 'Quiddihy', '675-810-8908', 'vquiuyitv@email.com', '71573 Arapahoe Alley', 'visa');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (5, 'Andrea', 'Towndrow', '288-749-5317', 'hfywueift@email.com', '6124 Ridgeview Road', 'laser');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (6, 'Ariela', 'Giannassi', '137-903-0454', 'caietcnrn9@email.com', '41267 Bobwhite Point', 'instapayment');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (7, 'Onfroi', 'Baal', '131-183-5286', 'alictenu83@email.com', '72184 Laurel Circle', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (8, 'Alyda', 'Moorfield', '627-323-9603', 'cpa94ncjh@email.com', '3935 Sage Park', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (9, 'Farrah', 'Dannatt', '367-132-7439', 'aoqpct7@email.com', '333 Utah Center', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (10, 'Ula', 'Imore', '736-263-1385', 'c832ncod65@email.com', '90938 Hovde Terrace', 'china-unionpay');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (11, 'Willabella', 'Helliar', '417-592-6615', 'c903nmcu@email.com', '902 Butterfield Trail', 'mastercard');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (12, 'Hildy', 'Becket', '131-573-9429', 'c83ndhruj@email.com', '0328 Warrior Center', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (13, 'Gus', 'Lapworth', '361-539-3051', 'c83ncie@email.com', '28 Killdeer Alley', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (14, 'Kathlin', 'Eliet', '338-447-3286', 'c903nckds@email.com', '397 Becker Plaza', 'diners-club-enroute');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (15, 'Claudetta', 'Godfree', '939-574-0353', 's8cn34@email.com', '7 Fairfield Parkway', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (16, 'Carmela', 'Hanna', '293-509-4299', 'c983nce@email.com', '8 Paget Terrace', 'visa-electron');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (17, 'Clerkclaude', 'Farland', '908-858-4160', 'vwsl389c@email.com', '74 Melby Street', 'maestro');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (18, 'Myra', 'Skellern', '732-516-3570', 'cn83ncy@email.com', '7144 Lukken Junction', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (19, 'Helen-elizabeth', 'Bonifazio', 'd9n383@email.com', '524-255-1254', '54 Hovde Lane', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (20, 'Edithe', 'Ida', '977-814-1074', 'aj84bnji@email.com', '39 Colorado Road', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (21, 'Timmie', 'Redmile', '997-541-8230', '289bdrh@email.com', '53783 Lawn Hill', 'switch');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (22, 'Koo', 'Suatt', '935-679-0438', 'nmviowinv3@email.com', '596 Michigan Terrace', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (23, 'Valaria', 'Agdahl', '541-849-8814', 'tuinvbr@email.com', '07 Ruskin Parkway', 'jcb');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (24, 'Ileane', 'Trime', '948-387-8821', 'qwhuqwr@email.com', '5597 Gateway Lane', 'mastercard');
insert into customeraccount (accountID, first_name, last_name, phoneNum, email, homeAddress, paymentMethod) values (25, 'Marin', 'Titlow', '741-736-0804', 'ghjushjgfs@email.com', '645 Ridge Oak Circle', 'maestro');

insert into customerorder (orderNum, accountID) values (1, 1);
insert into customerorder (orderNum, accountID) values (2, 2);
insert into customerorder (orderNum, accountID) values (3, 3);
insert into customerorder (orderNum, accountID) values (4, 4);
insert into customerorder (orderNum, accountID) values (5, 5);
insert into customerorder (orderNum, accountID) values (6, 6);
insert into customerorder (orderNum, accountID) values (7, 7);
insert into customerorder (orderNum, accountID) values (8, 8);
insert into customerorder (orderNum, accountID) values (9, 9);
insert into customerorder (orderNum, accountID) values (10, 10);
insert into customerorder (orderNum, accountID) values (11, 11);
insert into customerorder (orderNum, accountID) values (12, 12);
insert into customerorder (orderNum, accountID) values (13, 13);
insert into customerorder (orderNum, accountID) values (14, 14);
insert into customerorder (orderNum, accountID) values (15, 15);
insert into customerorder (orderNum, accountID) values (16, 16);
insert into customerorder (orderNum, accountID) values (17, 17);
insert into customerorder (orderNum, accountID) values (18, 18);
insert into customerorder (orderNum, accountID) values (19, 19);
insert into customerorder (orderNum, accountID) values (20, 20);
insert into customerorder (orderNum, accountID) values (21, 21);
insert into customerorder (orderNum, accountID) values (22, 22);
insert into customerorder (orderNum, accountID) values (23, 23);
insert into customerorder (orderNum, accountID) values (24, 24);
insert into customerorder (orderNum, accountID) values (25, 25);

insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (1, 1, 'jcb', '12/19/2021', '2:42 PM', 1429, 15);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (2, 2, 'switch', '7/10/2021', '11:33 AM', 1477, 16);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (3, 3, 'jcb', '2/4/2022', '9:46 PM', 4029, 17);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (4, 4, 'jcb', '4/27/2022', '1:07 AM', 8339, 20);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (5, 5, 'bankcard', '2/22/2022', '1:48 PM', 1985, 16);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (6, 6, 'bankcard', '8/21/2021', '11:57 AM', 2296, 17);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (7, 7, 'instapayment', '5/26/2021', '9:51 PM', 9026, 15);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (8, 8, 'maestro', '8/18/2021', '8:03 AM', 2266, 20);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (9, 9, 'jcb', '4/1/2022', '5:31 AM', 6149, 16);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (10, 10, 'jcb', '9/7/2021', '3:57 AM', 830, 20);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (11, 11, 'bankcard', '10/16/2021', '2:29 PM', 5252, 20);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (12, 12, 'jcb', '6/8/2021', '8:20 PM', 7228, 17);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (13, 13, 'jcb', '2/4/2022', '9:29 AM', 9602, 16);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (14, 14, 'maestro', '9/5/2021', '7:03 PM', 750, 17);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (15, 15, 'switch', '7/14/2021', '8:19 AM', 1217, 20);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (16, 16, 'jcb', '1/27/2022', '1:40 AM', 3758, 15);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (17, 17, 'bankcard', '10/21/2021', '6:27 PM', 500, 17);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (18, 18, 'mastercard', '4/18/2022', '2:16 AM', 5933, 17);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (19, 19, 'americanexpress', '3/22/2022', '9:37 PM', 8849, 17);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (20, 20, 'jcb', '9/5/2021', '1:13 AM', 2128, 15);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (21, 21, 'jcb', '9/8/2021', '9:15 PM', 5089, 20);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (22, 22, 'jcb', '12/22/2021', '12:31 PM', 7093, 16);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (23, 23, 'switch', '11/2/2021', '1:34 AM', 6786, 20);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (24, 24, 'diners-club-enroute', '9/27/2021', '9:58 AM', 3231, 16);
insert into transaction (TransactionID, orderNum, paymentMethod, date, time, total, emp_id) values (25, 25, 'jcb', '2/1/2022', '6:36 AM', 8776, 15);

insert into rewards (accountID, Points) values (1, 1733);
insert into rewards (accountID, Points) values (2, 1067);
insert into rewards (accountID, Points) values (3, 1342);
insert into rewards (accountID, Points) values (4, 605);
insert into rewards (accountID, Points) values (5, 165);
insert into rewards (accountID, Points) values (6, 1546);
insert into rewards (accountID, Points) values (7, 575);
insert into rewards (accountID, Points) values (8, 1014);
insert into rewards (accountID, Points) values (9, 558);
insert into rewards (accountID, Points) values (10, 199);
insert into rewards (accountID, Points) values (11, 592);
insert into rewards (accountID, Points) values (12, 361);
insert into rewards (accountID, Points) values (13, 1770);
insert into rewards (accountID, Points) values (14, 1835);
insert into rewards (accountID, Points) values (15, 575);
insert into rewards (accountID, Points) values (16, 1107);
insert into rewards (accountID, Points) values (17, 998);
insert into rewards (accountID, Points) values (18, 1218);
insert into rewards (accountID, Points) values (19, 279);
insert into rewards (accountID, Points) values (20, 1446);
insert into rewards (accountID, Points) values (21, 1418);
insert into rewards (accountID, Points) values (22, 527);
insert into rewards (accountID, Points) values (23, 253);
insert into rewards (accountID, Points) values (24, 1914);
insert into rewards (accountID, Points) values (25, 207);
