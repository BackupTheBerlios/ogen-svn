-- Table: "Group"

-- DROP TABLE "Group";

CREATE TABLE "Group"
(
  "IDGroup" int8 NOT NULL DEFAULT nextval('"Group_IDGroup_seq"'::regclass),
  "Name" varchar(50) NOT NULL,
  CONSTRAINT "Group_pkey" PRIMARY KEY ("IDGroup"),
  CONSTRAINT "Group_Name_key" UNIQUE ("Name")
) 
WITHOUT OIDS;
ALTER TABLE "Group" OWNER TO postgres;




