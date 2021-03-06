-- NOTA: tens de fazer DROP, nao da para fazer ALTER sobre funcoes

-- drop function "fnc_NWS_Content_Record_open_generic"
create function "dbo"."fnc_NWS_Content_Record_open_generic"(
	@IFApplication_search_ int, ------------------ [x]
	@IFUser__Publisher_search_ bigint, ----------- [x]

	@IFUser__Aproved_search_ bigint,  ------------ [x] = 0  - Approved
                                      ------------     = -1 - Not Approved
                                      ------------     < -1 - ignore

	@Begin_date_search_ datetime, ---------------- [x]
	@End_date_search_ datetime, ------------------ [x]
	@IDTag_search_ varchar(8000), ---------------- [x]
	@IDAuthor_search_ varchar(8000), ------------- [x]
	@IDSource_search_ varchar(8000), ------------- [x]
	@IDHighlight_search_ varchar(8000), ---------- [x]
	@IDProfile_search_ varchar(8000), ------------ [x]
	@Keywords_search_ varchar(8000), ------------- [x]
	@IDLanguage_ int, ---------------------------- CAN NOT BE NULL, or fnc_vNWS_Content_Record_open_generic will fail!!!
	@isAND_notOR_ bit ----------------------------
)
returns @output table (
	"IDContent" bigint
)
as
begin
	declare @conditional_join_DIC_TextLanguage as bit
	if (
		(@Keywords_search_ is null)
		or
		(@Keywords_search_ = '')
	) begin 
		set @conditional_join_DIC_TextLanguage = 0 
	end else begin 
		set @conditional_join_DIC_TextLanguage = 1 
	end

	declare @TagCount as int
	declare @conditional_join_NWS_ContentTag as bit
	if (
		(@IDTag_search_ is null)
		or
		(@IDTag_search_ = '')
	) begin
		set @conditional_join_NWS_ContentTag = 0
		set @TagCount = 0
	end else begin
		set @conditional_join_NWS_ContentTag = 1
		select @TagCount = count(OutputValue)
		from [dbo].[OGen_fnc0__Split] (
			@IDTag_search_, 
			','
		)
	end

	declare @AuthorCount as int
	declare @conditional_join_NWS_ContentAuthor as bit
	if (
		(@IDAuthor_search_ is null)
		or
		(@IDAuthor_search_ = '')
	) begin
		set @conditional_join_NWS_ContentAuthor = 0
		set @AuthorCount = 0
	end else begin
		set @conditional_join_NWS_ContentAuthor = 1
		select @AuthorCount = count(OutputValue)
		from [dbo].[OGen_fnc0__Split] (
			@IDAuthor_search_, 
			','
		)
	end

	declare @SourceCount as int
	declare @conditional_join_NWS_ContentSource as bit
	if (
		(@IDSource_search_ is null)
		or
		(@IDSource_search_ = '')
	) begin
		set @conditional_join_NWS_ContentSource = 0
		set @SourceCount = 0
	end else begin
		set @conditional_join_NWS_ContentSource = 1
		select @SourceCount = count(OutputValue)
		from [dbo].[OGen_fnc0__Split] (
			@IDSource_search_, 
			','
		)
	end

	declare @HighlightCount as int
	declare @conditional_join_NWS_ContentHighlight as bit
	if (
		(@IDHighlight_search_ is null)
		or
		(@IDHighlight_search_ = '')
	) begin
		set @conditional_join_NWS_ContentHighlight = 0
		set @HighlightCount = 0
	end else begin
		set @conditional_join_NWS_ContentHighlight = 1
		select @HighlightCount = count(OutputValue)
		from [dbo].[OGen_fnc0__Split] (
			@IDHighlight_search_, 
			','
		)
	end

	declare @ProfileCount as int
	declare @conditional_join_NWS_ContentProfile as bit
	if (
		(@IDProfile_search_ is null)
		--or
		--(@IDProfile_search_ = '')
	) begin
		set @conditional_join_NWS_ContentProfile = 0
		set @ProfileCount = 0
	end else begin
		set @conditional_join_NWS_ContentProfile = 1
		select @ProfileCount = count(OutputValue)
		from "dbo"."OGen_fnc0__Split" (
			@IDProfile_search_, 
			','
		)
	end

	insert into @output
	select
		distinct "NWS_Content"."IDContent"
	from "NWS_Content"
	left join "DIC_TextLanguage" on (
		(@conditional_join_DIC_TextLanguage = 1)
		and
		("DIC_TextLanguage"."IFLanguage" = @IDLanguage_)
		and
		("DIC_TextLanguage"."IFText" in (
			"NWS_Content"."TX_Title", 
			"NWS_Content"."TX_Content", 
			"NWS_Content"."tx_subtitle"
		))
	)
	where
		("NWS_Content"."isNews_notForum" = 1)
		and
		(
			(@IFApplication_search_ is null)
			or
			(@IFApplication_search_ = "NWS_Content"."IFApplication")
		) 
		and
		(
			(@IFUser__Publisher_search_ is null)
			or
			(@IFUser__Publisher_search_ <= 0)
			or
			(@IFUser__Publisher_search_ = "NWS_Content"."IFUser__Publisher")
		) 
		and
		(
			(@IFUser__Aproved_search_ < -1) -- < -1 !!! have in consideration argument comments
			or 
			(
				(
					(@IFUser__Aproved_search_ is null)
					or
					(@IFUser__Aproved_search_ = -1)
				)
				and
				("NWS_Content"."IFUser__Aproved" is null)
			) 
			or
			(
				(@IFUser__Aproved_search_ = 0)
				and
				(not "NWS_Content"."IFUser__Aproved" is null)
			)
			or
			(
				not (@IFUser__Aproved_search_ is null)
				and
				("NWS_Content"."IFUser__Aproved" = @IFUser__Aproved_search_)
			)
		) 
		and
		(
			(@Begin_date_search_ is null)
			OR
			(@End_date_search_ is null)
			OR
			("NWS_Content"."Begin_date" between @Begin_date_search_ and @End_date_search_)
		)
		and
		(
			(@conditional_join_DIC_TextLanguage = 0)
			or
			(
				select "dbo"."OGen_fnc0__Like"(
					(
						case 
							when (not "DIC_TextLanguage"."CharVar8000" is null) 
								then "DIC_TextLanguage"."CharVar8000"
							when (not "DIC_TextLanguage"."Text" is null) 
								then "DIC_TextLanguage"."Text"
							else
								''
						end
					), 			
					@Keywords_search_
				)
			) = 1
		)
		and
		(
			(@conditional_join_NWS_ContentTag = 0)
			or
			(
				(
					select count("NWS_ContentTag"."IFTag")
					from "NWS_ContentTag"
					where 
						("NWS_ContentTag"."IFContent" = "NWS_Content"."IDContent")
						and
						("NWS_ContentTag"."IFTag" in (
							select cast(OutputValue as bigint)
							from "dbo"."OGen_fnc0__Split" (
								@IDTag_search_, 
								','
							)
						))
				) = @TagCount
			)
		) 
		and
		(
			(@conditional_join_NWS_ContentAuthor = 0)
			or
			(
				(
					select count("NWS_ContentAuthor"."IFAuthor")
					from "NWS_ContentAuthor"
					where 
						("NWS_ContentAuthor"."IFContent" = "NWS_Content"."IDContent")
						and
						("NWS_ContentAuthor"."IFAuthor" in (
							select cast(OutputValue as bigint)
							from "dbo"."OGen_fnc0__Split" (
								@IDAuthor_search_, 
								','
							)
						))
				) = @AuthorCount
			)
		) 
		and
		(
			(@conditional_join_NWS_ContentSource = 0)
			or
			(
				(
					select count("NWS_ContentSource"."IFSource")
					from "NWS_ContentSource"
					where 
						("NWS_ContentSource"."IFContent" = "NWS_Content"."IDContent")
						and
						("NWS_ContentSource"."IFSource" in (
							select cast(OutputValue as bigint)
							from "dbo"."OGen_fnc0__Split" (
								@IDSource_search_, 
								','
							)
						))
				) = @SourceCount
			)
		) 
		and
		(
			(@conditional_join_NWS_ContentHighlight = 0)
			or
			(
				(
					select count("NWS_ContentHighlight"."IFHighlight")
					from "NWS_ContentHighlight"
					where 
						("NWS_ContentHighlight"."IFContent" = "NWS_Content"."IDContent")
						and
						("NWS_ContentHighlight"."IFHighlight" in (
							select cast(OutputValue as bigint)
							from "dbo"."OGen_fnc0__Split" (
								@IDHighlight_search_, 
								','
							)
						))
				) = @HighlightCount
			)
		) 
		and
		(
			(@conditional_join_NWS_ContentProfile = 0)
			or
			(
				(
					select count("NWS_ContentProfile"."IFProfile")
					from "NWS_ContentProfile"
					where 
						("NWS_ContentProfile"."IFContent" = "NWS_Content"."IDContent")
						and
						("NWS_ContentProfile"."IFProfile" in (
							select cast(OutputValue as bigint)
							from "dbo"."OGen_fnc0__Split" (
								@IDProfile_search_, 
								','
							)
						))
				) = @ProfileCount
			)
		) 
	return
