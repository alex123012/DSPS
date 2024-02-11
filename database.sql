CREATE TABLE "brand" (
  "id" serial PRIMARY KEY NOT NULL,
  "brand" varchar NOT NULL
);

CREATE TABLE "product_line" (
  "id" serial PRIMARY KEY NOT NULL,
  "product_line" varchar NOT NULL
);

CREATE TABLE "product_class" (
  "id" serial PRIMARY KEY NOT NULL,
  "product_class" varchar NOT NULL
);

CREATE TABLE "product_size" (
  "id" serial PRIMARY KEY NOT NULL,
  "product_size" varchar NOT NULL
);

CREATE TABLE "product" (
  "id" serial PRIMARY KEY NOT NULL,
  "product_id" integer NOT NULL,
  "brand_id" integer,
  "product_line_id" integer,
  "product_class_id" integer,
  "product_size_id" integer,
  "standard_cost" numeric(6,2)
);

CREATE TABLE "gender" (
  "id" serial PRIMARY KEY NOT NULL,
  "gender" character(1) NOT NULL
);

CREATE TABLE "job_industry_category" (
  "id" serial PRIMARY KEY NOT NULL,
  "job_industry_category" varchar NOT NULL
);

CREATE TABLE "wealth_segment" (
  "id" serial PRIMARY KEY NOT NULL,
  "wealth_segment" varchar NOT NULL
);

CREATE TABLE "country" (
  "id" serial PRIMARY KEY NOT NULL,
  "country" varchar NOT NULL
);

CREATE TABLE "state" (
  "id" serial PRIMARY KEY NOT NULL,
  "state" varchar NOT NULL,
  "country_id" integer
);

CREATE TABLE "customer" (
  "id" serial PRIMARY KEY NOT NULL,
  "first_name" varchar NOT NULL,
  "last_name" varchar,
  "gender_id" integer NOT NULL,
  "DOB" date,
  "job_title" varchar,
  "job_industry_category_id" integer,
  "wealth_segment_id" integer NOT NULL,
  "deceased_indicator" boolean NOT NULL,
  "owns_car" boolean NOT NULL,
  "address" varchar NOT NULL,
  "postcode" smallint NOT NULL,
  "state_id" integer NOT NULL,
  "property_valuation" smallint NOT NULL
);

CREATE TABLE "order_status" (
  "id" serial PRIMARY KEY NOT NULL,
  "order_status" varchar
);

CREATE TABLE "transaction" (
  "id" serial PRIMARY KEY NOT NULL,
  "product_id" integer NOT NULL,
  "customer_id" integer NOT NULL,
  "transaction_date" date NOT NULL,
  "online_order" boolean,
  "order_status_id" integer NOT NULL,
  "list_price" numeric(6,2) NOT NULL
);

ALTER TABLE "product" ADD FOREIGN KEY ("brand_id") REFERENCES "brand" ("id");

ALTER TABLE "product" ADD FOREIGN KEY ("product_line_id") REFERENCES "product_line" ("id");

ALTER TABLE "product" ADD FOREIGN KEY ("product_class_id") REFERENCES "product_class" ("id");

ALTER TABLE "product" ADD FOREIGN KEY ("product_size_id") REFERENCES "product_size" ("id");

ALTER TABLE "state" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("gender_id") REFERENCES "gender" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("job_industry_category_id") REFERENCES "job_industry_category" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("wealth_segment_id") REFERENCES "wealth_segment" ("id");

ALTER TABLE "customer" ADD FOREIGN KEY ("state_id") REFERENCES "state" ("id");

ALTER TABLE "transaction" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("id");

ALTER TABLE "transaction" ADD FOREIGN KEY ("customer_id") REFERENCES "customer" ("id");

ALTER TABLE "transaction" ADD FOREIGN KEY ("order_status_id") REFERENCES "order_status" ("id");
