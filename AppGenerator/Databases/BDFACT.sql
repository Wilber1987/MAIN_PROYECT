USE [master]
GO
/****** Object:  Database [SIGFACT]    Script Date: 1/5/2023 22:10:36 ******/
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
/****** Object:  Schema [security]    Script Date: 1/5/2023 22:10:37 ******/
CREATE SCHEMA [security]
GO
/****** Object:  Table [dbo].[Catalogo_Almacen]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Almacen](
	[Id_Almacen] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Ubicacion] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
	[Id_Sucursal] [int] NULL,
 CONSTRAINT [PK_CatalogoAlmacen] PRIMARY KEY CLUSTERED 
(
	[Id_Almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Caracteristicas]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Catalogo_Categorias]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Catalogo_Clientes]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Catalogo_Oferta_Especial]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Catalogo_Presentacion]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Catalogo_Producto]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Catalogo_Proveedores]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Proveedores](
	[Id_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[No_Contacto] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Catalogo_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Sucursales]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Sucursales](
	[Id_Sucursal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Direccion] [nvarchar](500) NULL,
 CONSTRAINT [PK_Catalogo_Sucursales] PRIMARY KEY CLUSTERED 
(
	[Id_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo_Tipo_Detalle_Lote]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Catalogo_Tipo_Transaccion]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo_Tipo_Transaccion](
	[Id_Tipo_Transaccion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
 CONSTRAINT [PK_CatalogoTipoEgreso] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo_Transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Datos_Compra]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datos_Compra](
	[Id_Transaccion] [int] NOT NULL,
	[Id_Proveedor] [int] NULL,
	[No_Factura] [nvarchar](50) NULL,
 CONSTRAINT [PK_Datos_Compra] PRIMARY KEY CLUSTERED 
(
	[Id_Transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Datos_Configuracion]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datos_Configuracion](
	[Id_Sucursal] [int] NOT NULL,
	[Encabezado] [nvarchar](150) NOT NULL,
	[AutoDebito] [bit] NOT NULL,
 CONSTRAINT [PK_Datos_Configuracion_1] PRIMARY KEY CLUSTERED 
(
	[Id_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail_Factura]    Script Date: 1/5/2023 22:10:37 ******/
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
	[Id_Oferta] [int] NULL,
 CONSTRAINT [PK_TblDetalleFactura] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail_Movimiento]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Movimiento](
	[Id_Detalle_Movimiento] [int] IDENTITY(1,1) NOT NULL,
	[Id_Original] [int] NULL,
	[Id_Resultante] [int] NULL,
	[Id_Movimiento] [int] NULL,
	[Cantidad_Afectada] [int] NULL,
 CONSTRAINT [PK_Detail_Movimiento] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail_Transaccion_Lote]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Transaccion_Lote](
	[Id_Detalle_Transaccion] [int] IDENTITY(1,1) NOT NULL,
	[Id_Lote] [int] NULL,
	[Cantidad_Afectada] [int] NULL,
	[Id_Transaccion] [int] NULL,
	[Id_Detalle_Factura] [int] NULL,
 CONSTRAINT [PK_Detail_Transaccion_Lote] PRIMARY KEY CLUSTERED 
(
	[Id_Detalle_Transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relational_Caracteristicas_Productos]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Relational_Detalle_Lotes]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Relational_Equivalencias_Presentacion]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Transaction_Factura]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Transaction_Lotes]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [dbo].[Transaction_Movimiento]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Movimiento](
	[Id_Movimiento] [int] NOT NULL,
	[Motivo] [nvarchar](500) NULL,
	[Fecha] [datetime] NULL,
	[Id_Gestor] [int] NULL,
 CONSTRAINT [PK_Transaction_Movimineto] PRIMARY KEY CLUSTERED 
(
	[Id_Movimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction_Transacciones_Lotes]    Script Date: 1/5/2023 22:10:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_Transacciones_Lotes](
	[Id_Transaccion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Id_Tipo_Transaccion] [int] NULL,
	[Id_Usuario_Gestor] [int] NULL,
	[Estado] [nvarchar](50) NULL,
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_TblEgresosLotes] PRIMARY KEY CLUSTERED 
(
	[Id_Transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [security].[Security_Permissions]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [security].[Security_Permissions_Roles]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [security].[Security_Roles]    Script Date: 1/5/2023 22:10:37 ******/
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
/****** Object:  Table [security].[Security_Users]    Script Date: 1/5/2023 22:10:37 ******/
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
	[Id_Sucursal] [int] NULL,
 CONSTRAINT [PK_Security_Users] PRIMARY KEY CLUSTERED 
(
	[Id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [security].[Security_Users_Roles]    Script Date: 1/5/2023 22:10:37 ******/
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

INSERT [dbo].[Catalogo_Almacen] ([Id_Almacen], [Descripcion], [Ubicacion], [Estado], [Id_Sucursal]) VALUES (1, N'Almacen1', N'test', N'ACTIVO', NULL)
INSERT [dbo].[Catalogo_Almacen] ([Id_Almacen], [Descripcion], [Ubicacion], [Estado], [Id_Sucursal]) VALUES (2, N'Almacen2', N'test', N'ACTIVO', NULL)
INSERT [dbo].[Catalogo_Almacen] ([Id_Almacen], [Descripcion], [Ubicacion], [Estado], [Id_Sucursal]) VALUES (3, N'Almacen3', N'test', N'ACTIVO', NULL)
INSERT [dbo].[Catalogo_Almacen] ([Id_Almacen], [Descripcion], [Ubicacion], [Estado], [Id_Sucursal]) VALUES (4, N'ws', N'a', N'ACTIVO', 1)
SET IDENTITY_INSERT [dbo].[Catalogo_Almacen] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Caracteristicas] ON 

INSERT [dbo].[Catalogo_Caracteristicas] ([Id_Caracteristica], [Descripcion], [EStado]) VALUES (0, N'COLOR', N'ACTIVO')
SET IDENTITY_INSERT [dbo].[Catalogo_Caracteristicas] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Categorias] ON 

INSERT [dbo].[Catalogo_Categorias] ([Id_Categoria], [Descripcion], [Estado]) VALUES (1, N'CATEGORIA 1', N'ACTIVO')
INSERT [dbo].[Catalogo_Categorias] ([Id_Categoria], [Descripcion], [Estado]) VALUES (2, N'CATEGORIA 2', N'ACTIVO')
SET IDENTITY_INSERT [dbo].[Catalogo_Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Clientes] ON 

INSERT [dbo].[Catalogo_Clientes] ([Id_Cliente], [Nombres], [Apellidos], [DNI]) VALUES (1, N'TEST', N'TEST', N'TEST')
SET IDENTITY_INSERT [dbo].[Catalogo_Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Oferta_Especial] ON 

INSERT [dbo].[Catalogo_Oferta_Especial] ([Id_Oferta], [Id_Lote], [Estado], [Valor], [Vencimiento]) VALUES (1, 1, N'1', 1, CAST(N'2023-06-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Catalogo_Oferta_Especial] ([Id_Oferta], [Id_Lote], [Estado], [Valor], [Vencimiento]) VALUES (2, 1, N'ACTIVO', 2, CAST(N'2023-05-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Catalogo_Oferta_Especial] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Presentacion] ON 

INSERT [dbo].[Catalogo_Presentacion] ([Id_Presentacion], [Descripcion], [Estado], [Abreviatura]) VALUES (1, N'LIBRA', N'ACTIVO', N'LB')
INSERT [dbo].[Catalogo_Presentacion] ([Id_Presentacion], [Descripcion], [Estado], [Abreviatura]) VALUES (2, N'KILO', N'ACTIVO', N'KLG')
SET IDENTITY_INSERT [dbo].[Catalogo_Presentacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Producto] ON 

INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (31, N'PROD 1', 2)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (32, N'PROD 2', 1)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (33, N'PROD 3', 2)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (34, N'PROD 4', 1)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (35, N'Prod 6 - test', 1)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (36, N'prod 5 - test', 2)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (37, N'aa', 1)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (38, N'q', 1)
INSERT [dbo].[Catalogo_Producto] ([Id_Producto], [Descripcion], [Id_Categoria]) VALUES (39, N'aa', 1)
SET IDENTITY_INSERT [dbo].[Catalogo_Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Proveedores] ON 

INSERT [dbo].[Catalogo_Proveedores] ([Id_Proveedor], [Descripcion], [No_Contacto], [Email]) VALUES (1, N'Sinsa', N'test', N'test')
SET IDENTITY_INSERT [dbo].[Catalogo_Proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Sucursales] ON 

INSERT [dbo].[Catalogo_Sucursales] ([Id_Sucursal], [Nombre], [Descripcion], [Direccion]) VALUES (1, N'Jinotepe', N'test', N'Jinotepe')
SET IDENTITY_INSERT [dbo].[Catalogo_Sucursales] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Tipo_Detalle_Lote] ON 

INSERT [dbo].[Catalogo_Tipo_Detalle_Lote] ([Id_Tipo_Detalle], [Descripcion], [Estado]) VALUES (1, N'COLOR', N'ACTIVO')
SET IDENTITY_INSERT [dbo].[Catalogo_Tipo_Detalle_Lote] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalogo_Tipo_Transaccion] ON 

INSERT [dbo].[Catalogo_Tipo_Transaccion] ([Id_Tipo_Transaccion], [Descripcion], [Estado]) VALUES (1, N'VENTA', N'ACTIVO')
INSERT [dbo].[Catalogo_Tipo_Transaccion] ([Id_Tipo_Transaccion], [Descripcion], [Estado]) VALUES (2, N'COMPRA', N'ACTIVO')
INSERT [dbo].[Catalogo_Tipo_Transaccion] ([Id_Tipo_Transaccion], [Descripcion], [Estado]) VALUES (3, N'BAJA', N'ACTIVO')
INSERT [dbo].[Catalogo_Tipo_Transaccion] ([Id_Tipo_Transaccion], [Descripcion], [Estado]) VALUES (4, N'test', N'ACTIVO')
SET IDENTITY_INSERT [dbo].[Catalogo_Tipo_Transaccion] OFF
GO
INSERT [dbo].[Datos_Compra] ([Id_Transaccion], [Id_Proveedor], [No_Factura]) VALUES (9, 1, N'3')
GO
SET IDENTITY_INSERT [dbo].[Detail_Factura] ON 

INSERT [dbo].[Detail_Factura] ([Id_Detalle_Factura], [Id_Factura], [Id_Producto], [Precio_Venta], [Cantidad], [Total], [Id_Oferta]) VALUES (2, 2, 31, 2, 2, 2, 1)
INSERT [dbo].[Detail_Factura] ([Id_Detalle_Factura], [Id_Factura], [Id_Producto], [Precio_Venta], [Cantidad], [Total], [Id_Oferta]) VALUES (3, 3, 31, 23, 23, 23, 1)
INSERT [dbo].[Detail_Factura] ([Id_Detalle_Factura], [Id_Factura], [Id_Producto], [Precio_Venta], [Cantidad], [Total], [Id_Oferta]) VALUES (4, 4, 32, 2, 2, 2, 1)
INSERT [dbo].[Detail_Factura] ([Id_Detalle_Factura], [Id_Factura], [Id_Producto], [Precio_Venta], [Cantidad], [Total], [Id_Oferta]) VALUES (5, 5, 31, 2, 2, 2, 1)
SET IDENTITY_INSERT [dbo].[Detail_Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Detail_Transaccion_Lote] ON 

INSERT [dbo].[Detail_Transaccion_Lote] ([Id_Detalle_Transaccion], [Id_Lote], [Cantidad_Afectada], [Id_Transaccion], [Id_Detalle_Factura]) VALUES (1, NULL, 1, 5, NULL)
INSERT [dbo].[Detail_Transaccion_Lote] ([Id_Detalle_Transaccion], [Id_Lote], [Cantidad_Afectada], [Id_Transaccion], [Id_Detalle_Factura]) VALUES (2, NULL, 2, 6, NULL)
INSERT [dbo].[Detail_Transaccion_Lote] ([Id_Detalle_Transaccion], [Id_Lote], [Cantidad_Afectada], [Id_Transaccion], [Id_Detalle_Factura]) VALUES (3, 1, 2, 7, NULL)
INSERT [dbo].[Detail_Transaccion_Lote] ([Id_Detalle_Transaccion], [Id_Lote], [Cantidad_Afectada], [Id_Transaccion], [Id_Detalle_Factura]) VALUES (4, 2, 2, 8, NULL)
INSERT [dbo].[Detail_Transaccion_Lote] ([Id_Detalle_Transaccion], [Id_Lote], [Cantidad_Afectada], [Id_Transaccion], [Id_Detalle_Factura]) VALUES (5, 3, 3, 9, NULL)
SET IDENTITY_INSERT [dbo].[Detail_Transaccion_Lote] OFF
GO
INSERT [dbo].[Relational_Caracteristicas_Productos] ([Id_Producto], [Id_Caracteristica], [Descripcion]) VALUES (34, 0, N'asfesfs')
INSERT [dbo].[Relational_Caracteristicas_Productos] ([Id_Producto], [Id_Caracteristica], [Descripcion]) VALUES (35, 0, N'')
INSERT [dbo].[Relational_Caracteristicas_Productos] ([Id_Producto], [Id_Caracteristica], [Descripcion]) VALUES (37, 0, N'')
INSERT [dbo].[Relational_Caracteristicas_Productos] ([Id_Producto], [Id_Caracteristica], [Descripcion]) VALUES (38, 0, N'')
INSERT [dbo].[Relational_Caracteristicas_Productos] ([Id_Producto], [Id_Caracteristica], [Descripcion]) VALUES (39, 0, N'')
GO
SET IDENTITY_INSERT [dbo].[Relational_Detalle_Lotes] ON 

INSERT [dbo].[Relational_Detalle_Lotes] ([Id_Detalle], [Descripcion], [Id_Tipo_Detalle], [Estado], [Id_Lote]) VALUES (1, N'2', 1, N'ACTIVO', 1)
INSERT [dbo].[Relational_Detalle_Lotes] ([Id_Detalle], [Descripcion], [Id_Tipo_Detalle], [Estado], [Id_Lote]) VALUES (2, N'2', 1, N'ACTIVO', 2)
INSERT [dbo].[Relational_Detalle_Lotes] ([Id_Detalle], [Descripcion], [Id_Tipo_Detalle], [Estado], [Id_Lote]) VALUES (3, N'3', 1, N'ACTIVO', 3)
SET IDENTITY_INSERT [dbo].[Relational_Detalle_Lotes] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_Factura] ON 

