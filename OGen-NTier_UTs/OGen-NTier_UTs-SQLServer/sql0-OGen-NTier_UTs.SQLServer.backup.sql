CREATE FUNCTION [dbo].[fnc0_Config_isObject](
	@Name_ varchar (50)
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [Config]
	WHERE
		([Name] = @Name_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_Group_isObject](
	@IDGroup_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [Group]
	WHERE
		([IDGroup] = @IDGroup_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_GroupPermition_isObject](
	@IDGroup_ bigint, 
	@IDPermition_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [GroupPermition]
	WHERE
		([IDGroup] = @IDGroup_) AND
		([IDPermition] = @IDPermition_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_Language_isObject](
	@IDLanguage_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [Language]
	WHERE
		([IDLanguage] = @IDLanguage_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_Log_isObject](
	@IDLog_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [Log]
	WHERE
		([IDLog] = @IDLog_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_Logcode_isObject](
	@IDLogcode_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [Logcode]
	WHERE
		([IDLogcode] = @IDLogcode_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_Permition_isObject](
	@IDPermition_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [Permition]
	WHERE
		([IDPermition] = @IDPermition_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_User_isObject](
	@IDUser_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [User]
	WHERE
		([IDUser] = @IDUser_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_UserGroup_isObject](
	@IDUser_ bigint, 
	@IDGroup_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [UserGroup]
	WHERE
		([IDUser] = @IDUser_) AND
		([IDGroup] = @IDGroup_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_vUserDefaultGroup_isObject](
	@IDUser_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [vUserDefaultGroup]
	WHERE
		([IDUser] = @IDUser_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_vUserGroup_isObject](
	@IDUser_ bigint, 
	@IDGroup_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [vUserGroup]
	WHERE
		([IDUser] = @IDUser_) AND
		([IDGroup] = @IDGroup_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_Word_isObject](
	@IDWord_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [Word]
	WHERE
		([IDWord] = @IDWord_)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_WordLanguage_isObject](
	@IDWord_ bigint, 
	@IDLanguage_ bigint
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT @isObject = 1
	FROM [WordLanguage]
	WHERE
		([IDWord] = @IDWord_) AND
		([IDLanguage] = @IDLanguage_)

	RETURN @isObject
END
--GO


CREATE PROCEDURE [dbo].[sp0_Config_setObject]
	@Name_ varchar (50), 
	@Config_ varchar (50), 
	@Type_ int, 
	@Description_ varchar (50), 

	@Output_ Int OUT
AS
	DECLARE @Exists Bit
	DECLARE @ConstraintExist Bit

	IF NOT EXISTS (
		SELECT NULL--[Name]
		FROM [Config]
		WHERE
			([Name] = @Name_)
	) BEGIN
		SET @Exists = 0
		SET @ConstraintExist = 0
		IF (@ConstraintExist = 0) BEGIN
			INSERT INTO [Config] (
				[Name], 
				[Config], 
				[Type], 
				[Description]
			) VALUES (
				@Name_, 
				@Config_, 
				@Type_, 
				@Description_
			)
		END
	END ELSE BEGIN
		SET @Exists = 1
		SET @ConstraintExist = 0
		IF (@ConstraintExist = 0) BEGIN
			UPDATE [Config]
			SET
				[Config] = @Config_, 
				[Type] = @Type_, 
				[Description] = @Description_
			WHERE
				([Name] = @Name_)
		END
	END

	SET @Output_ = 0
	IF (@Exists = 1) BEGIN
		SET @Output_ = @Output_ + 1
	END
	IF (@ConstraintExist = 1) BEGIN
		SET @Output_ = @Output_ + 2
	END
--GO


CREATE PROCEDURE [dbo].[sp0_GroupPermition_setObject]
	@IDGroup_ bigint, 
	@IDPermition_ bigint, 

	@Output_ Int OUT
AS
	DECLARE @Exists Bit
	DECLARE @ConstraintExist Bit

	IF NOT EXISTS (
		SELECT NULL--[IDGroup]
		FROM [GroupPermition]
		WHERE
			([IDGroup] = @IDGroup_) AND
			([IDPermition] = @IDPermition_)
	) BEGIN
		SET @Exists = 0
		SET @ConstraintExist = 0
		IF (@ConstraintExist = 0) BEGIN
			INSERT INTO [GroupPermition] (
				[IDGroup], 
				[IDPermition]
			) VALUES (
				@IDGroup_, 
				@IDPermition_
			)
		END
	END ELSE BEGIN
		SET @Exists = 1
		SET @ConstraintExist = 0
	END

	SET @Output_ = 0
	IF (@Exists = 1) BEGIN
		SET @Output_ = @Output_ + 1
	END
	IF (@ConstraintExist = 1) BEGIN
		SET @Output_ = @Output_ + 2
	END
--GO


CREATE PROCEDURE [dbo].[sp0_UserGroup_setObject]
	@IDUser_ bigint, 
	@IDGroup_ bigint, 
	@Relationdate_ datetime, 
	@Defaultrelation_ bit, 

	@Output_ Int OUT
AS
	DECLARE @Exists Bit
	DECLARE @ConstraintExist Bit

	IF NOT EXISTS (
		SELECT NULL--[IDUser]
		FROM [UserGroup]
		WHERE
			([IDUser] = @IDUser_) AND
			([IDGroup] = @IDGroup_)
	) BEGIN
		SET @Exists = 0
		SET @ConstraintExist = 0
		IF (@ConstraintExist = 0) BEGIN
			INSERT INTO [UserGroup] (
				[IDUser], 
				[IDGroup], 
				[Relationdate], 
				[Defaultrelation]
			) VALUES (
				@IDUser_, 
				@IDGroup_, 
				@Relationdate_, 
				@Defaultrelation_
			)
		END
	END ELSE BEGIN
		SET @Exists = 1
		SET @ConstraintExist = 0
		IF (@ConstraintExist = 0) BEGIN
			UPDATE [UserGroup]
			SET
				[Relationdate] = @Relationdate_, 
				[Defaultrelation] = @Defaultrelation_
			WHERE
				([IDUser] = @IDUser_) AND
				([IDGroup] = @IDGroup_)
		END
	END

	SET @Output_ = 0
	IF (@Exists = 1) BEGIN
		SET @Output_ = @Output_ + 1
	END
	IF (@ConstraintExist = 1) BEGIN
		SET @Output_ = @Output_ + 2
	END
--GO


CREATE PROCEDURE [dbo].[sp0_WordLanguage_setObject]
	@IDWord_ bigint, 
	@IDLanguage_ bigint, 
	@Translation_ varchar (2048), 

	@Output_ Int OUT
AS
	DECLARE @Exists Bit
	DECLARE @ConstraintExist Bit

	IF NOT EXISTS (
		SELECT NULL--[IDWord]
		FROM [WordLanguage]
		WHERE
			([IDWord] = @IDWord_) AND
			([IDLanguage] = @IDLanguage_)
	) BEGIN
		SET @Exists = 0
		SET @ConstraintExist = 0
		IF (@ConstraintExist = 0) BEGIN
			INSERT INTO [WordLanguage] (
				[IDWord], 
				[IDLanguage], 
				[Translation]
			) VALUES (
				@IDWord_, 
				@IDLanguage_, 
				@Translation_
			)
		END
	END ELSE BEGIN
		SET @Exists = 1
		SET @ConstraintExist = 0
		IF (@ConstraintExist = 0) BEGIN
			UPDATE [WordLanguage]
			SET
				[Translation] = @Translation_
			WHERE
				([IDWord] = @IDWord_) AND
				([IDLanguage] = @IDLanguage_)
		END
	END

	SET @Output_ = 0
	IF (@Exists = 1) BEGIN
		SET @Output_ = @Output_ + 1
	END
	IF (@ConstraintExist = 1) BEGIN
		SET @Output_ = @Output_ + 2
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Config_delObject]
	@Name_ varchar (50)
AS
	DELETE
	FROM [Config]
	WHERE
		([Name] = @Name_)
--GO


CREATE PROCEDURE [dbo].[sp0_Group_delObject]
	@IDGroup_ bigint
AS
	DELETE
	FROM [Group]
	WHERE
		([IDGroup] = @IDGroup_)
--GO


CREATE PROCEDURE [dbo].[sp0_GroupPermition_delObject]
	@IDGroup_ bigint, 
	@IDPermition_ bigint
AS
	DELETE
	FROM [GroupPermition]
	WHERE
		([IDGroup] = @IDGroup_) AND
		([IDPermition] = @IDPermition_)
--GO


CREATE PROCEDURE [dbo].[sp0_Language_delObject]
	@IDLanguage_ bigint
AS
	DELETE
	FROM [Language]
	WHERE
		([IDLanguage] = @IDLanguage_)
--GO


CREATE PROCEDURE [dbo].[sp0_Log_delObject]
	@IDLog_ bigint
AS
	DELETE
	FROM [Log]
	WHERE
		([IDLog] = @IDLog_)
--GO


CREATE PROCEDURE [dbo].[sp0_Logcode_delObject]
	@IDLogcode_ bigint
AS
	DELETE
	FROM [Logcode]
	WHERE
		([IDLogcode] = @IDLogcode_)
--GO


CREATE PROCEDURE [dbo].[sp0_Permition_delObject]
	@IDPermition_ bigint
AS
	DELETE
	FROM [Permition]
	WHERE
		([IDPermition] = @IDPermition_)
--GO


CREATE PROCEDURE [dbo].[sp0_User_delObject]
	@IDUser_ bigint
AS
	DELETE
	FROM [User]
	WHERE
		([IDUser] = @IDUser_)
--GO


CREATE PROCEDURE [dbo].[sp0_UserGroup_delObject]
	@IDUser_ bigint, 
	@IDGroup_ bigint
AS
	DELETE
	FROM [UserGroup]
	WHERE
		([IDUser] = @IDUser_) AND
		([IDGroup] = @IDGroup_)
--GO


CREATE PROCEDURE [dbo].[sp0_Word_delObject]
	@IDWord_ bigint
AS
	DELETE
	FROM [Word]
	WHERE
		([IDWord] = @IDWord_)
--GO


CREATE PROCEDURE [dbo].[sp0_WordLanguage_delObject]
	@IDWord_ bigint, 
	@IDLanguage_ bigint
AS
	DELETE
	FROM [WordLanguage]
	WHERE
		([IDWord] = @IDWord_) AND
		([IDLanguage] = @IDLanguage_)
--GO


CREATE FUNCTION [dbo].[fnc_User_isObject_byLogin](
	@Login_search_ varchar (50)
)
RETURNS @finalresult TABLE (
	[IDUser] bigint
)
AS
BEGIN
	INSERT INTO @finalresult
	SELECT
		[IDUser]
	FROM [User]
	WHERE
		([Login] LIKE '%' + @Login_search_ + '%' COLLATE SQL_Latin1_General_CP1_CI_AS)

	RETURN
END
--GO


CREATE FUNCTION [dbo].[fnc_Config_Record_open_all](
)
RETURNS TABLE
AS
RETURN
	SELECT
		[Name]
	FROM [Config]/*
	WHERE*/
--GO


CREATE FUNCTION [dbo].[fnc_User_Record_open_all](
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser]
	FROM [User]/*
	WHERE*/
--GO


CREATE FUNCTION [dbo].[fnc_User_Record_open_byGroup](
	@IDGroup_search_ bigint
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser]
	FROM [User]/*
	WHERE
		([IDGroup] = @IDGroup_search_)*/
--GO


CREATE FUNCTION [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation](
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser], 
		[IDGroup]
	FROM [UserGroup]
	WHERE
		([IDUser] = @IDUser_search_) AND
		((
			(@Relationdate_search_ IS NULL)
			AND
			([Relationdate] IS NULL)
		) OR (
			NOT (@Relationdate_search_ IS NULL)
			AND
			([Relationdate] = @Relationdate_search_)
		))
--GO


CREATE FUNCTION [dbo].[fnc_vUserDefaultGroup_Record_open_all](
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser]
	FROM [vUserDefaultGroup]/*
	WHERE*/
--GO


CREATE PROCEDURE [dbo].[sp_Config_Record_open_all]
AS
	SELECT
		t1.[Name]
	FROM [Config] t1
	INNER JOIN [dbo].[fnc_Config_Record_open_all](
	) t2 ON (
		(t2.[Name] = t1.[Name])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_Config_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
--GO


CREATE PROCEDURE [dbo].[sp_User_Record_open_all]
AS
	SELECT
		t1.[IDUser]
	FROM [User] t1
	INNER JOIN [dbo].[fnc_User_Record_open_all](
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
--GO


CREATE PROCEDURE [dbo].[sp_User_Record_open_byGroup]
	@IDGroup_search_ bigint
AS
	SELECT
		t1.[IDUser]
	FROM [User] t1
	INNER JOIN [dbo].[fnc_User_Record_open_byGroup](
		@IDGroup_search_
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_byGroup]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
--GO


CREATE PROCEDURE [dbo].[sp_UserGroup_Record_open_byUser_Defaultrelation]
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime
AS
	SELECT
		t1.[IDUser], 
		t1.[IDGroup]
	FROM [UserGroup] t1
	INNER JOIN [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation](
		@IDUser_search_, 
		@Relationdate_search_
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser]) AND
		(t2.[IDGroup] = t1.[IDGroup])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
--GO


CREATE PROCEDURE [dbo].[sp_vUserDefaultGroup_Record_open_all]
AS
	SELECT
		t1.[IDUser]
	FROM [vUserDefaultGroup] t1
	INNER JOIN [dbo].[fnc_vUserDefaultGroup_Record_open_all](
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_vUserDefaultGroup_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
--GO


CREATE PROCEDURE [dbo].[sp0_Config_getObject]
	@Name_ varchar (50) OUT, 
	@Config_ varchar (50) OUT, 
	@Type_ int OUT, 
	@Description_ varchar (50) OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@Name_ = [Name], 
		@Config_ = [Config], 
		@Type_ = [Type], 
		@Description_ = [Description], 
		@Exists = 1
	FROM [Config]
	WHERE
		([Name] = @Name_)

	IF (@exists = 0) BEGIN
		SET @Name_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Group_getObject]
	@IDGroup_ bigint OUT, 
	@Name_ varchar (50) OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDGroup_ = [IDGroup], 
		@Name_ = [Name], 
		@Exists = 1
	FROM [Group]
	WHERE
		([IDGroup] = @IDGroup_)

	IF (@exists = 0) BEGIN
		SET @IDGroup_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_GroupPermition_getObject]
	@IDGroup_ bigint OUT, 
	@IDPermition_ bigint OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDGroup_ = [IDGroup], 
		@IDPermition_ = [IDPermition], 
		@Exists = 1
	FROM [GroupPermition]
	WHERE
		([IDGroup] = @IDGroup_) AND
		([IDPermition] = @IDPermition_)

	IF (@exists = 0) BEGIN
		SET @IDGroup_ = NULL
		SET @IDPermition_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Language_getObject]
	@IDLanguage_ bigint OUT, 
	@IDWord_name_ bigint OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDLanguage_ = [IDLanguage], 
		@IDWord_name_ = [IDWord_name], 
		@Exists = 1
	FROM [Language]
	WHERE
		([IDLanguage] = @IDLanguage_)

	IF (@exists = 0) BEGIN
		SET @IDLanguage_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Log_getObject]
	@IDLog_ bigint OUT, 
	@IDLogcode_ bigint OUT, 
	@IDUser_posted_ bigint OUT, 
	@Date_posted_ datetime OUT, 
	@Logdata_ varchar (1024) OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDLog_ = [IDLog], 
		@IDLogcode_ = [IDLogcode], 
		@IDUser_posted_ = [IDUser_posted], 
		@Date_posted_ = [Date_posted], 
		@Logdata_ = [Logdata], 
		@Exists = 1
	FROM [Log]
	WHERE
		([IDLog] = @IDLog_)

	IF (@exists = 0) BEGIN
		SET @IDLog_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Logcode_getObject]
	@IDLogcode_ bigint OUT, 
	@Warning_ bit OUT, 
	@Error_ bit OUT, 
	@Code_ varchar (50) OUT, 
	@Description_ varchar (50) OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDLogcode_ = [IDLogcode], 
		@Warning_ = [Warning], 
		@Error_ = [Error], 
		@Code_ = [Code], 
		@Description_ = [Description], 
		@Exists = 1
	FROM [Logcode]
	WHERE
		([IDLogcode] = @IDLogcode_)

	IF (@exists = 0) BEGIN
		SET @IDLogcode_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Permition_getObject]
	@IDPermition_ bigint OUT, 
	@Name_ varchar (50) OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDPermition_ = [IDPermition], 
		@Name_ = [Name], 
		@Exists = 1
	FROM [Permition]
	WHERE
		([IDPermition] = @IDPermition_)

	IF (@exists = 0) BEGIN
		SET @IDPermition_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_User_getObject]
	@IDUser_ bigint OUT, 
	@Login_ varchar (50) OUT, 
	@Password_ varchar (50) OUT, 
	@SomeNullValue_ int OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDUser_ = [IDUser], 
		@Login_ = [Login], 
		@Password_ = [Password], 
		@SomeNullValue_ = [SomeNullValue], 
		@Exists = 1
	FROM [User]
	WHERE
		([IDUser] = @IDUser_)

	IF (@exists = 0) BEGIN
		SET @IDUser_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_UserGroup_getObject]
	@IDUser_ bigint OUT, 
	@IDGroup_ bigint OUT, 
	@Relationdate_ datetime OUT, 
	@Defaultrelation_ bit OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDUser_ = [IDUser], 
		@IDGroup_ = [IDGroup], 
		@Relationdate_ = [Relationdate], 
		@Defaultrelation_ = [Defaultrelation], 
		@Exists = 1
	FROM [UserGroup]
	WHERE
		([IDUser] = @IDUser_) AND
		([IDGroup] = @IDGroup_)

	IF (@exists = 0) BEGIN
		SET @IDUser_ = NULL
		SET @IDGroup_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_vUserDefaultGroup_getObject]
	@IDUser_ bigint OUT, 
	@Login_ varchar (50) OUT, 
	@IDGroup_ bigint OUT, 
	@Name_ varchar (50) OUT, 
	@Relationdate_ datetime OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDUser_ = [IDUser], 
		@Login_ = [Login], 
		@IDGroup_ = [IDGroup], 
		@Name_ = [Name], 
		@Relationdate_ = [Relationdate], 
		@Exists = 1
	FROM [vUserDefaultGroup]
	WHERE
		([IDUser] = @IDUser_)

	IF (@exists = 0) BEGIN
		SET @IDUser_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_vUserGroup_getObject]
	@IDUser_ bigint OUT, 
	@Login_ varchar (50) OUT, 
	@IDGroup_ bigint OUT, 
	@Name_ varchar (50) OUT, 
	@Relationdate_ datetime OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDUser_ = [IDUser], 
		@Login_ = [Login], 
		@IDGroup_ = [IDGroup], 
		@Name_ = [Name], 
		@Relationdate_ = [Relationdate], 
		@Exists = 1
	FROM [vUserGroup]
	WHERE
		([IDUser] = @IDUser_) AND
		([IDGroup] = @IDGroup_)

	IF (@exists = 0) BEGIN
		SET @IDUser_ = NULL
		SET @IDGroup_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Word_getObject]
	@IDWord_ bigint OUT, 
	@DeleteThisTestField_ bit OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDWord_ = [IDWord], 
		@DeleteThisTestField_ = [DeleteThisTestField], 
		@Exists = 1
	FROM [Word]
	WHERE
		([IDWord] = @IDWord_)

	IF (@exists = 0) BEGIN
		SET @IDWord_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_WordLanguage_getObject]
	@IDWord_ bigint OUT, 
	@IDLanguage_ bigint OUT, 
	@Translation_ varchar (2048) OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDWord_ = [IDWord], 
		@IDLanguage_ = [IDLanguage], 
		@Translation_ = [Translation], 
		@Exists = 1
	FROM [WordLanguage]
	WHERE
		([IDWord] = @IDWord_) AND
		([IDLanguage] = @IDLanguage_)

	IF (@exists = 0) BEGIN
		SET @IDWord_ = NULL
		SET @IDLanguage_ = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_User_getObject_byLogin]
	@Login_search_ varchar (50), 
	@IDUser bigint OUT, 
	@Login varchar (50) OUT, 
	@Password varchar (50) OUT, 
	@SomeNullValue int OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDUser = t1.[IDUser], 
		@Login = t1.[Login], 
		@Password = t1.[Password], 
		@SomeNullValue = t1.[SomeNullValue], 
		@Exists = 1
	FROM [User] t1
	INNER JOIN [dbo].[fnc_User_isObject_byLogin](
		@Login_search_
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	IF (@Exists = 0) BEGIN
		SET @IDUser = NULL
		SET @Login = NULL
		SET @Password = NULL
		SET @SomeNullValue = NULL
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Config_Record_open_all_fullmode]
AS
	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[Name] varchar (50)
	)
	
	INSERT INTO [#Table_temp] (
		[Name]
	)
	EXEC [dbo].[sp_Config_Record_open_all] 

	SELECT
		t1.[Name], 
		t1.[Config], 
		t1.[Type], 
		t1.[Description]
	FROM [Config] t1
		INNER JOIN [#Table_temp] t2 ON (
			(t2.[Name] = t1.[Name] COLLATE SQL_Latin1_General_CP1_CI_AI)
		)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_Config_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY IN: [dbo].[sp_Config_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_open_all_fullmode]
