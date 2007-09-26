CREATE TABLE [dbo].[WordLanguage] (
	[IDWord] [bigint] NOT NULL,
	[IDLanguage] [bigint] NOT NULL,
	[Translation] [varchar] (2048) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO
