CREATE OR REPLACE VIEW "v0_Config__onlyKeys"
AS
	SELECT
		"Name"
	FROM "Config"
;


CREATE OR REPLACE VIEW "v0_Group__onlyKeys"
AS
	SELECT
		"IDGroup"
	FROM "Group"
;


CREATE OR REPLACE VIEW "v0_User__onlyKeys"
AS
	SELECT
		"IDUser"
	FROM "User"
;


CREATE OR REPLACE VIEW "v0_UserGroup__onlyKeys"
AS
	SELECT
		"IDUser", 
		"IDGroup"
	FROM "UserGroup"
;


CREATE OR REPLACE VIEW "v0_vUserDefaultGroup__onlyKeys"
AS
	SELECT
		"IDUser"
	FROM "vUserDefaultGroup"
;


CREATE OR REPLACE VIEW "v0_vUserGroup__onlyKeys"
AS
	SELECT
		"IDUser", 
		"IDGroup"
	FROM "vUserGroup"
;


CREATE OR REPLACE FUNCTION "fnc0_Config_isObject"("Name_" character varying)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "Config"
			WHERE
				("Name" = "Name_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_Group_isObject"("IDGroup_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "Group"
			WHERE
				("IDGroup" = "IDGroup_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_User_isObject"("IDUser_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "User"
			WHERE
				("IDUser" = "IDUser_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_UserGroup_isObject"("IDUser_" bigint, "IDGroup_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "UserGroup"
			WHERE
				("IDUser" = "IDUser_") AND
				("IDGroup" = "IDGroup_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_vUserDefaultGroup_isObject"("IDUser_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "vUserDefaultGroup"
			WHERE
				("IDUser" = "IDUser_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_vUserGroup_isObject"("IDUser_" bigint, "IDGroup_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "vUserGroup"
			WHERE
				("IDUser" = "IDUser_") AND
				("IDGroup" = "IDGroup_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Config_setObject"(
	"Name_" character varying, 
	"Config_" character varying, 
	"Type_" integer, 
	"Description_" character varying
)
RETURNS int4 AS
'
	/*************************************
	 *  returns                          *
	 *    00 0: not exist, no constraint *
	 *    01 1: exists, no constraint    *
	 *    10 2: constraint, not exist    *
	 *    11 3: exists, constraint       *
	 *                                   *
	 *  bit 0: existance                 *
	 *  bit 1: constraint                *
	 *************************************/

	DECLARE
		_Exists bool; 
		_ConstraintExist bool;
		_Output int4;
	BEGIN
		_Exists := EXISTS (
			SELECT true -- whatever, just checking existence
			FROM "Config"
			WHERE
				("Name" = "Name_")
		);
		IF (_Exists) THEN
			_ConstraintExist := 0;
			IF NOT (_ConstraintExist) THEN
				UPDATE "Config"
				SET
					"Config" = "Config_", 
					"Type" = "Type_", 
					"Description" = "Description_"
				WHERE
					("Name" = "Name_");
			END IF;
		ELSE
			_ConstraintExist := 0;
			IF NOT (_ConstraintExist) THEN
				INSERT INTO "Config" (
					"Name", 
					"Config", 
					"Type", 
					"Description"
				) VALUES (
					"Name_", 
					"Config_", 
					"Type_", 
					"Description_"
				);
			END IF;
		END IF;

		_Output := 0;
		IF (_Exists) THEN _Output := _Output + 1; END IF;
		IF (_ConstraintExist) THEN _Output := _Output + 2; END IF;
		RETURN _Output AS "Output_";
	END;
'
LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_UserGroup_setObject"(
	"IDUser_" bigint, 
	"IDGroup_" bigint, 
	"Relationdate_" timestamp without time zone, 
	"Defaultrelation_" boolean
)
RETURNS int4 AS
'
	/*************************************
	 *  returns                          *
	 *    00 0: not exist, no constraint *
	 *    01 1: exists, no constraint    *
	 *    10 2: constraint, not exist    *
	 *    11 3: exists, constraint       *
	 *                                   *
	 *  bit 0: existance                 *
	 *  bit 1: constraint                *
	 *************************************/

	DECLARE
		_Exists bool; 
		_ConstraintExist bool;
		_Output int4;
	BEGIN
		_Exists := EXISTS (
			SELECT true -- whatever, just checking existence
			FROM "UserGroup"
			WHERE
				("IDUser" = "IDUser_") AND
				("IDGroup" = "IDGroup_")
		);
		IF (_Exists) THEN
			_ConstraintExist := 0;
			IF NOT (_ConstraintExist) THEN
				UPDATE "UserGroup"
				SET
					"Relationdate" = "Relationdate_", 
					"Defaultrelation" = "Defaultrelation_"
				WHERE
					("IDUser" = "IDUser_") AND
					("IDGroup" = "IDGroup_");
			END IF;
		ELSE
			_ConstraintExist := 0;
			IF NOT (_ConstraintExist) THEN
				INSERT INTO "UserGroup" (
					"IDUser", 
					"IDGroup", 
					"Relationdate", 
					"Defaultrelation"
				) VALUES (
					"IDUser_", 
					"IDGroup_", 
					"Relationdate_", 
					"Defaultrelation_"
				);
			END IF;
		END IF;

		_Output := 0;
		IF (_Exists) THEN _Output := _Output + 1; END IF;
		IF (_ConstraintExist) THEN _Output := _Output + 2; END IF;
		RETURN _Output AS "Output_";
	END;
'
LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Config_delObject"("Name_" character varying)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "Config"
		WHERE
			("Name" = "Name_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Group_delObject"("IDGroup_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "Group"
		WHERE
			("IDGroup" = "IDGroup_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_User_delObject"("IDUser_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "User"
		WHERE
			("IDUser" = "IDUser_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_UserGroup_delObject"("IDUser_" bigint, "IDGroup_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "UserGroup"
		WHERE
			("IDUser" = "IDUser_") AND
			("IDGroup" = "IDGroup_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "fnc_User_isObject_byLogin"(
	"Login_search_" character varying
)
RETURNS SETOF "v0_User__onlyKeys" AS
'
	DECLARE
		_Output "v0_User__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				"IDUser"
			FROM "User"
			WHERE
				("Login" LIKE ''%'' || "Login_search_" || ''%'' /*COLLATE */)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc_Config_Record_open_all"(
)
RETURNS SETOF "v0_Config__onlyKeys"
AS '
	DECLARE
		_Output "v0_Config__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				"Name"
			FROM "Config"/*
			WHERE*/
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc_User_Record_open_all"(
)
RETURNS SETOF "v0_User__onlyKeys"
AS '
	DECLARE
		_Output "v0_User__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				"IDUser"
			FROM "User"/*
			WHERE*/
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc_User_Record_open_byGroup"(
	"IDGroup_search_" bigint
)
RETURNS SETOF "v0_User__onlyKeys"
AS '
	DECLARE
		_Output "v0_User__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				"IDUser"
			FROM "User"/*
			WHERE
				("IDGroup" = "IDGroup_search_")*/
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc_UserGroup_Record_open_byUser_Defaultrelation"(
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone
)
RETURNS SETOF "v0_UserGroup__onlyKeys"
AS '
	DECLARE
		_Output "v0_UserGroup__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				"IDUser", 
				"IDGroup"
			FROM "UserGroup"
			WHERE
				("IDUser" = "IDUser_search_") AND
				((
					("Relationdate_search_" IS NULL)
					AND
					("Relationdate" IS NULL)
				) OR (
					NOT ("Relationdate_search_" IS NULL)
					AND
					("Relationdate" = "Relationdate_search_")
				))
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc_vUserDefaultGroup_Record_open_all"(
)
RETURNS SETOF "v0_vUserDefaultGroup__onlyKeys"
AS '
	DECLARE
		_Output "v0_vUserDefaultGroup__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				"IDUser"
			FROM "vUserDefaultGroup"/*
			WHERE*/
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp_Config_Record_open_all"(
)
RETURNS SETOF "v0_Config__onlyKeys"
AS '
	DECLARE
		_Output "v0_Config__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."Name"
			FROM "Config" t1
			INNER JOIN "fnc_Config_Record_open_all"(
			) t2 ON (
				(t2."Name" = t1."Name")
			)

			-- change where condition in: "fnc_Config_Record_open_all"
			-- NOT HERE!

			-- change order by HERE:
			-- ORDER BY t1."Name" ASC

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp_User_Record_open_all"(
)
RETURNS SETOF "v0_User__onlyKeys"
AS '
	DECLARE
		_Output "v0_User__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser"
			FROM "User" t1
			INNER JOIN "fnc_User_Record_open_all"(
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_User_Record_open_all"
			-- NOT HERE!

			-- change order by HERE:
			-- ORDER BY t1."IDUser" ASC

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp_User_Record_open_byGroup"(
	"IDGroup_search_" bigint
)
RETURNS SETOF "v0_User__onlyKeys"
AS '
	DECLARE
		_Output "v0_User__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser"
			FROM "User" t1
			INNER JOIN "fnc_User_Record_open_byGroup"(
				"IDGroup_search_"
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_User_Record_open_byGroup"
			-- NOT HERE!

			-- change order by HERE:
			-- ORDER BY t1."IDUser" ASC

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp_UserGroup_Record_open_byUser_Defaultrelation"(
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone
)
RETURNS SETOF "v0_UserGroup__onlyKeys"
AS '
	DECLARE
		_Output "v0_UserGroup__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."IDGroup"
			FROM "UserGroup" t1
			INNER JOIN "fnc_UserGroup_Record_open_byUser_Defaultrelation"(
				"IDUser_search_", 
				"Relationdate_search_"
			) t2 ON (
				(t2."IDUser" = t1."IDUser") AND
				(t2."IDGroup" = t1."IDGroup")
			)

			-- change where condition in: "fnc_UserGroup_Record_open_byUser_Defaultrelation"
			-- NOT HERE!

			-- change order by HERE:
			-- ORDER BY t1."IDUser" ASC

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp_vUserDefaultGroup_Record_open_all"(
)
RETURNS SETOF "v0_vUserDefaultGroup__onlyKeys"
AS '
	DECLARE
		_Output "v0_vUserDefaultGroup__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser"
			FROM "vUserDefaultGroup" t1
			INNER JOIN "fnc_vUserDefaultGroup_Record_open_all"(
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_vUserDefaultGroup_Record_open_all"
			-- NOT HERE!

			-- change order by HERE:
			-- ORDER BY t1."IDUser" ASC

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Config_getObject"("Name_" character varying)
RETURNS "Config"
AS '
	DECLARE
		_Output "Config"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"Name", 
			"Config", 
			"Type", 
			"Description", 
			true
		INTO
			_Output."Name", 
			_Output."Config", 
			_Output."Type", 
			_Output."Description", 
			_Exists
		FROM "Config"
		WHERE
			("Name" = "Name_");

		IF NOT (_Exists) THEN
			_Output."Name" := NULL;
			_Output."Config" := NULL;
			_Output."Type" := NULL;
			_Output."Description" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Group_getObject"("IDGroup_" bigint)
RETURNS "Group"
AS '
	DECLARE
		_Output "Group"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDGroup", 
			"Name", 
			true
		INTO
			_Output."IDGroup", 
			_Output."Name", 
			_Exists
		FROM "Group"
		WHERE
			("IDGroup" = "IDGroup_");

		IF NOT (_Exists) THEN
			_Output."IDGroup" := NULL;
			_Output."Name" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_getObject"("IDUser_" bigint)
RETURNS "User"
AS '
	DECLARE
		_Output "User"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDUser", 
			"Login", 
			"Password", 
			"SomeNullValue", 
			true
		INTO
			_Output."IDUser", 
			_Output."Login", 
			_Output."Password", 
			_Output."SomeNullValue", 
			_Exists
		FROM "User"
		WHERE
			("IDUser" = "IDUser_");

		IF NOT (_Exists) THEN
			_Output."IDUser" := NULL;
			_Output."Login" := NULL;
			_Output."Password" := NULL;
			_Output."SomeNullValue" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_UserGroup_getObject"("IDUser_" bigint, "IDGroup_" bigint)
RETURNS "UserGroup"
AS '
	DECLARE
		_Output "UserGroup"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDUser", 
			"IDGroup", 
			"Relationdate", 
			"Defaultrelation", 
			true
		INTO
			_Output."IDUser", 
			_Output."IDGroup", 
			_Output."Relationdate", 
			_Output."Defaultrelation", 
			_Exists
		FROM "UserGroup"
		WHERE
			("IDUser" = "IDUser_") AND
			("IDGroup" = "IDGroup_");

		IF NOT (_Exists) THEN
			_Output."IDUser" := NULL;
			_Output."IDGroup" := NULL;
			_Output."Relationdate" := NULL;
			_Output."Defaultrelation" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_vUserDefaultGroup_getObject"("IDUser_" bigint)
RETURNS "vUserDefaultGroup"
AS '
	DECLARE
		_Output "vUserDefaultGroup"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDUser", 
			"Login", 
			"IDGroup", 
			"Name", 
			"Relationdate", 
			true
		INTO
			_Output."IDUser", 
			_Output."Login", 
			_Output."IDGroup", 
			_Output."Name", 
			_Output."Relationdate", 
			_Exists
		FROM "vUserDefaultGroup"
		WHERE
			("IDUser" = "IDUser_");

		IF NOT (_Exists) THEN
			_Output."IDUser" := NULL;
			_Output."Login" := NULL;
			_Output."IDGroup" := NULL;
			_Output."Name" := NULL;
			_Output."Relationdate" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_vUserGroup_getObject"("IDUser_" bigint, "IDGroup_" bigint)
RETURNS "vUserGroup"
AS '
	DECLARE
		_Output "vUserGroup"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDUser", 
			"Login", 
			"IDGroup", 
			"Name", 
			"Relationdate", 
			true
		INTO
			_Output."IDUser", 
			_Output."Login", 
			_Output."IDGroup", 
			_Output."Name", 
			_Output."Relationdate", 
			_Exists
		FROM "vUserGroup"
		WHERE
			("IDUser" = "IDUser_") AND
			("IDGroup" = "IDGroup_");

		IF NOT (_Exists) THEN
			_Output."IDUser" := NULL;
			_Output."Login" := NULL;
			_Output."IDGroup" := NULL;
			_Output."Name" := NULL;
			_Output."Relationdate" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_getObject_byLogin"(
	"Login_search_" character varying
)
RETURNS "User" AS '
	DECLARE
		_Output "User"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			t1."IDUser", 
			t1."Login", 
			t1."Password", 
			t1."SomeNullValue", 
			true
		INTO
			_Output."IDUser", 
			_Output."Login", 
			_Output."Password", 
			_Output."SomeNullValue", 
			_Exists
		FROM "User" t1
		INNER JOIN "fnc_User_isObject_byLogin"(
			"Login_search_"
		) t2 ON (
			(t2."IDUser" = t1."IDUser")
		);
	
		IF NOT (_Exists) THEN
			_Output."IDUser" := NULL;
			_Output."Login" := NULL;
			_Output."Password" := NULL;
			_Output."SomeNullValue" := NULL;
		END IF;

		RETURN _Output;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Config_Record_open_all_fullmode"(
)
RETURNS SETOF "Config"
AS '
	DECLARE
		_Output "Config";
	BEGIN
		FOR _Output IN
			SELECT
				t1."Name", 
				t1."Config", 
				t1."Type", 
				t1."Description"
			FROM "Config" t1
			INNER JOIN "sp_Config_Record_open_all"(
			) t2 ON (
				(t2."Name" = t1."Name")
			)

			-- change where condition in: "fnc_Config_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_Config_Record_open_all"
			-- NOT HERE!

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_open_all_fullmode"(
)
RETURNS SETOF "User"
AS '
	DECLARE
		_Output "User";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."Login", 
				t1."Password", 
				t1."SomeNullValue"
			FROM "User" t1
			INNER JOIN "sp_User_Record_open_all"(
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_User_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_User_Record_open_all"
			-- NOT HERE!

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_open_byGroup_fullmode"(
	"IDGroup_search_" bigint
)
RETURNS SETOF "User"
AS '
	DECLARE
		_Output "User";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."Login", 
				t1."Password", 
				t1."SomeNullValue"
			FROM "User" t1
			INNER JOIN "sp_User_Record_open_byGroup"(
				"IDGroup_search_"
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_User_Record_open_byGroup"
			-- NOT HERE!

			-- change order by in: "sp_User_Record_open_byGroup"
			-- NOT HERE!

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_UserGroup_Record_open_byUser_Defaultrelation_fullmode"(
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone
)
RETURNS SETOF "UserGroup"
AS '
	DECLARE
		_Output "UserGroup";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."IDGroup", 
				t1."Relationdate", 
				t1."Defaultrelation"
			FROM "UserGroup" t1
			INNER JOIN "sp_UserGroup_Record_open_byUser_Defaultrelation"(
				"IDUser_search_", 
				"Relationdate_search_"
			) t2 ON (
				(t2."IDUser" = t1."IDUser") AND
				(t2."IDGroup" = t1."IDGroup")
			)

			-- change where condition in: "fnc_UserGroup_Record_open_byUser_Defaultrelation"
			-- NOT HERE!

			-- change order by in: "sp_UserGroup_Record_open_byUser_Defaultrelation"
			-- NOT HERE!

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_vUserDefaultGroup_Record_open_all_fullmode"(
)
RETURNS SETOF "vUserDefaultGroup"
AS '
	DECLARE
		_Output "vUserDefaultGroup";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."Login", 
				t1."IDGroup", 
				t1."Name", 
				t1."Relationdate"
			FROM "vUserDefaultGroup" t1
			INNER JOIN "sp_vUserDefaultGroup_Record_open_all"(
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_vUserDefaultGroup_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_vUserDefaultGroup_Record_open_all"
			-- NOT HERE!

		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Config_Record_open_all_page"(
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "v0_Config__onlyKeys"
AS '
	DECLARE
		_Output "v0_Config__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."Name"
			FROM "Config" t1
			INNER JOIN "sp_Config_Record_open_all"(
			) t2 ON (
				(t2."Name" = t1."Name")
			)

			-- change where condition in: "fnc_Config_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_Config_Record_open_all"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_open_all_page"(
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "v0_User__onlyKeys"
AS '
	DECLARE
		_Output "v0_User__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser"
			FROM "User" t1
			INNER JOIN "sp_User_Record_open_all"(
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_User_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_User_Record_open_all"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_open_byGroup_page"(
	"IDGroup_search_" bigint, 
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "v0_User__onlyKeys"
AS '
	DECLARE
		_Output "v0_User__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser"
			FROM "User" t1
			INNER JOIN "sp_User_Record_open_byGroup"(
				"IDGroup_search_"
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_User_Record_open_byGroup"
			-- NOT HERE!

			-- change order by in: "sp_User_Record_open_byGroup"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_UserGroup_Record_open_byUser_Defaultrelation_page"(
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone, 
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "v0_UserGroup__onlyKeys"
AS '
	DECLARE
		_Output "v0_UserGroup__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."IDGroup"
			FROM "UserGroup" t1
			INNER JOIN "sp_UserGroup_Record_open_byUser_Defaultrelation"(
				"IDUser_search_", 
				"Relationdate_search_"
			) t2 ON (
				(t2."IDUser" = t1."IDUser") AND
				(t2."IDGroup" = t1."IDGroup")
			)

			-- change where condition in: "fnc_UserGroup_Record_open_byUser_Defaultrelation"
			-- NOT HERE!

			-- change order by in: "sp_UserGroup_Record_open_byUser_Defaultrelation"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_vUserDefaultGroup_Record_open_all_page"(
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "v0_vUserDefaultGroup__onlyKeys"
AS '
	DECLARE
		_Output "v0_vUserDefaultGroup__onlyKeys";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser"
			FROM "vUserDefaultGroup" t1
			INNER JOIN "sp_vUserDefaultGroup_Record_open_all"(
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_vUserDefaultGroup_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_vUserDefaultGroup_Record_open_all"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Config_Record_open_all_page_fullmode"(
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "Config"
AS '
	DECLARE
		_Output "Config";
	BEGIN
		FOR _Output IN
			SELECT
				t1."Name", 
				t1."Config", 
				t1."Type", 
				t1."Description"
			FROM "Config" t1
			INNER JOIN "sp_Config_Record_open_all"(
			) t2 ON (
				(t2."Name" = t1."Name")
			)

			-- change where condition in: "fnc_Config_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_Config_Record_open_all"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_open_all_page_fullmode"(
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "User"
AS '
	DECLARE
		_Output "User";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."Login", 
				t1."Password", 
				t1."SomeNullValue"
			FROM "User" t1
			INNER JOIN "sp_User_Record_open_all"(
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_User_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_User_Record_open_all"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_open_byGroup_page_fullmode"(
	"IDGroup_search_" bigint, 
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "User"
AS '
	DECLARE
		_Output "User";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."Login", 
				t1."Password", 
				t1."SomeNullValue"
			FROM "User" t1
			INNER JOIN "sp_User_Record_open_byGroup"(
				"IDGroup_search_"
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_User_Record_open_byGroup"
			-- NOT HERE!

			-- change order by in: "sp_User_Record_open_byGroup"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_UserGroup_Record_open_byUser_Defaultrelation_page_fullmode"(
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone, 
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "UserGroup"
AS '
	DECLARE
		_Output "UserGroup";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."IDGroup", 
				t1."Relationdate", 
				t1."Defaultrelation"
			FROM "UserGroup" t1
			INNER JOIN "sp_UserGroup_Record_open_byUser_Defaultrelation"(
				"IDUser_search_", 
				"Relationdate_search_"
			) t2 ON (
				(t2."IDUser" = t1."IDUser") AND
				(t2."IDGroup" = t1."IDGroup")
			)

			-- change where condition in: "fnc_UserGroup_Record_open_byUser_Defaultrelation"
			-- NOT HERE!

			-- change order by in: "sp_UserGroup_Record_open_byUser_Defaultrelation"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_vUserDefaultGroup_Record_open_all_page_fullmode"(
	"page_" Int,
	"page_numRecords_" Int
)
RETURNS SETOF "vUserDefaultGroup"
AS '
	DECLARE
		_Output "vUserDefaultGroup";
	BEGIN
		FOR _Output IN
			SELECT
				t1."IDUser", 
				t1."Login", 
				t1."IDGroup", 
				t1."Name", 
				t1."Relationdate"
			FROM "vUserDefaultGroup" t1
			INNER JOIN "sp_vUserDefaultGroup_Record_open_all"(
			) t2 ON (
				(t2."IDUser" = t1."IDUser")
			)

			-- change where condition in: "fnc_vUserDefaultGroup_Record_open_all"
			-- NOT HERE!

			-- change order by in: "sp_vUserDefaultGroup_Record_open_all"
			-- NOT HERE!

			LIMIT "page_numRecords_" OFFSET "page_numRecords_" * ("page_" - 1)
		LOOP
			RETURN NEXT _Output;
		END LOOP;

		RETURN;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_update_SomeUpdateTest_byGroup"(
	"IDGroup_search_" bigint, 
	"Password_update_" character varying
)
RETURNS VOID AS '
	DECLARE
	BEGIN
		UPDATE "User"
		SET
			"Password" = "Password_update_"
		FROM "fnc_User_Record_open_byGroup"(
			"IDGroup_search_"
		) t1
		WHERE
			(t1."IDUser" = "User"."IDUser");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_UserGroup_Record_update_SomeUpdateTest_byUser_Defaultrelation"(
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone, 
	"Relationdate_update_" timestamp without time zone
)
RETURNS VOID AS '
	DECLARE
	BEGIN
		UPDATE "UserGroup"
		SET
			"Relationdate" = "Relationdate_update_"
		FROM "fnc_UserGroup_Record_open_byUser_Defaultrelation"(
			"IDUser_search_", 
			"Relationdate_search_"
		) t1
		WHERE
			(t1."IDUser" = "UserGroup"."IDUser") AND
			(t1."IDGroup" = "UserGroup"."IDGroup");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "fnc0_User__ConstraintExist"("IDUser_" bigint, "Login_" character varying, "Password_" character varying, "SomeNullValue_" integer)
RETURNS boolean
AS '
	DECLARE
		-- nothing to declare!
	BEGIN
		IF EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "fnc_User_isObject_byLogin"(
				$2
			)
			WHERE NOT (
				("IDUser" = $1)
			)
		) THEN
			RETURN true;
		END IF;

		RETURN false;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_User_isObject_byLogin"(
	"Login_search_" character varying
)
RETURNS bool AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "fnc_User_isObject_byLogin"(
				"Login_search_"
			)
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_Config_Record_count_all"(
)
RETURNS int8 AS
'
	DECLARE
		_Output int8 = 0;
	BEGIN
		SELECT
			COUNT("Name")
		INTO
			_Output
		FROM "fnc_Config_Record_open_all"(
		);
	
		RETURN _Output;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_User_Record_count_all"(
)
RETURNS int8 AS
'
	DECLARE
		_Output int8 = 0;
	BEGIN
		SELECT
			COUNT("IDUser")
		INTO
			_Output
		FROM "fnc_User_Record_open_all"(
		);
	
		RETURN _Output;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_User_Record_count_byGroup"(
	"IDGroup_search_" bigint
)
RETURNS int8 AS
'
	DECLARE
		_Output int8 = 0;
	BEGIN
		SELECT
			COUNT("IDUser")
		INTO
			_Output
		FROM "fnc_User_Record_open_byGroup"(
			"IDGroup_search_"
		);
	
		RETURN _Output;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_UserGroup_Record_count_byUser_Defaultrelation"(
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone
)
RETURNS int8 AS
'
	DECLARE
		_Output int8 = 0;
	BEGIN
		SELECT
			COUNT("IDUser")
		INTO
			_Output
		FROM "fnc_UserGroup_Record_open_byUser_Defaultrelation"(
			"IDUser_search_", 
			"Relationdate_search_"
		);
	
		RETURN _Output;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_vUserDefaultGroup_Record_count_all"(
)
RETURNS int8 AS
'
	DECLARE
		_Output int8 = 0;
	BEGIN
		SELECT
			COUNT("IDUser")
		INTO
			_Output
		FROM "fnc_vUserDefaultGroup_Record_open_all"(
		);
	
		RETURN _Output;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_Config_Record_hasObject_all"(
	"Name_" character varying
)
RETURNS bool AS '
	DECLARE
	BEGIN
		IF EXISTS (
			SELECT
				true -- whatever, just checking existence
			FROM "fnc_Config_Record_open_all"(
			)
			WHERE
				("Name" = "Name_")
		) THEN
			RETURN true;
		END IF;
	
		RETURN false;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_User_Record_hasObject_all"(
	"IDUser_" bigint
)
RETURNS bool AS '
	DECLARE
	BEGIN
		IF EXISTS (
			SELECT
				true -- whatever, just checking existence
			FROM "fnc_User_Record_open_all"(
			)
			WHERE
				("IDUser" = "IDUser_")
		) THEN
			RETURN true;
		END IF;
	
		RETURN false;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_User_Record_hasObject_byGroup"(
	"IDUser_" bigint, 
	"IDGroup_search_" bigint
)
RETURNS bool AS '
	DECLARE
	BEGIN
		IF EXISTS (
			SELECT
				true -- whatever, just checking existence
			FROM "fnc_User_Record_open_byGroup"(
				"IDGroup_search_"
			)
			WHERE
				("IDUser" = "IDUser_")
		) THEN
			RETURN true;
		END IF;
	
		RETURN false;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_UserGroup_Record_hasObject_byUser_Defaultrelation"(
	"IDUser_" bigint, 
	"IDGroup_" bigint, 
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone
)
RETURNS bool AS '
	DECLARE
	BEGIN
		IF EXISTS (
			SELECT
				true -- whatever, just checking existence
			FROM "fnc_UserGroup_Record_open_byUser_Defaultrelation"(
				"IDUser_search_", 
				"Relationdate_search_"
			)
			WHERE
				("IDUser" = "IDUser_") AND
				("IDGroup" = "IDGroup_")
		) THEN
			RETURN true;
		END IF;
	
		RETURN false;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_vUserDefaultGroup_Record_hasObject_all"(
	"IDUser_" bigint
)
RETURNS bool AS '
	DECLARE
	BEGIN
		IF EXISTS (
			SELECT
				true -- whatever, just checking existence
			FROM "fnc_vUserDefaultGroup_Record_open_all"(
			)
			WHERE
				("IDUser" = "IDUser_")
		) THEN
			RETURN true;
		END IF;
	
		RETURN false;
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Group_insObject"("Name_" character varying,  "SelectIdentity_" boolean)
RETURNS bigint
AS '
	/**********************************
	 *  returns                       *
	 *   -1: constraint exists        *
	 *    0: no need to get Identity  *
	 *   >0: Identity                 *
	 **********************************/

	DECLARE
		IdentityKey bigint = CAST(0 AS bigint);
	BEGIN
			INSERT INTO "Group" (
				"Name"
			) VALUES (
				"Name_"
			);
			IF ("SelectIdentity_") THEN
				SELECT
					"IDGroup"
				INTO
					IdentityKey
				FROM "Group"
				ORDER BY "IDGroup" DESC LIMIT 1;
			ELSE
				IdentityKey := CAST(0 AS bigint);
			END IF;

		RETURN IdentityKey AS "IDGroup_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_User_insObject"("Login_" character varying, "Password_" character varying, "SomeNullValue_" integer,  "SelectIdentity_" boolean)
