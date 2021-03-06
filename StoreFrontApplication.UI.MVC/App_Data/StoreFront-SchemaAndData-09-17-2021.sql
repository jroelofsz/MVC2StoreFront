/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Suppliers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_StockStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Categories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Employees]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[StockStatus]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[StockStatus]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/17/2021 2:28:31 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[JobTitle] [varchar](20) NULL,
	[DeptID] [int] NOT NULL,
	[DateOfBirth] [date] NULL,
	[TitleOfCourtesy] [nvarchar](5) NULL,
	[HireDate] [date] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](20) NOT NULL,
	[State] [char](2) NOT NULL,
	[Country] [nvarchar](20) NOT NULL,
	[Zip] [char](5) NOT NULL,
	[Phone] [varchar](15) NULL,
	[DirectReportID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[CategoryID] [int] NOT NULL,
	[AmtInStock] [int] NULL,
	[AmtOnOrder] [int] NULL,
	[SupplierID] [int] NOT NULL,
	[InStockID] [int] NOT NULL,
	[ProductImage] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockStatus]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockStatus](
	[InStockID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_StockStatus] PRIMARY KEY CLUSTERED 
(
	[InStockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](20) NOT NULL,
	[State] [char](2) NULL,
	[Country] [nvarchar](20) NOT NULL,
	[Zip] [char](5) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/17/2021 2:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[FavoriteColor] [varchar](7) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202108312010055_InitialCreate', N'StoreFrontApplication.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C4E8DE85B76D2746C6174CDB83BC0DD812BB2D8C446925CA6B23D82FCB433E29BF90A244A9255E24AA5B7DF16280414B2C9E2A16ABC862A9E8FFFDE7BFE39F5EC3C07AC149EA4764629F8C8E6D0B1337F27CB29CD8195DFCF0C9FEE9C73FFE617CE585AFD6D792EE8CD1414F924EEC674AE373C749DD671CA27414FA6E12A5D1828EDC2874901739A7C7C77F734E4E1C0C10366059D6F84B46A81FE2FC011EA71171714C3314DC461E0E52FE1E5A6639AA7587429CC6C8C5137B46A3045F2711A117711CF82EA220D1E8E96674FB753A2ABADBD645E023106D8683856D2142229A939D3FA57846A1EF7216C30B143CBEC518E8162848311FD0F98ADC746CC7A76C6CCEAA6309E566298DC29E8027675C598ED87D2D95DB9532419D57A076FAC6469DAB7462DF78387FF5250A400122C3F3699030E2897D5BB1B848E33B4C4765C75101799D00DCAF51F27D54473CB28CFB1D55C6753A3A66FF8EAC6916D02CC11382339AA0E0C87AC8E630E1FFC46F8FD1774C266727F3C5D9A70F1F9177F6F1AFF8EC437DA43056A06BBC80570F4914E30464C38B6AFCB6E534FB3962C7AA5BAD4FA115B025F013DBBA45AF9F3159D267F0A0D34FB675EDBF62AF7CC38DEB89F8E056D08926193CDE654180E601AEDA9D569EECFF16AEA71F3E0EC2F50EBDF8CB7CEA05FEE03809F8D5171CE4ADE9B31F17EED598EF6F9C0CDC3364CF4DFB2A5ABFCDA22C71D960222DC9234A969836A51B3B2BE33532690635BC5997A8876FDA4C52D9BC95A46C40EB7842C962D7DE50CABB5DBEC61657DB889846DA0CCE60F71A097047565BA795719D981A178141FF9ED7CAAB10F9C1008BA50117085C167E12E26A943F47609A88F496F901A529AC15DE3F50FADC223AFC1C40F41976B3044C784651186F9DDBC37344F05D16CE9967EC8ED76053F3F86B748D5C70C12BC27A6D8CF73972BF4719BD22DE25A2F889BA25207B7CF443738041C4B9705D9CA6D760CCD89B461097978037849E9DF686632BD6BE83956980FC501DAD086BEBB7927415B1A829A4A84543A68A5CDA44FD1C2D7D62266A49AA17B5A0E8149593F51595819949CA29F582E6049D72165483C582F90C0D1F0CE6B0871F0D6EB679EBD6829A1AF320E5EF98E0049631EF01518A13B29A019375631FC1423E7D8CE9D6F7A69CD357146443B35ACB1BF24560786FC8610FDF1B7231E1F58BEFB1A8C4E088541203BC11BDFAF4D5ED738264BB7687C63077CD7C376B80CE5D2ED23472FDDC0B14C9319EDA68CA0F319CD59DE7284623E64A606060E83EDBF2E00D8CCD168DEA9E5CE200536C5DB845F2708A521779B21A61405E0FC1CA1D5521D82A67D214EE2F124FB0749CB04E881D8252F0549F50D92D7CE2FA310A3AB524F434DCC2D8D82B1E62CB258E31610C3B3561C25C9D226102547C8449E9D2D0D8A9595CBB216AA256DD9C7785B0AB799732173BB1C98ED85963973C7EDB8A61B66B6C07C6D9AE121301B4E9BE7D18283FAB981A807870393403154E4C1A03E521D54E0CB4A9B13D18685325EFCE408B23AAE9FC0BE7D54333CFE64179F7DB7AABBAF6609B0D7D1C986916B127F4A1D00327B2795ECE59237EA58AC319C8C9CF67290F75451361E0334C9B299B55BCAB8C439D7610D188DA005786D601CA3F144A409243F510AECCE5B54AC7A3881EB065DEAD1596AFFD026CCD0664ECFA07D31AA1FEB3AA689C46A78F6A64953548466E7458A8E1280C425CBC9A0337508A2E2F2B2BC62416EE130DD706C627A345411D91AB4649E56006D752699ADD5A5205647D42B28DB424844F1A2D9583195C4BDC46BB95A4080A7A84051BA9A8B9850FE46C65A6A3DA6DAAB6B1531456F1176347538135BE4571EC9365AD228BBFB1664539D6F48759FFB2A4B0C070DC54519D54495B71A2518296586805D620E9B59FA4F4125134472CCF33F542894CB9B76A96FF92657DFB9427B1DC074A6AF69B7F5935F8BCDFD87CE5E884835EC3904316E2E4900A835077B758C91C0A50A248E54FA3200B893EE2D2F72E3EE8D5FB176F6484B123C82F455492FAA4B8B739174633257BC9B666AD8A70D69F393D844EFF657C5A9F015DCCAA4729535875145D5A6B6F33A90B75369B3D31ACEC3F799D08DBF13C5ECB5207E0AF7A62D4CA2124B05A9B396AB362A58ED96C314714CA52EA9042530F29EBC5270D21EB0D6BE16934AAA630E720979BD4D1E556736445E1491D5AD1BC06B64266B1CD1C55519B520756349B63AF0A55C455F580F736ED6167B8CDAD38206FB6BB6930B6B3440EB339D6EA00EA40B5D73DB1F8977E098CBF3F48F3D29E128733AF2251B299796930F46B53E3937A73696AAD03D06336BE933796FFB63A013D5E3F23DEAAA948A74691A4E25E9D1E8553E2989FD8BA2FF34847B882C4B64A358281BDA514872346309AFD124C031FB385BE24B845C45FE09416B521F6E9F1C9A970FDE770AEE23869EA058A13AFEE3E4E73CE7650E6455E50E23EA3442EBAD8E0BACA0A54CA67DF100FBF4EEC7FE7BDCEF3D408FB95BF3EB26ED227E2FF9241C3639261EB37B9887498F27D830B2395A0BFBD8B9B18E62ABFF9D7B7A2EB91759F803B9D5BC782A2D799FEE6FD8C5ED2145D379066ED5B1BEFD7DB1A171E94A882B7AC7FBF61EED341EE369452FE2944AF7FEE2B9AF2FEC246888A3B0A43E10DA242DD1D8475B0B4F70F3C78A4F9FD837E8355DF47584734ED5D049FF407136F22982F4365CF3DEE438A13D42E96A45CCF9D95DC1B9575EE7B6F920ABE377274B9A8BB07DCA085DB9B8528EFAC207AB0AD5351EF3C18F63EED7EEB45CE8752D7BC0ADAF75BCEBCCB0AE6966F50BFABC2E50328B553940EEDBF3C79D7B6A64B091F788D67BF22E4033336BECDEFBFD478D7C6A64B101FB8B1F52A283E305BDBD7FEB9674B33DE42F75E1E2C573A693EEDA8B2C85DE5BF45CA1D8EFFF3088CA088288B5B9BEA7AB3B65AD90E862B123D537DA19BC858721C89AF44D1CEB6DF58F986DF3A584ED3CE56531EDAC69BAFFFADBC394D3B6F4DD1E53E0A9795658FAA62F28E75ACADE2EA3D152A3746D25117DF15B3B67EA77F4F75C98328A5E13D9AAFCBEFA70C7910950CE93A3DCA8EE50FC5B077D6FE3624ECDFA9BF5C41B0BF1449B0DBD8352B9A1BB288CACD5B90A824113234B798220FB6D48B84FA0BE452686609E8FCDA799ED4639F41E6D8BB21F7198D330A43C6E13C6824BC5810D0C63FAFAD6ECA3CBE8FD9533AC410404C9F25EEEFC9CF991F7895DCD78A9C90068245173CDDCBE692B2B4EFF2AD42BA8B882110575F15143DE2300E002CBD2733F482D7910DCCEF335E22F76D9501D481744F4453EDE34B1F2D1314A61C63D51F1EC186BDF0F5C7FF038AC0868222550000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ba1363d7-585f-4301-906e-946522df9263', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'cf19c6e4-cf44-45b8-ac1b-d90437dc308f', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'7dee8e9c-f230-4178-abc6-7e8249e05f64', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3c2d0967-3bce-448d-9feb-9c7ddc9f4127', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9c7b3201-e7cb-4280-8557-6f04de412764', N'ba1363d7-585f-4301-906e-946522df9263')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6f99778a-8990-445d-9a18-d69e0fe6a88d', N'cf19c6e4-cf44-45b8-ac1b-d90437dc308f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9c7b3201-e7cb-4280-8557-6f04de412764', N'cf19c6e4-cf44-45b8-ac1b-d90437dc308f')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6f99778a-8990-445d-9a18-d69e0fe6a88d', N'customer@email.com', 0, N'AEpsxXxKfQzwMD6ieDJwi2KDqNSv5RaDT3DFUVtAaj8VFnBM8K0pdGma5kOZbQzmCg==', N'7411a2bb-df7a-4d47-bda8-a7cf35f0e895', NULL, 0, 0, NULL, 1, 0, N'customer@email.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9c7b3201-e7cb-4280-8557-6f04de412764', N'jacobroelofsz@gmail.com', 0, N'AJ0GCr7H1xB16wdV+xBb4rDePjoNwKlKfICEkkRFNlGhnuiBs9d8wuD5TSgLOdCf8A==', N'2bc147ea-d454-4cd7-9eba-5be6f096f16f', NULL, 0, 1, NULL, 1, 0, N'jacobroelofsz@gmail.com')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Type]) VALUES (1, N'CPU')
INSERT [dbo].[Categories] ([CategoryID], [Type]) VALUES (2, N'GPU')
INSERT [dbo].[Categories] ([CategoryID], [Type]) VALUES (3, N'Cooling')
INSERT [dbo].[Categories] ([CategoryID], [Type]) VALUES (4, N'Motherboard')
INSERT [dbo].[Categories] ([CategoryID], [Type]) VALUES (5, N'Cases')
INSERT [dbo].[Categories] ([CategoryID], [Type]) VALUES (6, N'Power Supply')
INSERT [dbo].[Categories] ([CategoryID], [Type]) VALUES (7, N'Memory')
INSERT [dbo].[Categories] ([CategoryID], [Type]) VALUES (8, N'Storage')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (1, N'Sales')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (2, N'Administration')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (3, N'Developers')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (4, N'Cold-Callers')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [JobTitle], [DeptID], [DateOfBirth], [TitleOfCourtesy], [HireDate], [Address], [City], [State], [Country], [Zip], [Phone], [DirectReportID]) VALUES (1, N'Michael', N'Scott', N'Owner', 2, CAST(N'0170-09-12' AS Date), N'Mr.', CAST(N'2009-09-30' AS Date), N'1234 Main St', N'Kasnas City', N'MO', N'USA', N'64157', N'816-825-2860', 1)
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [JobTitle], [DeptID], [DateOfBirth], [TitleOfCourtesy], [HireDate], [Address], [City], [State], [Country], [Zip], [Phone], [DirectReportID]) VALUES (16, N'Dwight', N'Scrute', N'Head Of Sales', 1, CAST(N'1985-11-15' AS Date), N'Mr.', CAST(N'2019-04-14' AS Date), N'4321 Not Main St', N'Liberty ', N'MO', N'USA', N'64068', N'923-234-1234', 1)
INSERT [dbo].[Employees] ([EmpID], [FirstName], [LastName], [JobTitle], [DeptID], [DateOfBirth], [TitleOfCourtesy], [HireDate], [Address], [City], [State], [Country], [Zip], [Phone], [DirectReportID]) VALUES (17, N'Jacob', N'Roelofsz', N'Lead-Dev', 3, CAST(N'2002-12-16' AS Date), N'Mr.', CAST(N'2016-05-30' AS Date), N'1011 N 96th St', N'Kansas City', N'MO', N'USA', N'65148', N'912-123-1234', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Price], [CategoryID], [AmtInStock], [AmtOnOrder], [SupplierID], [InStockID], [ProductImage]) VALUES (7, N'Powercolor Red Devil 6700xt', N'The AMD Radeon™ RX 6700 XT graphics card, powered by AMD RDNA™ 2 architecture, featuring 40 powerful enhanced Compute Units, the all-new AMD Infinity Cache and 12GB of dedicated GDDR6 memory, is engineered to deliver ultra-high frame rates and powerhouse 1440p resolution gaming.', 849.9900, 2, 4, 16, 5, 1, N'72198961-5d0d-475c-8d8f-6a951ab18bf3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Price], [CategoryID], [AmtInStock], [AmtOnOrder], [SupplierID], [InStockID], [ProductImage]) VALUES (11, N'Intel i7 7700k', N'Architected for performance, the Core i7-7700K processor packs 4 high-performing cores with core base frequency of 4.2GHz and 8MB of cache memory. Kick up the performance even higher with Intel Turbo Boost Technology 2.0 to bump the max turbo frequency to an amazing 4.5GHz. Add Intel Hyper-Threading Technology for 8-way multitasking to deliver the performance knockout punch. Not enough? For the enthusiast, this processor is unlocked, you can tweak the performance to its fullest potential.', 310.9900, 1, 0, 10, 1, 2, N'4932645c-f17a-4177-a0c6-dcb365d3b08e.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Price], [CategoryID], [AmtInStock], [AmtOnOrder], [SupplierID], [InStockID], [ProductImage]) VALUES (14, N'AMD Ryzen 5600X', N'Be unstoppable with the unprecedented speed of the world’s best desktop processors. AMD Ryzen 5000 Series processors deliver the ultimate in high performance, whether you’re playing the latest games, designing the next skyscraper or crunching scientific data. With AMD Ryzen, you’re always in the lead.', 250.9900, 1, 10, 20, 5, 1, N'549eb0af-1cc0-4281-8a43-c3fbabf501a6.png')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [Price], [CategoryID], [AmtInStock], [AmtOnOrder], [SupplierID], [InStockID], [ProductImage]) VALUES (15, N'NVIDIA RTX 3090', N'
The GeForce RTX 3090 is colossally powerful in every way, giving you a whole new tier of performance. It’s powered by Ampere—NVIDIA’s 2nd gen RTX architecture—doubling down on ray tracing and AI performance with enhanced RT Cores, Tensor Cores, and new streaming multiprocessors. Plus, it features a staggering 24 GB of G6X memory, all to deliver the ultimate gaming experience.', 3000.9900, 2, 1, 50, 3, 3, N'3241935e-f31f-4f0b-bc6f-a42bcded3348.png')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[StockStatus] ON 

INSERT [dbo].[StockStatus] ([InStockID], [Status]) VALUES (1, N'In-Stock')
INSERT [dbo].[StockStatus] ([InStockID], [Status]) VALUES (2, N'Out-of-Stock')
INSERT [dbo].[StockStatus] ([InStockID], [Status]) VALUES (3, N'Backordered')
INSERT [dbo].[StockStatus] ([InStockID], [Status]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[StockStatus] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [City], [State], [Country], [Zip]) VALUES (1, N'Intel', N'2200 Mission College Blvd', N'Santa Clara', N'CA', N'USA', N'95054')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [City], [State], [Country], [Zip]) VALUES (2, N'MSI', N'901 Canada Court', N'City Of Industry', N'CA', N'USA', N'91748')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [City], [State], [Country], [Zip]) VALUES (3, N'NVIDIA', N'2701 San Tomas Expressway', N'Santa Clara', N'CA', N'USA', N'95054')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [City], [State], [Country], [Zip]) VALUES (4, N'Western Digital', N'5601 Great Oaks Pkwy', N'San Jose', N'CA', N'USA', N'95119')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [Address], [City], [State], [Country], [Zip]) VALUES (5, N'AMD', N'2485 Augistine Road', N'Santa Clara', N'CA', N'USA', N'95054')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [FavoriteColor]) VALUES (N'6f99778a-8990-445d-9a18-d69e0fe6a88d', N'customer', N'Test', N'#a84d4d')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [FavoriteColor]) VALUES (N'9c7b3201-e7cb-4280-8557-6f04de412764', N'Jacob', N'Roelofsz', N'#ff0000')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments1] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Departments] ([DeptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([DirectReportID])
REFERENCES [dbo].[Employees] ([EmpID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_StockStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_StockStatus] FOREIGN KEY([InStockID])
REFERENCES [dbo].[StockStatus] ([InStockID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_StockStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_StockStatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
