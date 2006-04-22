-- Table: "UserGroup"

-- DROP TABLE "UserGroup";

CREATE TABLE "UserGroup"
(
  "IDUser" int8 NOT NULL,
  "IDGroup" int8 NOT NULL,
  "Relationdate" timestamp,
  "Defaultrelation" bool,
  CONSTRAINT "UserGroup_pkey" PRIMARY KEY ("IDUser", "IDGroup")
) 
WITHOUT OIDS;
ALTER TABLE "UserGroup" OWNER TO postgres;




