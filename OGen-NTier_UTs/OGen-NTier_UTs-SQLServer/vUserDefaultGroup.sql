CREATE VIEW "vUserDefaultGroup" AS
	SELECT
		t2."IDUser", 
		t2."Login", 
		t3."IDGroup", 
		t3."Name", 
		t1."Relationdate"
	FROM "UserGroup" t1
		JOIN "User" t2 ON (t2."IDUser" = t1."IDUser")
		JOIN "Group" t3 ON (t3."IDGroup" = t1."IDGroup")
	WHERE t1."Defaultrelation" = 1