AS
	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_User_Record_open_all] 

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[Password], 
		t1.[SomeNullValue]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON (
			(t2.[IDUser] = t1.[IDUser])
		)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY IN: [dbo].[sp_User_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_open_byGroup_fullmode]
	@IDGroup_search_ bigint
AS
	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_User_Record_open_byGroup] @IDGroup_search_

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[Password], 
		t1.[SomeNullValue]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON (
			(t2.[IDUser] = t1.[IDUser])
		)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_byGroup]
	-- NOT HERE!

	-- CHANGE ORDER BY IN: [dbo].[sp_User_Record_open_byGroup]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]
--GO


CREATE PROCEDURE [dbo].[sp0_UserGroup_Record_open_byUser_Defaultrelation_fullmode]
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime
AS
	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint, 
		[IDGroup] bigint
	)
	
	INSERT INTO [#Table_temp] (
		[IDUser], 
		[IDGroup]
	)
	EXEC [dbo].[sp_UserGroup_Record_open_byUser_Defaultrelation] @IDUser_search_, @Relationdate_search_

	SELECT
		t1.[IDUser], 
		t1.[IDGroup], 
		t1.[Relationdate], 
		t1.[Defaultrelation]
	FROM [UserGroup] t1
		INNER JOIN [#Table_temp] t2 ON (
			(t2.[IDUser] = t1.[IDUser])AND 
			(t2.[IDGroup] = t1.[IDGroup])
		)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation]
	-- NOT HERE!

	-- CHANGE ORDER BY IN: [dbo].[sp_UserGroup_Record_open_byUser_Defaultrelation]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]