RETURNS bigint
AS '
	/**********************************
	 *  returns                       *
	 *   -1: constraint exists        *
	 *    0: no need to get Identity  *
	 *   >0: Identity                 *
	 **********************************/

	DECLARE
		IdentityKey bigint = CAST(0 AS bigint);
	BEGIN
		IF ("fnc0_User__ConstraintExist"(
			CAST(0 AS bigint), 
			"Login_", 
			"Password_", 
			"SomeNullValue_"
		)) THEN
			IdentityKey := CAST(-1 AS bigint);
		ELSE
			INSERT INTO "User" (
				"Login", 
				"Password", 
				"SomeNullValue"
			) VALUES (
				"Login_", 
				"Password_", 
				"SomeNullValue_"
			);
			IF ("SelectIdentity_") THEN
				SELECT
					"IDUser"
				INTO
					IdentityKey
				FROM "User"
				ORDER BY "IDUser" DESC LIMIT 1;
			ELSE
				IdentityKey := CAST(0 AS bigint);
			END IF;
		END IF;

		RETURN IdentityKey AS "IDUser_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Group_updObject"("IDGroup_" bigint, "Name_" character varying)
RETURNS bool
AS '
	/***********************************************
	 *  returns                                    *
	 *    true: constraint exists, update NOT made * 
	 *    false: NO constraint, update made        *
	 ***********************************************/

	BEGIN
			UPDATE "Group"
			SET
				"Name" = "Name_"
			WHERE
				("IDGroup" = "IDGroup_")
			;

			RETURN false AS "ConstraintExist_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_User_updObject"("IDUser_" bigint, "Login_" character varying, "Password_" character varying, "SomeNullValue_" integer)
