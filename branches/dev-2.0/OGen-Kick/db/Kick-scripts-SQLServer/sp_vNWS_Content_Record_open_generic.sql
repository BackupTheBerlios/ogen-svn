ALTER PROCEDURE [dbo].[sp_vNWS_Content_Record_open_generic]
	@IFApplication_search_ int, 
	@IFUser__Publisher_search_ bigint, 
	@IFUser__Aproved_search_ bigint, 
	@Begin_date_search_ datetime, 
	@End_date_search_ datetime, 
	@IDTag_search_ varchar (8000), 
	@IDAuthor_search_ varchar (8000), 
	@IDSource_search_ varchar (8000), 
	@IDHighlight_search_ varchar (8000), 
	@IDProfile_search_ varchar (8000), 
	@Keywords_search_ varchar (8000), 
	@IDLanguage_search_ int, 
	@isAND_notOR_search_ bit
AS
	SELECT
		t1.[IDContent], 
		t1.[IDLanguage]
	FROM [vNWS_Content] t1
	INNER JOIN [dbo].[fnc_vNWS_Content_Record_open_generic](
		@IFApplication_search_, 
		@IFUser__Publisher_search_, 
		@IFUser__Aproved_search_, 
		@Begin_date_search_, 
		@End_date_search_, 
		@IDTag_search_, 
		@IDAuthor_search_, 
		@IDSource_search_, 
		@IDHighlight_search_, 
		@IDProfile_search_, 
		@Keywords_search_, 
		@IDLanguage_search_, 
		@isAND_notOR_search_
	) t2 ON (
		(t2.[IDContent] = t1.[IDContent]) AND
		(t2.[IDLanguage] = t1.[IDLanguage])
	)

	-- CHANGE WHERE CONDITION IN: [dbo].[fnc_vNWS_Content_Record_open_generic]
	-- NOT HERE!

	-- CHANGE ORDER BY HERE:
	ORDER BY
		t1.[IDContent] desc
		--, t1.[IDLanguage]

GO


--exec [dbo].[sp_vNWS_Content_Record_open_generic] 1, -1, 0, '1900-1-1', '1900-1-1', '', '', '', '18', '', '', 1, 1
exec [dbo].[sp0_vNWS_Content_Record_open_generic_page_fullmode]  1, -1, 0, '1900-1-1', '1900-1-1', '', '', '', '18', '', '', 1, 1, 1, 10
exec [dbo].[sp0_vNWS_Content_Record_open_generic_page_fullmode]  1, -1, 0, '1900-1-1', '1900-1-1', '', '', '', '18', '', '', 1, 1, 1, 2