--GO


CREATE PROCEDURE [dbo].[sp0_vUserDefaultGroup_Record_open_all_fullmode]
AS
	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_vUserDefaultGroup_Record_open_all] 

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[IDGroup], 
		t1.[Name], 
		t1.[Relationdate]
	FROM [vUserDefaultGroup] t1
		INNER JOIN [#Table_temp] t2 ON (
			(t2.[IDUser] = t1.[IDUser])
		)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_vUserDefaultGroup_Record_open_all]
	-- NOT HERE!

	-- CHANGE ORDER BY IN: [dbo].[sp_vUserDefaultGroup_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]
--GO


CREATE PROCEDURE [dbo].[sp0_Config_Record_open_all_page]
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[Name] varchar (50)
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[Name]
	)
	EXEC [dbo].[sp_Config_Record_open_all] 

	SELECT
		t1.[Name]
	FROM [Config] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[Name] = t1.[Name] COLLATE SQL_Latin1_General_CP1_CI_AI)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_Config_Record_open_all]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_Config_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_open_all_page]
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_User_Record_open_all] 

	SELECT
		t1.[IDUser]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_all]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_User_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_open_byGroup_page]
	@IDGroup_search_ bigint, 
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_User_Record_open_byGroup] @IDGroup_search_

	SELECT
		t1.[IDUser]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_byGroup]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_User_Record_open_byGroup]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_UserGroup_Record_open_byUser_Defaultrelation_page]
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime, 
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint, 
		[IDGroup] bigint
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[IDUser], 
		[IDGroup]
	)
	EXEC [dbo].[sp_UserGroup_Record_open_byUser_Defaultrelation] @IDUser_search_, @Relationdate_search_

	SELECT
		t1.[IDUser], 
		t1.[IDGroup]
	FROM [UserGroup] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])AND 
			(t2.[IDGroup] = t1.[IDGroup])

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_UserGroup_Record_open_byUser_Defaultrelation]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_vUserDefaultGroup_Record_open_all_page]
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_vUserDefaultGroup_Record_open_all] 

	SELECT
		t1.[IDUser]
	FROM [vUserDefaultGroup] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_vUserDefaultGroup_Record_open_all]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_vUserDefaultGroup_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_Config_Record_open_all_page_fullmode]
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[Name] varchar (50)
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[Name]
	)
	EXEC [dbo].[sp_Config_Record_open_all] 

	SELECT
		t1.[Name], 
		t1.[Config], 
		t1.[Type], 
		t1.[Description]
	FROM [Config] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[Name] = t1.[Name] COLLATE SQL_Latin1_General_CP1_CI_AI)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_Config_Record_open_all]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_Config_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_open_all_page_fullmode]
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_User_Record_open_all] 

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[Password], 
		t1.[SomeNullValue]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_all]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_User_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_open_byGroup_page_fullmode]
	@IDGroup_search_ bigint, 
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_User_Record_open_byGroup] @IDGroup_search_

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[Password], 
		t1.[SomeNullValue]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_User_Record_open_byGroup]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_User_Record_open_byGroup]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_UserGroup_Record_open_byUser_Defaultrelation_page_fullmode]
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime, 
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint, 
		[IDGroup] bigint
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[IDUser], 
		[IDGroup]
	)
	EXEC [dbo].[sp_UserGroup_Record_open_byUser_Defaultrelation] @IDUser_search_, @Relationdate_search_

	SELECT
		t1.[IDUser], 
		t1.[IDGroup], 
		t1.[Relationdate], 
		t1.[Defaultrelation]
	FROM [UserGroup] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])AND 
			(t2.[IDGroup] = t1.[IDGroup])

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_UserGroup_Record_open_byUser_Defaultrelation]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_vUserDefaultGroup_Record_open_all_page_fullmode]
	@page_ Int,
	@page_numRecords_ Int
