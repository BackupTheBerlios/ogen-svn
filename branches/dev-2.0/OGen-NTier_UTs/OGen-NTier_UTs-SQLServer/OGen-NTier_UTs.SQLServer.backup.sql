if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_Config_Record_count_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_Config_Record_count_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_Config_Record_hasObject_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_Config_Record_hasObject_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_Config_isObject]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_Config_isObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_Group_isObject]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_Group_isObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_UserGroup_isObject]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_UserGroup_isObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_User_Record_count_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_User_Record_count_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_User_Record_count_byGroup]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_User_Record_count_byGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_User_Record_hasObject_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_User_Record_hasObject_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_User_Record_hasObject_byGroup]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_User_Record_hasObject_byGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_User__ConstraintExist]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_User__ConstraintExist]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_User_isObject]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_User_isObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_User_isObject_byLogin]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_User_isObject_byLogin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_vUserDefaultGroup_Record_count_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_vUserDefaultGroup_Record_count_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_vUserDefaultGroup_Record_hasObject_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_vUserDefaultGroup_Record_hasObject_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_vUserDefaultGroup_isObject]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_vUserDefaultGroup_isObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc0_vUserGroup_isObject]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc0_vUserGroup_isObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc_Config_Record_open_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc_Config_Record_open_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc_User_Record_open_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc_User_Record_open_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc_User_Record_open_byGroup]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc_User_Record_open_byGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc_User_isObject_byLogin]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc_User_isObject_byLogin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fnc_vUserDefaultGroup_Record_open_all]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[fnc_vUserDefaultGroup_Record_open_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Config_Record_delete_all]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Config_Record_delete_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Config_Record_open_all_fullmode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Config_Record_open_all_fullmode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Config_Record_open_all_page]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Config_Record_open_all_page]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Config_Record_open_all_page_fullmode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Config_Record_open_all_page_fullmode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Config_delObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Config_delObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Config_getObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Config_getObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Config_setObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Config_setObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Group_delObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Group_delObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Group_getObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Group_getObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Group_insObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Group_insObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_Group_updObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_Group_updObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_UserGroup_delObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_UserGroup_delObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_UserGroup_getObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_UserGroup_getObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_UserGroup_setObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_UserGroup_setObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_delete_all]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_delete_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_delete_byGroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_delete_byGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_open_all_fullmode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_open_all_fullmode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_open_all_page]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_open_all_page]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_open_all_page_fullmode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_open_all_page_fullmode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_open_byGroup_fullmode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_open_byGroup_fullmode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_open_byGroup_page]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_open_byGroup_page]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_open_byGroup_page_fullmode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_open_byGroup_page_fullmode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_Record_update_SomeUpdateTest_byGroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_Record_update_SomeUpdateTest_byGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_delObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_delObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_delObject_byLogin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_delObject_byLogin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_getObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_getObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_getObject_byLogin]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_getObject_byLogin]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_insObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_insObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_updObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_updObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_User_updObject_SomeUpdateTest]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_User_updObject_SomeUpdateTest]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_vUserDefaultGroup_Record_open_all_fullmode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_vUserDefaultGroup_Record_open_all_fullmode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_vUserDefaultGroup_Record_open_all_page]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_vUserDefaultGroup_Record_open_all_page]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_vUserDefaultGroup_Record_open_all_page_fullmode]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_vUserDefaultGroup_Record_open_all_page_fullmode]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_vUserDefaultGroup_delObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_vUserDefaultGroup_delObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_vUserDefaultGroup_getObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_vUserDefaultGroup_getObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_vUserGroup_delObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_vUserGroup_delObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp0_vUserGroup_getObject]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp0_vUserGroup_getObject]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_Config_Record_open_all]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_Config_Record_open_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_User_Record_open_all]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_User_Record_open_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_User_Record_open_byGroup]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_User_Record_open_byGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_vUserDefaultGroup_Record_open_all]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_vUserDefaultGroup_Record_open_all]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vUserDefaultGroup]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vUserDefaultGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vUserGroup]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[vUserGroup]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Config]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Config]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Group]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Group]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[User]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[User]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[UserGroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[UserGroup]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_Config_Record_count_all"(
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([Name])
	FROM dbo."fnc_Config_Record_open_all"(
	)

	RETURN @Record_count_out
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_Config_Record_hasObject_all"(
	@Name_ varchar (50)
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM dbo."fnc_Config_Record_open_all"(
	)
	WHERE
		([Name] = @Name_)

	RETURN @Record_hasObject_out
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_Config_isObject"(
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_Group_isObject"(
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_UserGroup_isObject"(
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_User_Record_count_all"(
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM dbo."fnc_User_Record_open_all"(
	)

	RETURN @Record_count_out
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_User_Record_count_byGroup"(
	@IDGroup_search_ bigint
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM dbo."fnc_User_Record_open_byGroup"(
		@IDGroup_search_
	)

	RETURN @Record_count_out
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_User_Record_hasObject_all"(
	@IDUser_ bigint
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM dbo."fnc_User_Record_open_all"(
	)
	WHERE
		([IDUser] = @IDUser_)

	RETURN @Record_hasObject_out
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_User_Record_hasObject_byGroup"(
	@IDUser_ bigint, 
	@IDGroup_search_ bigint
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM dbo."fnc_User_Record_open_byGroup"(
		@IDGroup_search_
	)
	WHERE
		([IDUser] = @IDUser_)

	RETURN @Record_hasObject_out
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_User__ConstraintExist"(
	@IDUser bigint, 
	@Login varchar (50), 
	@Password varchar (50)
)
RETURNS Bit
AS
BEGIN
	DECLARE @ConstraintExist Bit
	SET @ConstraintExist = 0
	
	IF (@ConstraintExist = 0) BEGIN
		SELECT
			@ConstraintExist = 1
		FROM dbo."fnc_User_isObject_byLogin"(
			@Login
		)
		WHERE
			NOT (
				([IDUser] = @IDUser)
			)
	END
		
	RETURN @ConstraintExist
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_User_isObject"(
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_User_isObject_byLogin"(
	@Login_search_ varchar (50)
)
RETURNS Bit
AS
BEGIN
	DECLARE @isObject Bit
	SET @isObject = 0

	SELECT
		@isObject = 1
	FROM dbo."fnc_User_isObject_byLogin"(
		@Login_search_
	)

	RETURN @isObject
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_vUserDefaultGroup_Record_count_all"(
)
RETURNS BigInt
BEGIN
	DECLARE @Record_count_out BigInt
	SET @Record_count_out = 0

	SELECT @Record_count_out = COUNT([IDUser])
	FROM dbo."fnc_vUserDefaultGroup_Record_open_all"(
	)

	RETURN @Record_count_out
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_vUserDefaultGroup_Record_hasObject_all"(
	@IDUser_ bigint
)
RETURNS BIT
BEGIN
	DECLARE @Record_hasObject_out Bit
	SET @Record_hasObject_out = 0

	SELECT @Record_hasObject_out = 1
	FROM dbo."fnc_vUserDefaultGroup_Record_open_all"(
	)
	WHERE
		([IDUser] = @IDUser_)

	RETURN @Record_hasObject_out
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_vUserDefaultGroup_isObject"(
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc0_vUserGroup_isObject"(
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc_Config_Record_open_all"(
)
RETURNS TABLE
AS
RETURN
	SELECT
		[Name]
	FROM [Config]/*
	WHERE*/
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc_User_Record_open_all"(
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser]
	FROM [User]/*
	WHERE*/
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc_User_Record_open_byGroup"(
	@IDGroup_search_ bigint
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser]
	FROM [UserGroup]
	WHERE
		([IDGroup] = @IDGroup_search_)



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE FUNCTION dbo."fnc_User_isObject_byLogin"(
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
		--([Login] LIKE '%' + @Login_search_ + '%' COLLATE SQL_Latin1_General_CP1_CI_AI)
		([Login] = @Login_search_)

	RETURN
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo."fnc_vUserDefaultGroup_Record_open_all"(
)
RETURNS TABLE
AS
RETURN
	SELECT
		[IDUser]
	FROM [vUserDefaultGroup]/*
	WHERE*/
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE TABLE [dbo].[Config] (
	[Name] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL ,
	[Config] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL ,
	[Type] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Group] (
	[IDGroup] [bigint] IDENTITY (1, 1) NOT NULL ,
	[Name] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[User] (
	[IDUser] [bigint] IDENTITY (1, 1) NOT NULL ,
	[Login] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL ,
	[Password] [varchar] (50) COLLATE Latin1_General_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[UserGroup] (
	[IDUser] [bigint] NOT NULL ,
	[IDGroup] [bigint] NOT NULL ,
	[Relationdate] [datetime] NOT NULL ,
	[Defaultrelation] [bit] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Config] WITH NOCHECK ADD 
	CONSTRAINT [PK_Config] PRIMARY KEY  CLUSTERED 
	(
		[Name]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Group] WITH NOCHECK ADD 
	CONSTRAINT [PK_Group] PRIMARY KEY  CLUSTERED 
	(
		[IDGroup]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[User] WITH NOCHECK ADD 
	CONSTRAINT [PK_User] PRIMARY KEY  CLUSTERED 
	(
		[IDUser]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[UserGroup] WITH NOCHECK ADD 
	CONSTRAINT [PK_UserGroup] PRIMARY KEY  CLUSTERED 
	(
		[IDUser],
		[IDGroup]
	)  ON [PRIMARY] 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

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




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW "vUserGroup" 
AS 
	SELECT
		t2."IDUser", 
		t2."Login", 
		t3."IDGroup", 
		t3."Name", 
		t1."Relationdate"
	FROM "UserGroup" t1
		INNER JOIN "User" t2 ON (t2."IDUser" = t1."IDUser")
		INNER JOIN "Group" t3 ON (t3."IDGroup" = t1."IDGroup")


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Config_Record_delete_all"
AS
	DELETE [Config]
	FROM [Config] t1
	INNER JOIN dbo."fnc_Config_Record_open_all"(
	) t2 ON
		(t2.[Name] = t1.[Name])
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Config_Record_open_all_fullmode"
AS
	CREATE TABLE [#Table_temp] (
		[Name] varchar (50)
	)
	
	INSERT INTO [#Table_temp] (
		[Name]
	)
	EXEC dbo."sp_Config_Record_open_all" 

	SELECT
		t1.[Name], 
		t1.[Config], 
		t1.[Type]
	FROM [Config] t1
		INNER JOIN [#Table_temp] t2 ON (
			(t2.[Name] = t1.[Name])
		)

	-- CHANGE WHERE CONDITION IN: dbo."fnc_Config_Record_open_all"
	-- NOT HERE!

	-- CHANGE ORDER BY IN: dbo."sp_Config_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Config_Record_open_all_page"
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
	EXEC dbo."sp_Config_Record_open_all" 

	SELECT
		t1.[Name]
	FROM [Config] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[Name] = t1.[Name])

	-- CHANGE WHERE CONDITION IN: dbo."fnc_Config_Record_open_all"
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: dbo."sp_Config_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Config_Record_open_all_page_fullmode"
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
	EXEC dbo."sp_Config_Record_open_all" 

	SELECT
		t1.[Name], 
		t1.[Config], 
		t1.[Type]
	FROM [Config] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[Name] = t1.[Name])

	-- CHANGE WHERE CONDITION IN: dbo."fnc_Config_Record_open_all"
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: dbo."sp_Config_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Config_delObject"
	@Name_ varchar (50)
AS
	DELETE
	FROM [Config]
	WHERE
		([Name] = @Name_)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Config_getObject"
	@Name_ varchar (50) OUT, 
	@Config_ varchar (50) OUT, 
	@Type_ int OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@Name_ = [Name], 
		@Config_ = [Config], 
		@Type_ = [Type], 
		@Exists = 1
	FROM [Config]
	WHERE
		([Name] = @Name_)

	IF (@exists = 0) BEGIN
		SET @Name_ = NULL
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Config_setObject"
	@Name_ varchar (50), 
	@Config_ varchar (50), 
	@Type_ int, 

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
				[Type]
			) VALUES (
				@Name_, 
				@Config_, 
				@Type_
			)
		END
	END ELSE BEGIN
		SET @Exists = 1
		SET @ConstraintExist = 0
		IF (@ConstraintExist = 0) BEGIN
			UPDATE [Config]
			SET
				[Config] = @Config_, 
				[Type] = @Type_
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Group_delObject"
	@IDGroup_ bigint
AS
	DELETE
	FROM [Group]
	WHERE
		([IDGroup] = @IDGroup_)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Group_getObject"
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Group_insObject"
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_Group_updObject"
	@IDGroup_ bigint, 
	@Name_ varchar (50)
AS
		UPDATE [Group]
		SET
			[Name] = @Name_
		WHERE
			[IDGroup] = @IDGroup_
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_UserGroup_delObject"
	@IDUser_ bigint, 
	@IDGroup_ bigint
AS
	DELETE
	FROM [UserGroup]
	WHERE
		([IDUser] = @IDUser_) AND
		([IDGroup] = @IDGroup_)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_UserGroup_getObject"
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_UserGroup_setObject"
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_delete_all"
AS
	DELETE [User]
	FROM [User] t1
	INNER JOIN dbo."fnc_User_Record_open_all"(
	) t2 ON
		(t2.[IDUser] = t1.[IDUser])
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_delete_byGroup"
	@IDGroup_search_ bigint
AS
	DELETE [User]
	FROM [User] t1
	INNER JOIN dbo."fnc_User_Record_open_byGroup"(
		@IDGroup_search_
	) t2 ON
		(t2.[IDUser] = t1.[IDUser])
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_open_all_fullmode"
AS
	CREATE TABLE [#Table_temp] (
		[IDUser] bigint
	)
	
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC dbo."sp_User_Record_open_all" 

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[Password]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON (
			(t2.[IDUser] = t1.[IDUser])
		)

	-- CHANGE WHERE CONDITION IN: dbo."fnc_User_Record_open_all"
	-- NOT HERE!

	-- CHANGE ORDER BY IN: dbo."sp_User_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_open_all_page"
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
	EXEC dbo."sp_User_Record_open_all" 

	SELECT
		t1.[IDUser]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: dbo."fnc_User_Record_open_all"
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: dbo."sp_User_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_open_all_page_fullmode"
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
	EXEC dbo."sp_User_Record_open_all" 

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[Password]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: dbo."fnc_User_Record_open_all"
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: dbo."sp_User_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_open_byGroup_fullmode"
	@IDGroup_search_ bigint
AS
	CREATE TABLE [#Table_temp] (
		[IDUser] bigint
	)
	
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC dbo."sp_User_Record_open_byGroup" @IDGroup_search_

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[Password]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON (
			(t2.[IDUser] = t1.[IDUser])
		)

	-- CHANGE WHERE CONDITION IN: dbo."fnc_User_Record_open_byGroup"
	-- NOT HERE!

	-- CHANGE ORDER BY IN: dbo."sp_User_Record_open_byGroup"
	-- NOT HERE!

	DROP TABLE [#Table_temp]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_open_byGroup_page"
	@IDGroup_search bigint, 
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
	EXEC dbo."sp_User_Record_open_byGroup" @IDGroup_search

	SELECT
		t1.[IDUser]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: dbo."fnc_User_Record_open_byGroup"
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: dbo."sp_User_Record_open_byGroup"
	-- NOT HERE!

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_open_byGroup_page_fullmode"
	@IDGroup_search bigint, 
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
	EXEC dbo."sp_User_Record_open_byGroup" @IDGroup_search

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[Password]
	FROM [User] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: dbo."fnc_User_Record_open_byGroup"
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: dbo."sp_User_Record_open_byGroup"
	-- NOT HERE!

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_Record_update_SomeUpdateTest_byGroup"
	@IDGroup_search_ bigint, 
	@Password_update_ varchar (50)
AS
	UPDATE [User]
	SET
		[Password] = @Password_update_
	FROM dbo."fnc_User_Record_open_byGroup"(
		@IDGroup_search_
	) t1
	WHERE
		(t1.[IDUser] = [User].[IDUser])
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_delObject"
	@IDUser_ bigint
AS
	DELETE
	FROM [User]
	WHERE
		([IDUser] = @IDUser_)

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_delObject_byLogin"
	@Login_search_ varchar (50), 

	@Exists_ BIT OUT
AS
	DECLARE @IDUser bigint

	SET @Exists_ = 0

	SELECT
		@IDUser = [IDUser], 
		@Exists_ = 1
	FROM dbo."fnc_User_isObject_byLogin"(
		@Login_search_
	)

	IF (@Exists_ = 1) BEGIN
		DELETE
		FROM [User]
		WHERE
			([IDUser] = @IDUser)
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_getObject"
	@IDUser_ bigint OUT, 
	@Login_ varchar (50) OUT, 
	@Password_ varchar (50) OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDUser_ = [IDUser], 
		@Login_ = [Login], 
		@Password_ = [Password], 
		@Exists = 1
	FROM [User]
	WHERE
		([IDUser] = @IDUser_)

	IF (@exists = 0) BEGIN
		SET @IDUser_ = NULL
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_getObject_byLogin"
	@Login_search_ varchar (50), 
	@IDUser bigint OUT, 
	@Login varchar (50) OUT, 
	@Password varchar (50) OUT
AS
	DECLARE @Exists Bit
	SET @Exists = 0

	SELECT
		@IDUser = t1.[IDUser], 
		@Login = t1.[Login], 
		@Password = t1.[Password], 
		@Exists = 1
	FROM [User] t1
	INNER JOIN dbo."fnc_User_isObject_byLogin"(
		@Login_search_
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	IF (@Exists = 0) BEGIN
		SET @IDUser = NULL
		SET @Login = NULL
		SET @Password = NULL
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_insObject"
	@IDUser_ bigint OUT, 
	@Login_ varchar (50), 
	@Password_ varchar (50), 
	@SelectIdentity_ Bit
AS
	DECLARE @ConstraintExist Bit
	SET @ConstraintExist = dbo."fnc0_User__ConstraintExist"(
		0, 
		@Login_, 
		@Password_
	)
	IF (@ConstraintExist = 0) BEGIN
		INSERT INTO [User] (
			[Login], 
			[Password]
		) VALUES (
			@Login_, 
			@Password_
		)
		IF (@SelectIdentity_ = 1) BEGIN
			SET @IDUser_ = @@IDENTITY
		END ELSE BEGIN
			SET @IDUser_ = CAST(0 AS bigint)
		END
	END ELSE BEGIN
		SET @IDUser_ = CAST(-1 AS bigint)
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_updObject"
	@IDUser_ bigint, 
	@Login_ varchar (50), 
	@Password_ varchar (50), 
	@ConstraintExist_ Bit OUT
AS
	SET @ConstraintExist_ = dbo."fnc0_User__ConstraintExist"(
		@IDUser_, 
		@Login_, 
		@Password_
	)

	IF (@ConstraintExist_ = 0) BEGIN
		UPDATE [User]
		SET
			[Login] = @Login_, 
			[Password] = @Password_
		WHERE
			[IDUser] = @IDUser_
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_User_updObject_SomeUpdateTest"
	@IDUser_ bigint, 
	@Password_update_ varchar (50), 
	@ConstraintExist_ Bit OUT
AS
	SET @ConstraintExist_ = dbo."fnc0_User__ConstraintExist"(
		@IDUser_, 
		NULL, 
		@Password_update_
	)

	IF (@ConstraintExist_ = 0) BEGIN
		UPDATE [User]
		SET
			[Password] = @Password_update_
		WHERE
			([IDUser] = @IDUser_)
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_vUserDefaultGroup_Record_open_all_fullmode"
AS
	CREATE TABLE [#Table_temp] (
		[IDUser] bigint
	)
	
	INSERT INTO [#Table_temp] (
		[IDUser]
	)
	EXEC dbo."sp_vUserDefaultGroup_Record_open_all" 

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

	-- CHANGE WHERE CONDITION IN: dbo."fnc_vUserDefaultGroup_Record_open_all"
	-- NOT HERE!

	-- CHANGE ORDER BY IN: dbo."sp_vUserDefaultGroup_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_vUserDefaultGroup_Record_open_all_page"
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
	EXEC dbo."sp_vUserDefaultGroup_Record_open_all" 

	SELECT
		t1.[IDUser]
	FROM [vUserDefaultGroup] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: dbo."fnc_vUserDefaultGroup_Record_open_all"
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: dbo."sp_vUserDefaultGroup_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_vUserDefaultGroup_Record_open_all_page_fullmode"
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
	EXEC dbo."sp_vUserDefaultGroup_Record_open_all" 

	SELECT
		t1.[IDUser], 
		t1.[Login], 
		t1.[IDGroup], 
		t1.[Name], 
		t1.[Relationdate]
	FROM [vUserDefaultGroup] t1
		INNER JOIN [#Table_temp] t2 ON
			(t2.[IDUser] = t1.[IDUser])

	-- CHANGE WHERE CONDITION IN: dbo."fnc_vUserDefaultGroup_Record_open_all"
	-- NOT HERE!
	WHERE (t2.[ID_range] BETWEEN @ID_range_begin AND @ID_range_end)

	-- CHANGE ORDER BY IN: dbo."sp_vUserDefaultGroup_Record_open_all"
	-- NOT HERE!

	DROP TABLE [#Table_temp]

	SET NOCOUNT OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_vUserDefaultGroup_delObject"
	@IDUser_ bigint
AS
	DELETE
	FROM [vUserDefaultGroup]
	WHERE
		([IDUser] = @IDUser_)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_vUserDefaultGroup_getObject"
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_vUserGroup_delObject"
	@IDUser_ bigint, 
	@IDGroup_ bigint
AS
	DELETE
	FROM [vUserGroup]
	WHERE
		([IDUser] = @IDUser_) AND
		([IDGroup] = @IDGroup_)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp0_vUserGroup_getObject"
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
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp_Config_Record_open_all"
AS
	SELECT
	t1.[Name]
	FROM [Config] t1
	INNER JOIN dbo."fnc_Config_Record_open_all"(
	) t2 ON (
		(t2.[Name] = t1.[Name])
	)

	-- CHANGE WHERE CONDITION IN: dbo."fnc_Config_Record_open_all"
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp_User_Record_open_all"
AS
	SELECT
	t1.[IDUser]
	FROM [User] t1
	INNER JOIN dbo."fnc_User_Record_open_all"(
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	-- CHANGE WHERE CONDITION IN: dbo."fnc_User_Record_open_all"
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp_User_Record_open_byGroup"
	@IDGroup_search_ bigint
AS
	SELECT
	t1.[IDUser]
	FROM [User] t1
	INNER JOIN dbo."fnc_User_Record_open_byGroup"(
		@IDGroup_search_
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	-- CHANGE WHERE CONDITION IN: dbo."fnc_User_Record_open_byGroup"
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE dbo."sp_vUserDefaultGroup_Record_open_all"
AS
	SELECT
	t1.[IDUser]
	FROM [vUserDefaultGroup] t1
	INNER JOIN dbo."fnc_vUserDefaultGroup_Record_open_all"(
	) t2 ON (
		(t2.[IDUser] = t1.[IDUser])
	)

	-- CHANGE WHERE CONDITION IN: dbo."fnc_vUserDefaultGroup_Record_open_all"
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	-- ORDER BY t1.[SomeField]
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

