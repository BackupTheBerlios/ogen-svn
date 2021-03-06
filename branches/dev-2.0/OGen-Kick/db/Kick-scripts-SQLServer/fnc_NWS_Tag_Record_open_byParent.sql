--DROP FUNCTION [dbo].[fnc_NWS_Tag_Record_open_byParent]
ALTER FUNCTION [dbo].[fnc_NWS_Tag_Record_open_byParent](
	@IFTag__parent_search_ bigint, 
	@IFApplication_search_ int
)
RETURNS TABLE
AS
RETURN
	SELECT
		"IDTag"
	FROM "NWS_Tag"
	WHERE
		(
			(
				(@IFTag__parent_search_ IS NULL)
				AND
				("IFTag__parent" IS NULL)
			) 
			OR 
			(
				NOT (@IFTag__parent_search_ IS NULL)
				AND
				("IFTag__parent" = @IFTag__parent_search_)
			)
		) 
		AND
		(
			(@IFApplication_search_ IS NULL)
			OR
			(@IFApplication_search_ <= 0)
			OR
			(@IFApplication_search_ = "IFApplication")
		)
GO