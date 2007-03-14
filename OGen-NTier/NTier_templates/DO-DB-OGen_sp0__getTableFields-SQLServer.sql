CREATE PROCEDURE [dbo].[OGen_sp0__getTableFields]
	@tableName_ NVarChar (138)
AS
/*

OGen
Copyright (C) 2002 Francisco Monteiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
SELECT
	t1.COLUMN_NAME AS "Name", 
	CASE
		WHEN t1.IS_NULLABLE = 'No' THEN
			CAST(0 AS Int)
		ELSE
			CAST(1 AS Int)
	END AS "isNullable", 
	t1.DATA_TYPE AS "Type", 
	t1.CHARACTER_MAXIMUM_LENGTH AS "Size", 
	CASE
		WHEN (t6.TABLE_TYPE = 'VIEW') THEN
			CASE
				WHEN (
					(SUBSTRING(t1.COLUMN_NAME, 3, 1) = ',') AND 
					(SUBSTRING(t1.COLUMN_NAME, 2, 1) = 'K')
				) THEN
					CAST(1 AS Int)
				ELSE
					CAST(0 AS Int)
			END
		WHEN t2.CONSTRAINT_NAME IS NULL THEN
			CAST(0 AS Int)
		ELSE
			CAST(1 AS Int)
	END AS "isPK", 
	CASE
		WHEN (t6.TABLE_TYPE != 'VIEW') THEN
			CAST(COLUMNPROPERTY(OBJECT_ID(t1.TABLE_NAME), t1.COLUMN_NAME, 'IsIdentity') AS Int)
		ELSE
			CASE
				WHEN (
					(SUBSTRING(t1.COLUMN_NAME, 3, 1) = ',') AND 
					(SUBSTRING(t1.COLUMN_NAME, 1, 1) = 'I')
				) THEN
					CAST(1 AS Int)
				ELSE
					CAST(0 AS Int)
			END
			--COLUMNPROPERTY(OBJECT_ID(t5.TABLE_NAME), t5.COLUMN_NAME, 'IsIdentity')
	END AS "isIdentity", 
	CASE
		WHEN (t6.TABLE_TYPE != 'VIEW') THEN
			t8.TABLE_NAME
		ELSE
			/*
			CASE
				WHEN (SUBSTRING(t1.COLUMN_NAME, 3, 1) = ',') THEN
					SUBSTRING(
						t1.COLUMN_NAME,
						dbo.fnc__FIND(
							',', 
							t1.COLUMN_NAME, 
							1
						) + 1,
						dbo.fnc__FIND(
							',', 
							t1.COLUMN_NAME, 
							dbo.fnc__FIND(
								',', 
								t1.COLUMN_NAME, 
								1
							) + 1
						)
						- dbo.fnc__FIND(
							',', 
							t1.COLUMN_NAME, 
							1
						)
						- 1
					)
				ELSE
					NULL
			END
			*/
			NULL
			--t5.TABLE_NAME
	END AS "FK_TableName", 
	CASE
		WHEN (t6.TABLE_TYPE != 'VIEW') THEN
			t8.COLUMN_NAME
		ELSE
			/*
			CASE
				WHEN (SUBSTRING(t1.COLUMN_NAME, 3, 1) = ',') THEN
					SUBSTRING(
						t1.COLUMN_NAME,
						dbo.fnc__FIND(
							',', 
							t1.COLUMN_NAME, 
							dbo.fnc__FIND(
								',', 
								t1.COLUMN_NAME, 
								1
							) + 1
						) + 1,
						LEN(t1.COLUMN_NAME)
					)
				ELSE
					NULL
			END
			*/
			NULL
			--t5.COLUMN_NAME
	END AS "FK_FieldName", 
	t1.COLUMN_DEFAULT, 
	t1.COLLATION_NAME, 
	t1.NUMERIC_PRECISION, 
	t1.NUMERIC_SCALE
FROM INFORMATION_SCHEMA.COLUMNS AS t1
	LEFT JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE t2 ON
		(t2.COLUMN_NAME = t1.COLUMN_NAME)
		AND
		(t2.TABLE_NAME = t1.TABLE_NAME)
		AND
		(
			--(t2.CONSTRAINT_NAME LIKE 'PK%')

			(t2.CONSTRAINT_NAME = 'PK_' + t2.TABLE_NAME) -- the microsoft sql server way
			OR
			(t2.CONSTRAINT_NAME = t2.TABLE_NAME + '_PK') -- the microsoft visio way
		)
	--LEFT JOIN INFORMATION_SCHEMA.Referential_Constraints t3 ON
	--	(t3.UNIQUE_CONSTRAINT_NAME = t2.CONSTRAINT_NAME)
	LEFT JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE t4 ON
		(t4.COLUMN_NAME = t1.COLUMN_NAME)
		AND
		(t4.TABLE_NAME = t1.TABLE_NAME)
		AND
		(t4.CONSTRAINT_NAME LIKE '%_FK%')
	--LEFT JOIN INFORMATION_SCHEMA.View_Column_Usage t5 ON
	--	(t5.VIEW_NAME = t1.TABLE_NAME)
	--	AND
	--	(t5.COLUMN_NAME = t1.COLUMN_NAME)
	LEFT JOIN INFORMATION_SCHEMA.TABLES t6 ON
		(t6.TABLE_NAME = t1.TABLE_NAME)
	LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS t7 ON
		(t4.CONSTRAINT_NAME = t7.CONSTRAINT_NAME)
	LEFT JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE t8 ON
		(t7.UNIQUE_CONSTRAINT_NAME = t8.CONSTRAINT_NAME)
--WHERE (t1.TABLE_NAME LIKE 'vUserGroup%') --OR (t1.TABLE_NAME = 'UserGroup') OR (t1.TABLE_NAME = 'User') OR (t1.TABLE_NAME = 'Group')
--WHERE (t1.TABLE_NAME != 'dtproperties') AND (t1.TABLE_NAME NOT LIKE 'sql_%') AND (t1.TABLE_NAME NOT LIKE 'pg_%') AND (t1.TABLE_NAME NOT LIKE 'sys%')
WHERE (t1.TABLE_NAME = @tableName_) 
ORDER BY 
	--t1.TABLE_NAME, 
	t1.ORDINAL_POSITION
