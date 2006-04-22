-- Table: "User"

-- DROP TABLE "User";

CREATE TABLE "User"
(
  "IDUser" int8 NOT NULL DEFAULT nextval('"User_IDUser_seq"'::regclass),
  "Login" varchar(50) NOT NULL,
  "Password" varchar(50) NOT NULL,
  CONSTRAINT "User_pkey" PRIMARY KEY ("IDUser"),
  CONSTRAINT "User_Login_key" UNIQUE ("Login")
) 
WITHOUT OIDS;
ALTER TABLE "User" OWNER TO postgres;




