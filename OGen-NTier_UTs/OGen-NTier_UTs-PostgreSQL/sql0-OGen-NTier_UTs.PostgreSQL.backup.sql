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


CREATE OR REPLACE VIEW "v0_GroupPermition__onlyKeys"
AS
	SELECT
		"IDGroup", 
		"IDPermition"
	FROM "GroupPermition"
;


CREATE OR REPLACE VIEW "v0_Language__onlyKeys"
AS
	SELECT
		"IDLanguage"
	FROM "Language"
;


CREATE OR REPLACE VIEW "v0_Log__onlyKeys"
AS
	SELECT
		"IDLog"
	FROM "Log"
;


CREATE OR REPLACE VIEW "v0_Logcode__onlyKeys"
AS
	SELECT
		"IDLogcode"
	FROM "Logcode"
;


CREATE OR REPLACE VIEW "v0_Permition__onlyKeys"
AS
	SELECT
		"IDPermition"
	FROM "Permition"
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


CREATE OR REPLACE VIEW "v0_Word__onlyKeys"
AS
	SELECT
		"IDWord"
	FROM "Word"
;


CREATE OR REPLACE VIEW "v0_WordLanguage__onlyKeys"
AS
	SELECT
		"IDWord", 
		"IDLanguage"
	FROM "WordLanguage"
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

