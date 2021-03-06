-- NOTA: tens de fazer DROP, nao da para fazer ALTER sobre funcoes

-- drop function "dbo"."fnc_vFOR_Message_Record_open_byParent_Recursive"
create function "dbo"."fnc_vFOR_Message_Record_open_byParent_Recursive"(
	@IDMessage__parent_search_ bigint
)
returns @output table (
	"IDMessage" bigint
)
as
begin
	-- even though 32 is the maximum, remember this is going to be used by other functions
	-- so, for SAFETY, i'm setting this to 28
	if (@@NESTLEVEL <= 28) begin

		declare @cursor cursor;
		set @cursor = cursor
			for
				select "IDMessage"
				from "FOR_Message"
				where
					("IFMessage__parent" = @IDMessage__parent_search_);


		declare @IDMessage bigint;
		open @cursor
		fetch next from @cursor
		into
			@IDMessage
		while @@fetch_status = 0
		begin
			insert into @output
			select @IDMessage;

			insert into @output
			select "IDMessage"
			from "dbo"."fnc_vFOR_Message_Record_open_byParent_Recursive"(
				@IDMessage
			);

			fetch next from @cursor
			into
				@IDMessage;
		end;
		deallocate @cursor;

	end;
	return;
end;
go

select *
from "dbo"."fnc_vFOR_Message_Record_open_byParent_Recursive"(
	5
);