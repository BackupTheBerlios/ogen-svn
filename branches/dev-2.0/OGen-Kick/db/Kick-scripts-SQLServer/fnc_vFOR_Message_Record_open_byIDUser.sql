ALTER FUNCTION [dbo].[fnc_vFOR_Message_Record_open_byIDUser](
	@IDUser_search_ bigint
)
RETURNS TABLE
AS
RETURN
	SELECT
		"IDMessage"
	FROM "FOR_Message"
	WHERE
		("IFUser__Publisher" = @IDUser_search_)
GO
