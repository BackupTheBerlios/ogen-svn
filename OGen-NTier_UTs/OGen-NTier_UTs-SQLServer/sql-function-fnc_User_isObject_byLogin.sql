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
		--([Login] LIKE '%' + @Login_search_ + '%' COLLATE SQL_Latin1_General_CP1_CI_AI)
		([Login] = @Login_search_)

	RETURN
END