CREATE OR REPLACE FUNCTION "fnc0_GroupPermition_isObject"("IDGroup_" bigint, "IDPermition_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "GroupPermition"
			WHERE
				("IDGroup" = "IDGroup_") AND
				("IDPermition" = "IDPermition_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_Language_isObject"("IDLanguage_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "Language"
			WHERE
				("IDLanguage" = "IDLanguage_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_Log_isObject"("IDLog_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "Log"
			WHERE
				("IDLog" = "IDLog_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_Logcode_isObject"("IDLogcode_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "Logcode"
			WHERE
				("IDLogcode" = "IDLogcode_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_Permition_isObject"("IDPermition_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "Permition"
			WHERE
				("IDPermition" = "IDPermition_")
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

CREATE OR REPLACE FUNCTION "fnc0_Word_isObject"("IDWord_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "Word"
			WHERE
				("IDWord" = "IDWord_")
		);
	END;
' LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "fnc0_WordLanguage_isObject"("IDWord_" bigint, "IDLanguage_" bigint)
RETURNS boolean
AS '
	BEGIN
		RETURN EXISTS(
			SELECT
				true -- whatever, just checking existence
			FROM "WordLanguage"
			WHERE
				("IDWord" = "IDWord_") AND
				("IDLanguage" = "IDLanguage_")
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

CREATE OR REPLACE FUNCTION "sp0_GroupPermition_setObject"(
	"IDGroup_" bigint, 
	"IDPermition_" bigint
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
			FROM "GroupPermition"
			WHERE
				("IDGroup" = "IDGroup_") AND
				("IDPermition" = "IDPermition_")
		);
		IF (_Exists) THEN
			_ConstraintExist := 0;
			/* no need!
			IF NOT (_ConstraintExist) THEN
				UPDATE "GroupPermition"
				SET
				WHERE
					("IDGroup" = "IDGroup_") AND
					("IDPermition" = "IDPermition_");
			END IF;
			*/
		ELSE
			_ConstraintExist := 0;
			IF NOT (_ConstraintExist) THEN
				INSERT INTO "GroupPermition" (
					"IDGroup", 
					"IDPermition"
				) VALUES (
					"IDGroup_", 
					"IDPermition_"
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

CREATE OR REPLACE FUNCTION "sp0_WordLanguage_setObject"(
	"IDWord_" bigint, 
	"IDLanguage_" bigint, 
	"Translation_" character varying
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
			FROM "WordLanguage"
			WHERE
				("IDWord" = "IDWord_") AND
				("IDLanguage" = "IDLanguage_")
		);
		IF (_Exists) THEN
			_ConstraintExist := 0;
			IF NOT (_ConstraintExist) THEN
				UPDATE "WordLanguage"
				SET
					"Translation" = "Translation_"
				WHERE
					("IDWord" = "IDWord_") AND
					("IDLanguage" = "IDLanguage_");
			END IF;
		ELSE
			_ConstraintExist := 0;
			IF NOT (_ConstraintExist) THEN
				INSERT INTO "WordLanguage" (
					"IDWord", 
					"IDLanguage", 
					"Translation"
				) VALUES (
					"IDWord_", 
					"IDLanguage_", 
					"Translation_"
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

CREATE OR REPLACE FUNCTION "sp0_GroupPermition_delObject"("IDGroup_" bigint, "IDPermition_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "GroupPermition"
		WHERE
			("IDGroup" = "IDGroup_") AND
			("IDPermition" = "IDPermition_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Language_delObject"("IDLanguage_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "Language"
		WHERE
			("IDLanguage" = "IDLanguage_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Log_delObject"("IDLog_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "Log"
		WHERE
			("IDLog" = "IDLog_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Logcode_delObject"("IDLogcode_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "Logcode"
		WHERE
			("IDLogcode" = "IDLogcode_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Permition_delObject"("IDPermition_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "Permition"
		WHERE
			("IDPermition" = "IDPermition_");

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

CREATE OR REPLACE FUNCTION "sp0_Word_delObject"("IDWord_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "Word"
		WHERE
			("IDWord" = "IDWord_");

		RETURN;
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_WordLanguage_delObject"("IDWord_" bigint, "IDLanguage_" bigint)
RETURNS void
AS '
	BEGIN
		DELETE
		FROM "WordLanguage"
		WHERE
			("IDWord" = "IDWord_") AND
			("IDLanguage" = "IDLanguage_");

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

CREATE OR REPLACE FUNCTION "sp0_GroupPermition_getObject"("IDGroup_" bigint, "IDPermition_" bigint)
RETURNS "GroupPermition"
AS '
	DECLARE
		_Output "GroupPermition"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDGroup", 
			"IDPermition", 
			true
		INTO
			_Output."IDGroup", 
			_Output."IDPermition", 
			_Exists
		FROM "GroupPermition"
		WHERE
			("IDGroup" = "IDGroup_") AND
			("IDPermition" = "IDPermition_");

		IF NOT (_Exists) THEN
			_Output."IDGroup" := NULL;
			_Output."IDPermition" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Language_getObject"("IDLanguage_" bigint)
RETURNS "Language"
AS '
	DECLARE
		_Output "Language"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDLanguage", 
			"IDWord_name", 
			true
		INTO
			_Output."IDLanguage", 
			_Output."IDWord_name", 
			_Exists
		FROM "Language"
		WHERE
			("IDLanguage" = "IDLanguage_");

		IF NOT (_Exists) THEN
			_Output."IDLanguage" := NULL;
			_Output."IDWord_name" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Log_getObject"("IDLog_" bigint)
RETURNS "Log"
AS '
	DECLARE
		_Output "Log"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDLog", 
			"IDLogcode", 
			"IDUser_posted", 
			"Date_posted", 
			"Logdata", 
			true
		INTO
			_Output."IDLog", 
			_Output."IDLogcode", 
			_Output."IDUser_posted", 
			_Output."Date_posted", 
			_Output."Logdata", 
			_Exists
		FROM "Log"
		WHERE
			("IDLog" = "IDLog_");

		IF NOT (_Exists) THEN
			_Output."IDLog" := NULL;
			_Output."IDLogcode" := NULL;
			_Output."IDUser_posted" := NULL;
			_Output."Date_posted" := NULL;
			_Output."Logdata" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Logcode_getObject"("IDLogcode_" bigint)
RETURNS "Logcode"
AS '
	DECLARE
		_Output "Logcode"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDLogcode", 
			"Warning", 
			"Error", 
			"Code", 
			"Description", 
			true
		INTO
			_Output."IDLogcode", 
			_Output."Warning", 
			_Output."Error", 
			_Output."Code", 
			_Output."Description", 
			_Exists
		FROM "Logcode"
		WHERE
			("IDLogcode" = "IDLogcode_");

		IF NOT (_Exists) THEN
			_Output."IDLogcode" := NULL;
			_Output."Warning" := NULL;
			_Output."Error" := NULL;
			_Output."Code" := NULL;
			_Output."Description" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_Permition_getObject"("IDPermition_" bigint)
RETURNS "Permition"
AS '
	DECLARE
		_Output "Permition"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDPermition", 
			"Name", 
			true
		INTO
			_Output."IDPermition", 
			_Output."Name", 
			_Exists
		FROM "Permition"
		WHERE
			("IDPermition" = "IDPermition_");

		IF NOT (_Exists) THEN
			_Output."IDPermition" := NULL;
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

CREATE OR REPLACE FUNCTION "sp0_Word_getObject"("IDWord_" bigint)
RETURNS "Word"
AS '
	DECLARE
		_Output "Word"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDWord", 
			"DeleteThisTestField", 
			true
		INTO
			_Output."IDWord", 
			_Output."DeleteThisTestField", 
			_Exists
		FROM "Word"
		WHERE
			("IDWord" = "IDWord_");

		IF NOT (_Exists) THEN
			_Output."IDWord" := NULL;
			_Output."DeleteThisTestField" := NULL;
		END IF;

		RETURN _Output;
	END;
'
LANGUAGE 'plpgsql' STABLE;

CREATE OR REPLACE FUNCTION "sp0_WordLanguage_getObject"("IDWord_" bigint, "IDLanguage_" bigint)
RETURNS "WordLanguage"
AS '
	DECLARE
		_Output "WordLanguage"%ROWTYPE;
		_Exists boolean = false;
	BEGIN

		SELECT
			"IDWord", 
			"IDLanguage", 
			"Translation", 
			true
		INTO
			_Output."IDWord", 
			_Output."IDLanguage", 
			_Output."Translation", 
			_Exists
		FROM "WordLanguage"
		WHERE
			("IDWord" = "IDWord_") AND
			("IDLanguage" = "IDLanguage_");

		IF NOT (_Exists) THEN
			_Output."IDWord" := NULL;
			_Output."IDLanguage" := NULL;
			_Output."Translation" := NULL;
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

CREATE OR REPLACE FUNCTION "sp0_Language_insObject"("IDWord_name_" bigint,  "SelectIdentity_" boolean)
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
			INSERT INTO "Language" (
				"IDWord_name"
			) VALUES (
				"IDWord_name_"
			);
			IF ("SelectIdentity_") THEN
				SELECT
					"IDLanguage"
				INTO
					IdentityKey
				FROM "Language"
				ORDER BY "IDLanguage" DESC LIMIT 1;
			ELSE
				IdentityKey := CAST(0 AS bigint);
			END IF;

		RETURN IdentityKey AS "IDLanguage_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Log_insObject"("IDLogcode_" bigint, "IDUser_posted_" bigint, "Date_posted_" timestamp without time zone, "Logdata_" character varying,  "SelectIdentity_" boolean)
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
			INSERT INTO "Log" (
				"IDLogcode", 
				"IDUser_posted", 
				"Date_posted", 
				"Logdata"
			) VALUES (
				"IDLogcode_", 
				"IDUser_posted_", 
				"Date_posted_", 
				"Logdata_"
			);
			IF ("SelectIdentity_") THEN
				SELECT
					"IDLog"
				INTO
					IdentityKey
				FROM "Log"
				ORDER BY "IDLog" DESC LIMIT 1;
			ELSE
				IdentityKey := CAST(0 AS bigint);
			END IF;

		RETURN IdentityKey AS "IDLog_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Logcode_insObject"("Warning_" boolean, "Error_" boolean, "Code_" character varying, "Description_" character varying,  "SelectIdentity_" boolean)
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
			INSERT INTO "Logcode" (
				"Warning", 
				"Error", 
				"Code", 
				"Description"
			) VALUES (
				"Warning_", 
				"Error_", 
				"Code_", 
				"Description_"
			);
			IF ("SelectIdentity_") THEN
				SELECT
					"IDLogcode"
				INTO
					IdentityKey
				FROM "Logcode"
				ORDER BY "IDLogcode" DESC LIMIT 1;
			ELSE
				IdentityKey := CAST(0 AS bigint);
			END IF;

		RETURN IdentityKey AS "IDLogcode_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Permition_insObject"("Name_" character varying,  "SelectIdentity_" boolean)
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
			INSERT INTO "Permition" (
				"Name"
			) VALUES (
				"Name_"
			);
			IF ("SelectIdentity_") THEN
				SELECT
					"IDPermition"
				INTO
					IdentityKey
				FROM "Permition"
				ORDER BY "IDPermition" DESC LIMIT 1;
			ELSE
				IdentityKey := CAST(0 AS bigint);
			END IF;

		RETURN IdentityKey AS "IDPermition_";
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

CREATE OR REPLACE FUNCTION "sp0_Word_insObject"("DeleteThisTestField_" boolean,  "SelectIdentity_" boolean)
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
			INSERT INTO "Word" (
				"DeleteThisTestField"
			) VALUES (
				"DeleteThisTestField_"
			);
			IF ("SelectIdentity_") THEN
				SELECT
					"IDWord"
				INTO
					IdentityKey
				FROM "Word"
				ORDER BY "IDWord" DESC LIMIT 1;
			ELSE
				IdentityKey := CAST(0 AS bigint);
			END IF;

		RETURN IdentityKey AS "IDWord_";
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

CREATE OR REPLACE FUNCTION "sp0_Language_updObject"("IDLanguage_" bigint, "IDWord_name_" bigint)
RETURNS bool
AS '
	/***********************************************
	 *  returns                                    *
	 *    true: constraint exists, update NOT made * 
	 *    false: NO constraint, update made        *
	 ***********************************************/

	BEGIN
			UPDATE "Language"
			SET
				"IDWord_name" = "IDWord_name_"
			WHERE
				("IDLanguage" = "IDLanguage_")
			;

			RETURN false AS "ConstraintExist_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Log_updObject"("IDLog_" bigint, "IDLogcode_" bigint, "IDUser_posted_" bigint, "Date_posted_" timestamp without time zone, "Logdata_" character varying)
RETURNS bool
AS '
	/***********************************************
	 *  returns                                    *
	 *    true: constraint exists, update NOT made * 
	 *    false: NO constraint, update made        *
	 ***********************************************/

	BEGIN
			UPDATE "Log"
			SET
				"IDLogcode" = "IDLogcode_", 
				"IDUser_posted" = "IDUser_posted_", 
				"Date_posted" = "Date_posted_", 
				"Logdata" = "Logdata_"
			WHERE
				("IDLog" = "IDLog_")
			;

			RETURN false AS "ConstraintExist_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Logcode_updObject"("IDLogcode_" bigint, "Warning_" boolean, "Error_" boolean, "Code_" character varying, "Description_" character varying)
RETURNS bool
AS '
	/***********************************************
	 *  returns                                    *
	 *    true: constraint exists, update NOT made * 
	 *    false: NO constraint, update made        *
	 ***********************************************/

	BEGIN
			UPDATE "Logcode"
			SET
				"Warning" = "Warning_", 
				"Error" = "Error_", 
				"Code" = "Code_", 
				"Description" = "Description_"
			WHERE
				("IDLogcode" = "IDLogcode_")
			;

			RETURN false AS "ConstraintExist_";
	END;
' LANGUAGE 'plpgsql' VOLATILE;

CREATE OR REPLACE FUNCTION "sp0_Permition_updObject"("IDPermition_" bigint, "Name_" character varying)
RETURNS bool
AS '
	/***********************************************
	 *  returns                                    *
	 *    true: constraint exists, update NOT made * 
	 *    false: NO constraint, update made        *
	 ***********************************************/

	BEGIN
			UPDATE "Permition"
			SET
				"Name" = "Name_"
			WHERE
				("IDPermition" = "IDPermition_")
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

CREATE OR REPLACE FUNCTION "sp0_Word_updObject"("IDWord_" bigint, "DeleteThisTestField_" boolean)
RETURNS bool
AS '
	/***********************************************
	 *  returns                                    *
	 *    true: constraint exists, update NOT made * 
	 *    false: NO constraint, update made        *
	 ***********************************************/

	BEGIN
			UPDATE "Word"
			SET
				"DeleteThisTestField" = "DeleteThisTestField_"
			WHERE
				("IDWord" = "IDWord_")
			;

			RETURN false AS "ConstraintExist_";
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