RETURNS bool
AS '
	/***********************************************
	 *  returns                                    *
	 *    true: constraint exists, update NOT made * 
	 *    false: NO constraint, update made        *
	 ***********************************************/

	BEGIN
		IF ("fnc0_User__ConstraintExist"(
			"IDUser_", 
			"Login_", 
			"Password_", 
			"SomeNullValue_"
		)) THEN
			RETURN true AS "ConstraintExist";
		ELSE
			UPDATE "User"
			SET
				"Login" = "Login_", 
				"Password" = "Password_", 
				"SomeNullValue" = "SomeNullValue_"
			WHERE
				("IDUser" = "IDUser_")
			;

			RETURN false AS "ConstraintExist_";
		END IF;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_User_delObject_byLogin"(
	"Login_search_" character varying
)
RETURNS bool AS '
	DECLARE
		_Exists bool = false;
		_User "v0_User__onlyKeys";
	BEGIN
		SELECT
			"IDUser", 
			true
		INTO
			_User."IDUser", 
			_Exists
		FROM "fnc_User_isObject_byLogin"(
			"Login_search_"
		);

		IF (_Exists) THEN
			DELETE
			FROM "User"
			WHERE
				("IDUser" = _User."IDUser")
			;

			RETURN true AS "Exists_";
		END IF;

		RETURN false AS "Exists_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Config_Record_delete_all"(
)
RETURNS VOID AS '
	DECLARE
		_Config "v0_Config__onlyKeys";
	BEGIN
		FOR _Config IN
			SELECT
				"Name"
			FROM "fnc_Config_Record_open_all"(
			)
		LOOP
			DELETE FROM "Config"
			WHERE
				("Name" = _Config."Name");
		END LOOP;

		/***************************************************************
		 * does not work with PostgreSQL :(
		 *

		DELETE --"Config"
		FROM "Config" --t1
			INNER JOIN "fnc_Config_Record_open_all"(
			) t2 ON
				(t2."Name" = --t1.
				"Name");

		 *
		 ***************************************************************/

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_delete_all"(
)
RETURNS VOID AS '
	DECLARE
		_User "v0_User__onlyKeys";
	BEGIN
		FOR _User IN
			SELECT
				"IDUser"
			FROM "fnc_User_Record_open_all"(
			)
		LOOP
			DELETE FROM "User"
			WHERE
				("IDUser" = _User."IDUser");
		END LOOP;

		/***************************************************************
		 * does not work with PostgreSQL :(
		 *

		DELETE --"User"
		FROM "User" --t1
			INNER JOIN "fnc_User_Record_open_all"(
			) t2 ON
				(t2."IDUser" = --t1.
				"IDUser");

		 *
		 ***************************************************************/

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_User_Record_delete_byGroup"(
	"IDGroup_search_" bigint
)
RETURNS VOID AS '
	DECLARE
		_User "v0_User__onlyKeys";
	BEGIN
		FOR _User IN
			SELECT
				"IDUser"
			FROM "fnc_User_Record_open_byGroup"(
				"IDGroup_search_"
			)
		LOOP
			DELETE FROM "User"
			WHERE
				("IDUser" = _User."IDUser");
		END LOOP;

		/***************************************************************
		 * does not work with PostgreSQL :(
		 *

		DELETE --"User"
		FROM "User" --t1
			INNER JOIN "fnc_User_Record_open_byGroup"(
				"IDGroup_search_"
			) t2 ON
				(t2."IDUser" = --t1.
				"IDUser");

		 *
		 ***************************************************************/

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_UserGroup_Record_delete_byUser_Defaultrelation"(
	"IDUser_search_" bigint, 
	"Relationdate_search_" timestamp without time zone
)
RETURNS VOID AS '
	DECLARE
		_UserGroup "v0_UserGroup__onlyKeys";
	BEGIN
		FOR _UserGroup IN
			SELECT
				"IDUser", 
				"IDGroup"
			FROM "fnc_UserGroup_Record_open_byUser_Defaultrelation"(
				"IDUser_search_", 
				"Relationdate_search_"
			)
		LOOP
			DELETE FROM "UserGroup"
			WHERE
				("IDUser" = _UserGroup."IDUser") AND
				("IDGroup" = _UserGroup."IDGroup");
		END LOOP;

		/***************************************************************
		 * does not work with PostgreSQL :(
		 *

		DELETE --"UserGroup"
		FROM "UserGroup" --t1
			INNER JOIN "fnc_UserGroup_Record_open_byUser_Defaultrelation"(
				"IDUser_search_", 
				"Relationdate_search_"
			) t2 ON
				(t2."IDUser" = --t1.
				"IDUser") AND
				(t2."IDGroup" = --t1.
				"IDGroup");

		 *
		 ***************************************************************/

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0__APAGAR"(
)
returns boolean
as '
	SELECT false;
' LANGUAGE 'SQL';