AS
	DECLARE @ID_range_begin BigInt
	DECLARE @ID_range_end BigInt
	SET @ID_range_begin = ((@page_ - 1) * @page_numRecords_ + 1)
	SET @ID_range_end = (@page_ * @page_numRecords_)

	SET NOCOUNT ON

	CREATE TABLE [#Table_temp] (
		[ID_range] BigInt IDENTITY,
		[IDUser] bigint
	)
	
	SET ROWCOUNT @ID_range_end
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC [dbo].[sp_vUserDefaultGroup_Record_open_all] 

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[IDGroup], 
		t1.[Name], 
		t1.[Relationdate]
	FROM [vUserDefaultGroup] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_vUserDefaultGroup_Record_open_all]
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: [dbo].[sp_vUserDefaultGroup_Record_open_all]
	-- NOT HERE!
	ORDER BY t2.[ID_range]

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_update_SomeUpdateTest_byGroup]
	@IDGroup_search_ bigint, 
	@Password_update_ varchar (50)
AS
	UPDATE [User]
	SET
		[Password] = @Password_update_
	FROM [dbo].[fnc_User_Record_open_byGroup](
		@IDGroup_search_
	) t1
	WHERE
		(t1.[IDUser] = [User].[IDUser])
--GO


CREATE PROCEDURE [dbo].[sp0_UserGroup_Record_update_SomeUpdateTest_byUser_Defaultrelation]
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime, 
	@Relationdate_update_ datetime
