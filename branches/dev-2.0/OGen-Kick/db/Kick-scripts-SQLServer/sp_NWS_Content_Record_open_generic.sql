ALTER PROCEDURE [dbo].[sp_NWS_Content_Record_open_generic]
	@IFApplication_search_ int, 
	@IFUser__Publisher_search_ bigint, 
	@IFUser__Aproved_search_ bigint, 
	@Begin_date_search_ datetime, 
	@End_date_search_ datetime, 
	@IDTag_search_ ntext, 
	@IDProfile_search_ ntext, 
	@Keywords_search_ varchar (255), 
	@IDLanguage_search_ int, 
	@isAND_notOR_search_ bit
AS
	SELECT
		t1.[IDContent]
	FROM [NWS_Content] t1
	INNER JOIN [dbo].[fnc_NWS_Content_Record_open_generic](
		@IFApplication_search_, 
		@IFUser__Publisher_search_, 
		@IFUser__Aproved_search_, 
		@Begin_date_search_, 
		@End_date_search_, 
		@IDTag_search_, 
		@IDProfile_search_, 
		@Keywords_search_, 
		@IDLanguage_search_, 
		@isAND_notOR_search_
	) t2 ON (
		(t2.[IDContent] = t1.[IDContent])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_NWS_Content_Record_open_generic]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	ORDER BY t1.[IDContent] desc
GO