INSERT [dbo].[Transaction_Factura] ([Id_Factura], [Nombre_Cliente], [Id_Cliente], [Fecha], [SubTotal], [IVA], [Total], [No_Factura], [Estado]) VALUES (2, N'TEST', 1, CAST(N'2023-04-24T00:00:00.000' AS DateTime), 2, 2, 2, N'2', N'ACTIVO')
INSERT [dbo].[Transaction_Factura] ([Id_Factura], [Nombre_Cliente], [Id_Cliente], [Fecha], [SubTotal], [IVA], [Total], [No_Factura], [Estado]) VALUES (3, N'23', 1, CAST(N'2023-04-25T00:00:00.000' AS DateTime), 23, 23, 23, N'32', N'ACTIVO')
INSERT [dbo].[Transaction_Factura] ([Id_Factura], [Nombre_Cliente], [Id_Cliente], [Fecha], [SubTotal], [IVA], [Total], [No_Factura], [Estado]) VALUES (4, N'2', 1, CAST(N'2023-04-25T00:00:00.000' AS DateTime), 2, 2, 2, N'2', N'ACTIVO')
INSERT [dbo].[Transaction_Factura] ([Id_Factura], [Nombre_Cliente], [Id_Cliente], [Fecha], [SubTotal], [IVA], [Total], [No_Factura], [Estado]) VALUES (5, N'ww', 1, CAST(N'2023-05-02T00:00:00.000' AS DateTime), 2, 2, 2, N'2', N'ACTIVO')
SET IDENTITY_INSERT [dbo].[Transaction_Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_Lotes] ON 

INSERT [dbo].[Transaction_Lotes] ([Id_Lote], [Cantidad], [Id_Producto], [Cantidad_Inicial], [Cantidad_Existente], [Costo], [Estado], [Id_Presentacion], [Id_Almacen]) VALUES (1, 2, 31, 2, 2, 2, N'ACTIVO', 1, 1)
INSERT [dbo].[Transaction_Lotes] ([Id_Lote], [Cantidad], [Id_Producto], [Cantidad_Inicial], [Cantidad_Existente], [Costo], [Estado], [Id_Presentacion], [Id_Almacen]) VALUES (2, 2, 31, 2, 2, 2, N'ACTIVO', 1, 1)
INSERT [dbo].[Transaction_Lotes] ([Id_Lote], [Cantidad], [Id_Producto], [Cantidad_Inicial], [Cantidad_Existente], [Costo], [Estado], [Id_Presentacion], [Id_Almacen]) VALUES (3, 3, 31, 3, 3, 3, N'ACTIVO', 1, 1)
SET IDENTITY_INSERT [dbo].[Transaction_Lotes] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction_Transacciones_Lotes] ON 

INSERT [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion], [Descripcion], [Id_Tipo_Transaccion], [Id_Usuario_Gestor], [Estado], [Fecha]) VALUES (1, N'test', 2, 1, NULL, CAST(N'2023-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion], [Descripcion], [Id_Tipo_Transaccion], [Id_Usuario_Gestor], [Estado], [Fecha]) VALUES (3, N'r', 2, 1, NULL, CAST(N'2023-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion], [Descripcion], [Id_Tipo_Transaccion], [Id_Usuario_Gestor], [Estado], [Fecha]) VALUES (5, N'test', 2, 1, NULL, CAST(N'2023-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion], [Descripcion], [Id_Tipo_Transaccion], [Id_Usuario_Gestor], [Estado], [Fecha]) VALUES (6, N'test', 2, 1, NULL, CAST(N'2023-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion], [Descripcion], [Id_Tipo_Transaccion], [Id_Usuario_Gestor], [Estado], [Fecha]) VALUES (7, N'r', 2, 1, NULL, CAST(N'2023-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion], [Descripcion], [Id_Tipo_Transaccion], [Id_Usuario_Gestor], [Estado], [Fecha]) VALUES (8, N'232', 2, 2, NULL, CAST(N'2023-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion], [Descripcion], [Id_Tipo_Transaccion], [Id_Usuario_Gestor], [Estado], [Fecha]) VALUES (9, N'3', 2, 3, NULL, CAST(N'2023-04-26T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transaction_Transacciones_Lotes] OFF
GO
SET IDENTITY_INSERT [security].[Security_Permissions] ON 

INSERT [security].[Security_Permissions] ([Id_Permission], [Descripcion], [Estado]) VALUES (1, N'ADMIN_ACCESS', N'Activo')
INSERT [security].[Security_Permissions] ([Id_Permission], [Descripcion], [Estado]) VALUES (2, N'HOME_ACCESS', N'Activo')
INSERT [security].[Security_Permissions] ([Id_Permission], [Descripcion], [Estado]) VALUES (3, N'PERFIL_ACCESS', N'Activo')
SET IDENTITY_INSERT [security].[Security_Permissions] OFF
GO
INSERT [security].[Security_Permissions_Roles] ([Id_Role], [Id_Permission], [Estado]) VALUES (1, 1, NULL)
INSERT [security].[Security_Permissions_Roles] ([Id_Role], [Id_Permission], [Estado]) VALUES (5, 1, N'Activo')
INSERT [security].[Security_Permissions_Roles] ([Id_Role], [Id_Permission], [Estado]) VALUES (6, 2, N'Activo')
GO
SET IDENTITY_INSERT [security].[Security_Roles] ON 

INSERT [security].[Security_Roles] ([Id_Role], [Descripcion], [Estado]) VALUES (1, N'ADMIN', N'Activo')
INSERT [security].[Security_Roles] ([Id_Role], [Descripcion], [Estado]) VALUES (5, N'GERENTE', N'Activo')
INSERT [security].[Security_Roles] ([Id_Role], [Descripcion], [Estado]) VALUES (6, N'CAJERO', N'Activo')
SET IDENTITY_INSERT [security].[Security_Roles] OFF
GO
SET IDENTITY_INSERT [security].[Security_Users] ON 

INSERT [security].[Security_Users] ([Id_User], [Nombres], [Estado], [Descripcion], [Password], [Mail], [Token], [Token_Date], [Token_Expiration_Date], [Id_Sucursal]) VALUES (1, N'Wilber', N'Activo', N'Test', N'??&?E????h=~?????????I}?@????', N'sa@me.es', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [security].[Security_Users] ([Id_User], [Nombres], [Estado], [Descripcion], [Password], [Mail], [Token], [Token_Date], [Token_Expiration_Date], [Id_Sucursal]) VALUES (2, N'Admin', N'Activo', N'', N'b???_??????Q3', N'admin@admin.net', NULL, NULL, NULL, NULL)
INSERT [security].[Security_Users] ([Id_User], [Nombres], [Estado], [Descripcion], [Password], [Mail], [Token], [Token_Date], [Token_Expiration_Date], [Id_Sucursal]) VALUES (3, N'Mariano', N'Activo', N'cajero1', N'b???_??????Q3', N'cajero1@cajero.es', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [security].[Security_Users] OFF
GO
INSERT [security].[Security_Users_Roles] ([Id_Role], [Id_User], [Estado]) VALUES (1, 1, N'Activo')
INSERT [security].[Security_Users_Roles] ([Id_Role], [Id_User], [Estado]) VALUES (1, 2, N'ACTIVO')
INSERT [security].[Security_Users_Roles] ([Id_Role], [Id_User], [Estado]) VALUES (5, 1, N'Activo')
INSERT [security].[Security_Users_Roles] ([Id_Role], [Id_User], [Estado]) VALUES (6, 3, N'Activo')
GO
ALTER TABLE [dbo].[Catalogo_Almacen]  WITH CHECK ADD  CONSTRAINT [FK_Catalogo_Almacen_Catalogo_Sucursales] FOREIGN KEY([Id_Sucursal])
REFERENCES [dbo].[Catalogo_Sucursales] ([Id_Sucursal])
GO
ALTER TABLE [dbo].[Catalogo_Almacen] CHECK CONSTRAINT [FK_Catalogo_Almacen_Catalogo_Sucursales]
GO
ALTER TABLE [dbo].[Catalogo_Producto]  WITH CHECK ADD  CONSTRAINT [FK_CatalogoProducto_CatalogoCategorias] FOREIGN KEY([Id_Categoria])
REFERENCES [dbo].[Catalogo_Categorias] ([Id_Categoria])
GO
ALTER TABLE [dbo].[Catalogo_Producto] CHECK CONSTRAINT [FK_CatalogoProducto_CatalogoCategorias]
GO
ALTER TABLE [dbo].[Datos_Compra]  WITH CHECK ADD  CONSTRAINT [FK_Datos_Compra_Catalogo_Proveedores] FOREIGN KEY([Id_Proveedor])
REFERENCES [dbo].[Catalogo_Proveedores] ([Id_Proveedor])
GO
ALTER TABLE [dbo].[Datos_Compra] CHECK CONSTRAINT [FK_Datos_Compra_Catalogo_Proveedores]
GO
ALTER TABLE [dbo].[Datos_Compra]  WITH CHECK ADD  CONSTRAINT [FK_Datos_Compra_Transaction_Transacciones_Lotes] FOREIGN KEY([Id_Transaccion])
REFERENCES [dbo].[Transaction_Transacciones_Lotes] ([Id_Transaccion])
GO
ALTER TABLE [dbo].[Datos_Compra] CHECK CONSTRAINT [FK_Datos_Compra_Transaction_Transacciones_Lotes]
GO
ALTER TABLE [dbo].[Datos_Configuracion]  WITH CHECK ADD  CONSTRAINT [FK_Datos_Configuracion_Catalogo_Sucursales] FOREIGN KEY([Id_Sucursal])
REFERENCES [dbo].[Catalogo_Sucursales] ([Id_Sucursal])
GO
ALTER TABLE [dbo].[Datos_Configuracion] CHECK CONSTRAINT [FK_Datos_Configuracion_Catalogo_Sucursales]
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
ALTER TABLE [dbo].[Detail_Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Movimiento_Transaction_Lotes] FOREIGN KEY([Id_Original])
REFERENCES [dbo].[Transaction_Lotes] ([Id_Lote])
GO
ALTER TABLE [dbo].[Detail_Movimiento] CHECK CONSTRAINT [FK_Detail_Movimiento_Transaction_Lotes]
GO
ALTER TABLE [dbo].[Detail_Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Movimiento_Transaction_Lotes1] FOREIGN KEY([Id_Resultante])
REFERENCES [dbo].[Transaction_Lotes] ([Id_Lote])
GO
ALTER TABLE [dbo].[Detail_Movimiento] CHECK CONSTRAINT [FK_Detail_Movimiento_Transaction_Lotes1]
GO
ALTER TABLE [dbo].[Detail_Movimiento]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Movimiento_Transaction_Movimineto] FOREIGN KEY([Id_Movimiento])
REFERENCES [dbo].[Transaction_Movimiento] ([Id_Movimiento])
GO
ALTER TABLE [dbo].[Detail_Movimiento] CHECK CONSTRAINT [FK_Detail_Movimiento_Transaction_Movimineto]
GO
ALTER TABLE [dbo].[Detail_Transaccion_Lote]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Transaccion_Lote_Detail_Factura] FOREIGN KEY([Id_Detalle_Factura])
REFERENCES [dbo].[Detail_Factura] ([Id_Detalle_Factura])
GO
ALTER TABLE [dbo].[Detail_Transaccion_Lote] CHECK CONSTRAINT [FK_Detail_Transaccion_Lote_Detail_Factura]
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
ALTER TABLE [dbo].[Transaction_Transacciones_Lotes]  WITH CHECK ADD  CONSTRAINT [FK_TblEgresosLotes_CatalogoTipoEgreso] FOREIGN KEY([Id_Tipo_Transaccion])
REFERENCES [dbo].[Catalogo_Tipo_Transaccion] ([Id_Tipo_Transaccion])
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
ALTER TABLE [security].[Security_Users]  WITH CHECK ADD  CONSTRAINT [FK_Security_Users_Catalogo_Sucursales] FOREIGN KEY([Id_Sucursal])
REFERENCES [dbo].[Catalogo_Sucursales] ([Id_Sucursal])
GO
ALTER TABLE [security].[Security_Users] CHECK CONSTRAINT [FK_Security_Users_Catalogo_Sucursales]
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
