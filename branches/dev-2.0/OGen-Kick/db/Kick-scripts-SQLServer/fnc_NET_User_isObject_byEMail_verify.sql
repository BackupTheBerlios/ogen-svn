ALTER FUNCTION [dbo].[fnc_NET_User_isObject_byEMail_verify](
	@EMail_verify_search_ varchar (255), 
	@IDApplication_search_ int
)
RETURNS @finalresult TABLE (
	[IFUser] bigint
)
AS
BEGIN
	INSERT INTO @finalresult
	SELECT
		"IFUser"
	FROM "NET_User"
	WHERE
		("EMail_verify" = @EMail_verify_search_) 
		AND
		(
			(@IDApplication_search_ is null)
			or
			(@IDApplication_search_ = "IFApplication")
		)

	RETURN
END
GO
