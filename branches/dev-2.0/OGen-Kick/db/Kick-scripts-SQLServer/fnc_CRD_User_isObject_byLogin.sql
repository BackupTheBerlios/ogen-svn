-- DROP FUNCTION [dbo].[fnc_CRD_User_isObject_byLogin]
ALTER FUNCTION [dbo].[fnc_CRD_User_isObject_byLogin](
	@Login_search_ varchar (255), 
	@IFApplication_search_ int
)
RETURNS @finalresult TABLE (
	"IDUser" bigint
)
AS
BEGIN
	INSERT INTO @finalresult
	SELECT
		"IDUser"
	FROM "CRD_User"
	WHERE
		("Login" = @Login_search_) 
		AND
		(
			(@IFApplication_search_ is null)
			or
			(@IFApplication_search_ <= 0)
			or
			(@IFApplication_search_ = "IFApplication")
		)

	RETURN
END
GO
