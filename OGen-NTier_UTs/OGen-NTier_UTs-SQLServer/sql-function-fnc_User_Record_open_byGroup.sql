CREATE FUNCTION [dbo].[fnc_User_Record_open_byGroup](
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