AS
	UPDATE [UserGroup]
	SET
		[Relationdate] = @Relationdate_update_
	FROM [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation](
		@IDUser_search_, 
		@Relationdate_search_
	) t1
	WHERE
		(t1.[IDUser] = [UserGroup].[IDUser]) AND
		(t1.[IDGroup] = [UserGroup].[IDGroup])
--GO


CREATE FUNCTION [dbo].[fnc0_User__ConstraintExist](
	@IDUser bigint, 
	@Login varchar (50), 
	@Password varchar (50), 
	@SomeNullValue int
)
RETURNS Bit
AS
BEGIN
	DECLARE @ConstraintExist Bit
	SET @ConstraintExist = 0
	
	IF (@ConstraintExist = 0) BEGIN
		SELECT
			@ConstraintExist = 1
		FROM [dbo].[fnc_User_isObject_byLogin](
			@Login
		)
		WHERE
			NOT (
				([IDUser] = @IDUser)
			)
	END
		
	RETURN @ConstraintExist
END
--GO


CREATE FUNCTION [dbo].[fnc0_User_isObject_byLogin](
	@Login_search_ varchar (50)
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT
		@isObject = 1
	FROM [dbo].[fnc_User_isObject_byLogin](
		@Login_search_
	)

	RETURN @isObject
END
--GO


CREATE FUNCTION [dbo].[fnc0_Config_Record_count_all](
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([Name])
	FROM [dbo].[fnc_Config_Record_open_all](
	)

	RETURN @Record_count_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_User_Record_count_all](
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM [dbo].[fnc_User_Record_open_all](
	)

	RETURN @Record_count_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_User_Record_count_byGroup](
	@IDGroup_search_ bigint
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM [dbo].[fnc_User_Record_open_byGroup](
		@IDGroup_search_
	)

	RETURN @Record_count_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_UserGroup_Record_count_byUser_Defaultrelation](
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation](
		@IDUser_search_, 
		@Relationdate_search_
	)

	RETURN @Record_count_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_vUserDefaultGroup_Record_count_all](
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM [dbo].[fnc_vUserDefaultGroup_Record_open_all](
	)

	RETURN @Record_count_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_Config_Record_hasObject_all](
	@Name_ varchar (50)
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM [dbo].[fnc_Config_Record_open_all](
	)
	WHERE
		([Name] = @Name_)

	RETURN @Record_hasObject_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_User_Record_hasObject_all](
	@IDUser_ bigint
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM [dbo].[fnc_User_Record_open_all](
	)
	WHERE
		([IDUser] = @IDUser_)

	RETURN @Record_hasObject_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_User_Record_hasObject_byGroup](
	@IDUser_ bigint, 
	@IDGroup_search_ bigint
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM [dbo].[fnc_User_Record_open_byGroup](
		@IDGroup_search_
	)
	WHERE
		([IDUser] = @IDUser_)

	RETURN @Record_hasObject_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_UserGroup_Record_hasObject_byUser_Defaultrelation](
	@IDUser_ bigint, 
	@IDGroup_ bigint, 
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation](
		@IDUser_search_, 
		@Relationdate_search_
	)
	WHERE
		([IDUser] = @IDUser_) AND
		([IDGroup] = @IDGroup_)

	RETURN @Record_hasObject_out
