-- DROP FUNCTION [dbo].[fnc_CRD_Profile_Record_open_all]
ALTER FUNCTION [dbo].[fnc_CRD_Profile_Record_open_all](
	@IFApplication_search_ int
)
RETURNS TABLE
AS
RETURN
	SELECT
		"IDProfile"
	FROM "CRD_Profile"
	WHERE
		(@IFApplication_search_ IS NULL)
		OR
		(@IFApplication_search_ <= 0)
		OR
		(@IFApplication_search_ = "IFApplication")
GO
