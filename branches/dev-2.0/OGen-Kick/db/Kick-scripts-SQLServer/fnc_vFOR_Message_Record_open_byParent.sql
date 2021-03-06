ALTER FUNCTION [dbo].[fnc_vFOR_Message_Record_open_byParent](
	@IDMessage__parent_search_ bigint
)
RETURNS TABLE
AS
RETURN
	SELECT
		"IDMessage"
	FROM "FOR_Message"
	WHERE
		("IFMessage__parent" = @IDMessage__parent_search_)
GO

select 
	*
from "vFOR_Message"
where "IDMessage" in (
	select 
		"IDMessage"
	from "dbo"."fnc_vFOR_Message_Record_open_byParent"(
		1
	)
)