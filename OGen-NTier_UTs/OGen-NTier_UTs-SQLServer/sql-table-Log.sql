CREATE TABLE [dbo].[Log] (
	[IDLog] [bigint] IDENTITY (1, 1) NOT NULL,
	[IDLogcode] [bigint] NOT NULL,
	[IDUser_posted] [bigint] NOT NULL,
	[Date_posted] [datetime] NOT NULL,
	[Logdata] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO
