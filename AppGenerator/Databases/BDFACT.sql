USE [master]
GO
/****** Object:  Database [SIGFACT]    Script Date: 9/2/2023 10:38:35 ******/
CREATE DATABASE [SIGFACT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SIGFACT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SIGFACT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SIGFACT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SIGFACT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SIGFACT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SIGFACT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SIGFACT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SIGFACT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SIGFACT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SIGFACT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SIGFACT] SET ARITHABORT OFF 
GO
ALTER DATABASE [SIGFACT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SIGFACT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SIGFACT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SIGFACT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SIGFACT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SIGFACT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SIGFACT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SIGFACT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SIGFACT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SIGFACT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SIGFACT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SIGFACT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SIGFACT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SIGFACT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SIGFACT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SIGFACT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SIGFACT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SIGFACT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SIGFACT] SET  MULTI_USER 
GO
ALTER DATABASE [SIGFACT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SIGFACT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SIGFACT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SIGFACT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SIGFACT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SIGFACT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SIGFACT] SET QUERY_STORE = OFF
GO
USE [SIGFACT]
GO
/****** Object:  Schema [security]    Script Date: 9/2/2023 10:38:35 ******/
CREATE SCHEMA [security]
GO
/****** Object:  Table [dbo].[Catalogo_Almacen]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Almacen](
	[Id_Almacen] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Ubicacion] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogoAlmacen] PRIMARY KEY CLUSTERED 
(
	[Id_Almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Caracteristicas]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Caracteristicas](
	[Id_Caracteristica] [int] IDENTITY(0,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[EStado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cat_Caracteristicas] PRIMARY KEY CLUSTERED 
(
	[Id_Caracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Categorias]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Categorias](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogoCategorias] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Clientes]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Clientes](
	[Id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[DNI] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogoClientes] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Oferta_Especial]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Oferta_Especial](
	[Id_Oferta] [int] IDENTITY(1,1) NOT NULL,
	[Id_Lote] [int] NULL,
	[Estado] [nvarchar](50) NULL,
	[Valor] [float] NULL,
	[Vencimiento] [datetime] NULL,
 CONSTRAINT [PK_CatalogoOfertaEspecial] PRIMARY KEY CLUSTERED 
(
	[Id_Oferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Presentacion]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Presentacion](
	[Id_Presentacion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
	[Abreviatura] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogoPresentacion] PRIMARY KEY CLUSTERED 
(
	[Id_Presentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Producto]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Producto](
	[Id_Producto] [int] IDENTITY(0,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Id_Categoria] [int] NULL,
 CONSTRAINT [PK_CatProducto] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Tipo_Detalle_Lote]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Tipo_Detalle_Lote](
	[Id_Tipo_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogoTipoDetalle] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Tipo_Transaccion]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Tipo_Transaccion](
	[Id_Tipo_Egreso] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogoTipoEgreso] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Egreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail_Factura]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Factura](
	[Id_Detalle_Factura] [int] IDENTITY(1,1) NOT NULL,
	[Id_Factura] [int] NULL,
	[Id_Producto] [int] NULL,
	[Precio_Venta] [float] NULL,
	[Cantidad] [int] NULL,
	[Total] [float] NULL,
	[Id_Detalle_Transaccion] [int] NULL,
	[Id_Oferta] [int] NULL,
 CONSTRAINT [PK_TblDetalleFactura] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail_Transaccion_Lote]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Transaccion_Lote](
	[Id_Detalle_Transaccion] [int] NOT NULL,
	[Id_Lote] [int] NULL,
	[Cantidad_Afectada] [int] NULL,
	[Id_Transaccion] [int] NULL,
 CONSTRAINT [PK_Detail_Transaccion_Lote] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relational_Caracteristicas_Productos]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relational_Caracteristicas_Productos](
	[Id_Producto] [int] NOT NULL,
	[Id_Caracteristica] [int] NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblCaracteristicasProductos] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC,
	[Id_Caracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relational_Detalle_Lotes]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relational_Detalle_Lotes](
	[Id_Detalle] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Id_Tipo_Detalle] [int] NULL,
	[Estado] [nvarchar](50) NULL,
	[Id_Lote] [int] NULL,
 CONSTRAINT [PK_TblDetalleLotes] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relational_Equivalencias_Presentacion]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relational_Equivalencias_Presentacion](
	[Id_Presentacion_Inicial] [int] NOT NULL,
	[Valor_Presentacion_Inicial] [int] NULL,
	[Id_Presentacion_Final] [int] NOT NULL,
	[Valor_Presentacion_Final] [int] NULL,
 CONSTRAINT [PK_TblEquivalenciasPresentacion] PRIMARY KEY CLUSTERED 
(
	[Id_Presentacion_Inicial] ASC,
	[Id_Presentacion_Final] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Factura]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Factura](
	[Id_Factura] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cliente] [nvarchar](50) NULL,
	[Id_Cliente] [int] NULL,
	[Fecha] [datetime] NULL,
	[SubTotal] [float] NULL,
	[IVA] [float] NULL,
	[Total] [float] NULL,
	[No_Factura] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblFactura] PRIMARY KEY CLUSTERED 
(
	[Id_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Lotes]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Lotes](
	[Id_Lote] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [int] NULL,
	[Id_Producto] [int] NULL,
	[Cantidad_Inicial] [int] NULL,
	[Cantidad_Existente] [int] NULL,
	[Costo] [float] NULL,
	[Estado] [nvarchar](50) NULL,
	[Id_Presentacion] [int] NULL,
	[Id_Almacen] [int] NULL,
 CONSTRAINT [PK_TblLotes] PRIMARY KEY CLUSTERED 
(
	[Id_Lote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Transacciones_Lotes]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Transacciones_Lotes](
	[Id_Transaccion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Id_Tipo_Egreso] [int] NULL,
	[Id_Lote] [int] NULL,
	[Cantidad] [int] NULL,
	[Id_Usuario_Gestor] [int] NULL,
 CONSTRAINT [PK_TblEgresosLotes] PRIMARY KEY CLUSTERED 
(
	[Id_Transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [security].[Security_Permissions]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [security].[Security_Permissions](
	[Id_Permission] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Security_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id_Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [security].[Security_Permissions_Roles]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [security].[Security_Permissions_Roles](
	[Id_Role] [int] NOT NULL,
	[Id_Permission] [int] NOT NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Security_Permissions_Roles] PRIMARY KEY CLUSTERED 
(
	[Id_Role] ASC,
	[Id_Permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [security].[Security_Roles]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [security].[Security_Roles](
	[Id_Role] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](150) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Security_Roles] PRIMARY KEY CLUSTERED 
(
	[Id_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [security].[Security_Users]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [security].[Security_Users](
	[Id_User] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](150) NULL,
	[Estado] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Password] [nvarchar](500) NULL,
	[Mail] [nvarchar](150) NULL,
	[Token] [nvarchar](500) NULL,
	[Token_Date] [datetime] NULL,
	[Token_Expiration_Date] [datetime] NULL,
 CONSTRAINT [PK_Security_Users] PRIMARY KEY CLUSTERED 
(
	[Id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [security].[Security_Users_Roles]    Script Date: 9/2/2023 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [security].[Security_Users_Roles](
	[Id_Role] [int] NOT NULL,
	[Id_User] [int] NOT NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_Security_Users_Roles] PRIMARY KEY CLUSTERED 
(
	[Id_Role] ASC,
	[Id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Almacen] ON 

INSERT [dbo].[Catalogo_Almacen] ([Id_Almacen], [Descripcion], [Ubicacion], [Estado]) VALUES (1, N'rt', N'rt', N'ert')
INSERT [dbo].[Catalogo_Almacen] ([Id_Almacen], [Descripcion], [Ubicacion], [Estado]) VALUES (2, N'asd', N'asd', N'asd')
INSERT [dbo].[Catalogo_Almacen] ([Id_Almacen], [Descripcion], [Ubicacion], [Estado]) VALUES (3, N'asd', N'asd', N'asd')
SET IDENTITY_INSERT [dbo].[Catalogo_Almacen] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Caracteristicas] ON 

INSERT [dbo].[Catalogo_Caracteristicas] ([Id_Caracteristica], [Descripcion], [EStado]) VALUES (0, N'sweft', N'wer')
SET IDENTITY_INSERT [dbo].[Catalogo_Caracteristicas] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Categorias] ON 

INSERT [dbo].[Catalogo_Categorias] ([Id_Categoria], [Descripcion], [Estado]) VALUES (1, N'dty', N'ert')
INSERT [dbo].[Catalogo_Categorias] ([Id_Categoria], [Descripcion], [Estado]) VALUES (2, N'fgh', N'fgh')
SET IDENTITY_INSERT [dbo].[Catalogo_Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Clientes] ON 

INSERT [dbo].[Catalogo_Clientes] ([Id_Cliente], [Nombres], [Apellidos], [DNI]) VALUES (1, N'ert', N'ert', N'ert')
SET IDENTITY_INSERT [dbo].[Catalogo_Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Oferta_Especial] ON 

INSERT [dbo].[Catalogo_Oferta_Especial] ([Id_Oferta], [Id_Lote], [Estado], [Valor], [Vencimiento]) VALUES (1, 1, N'1', 1, CAST(N'2023-06-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Catalogo_Oferta_Especial] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Presentacion] ON 

INSERT [dbo].[Catalogo_Presentacion] ([Id_Presentacion], [Descripcion], [Estado], [Abreviatura]) VALUES (1, N'rt', N'sdf', N'sdf')
SET IDENTITY_INSERT [dbo].[Catalogo_Presentacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Producto] ON 

INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (31, N'ASD', 1)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (32, N'ASD', 1)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (33, N'wer', 2)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (34, N'ad', 1)
SET IDENTITY_INSERT [dbo].[Catalogo_Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Tipo_Detalle_Lote] ON 

INSERT [dbo].[Catalogo_Tipo_Detalle_Lote] ([Id_Tipo_Detalle], [Descripcion], [Estado]) VALUES (1, N'sdf', N'sdf')
SET IDENTITY_INSERT [dbo].[Catalogo_Tipo_Detalle_Lote] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Tipo_Transaccion] ON 

INSERT [dbo].[Catalogo_Tipo_Transaccion] ([Id_Tipo_Egreso], [Descripcion], [Estado]) VALUES (1, N'sdf', N'sdf')
SET IDENTITY_INSERT [dbo].[Catalogo_Tipo_Transaccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Detail_Factura] ON 

INSERT [dbo].[Detail_Factura] ([Id_Detalle_Factura], [Id_Factura], [Id_Producto], [Precio_Venta], [Cantidad], [Total], [Id_Detalle_Transaccion], [Id_Oferta]) VALUES (1, 1, 31, 1, 1, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[Detail_Factura] OFF
GO
INSERT [dbo].[Relational_Caracteristicas_Productos] ([Id_Producto], [Id_Caracteristica], [Descripcion]) VALUES (34, 0, N'asfesfs')
GO
SET IDENTITY_INSERT [dbo].[Transaction_Factura] ON 

INSERT [dbo].[Transaction_Factura] ([Id_Factura], [Nombre_Cliente], [Id_Cliente], [Fecha], [SubTotal], [IVA], [Total], [No_Factura], [Estado]) VALUES (1, N'ad', 1, CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1, 1, N'1', N'1')
SET IDENTITY_INSERT [dbo].[Transaction_Factura] OFF
GO
SET IDENTITY_INSERT [security].[Security_Users] ON 

INSERT [security].[Security_Users] ([Id_User], [Nombres], [Estado], [Descripcion], [Password], [Mail], [Token], [Token_Date], [Token_Expiration_Date]) VALUES (1, N'Wilber', N'ACT', N'Test', N'zaxscd', N'sa', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [security].[Security_Users] OFF
GO
ALTER TABLE [dbo].[Catalogo_Producto]  WITH CHECK ADD  CONSTRAINT [FK_CatalogoProducto_CatalogoCategorias] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Catalogo_Categorias] ([Id_Categoria])
GO
ALTER TABLE [dbo].[Catalogo_Producto] CHECK CONSTRAINT [FK_CatalogoProducto_CatalogoCategorias]
GO
ALTER TABLE [dbo].[Detail_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Factura_Detail_Transaccion_Lote] FOREIGN KEY([Id_Detalle_Transaccion])
REFERENCES [dbo].[Detail_Transaccion_Lote] ([Id_Detalle_Transaccion])
GO
ALTER TABLE [dbo].[Detail_Factura] CHECK CONSTRAINT [FK_Detail_Factura_Detail_Transaccion_Lote]
GO
ALTER TABLE [dbo].[Detail_Factura]  WITH CHECK ADD  CONSTRAINT [FK_TblDetalleFactura_CatalogoOfertaEspecial] FOREIGN KEY([Id_Oferta])
REFERENCES [dbo].[Catalogo_Oferta_Especial] ([Id_Oferta])
GO
ALTER TABLE [dbo].[Detail_Factura] CHECK CONSTRAINT [FK_TblDetalleFactura_CatalogoOfertaEspecial]
GO
ALTER TABLE [dbo].[Detail_Factura]  WITH CHECK ADD  CONSTRAINT [FK_TblDetalleFactura_TblFactura] FOREIGN KEY([Id_Factura])
REFERENCES [dbo].[Transaction_Factura] ([Id_Factura])
GO
ALTER TABLE [dbo].[Detail_Factura] CHECK CONSTRAINT [FK_TblDetalleFactura_TblFactura]
GO
ALTER TABLE [dbo].[Detail_Factura]  WITH CHECK ADD  CONSTRAINT [TblDetalleFactura_FK] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Catalogo_Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Detail_Factura] CHECK CONSTRAINT [TblDetalleFactura_FK]
GO
ALTER TABLE [dbo].[Detail_Transaccion_Lote]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Transaccion_Lote_Transaction_Lotes] FOREIGN KEY([Id_Lote])
REFERENCES [dbo].[Transaction_Lotes] ([Id_Lote])
GO
ALTER TABLE [dbo].[Detail_Transaccion_Lote] CHECK CONSTRAINT [FK_Detail_Transaccion_Lote_Transaction_Lotes]
GO
ALTER TABLE [dbo].[Detail_Transaccion_Lote]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Transaccion_Lote_Transaction_Transacciones_Lotes] FOREIGN KEY([Id_Transaccion])
REFERENCES [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion])
GO
ALTER TABLE [dbo].[Detail_Transaccion_Lote] CHECK CONSTRAINT [FK_Detail_Transaccion_Lote_Transaction_Transacciones_Lotes]
GO
ALTER TABLE [dbo].[Relational_Caracteristicas_Productos]  WITH CHECK ADD  CONSTRAINT [FK_TblCaracteristicasProductos_CatalogoCaracteristicas] FOREIGN KEY([Id_Caracteristica])
REFERENCES [dbo].[Catalogo_Caracteristicas] ([Id_Caracteristica])
GO
ALTER TABLE [dbo].[Relational_Caracteristicas_Productos] CHECK CONSTRAINT [FK_TblCaracteristicasProductos_CatalogoCaracteristicas]
GO
ALTER TABLE [dbo].[Relational_Caracteristicas_Productos]  WITH CHECK ADD  CONSTRAINT [FK_TblCaracteristicasProductos_CatalogoProducto] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Catalogo_Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Relational_Caracteristicas_Productos] CHECK CONSTRAINT [FK_TblCaracteristicasProductos_CatalogoProducto]
GO
ALTER TABLE [dbo].[Relational_Detalle_Lotes]  WITH CHECK ADD  CONSTRAINT [FK_TblDetalleLotes_CatalogoTipoDetalle] FOREIGN KEY([Id_Tipo_Detalle])
REFERENCES [dbo].[Catalogo_Tipo_Detalle_Lote] ([Id_Tipo_Detalle])
GO
ALTER TABLE [dbo].[Relational_Detalle_Lotes] CHECK CONSTRAINT [FK_TblDetalleLotes_CatalogoTipoDetalle]
GO
ALTER TABLE [dbo].[Relational_Detalle_Lotes]  WITH CHECK ADD  CONSTRAINT [FK_TblDetalleLotes_TblLotes] FOREIGN KEY([Id_Lote])
REFERENCES [dbo].[Transaction_Lotes] ([Id_Lote])
GO
ALTER TABLE [dbo].[Relational_Detalle_Lotes] CHECK CONSTRAINT [FK_TblDetalleLotes_TblLotes]
GO
ALTER TABLE [dbo].[Relational_Equivalencias_Presentacion]  WITH CHECK ADD  CONSTRAINT [FK_TblEquivalenciasPresentacion_CatalogoPresentacion] FOREIGN KEY([Id_Presentacion_Inicial])
REFERENCES [dbo].[Catalogo_Presentacion] ([Id_Presentacion])
GO
ALTER TABLE [dbo].[Relational_Equivalencias_Presentacion] CHECK CONSTRAINT [FK_TblEquivalenciasPresentacion_CatalogoPresentacion]
GO
ALTER TABLE [dbo].[Relational_Equivalencias_Presentacion]  WITH CHECK ADD  CONSTRAINT [FK_TblEquivalenciasPresentacion_CatalogoPresentacion1] FOREIGN KEY([Id_Presentacion_Final])
REFERENCES [dbo].[Catalogo_Presentacion] ([Id_Presentacion])
GO
ALTER TABLE [dbo].[Relational_Equivalencias_Presentacion] CHECK CONSTRAINT [FK_TblEquivalenciasPresentacion_CatalogoPresentacion1]
GO
ALTER TABLE [dbo].[Transaction_Factura]  WITH CHECK ADD  CONSTRAINT [FK_TblFactura_CatalogoClientes] FOREIGN KEY([Id_Cliente])
REFERENCES [dbo].[Catalogo_Clientes] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Transaction_Factura] CHECK CONSTRAINT [FK_TblFactura_CatalogoClientes]
GO
ALTER TABLE [dbo].[Transaction_Lotes]  WITH CHECK ADD  CONSTRAINT [FK_TblLotes_CatalogoAlmacen] FOREIGN KEY([Id_Almacen])
REFERENCES [dbo].[Catalogo_Almacen] ([Id_Almacen])
GO
ALTER TABLE [dbo].[Transaction_Lotes] CHECK CONSTRAINT [FK_TblLotes_CatalogoAlmacen]
GO
ALTER TABLE [dbo].[Transaction_Lotes]  WITH CHECK ADD  CONSTRAINT [FK_TblLotes_CatalogoPresentacion] FOREIGN KEY([Id_Presentacion])
REFERENCES [dbo].[Catalogo_Presentacion] ([Id_Presentacion])
GO
ALTER TABLE [dbo].[Transaction_Lotes] CHECK CONSTRAINT [FK_TblLotes_CatalogoPresentacion]
GO
ALTER TABLE [dbo].[Transaction_Lotes]  WITH CHECK ADD  CONSTRAINT [FK_TblLotes_CatalogoProducto] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Catalogo_Producto] ([Id_Producto])
GO
ALTER TABLE [dbo].[Transaction_Lotes] CHECK CONSTRAINT [FK_TblLotes_CatalogoProducto]
GO
ALTER TABLE [dbo].[Transaction_Transacciones_Lotes]  WITH CHECK ADD  CONSTRAINT [FK_TblEgresosLotes_CatalogoTipoEgreso] FOREIGN KEY([Id_Tipo_Egreso])
REFERENCES [dbo].[Catalogo_Tipo_Transaccion] ([Id_Tipo_Egreso])
GO
ALTER TABLE [dbo].[Transaction_Transacciones_Lotes] CHECK CONSTRAINT [FK_TblEgresosLotes_CatalogoTipoEgreso]
GO
ALTER TABLE [security].[Security_Permissions_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Security_Permissions_Roles_Security_Permissions] FOREIGN KEY([Id_Permission])
REFERENCES [security].[Security_Permissions] ([Id_Permission])
GO
ALTER TABLE [security].[Security_Permissions_Roles] CHECK CONSTRAINT [FK_Security_Permissions_Roles_Security_Permissions]
GO
ALTER TABLE [security].[Security_Permissions_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Security_Permissions_Roles_Security_Roles] FOREIGN KEY([Id_Role])
REFERENCES [security].[Security_Roles] ([Id_Role])
GO
ALTER TABLE [security].[Security_Permissions_Roles] CHECK CONSTRAINT [FK_Security_Permissions_Roles_Security_Roles]
GO
ALTER TABLE [security].[Security_Users_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Security_Users_Roles_Security_Roles] FOREIGN KEY([Id_Role])
REFERENCES [security].[Security_Roles] ([Id_Role])
GO
ALTER TABLE [security].[Security_Users_Roles] CHECK CONSTRAINT [FK_Security_Users_Roles_Security_Roles]
GO
ALTER TABLE [security].[Security_Users_Roles]  WITH CHECK ADD  CONSTRAINT [FK_Security_Users_Roles_Security_Users] FOREIGN KEY([Id_User])
REFERENCES [security].[Security_Users] ([Id_User])
GO
ALTER TABLE [security].[Security_Users_Roles] CHECK CONSTRAINT [FK_Security_Users_Roles_Security_Users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Almacen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo Caracteristicas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Caracteristicas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Categorias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Clientes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Oferta_Especial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Presentacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo de productos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Producto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Tipo_Detalle_Lote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Catalogo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Catalogo_Tipo_Transaccion'
GO
USE [master]
GO
ALTER DATABASE [SIGFACT] SET  READ_WRITE 
GO
