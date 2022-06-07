-- Adminer 4.8.1 PostgreSQL 14.3 (Debian 14.3-1.pgdg110+1) dump

DROP TABLE IF EXISTS "car_list";
CREATE TABLE "public"."car_list" (
    "car_id" integer NOT NULL,
    "brand_name" character varying(200) NOT NULL,
    "model_id" integer NOT NULL,
    "car_year" integer NOT NULL,
    "price" integer NOT NULL,
    "credit_price" integer NOT NULL,
    "user_id" integer NOT NULL,
    "posting_at" timestamp NOT NULL,
    CONSTRAINT "car_list_pkey" PRIMARY KEY ("car_id")
) WITH (oids = false);

TRUNCATE "car_list";
INSERT INTO "car_list" ("car_id", "brand_name", "model_id", "car_year", "price", "credit_price", "user_id", "posting_at") VALUES
(1,	'Mazda 6',	1,	2014,	280000000,	255000000,	1,	'2021-01-01 00:00:00'),
(3,	'Honda',	3,	2014,	240000000,	225000000,	3,	'2021-01-06 08:00:00'),
(2,	'Honda',	2,	2016,	0,	245000000,	2,	'2021-01-05 08:46:12'),
(4,	'Mazda 2.5',	1,	2015,	0,	265000000,	4,	'2021-01-20 08:00:00'),
(5,	'Honda',	4,	2017,	0,	383000000,	5,	'2021-02-01 08:00:00'),
(6,	'Mercedes',	5,	0,	500000000,	0,	6,	'2021-02-05 08:00:00');

DROP TABLE IF EXISTS "car_model";
DROP SEQUENCE IF EXISTS car_model_model_id_seq;
CREATE SEQUENCE car_model_model_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 3 CACHE 1;

CREATE TABLE "public"."car_model" (
    "model_id" integer DEFAULT nextval('car_model_model_id_seq') NOT NULL,
    "model_group_name" character varying(100) NOT NULL,
    CONSTRAINT "car_model_pkey" PRIMARY KEY ("model_id")
) WITH (oids = false);

TRUNCATE "car_model";
INSERT INTO "car_model" ("model_id", "model_group_name") VALUES
(1,	'Skyactiv'),
(2,	'CRV 2.0'),
(3,	'CRV Prestige'),
(4,	'Civic 1.3'),
(5,	'c300 avantgrade');

DROP TABLE IF EXISTS "kredit";
DROP SEQUENCE IF EXISTS kredit_kredit_id_seq;
CREATE SEQUENCE kredit_kredit_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 3 CACHE 1;

CREATE TABLE "public"."kredit" (
    "kredit_id" integer DEFAULT nextval('kredit_kredit_id_seq') NOT NULL,
    "car_id" integer NOT NULL,
    "dp" numeric(200,0) NOT NULL,
    "tenor" numeric(100,0) NOT NULL,
    "installment_per_month" numeric(200,0) NOT NULL,
    CONSTRAINT "kredit_pkey" PRIMARY KEY ("kredit_id")
) WITH (oids = false);

TRUNCATE "kredit";
INSERT INTO "kredit" ("kredit_id", "car_id", "dp", "tenor", "installment_per_month") VALUES
(1,	2,	87000000,	47,	5422300),
(2,	3,	45600000,	36,	7339000),
(3,	3,	45600000,	48,	6083000);

DROP TABLE IF EXISTS "seller_profile";
DROP SEQUENCE IF EXISTS profil_penjual_id_seq;
CREATE SEQUENCE profil_penjual_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."seller_profile" (
    "user_id" integer DEFAULT nextval('profil_penjual_id_seq') NOT NULL,
    "username" character varying(100) NOT NULL,
    "address" text NOT NULL,
    "phone" numeric(12,0) NOT NULL,
    CONSTRAINT "profil_penjual_pkey" PRIMARY KEY ("user_id")
) WITH (oids = false);

TRUNCATE "seller_profile";
INSERT INTO "seller_profile" ("user_id", "username", "address", "phone") VALUES
(1,	'Agus',	'Jakarta',	812345678),
(2,	'Djubli',	'Jakarta',	812345679),
(3,	'PT. Bangkit Perkasa',	'Surabaya',	812345680),
(4,	'PT. Adil Jaya Makmur',	'Bandung',	812345681),
(5,	'PT. Jaya Sejahtera',	'Jakarta',	812345682),
(6,	'Nita',	'Bandung',	812345683);

-- 2022-06-07 13:03:02.833648+00
