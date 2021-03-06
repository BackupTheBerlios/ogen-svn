ALTER PROCEDURE [dbo].[sp_vFOR_Message_Record_open_byParent]
	@IDMessage__parent_search_ bigint
AS
	SELECT
		t1.[IDMessage]
	FROM [vFOR_Message] t1
	INNER JOIN [dbo].[fnc_vFOR_Message_Record_open_byParent](
		@IDMessage__parent_search_
	) t2 ON (
		(t2.[IDMessage] = t1.[IDMessage])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_vFOR_Message_Record_open_byParent]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	ORDER BY t1.[IDMessage] desc
GO