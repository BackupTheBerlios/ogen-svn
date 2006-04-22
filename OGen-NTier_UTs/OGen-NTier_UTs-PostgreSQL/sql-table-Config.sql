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