end
go


select *
from vNWS_Content
where IDContent in (
	select IDContent
	from "dbo"."fnc_NWS_Content_Record_open_generic"(
		1, --null	--@IFApplication_search_ int, 
		1, --@IFUser__Publisher_search_ bigint, 
		-1, --@IFUser__Aproved_search_ bigint, 
		'1899-1-1', --null	--@Begin_date_search_ datetime, 
		'1901-1-1', --null, --@End_date_search_ datetime, 

		'1,4',	--@IDTag_search_ varchar(8000), 
		null,	--@IDAuthor_search_ varchar(8000), 
		null,	--@IDSource_search_ varchar(8000), 
		null,	--@IDHighlight_search_ varchar(8000), 
		'1,4',	--@IDProfile_search_ varchar(8000), 

		'r ês', --@Keywords_search_ varchar (255)
		1, --@IDLanguage_ int, 
		1 -- @isAND_notOR_ bit
	)
)

select *
from vNWS_Content
where IDContent in (
	select IDContent
	from "fnc_NWS_Content_Record_open_generic"(
		1, --null	--@IFApplication_search_ int, 
		1, --@IFUser__Publisher_search_ bigint, 
		-1, --@IFUser__Aproved_search_ bigint, 
		null,--'1899-1-1', --null	--@Begin_date_search_ datetime, 
		null,--'1901-1-1', --null, --@End_date_search_ datetime, 

		'',--'1,4',	--@IDTag_search_ varchar(8000), 
		null,	--@IDAuthor_search_ varchar(8000), 
		null,	--@IDSource_search_ varchar(8000), 
		null,	--@IDHighlight_search_ varchar(8000), 
		'',--'1,4',	--@IDProfile_search_ varchar(8000), 

		'',--'r ês', --@Keywords_search_ varchar (255)
		1, --@IDLanguage_ int, 
		1 -- @isAND_notOR_ bit
	)
)