--constraint details1 default (0)items_bought integer 
INSERT INTO 
PRODUCTION1 (order_number,inserted_date,updated_date,items_sold,buyer,deliver_date,producer,brand_of_item,car_number,certification_number)
VALUES (6001239, 2019-12-05, 2019-12-09, 1000, 'Fuji', 2019-12-08, 'Tesla_Inc', 'Model_S', 'WSA', 900056)
select * from PRODUCTION1;
--constraint details2 check (items_sold >1)
INSERT INTO 
PRODUCTION1 (order_number,inserted_date,updated_date,items_sold,buyer,deliver_date,producer,brand_of_item,car_number,certification_number)
VALUES (6001240, 2019-12-05, 2019-12-09, -69, 'Fuji', 2019-12-08, 'Tesla_Inc', 'Model_S', 'WSA', 90005612)
select * from PRODUCTION1;
--constraint details3 primary key clustered (order_number)
INSERT INTO 
PRODUCTION1 (order_number,inserted_date,updated_date,items_sold,buyer,deliver_date,producer,brand_of_item,car_number,certification_number)
VALUES (6001239, 2019-12-05, 2019-12-09, 1000, 'Fuji', 2019-12-08, 'Tesla_Inc', 'Model_S', 'WSA', 900056567)
select * from PRODUCTION1;
--constraint details3 primary key clustered (order_number)
INSERT INTO 
PRODUCTION1 (order_number,inserted_date,updated_date,items_sold,buyer,deliver_date,producer,brand_of_item,car_number,certification_number)
VALUES (6001265, 2019-12-05, 2019-12-09, 1000, 'Fuji', 2019-12-08, 'Tesla_Inc', 'Model_S', 'WSA', 900056)
select * from PRODUCTION1;
--proper records that do not violate any constrains
INSERT INTO PRODUCTION1 (order_number, inserted_date, updated_date, items_sold,buyer, deliver_date, producer,brand_of_item, car_number,certification_number)
VALUES (6001, 13-05-2019, 15-05-2019, 1000, 'Fuji', 15-05-2020, 'Tesla_Inc', 'Model_S', 'WE123SA', 9000)
select * from PRODUCTION1;

INSERT INTO CAR1 (certification_number, color, brand, transported_items,driver,license, old_VS_new,days_in_use,with_VS_without_turbine,wheels,inserted_date ,updated_date)
VALUES (9000, 'green', 'Subaru', 65789, 'TransService1', 'NAS23418', 'old', 1234, 'with_turbine', 'nokian',13-05-2019,23-05-2019)
select * from CAR1;

INSERT INTO Flowers1 (purchase_number,quantity,quality,color,type_of_flower,pooring,pot,form,flowerweight,ground,nutrition,structure,price, [package], arriving_date)
VALUES ('SE-90-78-FR', 23, 'high', 'green', 'liliia', 'yes', 'plastic', 'round', 32, 'yes','fertilizer','round', 34, 'plastic box',23-05-2019)
select * from Flowers1;

INSERT INTO Flowers2 (purchase_number,operationtype,operationdate,quantity,quality,color,type_of_flower,pooring,pot,form,flowerweight,ground,nutrition,structure,price, [package], arriving_date)
VALUES ('WE123SA', 't', 13-05-2019, 'twenty', 'high', 'green', 'liliia', 'yes', 'plastic', 'round', 32, 'yes','fertilizer','round', 34, 'plastic box',23-05-2019)
select * from Flowers2;