END
--GO


CREATE FUNCTION [dbo].[fnc0_vUserDefaultGroup_Record_hasObject_all](
	@IDUser_ bigint
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM [dbo].[fnc_vUserDefaultGroup_Record_open_all](
	)
	WHERE
		([IDUser] = @IDUser_)

	RETURN @Record_hasObject_out
END
--GO


CREATE PROCEDURE [dbo].[sp0_Group_insObject]
	@IDGroup_ bigint OUT, 
	@Name_ varchar (50), 
	@SelectIdentity_ Bit
AS
		INSERT INTO [Group] (
			[Name]
		) VALUES (
			@Name_
		)
		IF (@SelectIdentity_ = 1) BEGIN
			SET @IDGroup_ = @@IDENTITY
		END ELSE BEGIN
			SET @IDGroup_ = CAST(0 AS bigint)
		END
--GO


CREATE PROCEDURE [dbo].[sp0_Language_insObject]
	@IDLanguage_ bigint OUT, 
	@IDWord_name_ bigint, 
	@SelectIdentity_ Bit
AS
		INSERT INTO [Language] (
			[IDWord_name]
		) VALUES (
			@IDWord_name_
		)
		IF (@SelectIdentity_ = 1) BEGIN
			SET @IDLanguage_ = @@IDENTITY
		END ELSE BEGIN
			SET @IDLanguage_ = CAST(0 AS bigint)
		END
--GO


CREATE PROCEDURE [dbo].[sp0_Log_insObject]
	@IDLog_ bigint OUT, 
	@IDLogcode_ bigint, 
	@IDUser_posted_ bigint, 
	@Date_posted_ datetime, 
	@Logdata_ varchar (1024), 
	@SelectIdentity_ Bit
AS
		INSERT INTO [Log] (
			[IDLogcode], 
			[IDUser_posted], 
			[Date_posted], 
			[Logdata]
		) VALUES (
			@IDLogcode_, 
			@IDUser_posted_, 
			@Date_posted_, 
			@Logdata_
		)
		IF (@SelectIdentity_ = 1) BEGIN
			SET @IDLog_ = @@IDENTITY
		END ELSE BEGIN
			SET @IDLog_ = CAST(0 AS bigint)
		END
--GO


CREATE PROCEDURE [dbo].[sp0_Logcode_insObject]
	@IDLogcode_ bigint OUT, 
	@Warning_ bit, 
	@Error_ bit, 
	@Code_ varchar (50), 
	@Description_ varchar (50), 
	@SelectIdentity_ Bit
AS
		INSERT INTO [Logcode] (
			[Warning], 
			[Error], 
			[Code], 
			[Description]
		) VALUES (
			@Warning_, 
			@Error_, 
			@Code_, 
			@Description_
		)
		IF (@SelectIdentity_ = 1) BEGIN
			SET @IDLogcode_ = @@IDENTITY
		END ELSE BEGIN
			SET @IDLogcode_ = CAST(0 AS bigint)
		END
--GO


CREATE PROCEDURE [dbo].[sp0_Permition_insObject]
	@IDPermition_ bigint OUT, 
	@Name_ varchar (50), 
	@SelectIdentity_ Bit
AS
		INSERT INTO [Permition] (
			[Name]
		) VALUES (
			@Name_
		)
		IF (@SelectIdentity_ = 1) BEGIN
			SET @IDPermition_ = @@IDENTITY
		END ELSE BEGIN
			SET @IDPermition_ = CAST(0 AS bigint)
		END
--GO


CREATE PROCEDURE [dbo].[sp0_User_insObject]
	@IDUser_ bigint OUT, 
	@Login_ varchar (50), 
	@Password_ varchar (50), 
	@SomeNullValue_ int, 
	@SelectIdentity_ Bit
AS
	DECLARE @ConstraintExist Bit
	SET @ConstraintExist = [dbo].[fnc0_User__ConstraintExist](
		0, 
		@Login_, 
		@Password_, 
		@SomeNullValue_
	)
	IF (@ConstraintExist = 0) BEGIN
		INSERT INTO [User] (
			[Login], 
			[Password], 
			[SomeNullValue]
		) VALUES (
			@Login_, 
			@Password_, 
			@SomeNullValue_
		)
		IF (@SelectIdentity_ = 1) BEGIN
			SET @IDUser_ = @@IDENTITY
		END ELSE BEGIN
			SET @IDUser_ = CAST(0 AS bigint)
		END
	END ELSE BEGIN
		SET @IDUser_ = CAST(-1 AS bigint)
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Word_insObject]
	@IDWord_ bigint OUT, 
	@DeleteThisTestField_ bit, 
	@SelectIdentity_ Bit
