-- DROP FUNCTION [DBO].[fnc_CRD_Permition_Record_open_byUser]
ALTER FUNCTION [DBO].[fnc_CRD_Permition_Record_open_byUser](
	@IDUser_search_ bigint
)
RETURNS TABLE
AS
RETURN

	--select
	--	distinct pp1."IFPermition" as "IDPermition"
	--from "CRD_UserProfile" as up1
	--left join "CRD_ProfilePermition" as pp1 on (
	--	pp1."IFProfile" = up1."IFProfile"
	--)
	--where 
	--	(up1."IFUser" = @IDUser_search_)

	select 
		distinct "CRD_ProfilePermition"."IFPermition" as "IDPermition"
	from "CRD_UserProfile"
	left join "CRD_ProfileProfile" on (
		"CRD_ProfileProfile"."IFProfile" = "CRD_UserProfile"."IFProfile"
	)
	left join "CRD_ProfilePermition" on (
		("CRD_UserProfile"."IFProfile" = "CRD_ProfilePermition"."IFProfile")
		or
		("CRD_ProfileProfile"."IFProfile_parent" = "CRD_ProfilePermition"."IFProfile")
	)
	where
		"CRD_UserProfile"."IFUser" = @IDUser_search_

GO

select *
from "fnc_CRD_Permition_Record_open_byUser"(
	1
);