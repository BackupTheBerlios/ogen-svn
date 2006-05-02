-- Table: "Config"

-- DROP TABLE "Config";

CREATE TABLE "Config"
(
  "Name" varchar(50) NOT NULL,
  "Config" varchar(50) NOT NULL,
  "Type" int4 NOT NULL,
  CONSTRAINT "Config_pkey" PRIMARY KEY ("Name")
) 
WITHOUT OIDS;
ALTER TABLE "Config" OWNER TO postgres;




insert into "Config" ("Name", "Config", "Type") values ('SomeBoolConfig', 'False', 1);
insert into "Config" ("Name", "Config", "Type") values ('SomeIntConfig', '1245', 4);
insert into "Config" ("Name", "Config", "Type") values ('SomeMultiLineStringConfig', 'line 1\nline 2', 3);
insert into "Config" ("Name", "Config", "Type") values ('SomeStringConfig', 'whatever', 2);
