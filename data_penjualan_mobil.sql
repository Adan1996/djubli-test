-- Adminer 4.8.1 PostgreSQL 14.3 (Debian 14.3-1.pgdg110+1) dump

DROP TABLE IF EXISTS "car_list";
DROP SEQUENCE IF EXISTS car_list_car_id_seq;
CREATE SEQUENCE car_list_car_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."car_list" (
    "car_id" integer DEFAULT nextval('car_list_car_id_seq') NOT NULL,
    "brand_name" character varying(200) NOT NULL,
    "model_id" integer NOT NULL,
    "car_year" numeric(4,0) NOT NULL,
    "price" numeric(200,0) NOT NULL,
    "credit_price" numeric(200,0) NOT NULL,
    "user_id" integer NOT NULL,
    "posting_at" timestamp NOT NULL,
    "tenor" numeric(100,0) DEFAULT '0' NOT NULL,
    "dp" numeric(200,0) DEFAULT '0' NOT NULL,
    CONSTRAINT "car_list_pkey" PRIMARY KEY ("car_id")
) WITH (oids = false);

TRUNCATE "car_list";
INSERT INTO "car_list" ("car_id", "brand_name", "model_id", "car_year", "price", "credit_price", "user_id", "posting_at", "tenor", "dp") VALUES
(1,	'Mazda 6',	1,	2014,	280000000,	255000000,	1,	'2021-01-01 00:00:00',	0,	0);

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
(3,	'CRV Prestige');

DROP TABLE IF EXISTS "seller_profile";
DROP SEQUENCE IF EXISTS profil_penjual_id_seq;
CREATE SEQUENCE profil_penjual_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 6 CACHE 1;

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

-- 2022-06-07 08:33:53.601976+00