AS
		INSERT INTO [Word] (
			[DeleteThisTestField]
		) VALUES (
			@DeleteThisTestField_
		)
		IF (@SelectIdentity_ = 1) BEGIN
			SET @IDWord_ = @@IDENTITY
		END ELSE BEGIN
			SET @IDWord_ = CAST(0 AS bigint)
		END
--GO


CREATE PROCEDURE [dbo].[sp0_Group_updObject]
	@IDGroup_ bigint, 
	@Name_ varchar (50)
AS
		UPDATE [Group]
		SET
			[Name] = @Name_
		WHERE
			[IDGroup] = @IDGroup_
--GO


CREATE PROCEDURE [dbo].[sp0_Language_updObject]
	@IDLanguage_ bigint, 
	@IDWord_name_ bigint
AS
		UPDATE [Language]
		SET
			[IDWord_name] = @IDWord_name_
		WHERE
			[IDLanguage] = @IDLanguage_
--GO


CREATE PROCEDURE [dbo].[sp0_Log_updObject]
	@IDLog_ bigint, 
	@IDLogcode_ bigint, 
	@IDUser_posted_ bigint, 
	@Date_posted_ datetime, 
	@Logdata_ varchar (1024)
AS
		UPDATE [Log]
		SET
			[IDLogcode] = @IDLogcode_, 
			[IDUser_posted] = @IDUser_posted_, 
			[Date_posted] = @Date_posted_, 
			[Logdata] = @Logdata_
		WHERE
			[IDLog] = @IDLog_
--GO


CREATE PROCEDURE [dbo].[sp0_Logcode_updObject]
	@IDLogcode_ bigint, 
	@Warning_ bit, 
	@Error_ bit, 
	@Code_ varchar (50), 
	@Description_ varchar (50)
AS
		UPDATE [Logcode]
		SET
			[Warning] = @Warning_, 
			[Error] = @Error_, 
			[Code] = @Code_, 
			[Description] = @Description_
		WHERE
			[IDLogcode] = @IDLogcode_
--GO


CREATE PROCEDURE [dbo].[sp0_Permition_updObject]
	@IDPermition_ bigint, 
	@Name_ varchar (50)
AS
		UPDATE [Permition]
		SET
			[Name] = @Name_
		WHERE
			[IDPermition] = @IDPermition_
--GO


CREATE PROCEDURE [dbo].[sp0_User_updObject]
	@IDUser_ bigint, 
	@Login_ varchar (50), 
	@Password_ varchar (50), 
	@SomeNullValue_ int, 
	@ConstraintExist_ Bit OUT
AS
	SET @ConstraintExist_ = [dbo].[fnc0_User__ConstraintExist](
		@IDUser_, 
		@Login_, 
		@Password_, 
		@SomeNullValue_
	)

	IF (@ConstraintExist_ = 0) BEGIN
		UPDATE [User]
		SET
			[Login] = @Login_, 
			[Password] = @Password_, 
			[SomeNullValue] = @SomeNullValue_
		WHERE
			[IDUser] = @IDUser_
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Word_updObject]
	@IDWord_ bigint, 
	@DeleteThisTestField_ bit
AS
		UPDATE [Word]
		SET
			[DeleteThisTestField] = @DeleteThisTestField_
		WHERE
			[IDWord] = @IDWord_
--GO


CREATE PROCEDURE [dbo].[sp0_User_delObject_byLogin]
	@Login_search_ varchar (50), 

	@Exists_ BIT OUT
AS
	DECLARE @IDUser bigint

	SET @Exists_ = 0

	SELECT
		@IDUser = [IDUser], 
		@Exists_ = 1
	FROM [dbo].[fnc_User_isObject_byLogin](
		@Login_search_
	)

	IF (@Exists_ = 1) BEGIN
		DELETE
		FROM [User]
		WHERE
			([IDUser] = @IDUser)
	END
--GO


CREATE PROCEDURE [dbo].[sp0_Config_Record_delete_all]
AS
	DELETE [Config]
	FROM [Config] t1
	INNER JOIN [dbo].[fnc_Config_Record_open_all](
	) t2 ON
		(t2.[Name] = t1.[Name])
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_delete_all]
AS
	DELETE [User]
	FROM [User] t1
	INNER JOIN [dbo].[fnc_User_Record_open_all](
	) t2 ON
		(t2.[IDUser] = t1.[IDUser])
--GO


CREATE PROCEDURE [dbo].[sp0_User_Record_delete_byGroup]
	@IDGroup_search_ bigint
AS
	DELETE [User]
	FROM [User] t1
	INNER JOIN [dbo].[fnc_User_Record_open_byGroup](
		@IDGroup_search_
	) t2 ON
		(t2.[IDUser] = t1.[IDUser])
--GO


CREATE PROCEDURE [dbo].[sp0_UserGroup_Record_delete_byUser_Defaultrelation]
	@IDUser_search_ bigint, 
	@Relationdate_search_ datetime
AS
	DELETE [UserGroup]
	FROM [UserGroup] t1
	INNER JOIN [dbo].[fnc_UserGroup_Record_open_byUser_Defaultrelation](
		@IDUser_search_, 
		@Relationdate_search_
	) t2 ON
		(t2.[IDUser] = t1.[IDUser]) AND
		(t2.[IDGroup] = t1.[IDGroup])
--GO


CREATE PROCEDURE [dbo].[sp0_User_updObject_SomeUpdateTest]
	@IDUser_ bigint, 
	@Password_update_ varchar (50), 
	@ConstraintExist_ Bit OUT
AS
	SET @ConstraintExist_ = [dbo].[fnc0_User__ConstraintExist](
		@IDUser_, 
		NULL, 
		@Password_update_, 
		NULL
	)

	IF (@ConstraintExist_ = 0) BEGIN
		UPDATE [User]
		SET
			[Password] = @Password_update_
		WHERE
			([IDUser] = @IDUser_)
	END
--GO


