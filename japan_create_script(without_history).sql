CREATE PARTITION FUNCTION [PF_Monthly] (datetime2)
AS RANGE RIGHT FOR VALUES ('2020-01-01', '2020-02-01', '2020-03-01', '2020-04-01', '2020-05-01', '2020-06-01', '2020-07-01', '2020-08-01', '2020-09-01', '2020-10-01', '2020-11-01', '2020-12-01', '2021-01-01', '2021-02-01', '2021-03-01', '2021-04-01', '2021-05-01', '2021-06-01', '2021-07-01', '2021-08-01', '2021-09-01', '2021-10-01', '2021-11-01', '2021-12-01', '2022-01-01', '2022-02-01', '2022-03-01', '2022-04-01', '2022-05-01', '2022-06-01', '2022-07-01', '2022-08-01', '2022-09-01', '2022-10-01', '2022-11-01', '2022-12-01', '2023-01-01', '2023-02-01', '2023-03-01', '2023-04-01', '2023-05-01', '2023-06-01', '2023-07-01', '2023-08-01', '2023-09-01', '2023-10-01', '2023-11-01', '2023-12-01', '2024-01-01', '2024-02-01', '2024-03-01', '2024-04-01', '2024-05-01', '2024-06-01', '2024-07-01', '2024-08-01', '2024-09-01', '2024-10-01', '2024-11-01', '2024-12-01', '2025-01-01', '2025-02-01', '2025-03-01', '2025-04-01', '2025-05-01', '2025-06-01', '2025-07-01', '2025-08-01', '2025-09-01', '2025-10-01', '2025-11-01', '2025-12-01', '2026-01-01', '2026-02-01', '2026-03-01', '2026-04-01', '2026-05-01', '2026-06-01', '2026-07-01', '2026-08-01', '2026-09-01', '2026-10-01', '2026-11-01', '2026-12-01', '2027-01-01', '2027-02-01', '2027-03-01', '2027-04-01', '2027-05-01', '2027-06-01', '2027-07-01', '2027-08-01', '2027-09-01', '2027-10-01', '2027-11-01', '2027-12-01', '2028-01-01', '2028-02-01', '2028-03-01', '2028-04-01', '2028-05-01', '2028-06-01', '2028-07-01', '2028-08-01', '2028-09-01', '2028-10-01', '2028-11-01', '2028-12-01', '2029-01-01', '2029-02-01', '2029-03-01', '2029-04-01', '2029-05-01', '2029-06-01', '2029-07-01', '2029-08-01', '2029-09-01', '2029-10-01', '2029-11-01', '2029-12-01', '2030-01-01');
 
CREATE PARTITION SCHEME PS_Monthly
AS PARTITION PF_Monthly
ALL TO ([PRIMARY])

CREATE SCHEMA [JAPAN]
GO

/****** Object:  Table [JAPAN].[region_node_forecast_data]    Script Date: 14/08/2024 15:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[region_node_forecast_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[confidence] [float] NOT NULL,
	[data_value] [float] NOT NULL,
	[model_name] [varchar](128) NOT NULL,
	[mlflow_run_id] [uniqueidentifier],
	[mlflow_model_uri] [varchar](256),
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_region_node_forecast_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC,
	[confidence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
) ON PS_Monthly ([time_stamp])




ALTER TABLE [JAPAN].[region_node_forecast_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[region_node_forecast_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))


	CREATE TABLE [JAPAN].[ds_region_node_forecast_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[confidence] [float] NOT NULL,
	[data_value] [float] NOT NULL,
	[model_name] [varchar](128) NOT NULL,
	[mlflow_run_id] [uniqueidentifier],
	[mlflow_model_uri] [varchar](256),
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_ds_region_node_forecast_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC,
	[confidence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
) ON PS_Monthly ([time_stamp])




ALTER TABLE [JAPAN].[ds_region_node_forecast_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[ds_region_node_forecast_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))




/****** Object:  Table [JAPAN].[natural_gas_actual_data]    Script Date: 14/08/2024 15:23:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[natural_gas_actual_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[data_value] [float] NOT NULL,
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_natural_gas_actual_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
) ON PS_Monthly ([time_stamp])


ALTER TABLE [JAPAN].[natural_gas_actual_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[natural_gas_actual_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))

/****** Object:  Table [JAPAN].[natural_gas_forecast_data]    Script Date: 14/08/2024 15:23:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[natural_gas_forecast_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[confidence] [float] NOT NULL,
	[data_value] [float] NOT NULL,
	[model_name] [varchar](128) NOT NULL,
	[mlflow_run_id] [uniqueidentifier],
	[mlflow_model_uri] [varchar](256),
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_natural_gas_forecast_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC,
	[confidence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
) ON PS_Monthly ([time_stamp])



ALTER TABLE [JAPAN].[natural_gas_forecast_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[natural_gas_forecast_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))


/****** Object:  Table [JAPAN].[grid_actual_data]    Script Date: 14/08/2024 15:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_actual_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[data_value] [float] NOT NULL,
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_grid_actual_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
)ON PS_Monthly ([time_stamp]);



ALTER TABLE [JAPAN].[grid_actual_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[grid_actual_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))


/****** Object:  Table [JAPAN].[grid_forecast_data]    Script Date: 14/08/2024 15:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_forecast_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[confidence] [float] NOT NULL,
	[data_value] [float] NOT NULL,
	[model_name] [varchar](128) NOT NULL,
	[mlflow_run_id] [uniqueidentifier],
	[mlflow_model_uri] [varchar](256),
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_grid_forecast_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC,
	[confidence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
)ON PS_Monthly ([time_stamp]);



ALTER TABLE [JAPAN].[grid_forecast_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[grid_forecast_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))



	CREATE TABLE [JAPAN].[ds_grid_forecast_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[confidence] [float] NOT NULL,
	[data_value] [float] NOT NULL,
	[model_name] [varchar](128) NOT NULL,
	[mlflow_run_id] [uniqueidentifier],
	[mlflow_model_uri] [varchar](256),
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_ds_grid_forecast_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC,
	[confidence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
)ON PS_Monthly ([time_stamp]);



ALTER TABLE [JAPAN].[ds_grid_forecast_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[ds_grid_forecast_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))
	

/****** Object:  Table [JAPAN].[grid_region_actual_data]    Script Date: 14/08/2024 15:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_region_actual_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[data_value] [float] NOT NULL,
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_grid_region_actual_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
)ON PS_Monthly ([time_stamp]);



ALTER TABLE [JAPAN].[grid_region_actual_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[grid_region_actual_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))


/****** Object:  Table [JAPAN].[grid_region_forecast_data]    Script Date: 14/08/2024 15:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_region_forecast_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[confidence] [float] NOT NULL,
	[data_value] [float] NOT NULL,
	[model_name] [varchar](128) NOT NULL,
	[mlflow_run_id] [uniqueidentifier],
	[mlflow_model_uri] [varchar](256),
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),

 CONSTRAINT [PK_grid_region_forecast_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC,
	[confidence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
)ON PS_Monthly ([time_stamp]);



ALTER TABLE [JAPAN].[grid_region_forecast_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[grid_region_forecast_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))


	CREATE TABLE [JAPAN].[ds_grid_region_forecast_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[confidence] [float] NOT NULL,
	[data_value] [float] NOT NULL,
	[model_name] [varchar](128) NOT NULL,
	[mlflow_run_id] [uniqueidentifier],
	[mlflow_model_uri] [varchar](256),
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),

 CONSTRAINT [PK_ds_grid_region_forecast_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC,
	[confidence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
)ON PS_Monthly ([time_stamp]);



ALTER TABLE [JAPAN].[ds_grid_region_forecast_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[ds_grid_region_forecast_data_history],
        DATA_CONSISTENCY_CHECK = OFF
		))

/****** Object:  Table [JAPAN].[region_node_actual_data]    Script Date: 14/08/2024 15:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[region_node_actual_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[data_value] [float] NOT NULL,
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	CONSTRAINT [PK_region_node_actual_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
) ON PS_Monthly ([time_stamp]);



ALTER TABLE [JAPAN].[region_node_actual_data]
SET (SYSTEM_VERSIONING = ON
    (
        HISTORY_TABLE = [JAPAN].[region_node_actual_data_history],
        DATA_CONSISTENCY_CHECK = OFF
    ))
---------------------------------------------------------------
-----------------------------------------------------------------
/****** Object:  Table [dbo].[grid_actual_data]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grid_actual_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[timestamp_generated] [datetime2](7) NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[data_value] [float] NOT NULL,
	
 CONSTRAINT [PK_grid_actual_data] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC,
	[data_source_id] ASC,
	[feature_id] ASC,
	[timestamp_generated] ASC,
	[time_stamp] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
)ON PS_Monthly ([time_stamp]);

------------------------------------------------------------------
---------------------------------------------------------------------
/****** Object:  Table [JAPAN].[data_feature]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[data_feature](
	[feature_id] [uniqueidentifier] NOT NULL,
	[feature_name] [varchar](128) NOT NULL,
	[unit] [varchar](32) NOT NULL,
	[sampling_interval_minute] [int] NOT NULL,
	[description] [varchar](256) NOT NULL,
 CONSTRAINT [data_feature_pk] PRIMARY KEY CLUSTERED 
(
	[feature_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [data_feature_pk2] UNIQUE NONCLUSTERED 
(
	[feature_name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--------------------------------------------------------------------
/****** Object:  Table [JAPAN].[data_source]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[data_source](
	[data_source_id] [uniqueidentifier] NOT NULL,
	[data_source_name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_data_source] PRIMARY KEY CLUSTERED 
(
	[data_source_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[grid]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid](
	[resource_id] [uniqueidentifier] NOT NULL,
	[resource_name] [varchar](32) NOT NULL,
	[time_zone] [varchar](32) NOT NULL,
 CONSTRAINT [PK_NewTable] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[grid_data_load]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_data_load](
	[resource_id] [uniqueidentifier] NULL,
	[data_source_id] [uniqueidentifier] NULL,
	[cadence_seconds] [int] NULL,
	[file_template] [varchar](128) NULL,
	[file_extension] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[grid_extraction]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_extraction](
	[resource_id] [uniqueidentifier] NULL,
	[data_source_id] [uniqueidentifier] NULL,
	[data_source_url] [varchar](256) NULL,
	[cadence_seconds] [int] NULL,
	[strategy] [varchar](16) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[grid_region]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_region](
	[resource_id] [uniqueidentifier] NOT NULL,
	[resource_name] [varchar](32) NOT NULL,
	[grid_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_grid_region] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[natural_gas_data_load]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[natural_gas_data_load](
	[data_source_id] [uniqueidentifier] NULL,
	[cadence_seconds] [int] NULL,
	[file_template] [varchar](128) NULL,
	[file_extension] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[natural_gas_extraction]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[natural_gas_extraction](
	[data_source_id] [uniqueidentifier] NOT NULL,
	[data_source_url] [varchar](256) NOT NULL,
	[cadence_seconds] [int] NOT NULL,
	[strategy] [varchar](16) NOT NULL,
 CONSTRAINT [natural_gas_extraction_pk] PRIMARY KEY CLUSTERED 
(
	[data_source_id] ASC,
	[data_source_url] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[natural_gas_hub]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[natural_gas_hub](
	[resource_id] [uniqueidentifier] NOT NULL,
	[resource_name] [varchar](32) NOT NULL,
 CONSTRAINT [natural_gas_hub_pk] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [natural_gas_hub_pk2] UNIQUE NONCLUSTERED 
(
	[resource_name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[region_node]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[region_node](
	[resource_id] [uniqueidentifier] NOT NULL,
	[resource_name] [varchar](32) NOT NULL,
	[node_type] [smallint] NOT NULL,
	[region_id] [uniqueidentifier] NOT NULL,
	[load_distribution_factor] [float] NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[region_node_data_load]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[region_node_data_load](
	[resource_id] [uniqueidentifier] NULL,
	[data_source_id] [uniqueidentifier] NULL,
	[cadence_seconds] [int] NULL,
	[file_template] [varchar](128) NULL,
	[file_extension] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[region_node_extraction]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[region_node_extraction](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[data_source_url] [varchar](256) NOT NULL,
	[cadence_seconds] [int] NOT NULL,
	[strategy] [varchar](16) NOT NULL,
 CONSTRAINT [region_node_extraction_pk] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC,
	[data_source_id] ASC,
	[data_source_url] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[region_node_natural_gas_supplier]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[region_node_natural_gas_supplier](
	[region_node_id] [uniqueidentifier] NOT NULL,
	[natural_gas_hub_id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[grid_transmission]    Script Date: 14/08/2024 15:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_transmission](
	[resource_id] [uniqueidentifier] NOT NULL,
	[resource_name] [varchar](64) NOT NULL,
	[grid_id] [uniqueidentifier] NOT NULL,
	[from_region] [varchar](32) NOT NULL,
	[to_region] [varchar](32) NOT NULL,
 CONSTRAINT [PK_grid_transmission] PRIMARY KEY CLUSTERED 
(
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [JAPAN].[grid_transmission_actual_data]    Script Date: 14/08/2024 15:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_transmission_actual_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[data_value] [float] NOT NULL,
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),
	
 CONSTRAINT [PK_grid_transmission_actual_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
)ON PS_Monthly ([time_stamp]);
/****** Object:  Table [JAPAN].[grid_transmission_forecast_data]    Script Date: 14/08/2024 15:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [JAPAN].[grid_transmission_forecast_data](
	[resource_id] [uniqueidentifier] NOT NULL,
	[data_source_id] [uniqueidentifier] NOT NULL,
	[feature_id] [uniqueidentifier] NOT NULL,
	[time_stamp] [datetime2](7) NOT NULL,
	[confidence] [float] NOT NULL,
	[data_value] [float] NOT NULL,
	[model_name] [varchar](128) NOT NULL,
	[mlflow_run_id] [uniqueidentifier],
	[mlflow_model_uri] [varchar](256),
	[timestamp_generated] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[timestamp_expired] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	PERIOD FOR SYSTEM_TIME ([timestamp_generated], [timestamp_expired]),

 CONSTRAINT [PK_grid_transmission_forecast_data] PRIMARY KEY CLUSTERED 
(
	[time_stamp] ASC,
	[feature_id] ASC,
	[data_source_id] ASC,
	[resource_id] ASC,
	[confidence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
	
)ON PS_Monthly ([time_stamp]);






ALTER TABLE [JAPAN].[region_node] ADD  DEFAULT ((1)) FOR [node_type]
GO
ALTER TABLE [JAPAN].[region_node] ADD  DEFAULT ((1.0)) FOR [load_distribution_factor]
GO
ALTER TABLE [JAPAN].[region_node] ADD  DEFAULT ((0.0)) FOR [latitude]
GO
ALTER TABLE [JAPAN].[region_node] ADD  DEFAULT ((0.0)) FOR [longitude]
GO


ALTER TABLE [JAPAN].[grid_actual_data]  WITH CHECK ADD  CONSTRAINT [grid_actual_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[grid_actual_data] CHECK CONSTRAINT [grid_actual_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[grid_actual_data]  WITH CHECK ADD  CONSTRAINT [grid_actual_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[grid_actual_data] CHECK CONSTRAINT [grid_actual_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[grid_actual_data]  WITH CHECK ADD  CONSTRAINT [grid_actual_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[grid] ([resource_id])
GO
ALTER TABLE [JAPAN].[grid_actual_data] CHECK CONSTRAINT [grid_actual_data_grid_resource_id_fk]
GO
ALTER TABLE [JAPAN].[grid_forecast_data]  WITH CHECK ADD  CONSTRAINT [grid_forecast_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO

ALTER TABLE [JAPAN].[ds_grid_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_grid_forecast_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])

ALTER TABLE [JAPAN].[grid_forecast_data] CHECK CONSTRAINT [grid_forecast_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[ds_grid_forecast_data] CHECK CONSTRAINT [ds_grid_forecast_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[grid_forecast_data]  WITH CHECK ADD  CONSTRAINT [grid_forecast_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO

ALTER TABLE [JAPAN].[ds_grid_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_grid_forecast_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[grid_forecast_data] CHECK CONSTRAINT [grid_forecast_data_data_source_data_source_id_fk]
GO

ALTER TABLE [JAPAN].[ds_grid_forecast_data] CHECK CONSTRAINT [ds_grid_forecast_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[grid_forecast_data]  WITH CHECK ADD  CONSTRAINT [grid_forecast_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[grid] ([resource_id])
GO

ALTER TABLE [JAPAN].[ds_grid_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_grid_forecast_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[grid] ([resource_id])
GO
ALTER TABLE [JAPAN].[grid_forecast_data] CHECK CONSTRAINT [grid_forecast_data_grid_resource_id_fk]
GO
ALTER TABLE [JAPAN].[ds_grid_forecast_data] CHECK CONSTRAINT [ds_grid_forecast_data_grid_resource_id_fk]
GO
ALTER TABLE [JAPAN].[grid_region]  WITH CHECK ADD  CONSTRAINT [FK_grid_region_grid] FOREIGN KEY([grid_id])
REFERENCES [JAPAN].[grid] ([resource_id])
GO
ALTER TABLE [JAPAN].[grid_region] CHECK CONSTRAINT [FK_grid_region_grid]
GO
ALTER TABLE [JAPAN].[grid_region_actual_data]  WITH CHECK ADD  CONSTRAINT [grid_region_actual_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[grid_region_actual_data] CHECK CONSTRAINT [grid_region_actual_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[grid_region_actual_data]  WITH CHECK ADD  CONSTRAINT [grid_region_actual_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[grid_region_actual_data] CHECK CONSTRAINT [grid_region_actual_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[grid_region_actual_data]  WITH CHECK ADD  CONSTRAINT [grid_region_actual_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[grid_region] ([resource_id])
GO
ALTER TABLE [JAPAN].[grid_region_actual_data] CHECK CONSTRAINT [grid_region_actual_data_grid_resource_id_fk]
GO
ALTER TABLE [JAPAN].[grid_region_forecast_data]  WITH CHECK ADD  CONSTRAINT [grid_region_forecast_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[grid_region_forecast_data] CHECK CONSTRAINT [grid_region_forecast_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[grid_region_forecast_data]  WITH CHECK ADD  CONSTRAINT [grid_region_forecast_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[grid_region_forecast_data] CHECK CONSTRAINT [grid_region_forecast_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[grid_region_forecast_data]  WITH CHECK ADD  CONSTRAINT [grid_region_forecast_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[grid_region] ([resource_id])
GO
ALTER TABLE [JAPAN].[grid_region_forecast_data] CHECK CONSTRAINT [grid_region_forecast_data_grid_resource_id_fk]
GO


ALTER TABLE [JAPAN].[ds_grid_region_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_grid_region_forecast_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[ds_grid_region_forecast_data] CHECK CONSTRAINT [ds_grid_region_forecast_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[ds_grid_region_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_grid_region_forecast_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[ds_grid_region_forecast_data] CHECK CONSTRAINT [ds_grid_region_forecast_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[ds_grid_region_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_grid_region_forecast_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[grid_region] ([resource_id])
GO
ALTER TABLE [JAPAN].[ds_grid_region_forecast_data] CHECK CONSTRAINT [ds_grid_region_forecast_data_grid_resource_id_fk]
GO
ALTER TABLE [JAPAN].[natural_gas_actual_data]  WITH CHECK ADD  CONSTRAINT [natural_gas_actual_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[natural_gas_actual_data] CHECK CONSTRAINT [natural_gas_actual_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[natural_gas_actual_data]  WITH CHECK ADD  CONSTRAINT [natural_gas_actual_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[natural_gas_actual_data] CHECK CONSTRAINT [natural_gas_actual_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[natural_gas_actual_data]  WITH CHECK ADD  CONSTRAINT [natural_gas_actual_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[natural_gas_hub] ([resource_id])
GO
ALTER TABLE [JAPAN].[natural_gas_actual_data] CHECK CONSTRAINT [natural_gas_actual_data_grid_resource_id_fk]
GO
ALTER TABLE [JAPAN].[natural_gas_extraction]  WITH CHECK ADD  CONSTRAINT [natural_gas_extraction_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[natural_gas_extraction] CHECK CONSTRAINT [natural_gas_extraction_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[natural_gas_forecast_data]  WITH CHECK ADD  CONSTRAINT [natural_gas_forecast_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[natural_gas_forecast_data] CHECK CONSTRAINT [natural_gas_forecast_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[natural_gas_forecast_data]  WITH CHECK ADD  CONSTRAINT [natural_gas_forecast_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[natural_gas_forecast_data] CHECK CONSTRAINT [natural_gas_forecast_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[natural_gas_forecast_data]  WITH CHECK ADD  CONSTRAINT [natural_gas_forecast_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[natural_gas_hub] ([resource_id])
GO
ALTER TABLE [JAPAN].[natural_gas_forecast_data] CHECK CONSTRAINT [natural_gas_forecast_data_grid_resource_id_fk]
GO
ALTER TABLE [JAPAN].[region_node]  WITH CHECK ADD  CONSTRAINT [FK_region_node_grid_region] FOREIGN KEY([region_id])
REFERENCES [JAPAN].[grid_region] ([resource_id])
GO
ALTER TABLE [JAPAN].[region_node] CHECK CONSTRAINT [FK_region_node_grid_region]
GO
ALTER TABLE [JAPAN].[region_node_actual_data]  WITH CHECK ADD  CONSTRAINT [region_node_actual_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[region_node_actual_data] CHECK CONSTRAINT [region_node_actual_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[region_node_actual_data]  WITH CHECK ADD  CONSTRAINT [region_node_actual_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[region_node_actual_data] CHECK CONSTRAINT [region_node_actual_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[region_node_actual_data]  WITH CHECK ADD  CONSTRAINT [region_node_actual_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[region_node] ([resource_id])
GO
ALTER TABLE [JAPAN].[region_node_actual_data] CHECK CONSTRAINT [region_node_actual_data_grid_resource_id_fk]
GO
ALTER TABLE [JAPAN].[region_node_extraction]  WITH CHECK ADD  CONSTRAINT [region_node_extraction_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[region_node_extraction] CHECK CONSTRAINT [region_node_extraction_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[region_node_extraction]  WITH CHECK ADD  CONSTRAINT [region_node_extraction_region_node_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[region_node] ([resource_id])
GO
ALTER TABLE [JAPAN].[region_node_extraction] CHECK CONSTRAINT [region_node_extraction_region_node_resource_id_fk]
GO
ALTER TABLE [JAPAN].[region_node_forecast_data]  WITH CHECK ADD  CONSTRAINT [region_node_forecast_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[region_node_forecast_data] CHECK CONSTRAINT [region_node_forecast_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[region_node_forecast_data]  WITH CHECK ADD  CONSTRAINT [region_node_forecast_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[region_node_forecast_data] CHECK CONSTRAINT [region_node_forecast_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[region_node_forecast_data]  WITH CHECK ADD  CONSTRAINT [region_node_forecast_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[region_node] ([resource_id])
GO
ALTER TABLE [JAPAN].[region_node_forecast_data] CHECK CONSTRAINT [region_node_forecast_data_grid_resource_id_fk]
GO


ALTER TABLE [JAPAN].[ds_region_node_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_region_node_forecast_data_data_feature_feature_id_fk] FOREIGN KEY([feature_id])
REFERENCES [JAPAN].[data_feature] ([feature_id])
GO
ALTER TABLE [JAPAN].[ds_region_node_forecast_data] CHECK CONSTRAINT [ds_region_node_forecast_data_data_feature_feature_id_fk]
GO
ALTER TABLE [JAPAN].[ds_region_node_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_region_node_forecast_data_data_source_data_source_id_fk] FOREIGN KEY([data_source_id])
REFERENCES [JAPAN].[data_source] ([data_source_id])
GO
ALTER TABLE [JAPAN].[ds_region_node_forecast_data] CHECK CONSTRAINT [ds_region_node_forecast_data_data_source_data_source_id_fk]
GO
ALTER TABLE [JAPAN].[ds_region_node_forecast_data]  WITH CHECK ADD  CONSTRAINT [ds_region_node_forecast_data_grid_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[region_node] ([resource_id])
GO
ALTER TABLE [JAPAN].[ds_region_node_forecast_data] CHECK CONSTRAINT [ds_region_node_forecast_data_grid_resource_id_fk]
GO


ALTER TABLE [JAPAN].[region_node_natural_gas_supplier]  WITH CHECK ADD  CONSTRAINT [region_node_natural_gas_supplier_natural_gas_hub_resource_id_fk] FOREIGN KEY([natural_gas_hub_id])
REFERENCES [JAPAN].[natural_gas_hub] ([resource_id])
GO
ALTER TABLE [JAPAN].[region_node_natural_gas_supplier] CHECK CONSTRAINT [region_node_natural_gas_supplier_natural_gas_hub_resource_id_fk]
GO
ALTER TABLE [JAPAN].[region_node_natural_gas_supplier]  WITH CHECK ADD  CONSTRAINT [region_node_natural_gas_supplier_region_node_resource_id_fk] FOREIGN KEY([region_node_id])
REFERENCES [JAPAN].[region_node] ([resource_id])
GO
ALTER TABLE [JAPAN].[region_node_natural_gas_supplier] CHECK CONSTRAINT [region_node_natural_gas_supplier_region_node_resource_id_fk]
GO

GO

ALTER TABLE [JAPAN].[region_node]  WITH CHECK ADD  CONSTRAINT [grid_nodes_node_type_check] CHECK  (([node_type]>=(0)))
GO
ALTER TABLE [JAPAN].[region_node] CHECK CONSTRAINT [grid_nodes_node_type_check]
GO

ALTER TABLE [JAPAN].[grid_transmission]  WITH CHECK ADD CONSTRAINT [FK_grid_transmission_grid] FOREIGN KEY([grid_id])
REFERENCES [JAPAN].[grid] ([resource_id])
GO
ALTER TABLE [JAPAN].[grid_transmission] CHECK CONSTRAINT [FK_grid_transmission_grid]
GO
ALTER TABLE [JAPAN].[grid_transmission_actual_data]  WITH CHECK ADD CONSTRAINT [grid_transmission_actual_data_grid_transmission_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[grid_transmission] ([resource_id])
GO
ALTER TABLE [JAPAN].[grid_transmission_forecast_data]  WITH CHECK ADD CONSTRAINT [grid_transmission_forecast_data_grid_transmission_resource_id_fk] FOREIGN KEY([resource_id])
REFERENCES [JAPAN].[grid_transmission] ([resource_id])


---------------INSERT grid and grid_region table--------------------------------------

INSERT INTO japan.grid(resource_id, resource_name, time_zone)
VALUES ('d4dc70cd-8b07-431f-956d-66120577088a', 'JAPAN', 'Asia/Tokyo');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'771814fe-2d3b-4863-9a82-3dcb3ef43faa', N'CHUBU', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'43cb6bbe-7600-4ad9-a236-f1400bbed1ef', N'CHOGOKU', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'914edc4f-8568-4e21-a392-2c98b8299e6b', N'HOKKAIDO', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'97b92970-efd4-4e3d-99f3-bd24e115cb75', N'TOHOKU', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'3e772823-8489-4bcf-9b40-c7c4a03aa972', N'HOKURIKU', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'd5d41c4b-03d3-49ba-8cc1-3de7f83a5b13', N'KANSAI', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'8441c39d-f7c6-4bd7-8aa2-671f77f9d809', N'OKINAWA', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'7470f69b-817f-4b52-811f-7dfa39249f18', N'SHIKOKU', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'e34dc32b-f1f5-4b9f-a479-8f829e1d1e35', N'KANTO', N'd4dc70cd-8b07-431f-956d-66120577088a');
INSERT INTO japan.grid_region (resource_id, resource_name, grid_id)
VALUES (N'dbcad8cb-6f67-4449-b938-8eb7d55297fa', N'KYUSHU', N'd4dc70cd-8b07-431f-956d-66120577088a');


----------------------INSERT data_source table----------------------------------

INSERT INTO japan.data_source (data_source_id, data_source_name)
VALUES (N'd4dc70cd-8b07-431f-956d-66120577088a', N'JAPAN');

---------------------INSERT data_feature table---------------------------------

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'0301AE70-4BC3-4230-9697-2D6F7A3B2C89', N'REAL_LOCATIONAL_MARGIN_PRICE', N'$/MWh', 5,
        N'Real Time Locational Marginal Price');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'CFE533B8-28A1-40AD-9C0A-30B0E4F8AC3B', N'REAL_TIME_DEMAND', N'MW', 5, N'Real Time Demand');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'692A31A1-9DBB-45C7-BB2D-33AC5BD6C32A', N'DEMAND', N'MW', 60, N'Demand');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'166E5304-6948-4CBD-AFA5-85748E0810B4', N'REAL_TIME_FREQUENCY_RESPONSE_CAPABILITY', N'MW', 1,
        N'Physical Responsive Capability (PRC)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'D98F77A2-CB48-4DAB-B356-9636A67366F7', N'DAY_AHEAD_DEMAND', N'MW', 60, N'Day Ahead Demand');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'55f5a083-94a8-4f13-801d-6e1e68da5fb4', N'NUCLEAR_GENERATION', N'MW', 60, N'Nuclear Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'579cde48-a7b4-426f-9854-f76282dc46be', N'THERMAL_GENERATION', N'MW', 60, N'Thermal Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8e9b7916-c27f-42e6-a988-63aafa005a41', N'THERMAL_GENERATION_GAS', N'MW', 60, N'Thermal Generation Gas');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'de5c019f-cb78-49d4-8da4-9e4c0b5b9aa3', N'THERMAL_GENERATION_COAL', N'MW', 60, N'Thermal Generation Coal');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'3406cd9f-bec1-44e9-986f-25f77b0bc781', N'THERMAL_GENERATION_OIL', N'MW', 60, N'Thermal Generation Oil');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'4c9fd5fb-cb7f-4379-a234-c12afebd1982', N'THERMAL_GENERATION_OTHERS', N'MW', 60, N'Thermal Generation Others');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'a93aeb69-030a-444a-ad3e-6280fc5c2833', N'HYDRO_GENERATION', N'MW', 60, N'Hydro Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ca46815c-b978-4bf4-aad0-a60afc71b510', N'GEOTHERMAL_GENERATION', N'MW', 60, N'Geothermal Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'543b8d36-32ab-4871-8a63-dddf20d444d3', N'BIOMASS_GENERATION', N'MW', 60, N'Biomass Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'f6e77555-2587-42c6-91ee-fa3f662e7d9f', N'SOLAR_GENERATION', N'MW', 60, N'Solar Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'2b449445-541f-41f0-9396-067990c11843', N'SOLAR_CURTAILMENT', N'MW', 60, N'Solar Curtailment');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'5bf7db57-1f25-4429-b3de-25867288f29c', N'WIND_GENERATION', N'MW', 60, N'Wind Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'67622249-f6ab-414b-9037-b5f8b5e39ecc', N'WIND_CURTAILMENT', N'MW', 60, N'Wind Curtailment');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'74801acb-a2ae-4535-80e9-ec96dc3b1cb5', N'PUMPED_STORAGE', N'MW', 60, N'Pumped Storage Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1a216f84-a2f4-4a02-8188-8ad3241a3416', N'BATTERY_STORAGE', N'MW', 60, N'Battery Storage Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'f8db2ffb-adc6-44ca-8e07-fe904d82cf2f', N'OTHERS_GENERATION', N'MW', 60, N'Others Generation');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8392a77d-79e8-4f64-aa31-da33b7fab8d1', N'CONNECTION_WIRE', N'MW', 60, N'Connection Wire');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'308b5aa6-ed47-4fe0-a9c2-07f63bede512', N'TOTAL_GENERATION', N'MW', 60, N'Total Generation');

-- Insert statements for each measurement
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8453d8d6-e3b7-442c-b9e2-60cc13195e11', N'RECRUITMENT_AMOUNT', N'MW', 180, N'Recruitment amount (by TSO)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'562a6cde-abfc-461f-b372-b567ef05d2b6', N'AVERAGE_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'Average winning bid (by TSO)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'75357d67-6f8a-45ad-b6d2-04b8e17fd537', N'AVERAGE_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'Average winning bid (by power source)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'9469a02d-98f0-496b-9dfc-43f3cf1b719c', N'NUMBER_OF_BIDS_BY_POWER_SOURCE', N'cases', 180, N'Number of bids (by power source)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'15a5c057-9646-4350-9f32-6133956b82ad', N'TOTAL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'Total bid amount (by power source)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'aa0e2764-96fa-4222-a369-b8348b94e1cb', N'MINIUM_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'Minimum winning bid (by TSO)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'2e396668-6b5a-47bf-977f-12b838aa7349', N'MINIUM_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'Minimum winning bid (by power source)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'594c96dc-53e7-45d7-9b4e-649dd20892d2', N'HIGHEST_BID_PRICE_BY_TSO', N'yen/kW - 30min', 180, N'Highest bid price (by TSO)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'834b058e-5918-4cef-a33d-4dae4516e814', N'HIGHEST_BID_PRICE_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'Highest bid price (by power source)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'f4d80aef-8927-4a7d-b43c-7eb04248e824', N'NUMBER_OF_SUCCESSFUL_BIDS_BY_POWER_SOURCE', N'cases', 180, N'Number of successful bids (by power source)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'93cdb101-db3d-40a7-97b2-29c80fb01786', 'TOTAL_SUCCESSFUL_BID_AMOUNT_BY_TSO', 'MW', 180, N'Total successful bid amount (by TSO)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'a29e8dc5-98da-475b-886d-7134b0613064', 'TOTAL_SUCCESSFUL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'Total successful bid amount (by power source)');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'915e1c91-5d02-46f7-adb7-33dbca6fe424', 'AMOUNT_SUCCESSFUL_BIDS', N'MW', 180, N'(Breakdown) Amount of successful bids from your area');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'9d8d71d4-53b4-40b3-b610-c442128d09e2', N'SUPPLY_CAPACITY', N'MW', 60, N'Supply Capacity');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'6e58c7d6-4302-4218-9473-6e4fbd0ab9ba', N'RESERVE', N'MW', 60, N'Reserve');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'aae73840-5eac-4881-bbb7-6f848d80d1c4', N'RESERVE_MARGIN_RATE', N'%', 60, N'Reserve Margin Rate');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'786349a8-2582-444a-880b-4522497ee611', N'USAGE_RATE', N'%', 60, N'Usage Rate');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'9fbf04e8-ef44-4dd8-b8cd-40955da90ac7', N'OUTAGE_AMOUNT', 'MW', 60, 'Outage Amount')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'0d57901c-bf8f-49c1-a989-534528a396b0', N'PRECIPITATION_TOTAL', 'mm', 60, 'Precipitation total')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'b9d6da9a-77e0-4ea8-b0d1-42da8b56988b', N'SNOW_DEPTH', 'mm', 60, 'Snow Depth')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'658eee32-1894-49ca-9950-b3cfcc406000', N'SEA_LEVEL_AIR_PRESSURE', 'hPa', 60, 'Sea Level Air Pressure')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'a1107b30-f5f6-41b2-b6c2-6c0a93d7e2cb', N'SUNSHINE_TOTAL', 'mins', 60, 'Sunshine Total')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'B7CD6F46-493D-4608-BE1D-867827693D70', N'TEMPERATURE', 'C', 60, 'Temperature Total')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1D479951-B1A3-4969-BCE7-C21B4CF77A66', N'DEW_POINT', 'C', 60, 'Dew Point')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'C71CBAB7-411D-4F65-835E-2F089308DD08', N'HUMIDITY', '%', 60, 'Humidity Point')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'80329264-F5A8-46C2-8EB5-55BC68C4731D', N'WIND_SPEED', 'kph', 60, 'Wind Speed')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'9B78380A-E131-41BB-A80C-A649FFCBDC5A', N'WIND_DIRECTION', 'degrees', 60, 'Wind Direction')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'A7CF9A02-2F89-43C9-838F-C754CE00418F', N'WIND_GUST', 'kph', 60, 'Wind Gust')

-- Insert features market
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1cea2931-cd92-4a76-905f-f75709880133', N'RR_FIT_RECRUITMENT_AMOUNT', N'MW', 180, N'RR_FIT Recruitment amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ae29a0e4-8c59-48b7-842a-774c5a0e6627', N'RR_FIT_AVERAGE_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'RR_FIT Average winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ffba80bd-1b3e-4af3-b7fb-6d786beadee9', N'RR_FIT_AVERAGE_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'RR_FIT Average winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'a52ebc46-6fb4-4eac-9330-b1220b80a5ba', N'RR_FIT_HIGHEST_BID_PRICE_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'RR_FIT Highest bid price (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'6a178e4c-bba5-4f18-98a1-c6b70f0eb65f', N'RR_FIT_HIGHEST_BID_PRICE_BY_TSO', N'yen/kW - 30min', 180, N'RR_FIT Highest bid price (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'f3161803-f710-4365-9d29-3f9e9fe2956d', N'RR_FIT_MINIUM_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'RR_FIT Minimum winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'223080d9-9cfe-4901-b62c-5f0b50703a3b', N'RR_FIT_MINIUM_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'RR_FIT Minimum winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'a5562ce3-b2f4-41cf-955b-e65cbfabdbfd', N'RR_FIT_NUMBER_OF_BIDS_BY_POWER_SOURCE', N'cases', 180, N'RR_FIT Number of bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'fdf8066c-1276-4a36-8af9-720aeb0c7a08', N'RR_FIT_NUMBER_OF_SUCCESSFUL_BIDS_BY_POWER_SOURCE', N'cases', 180, N'RR_FIT Number of successful bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'19815bec-f4ae-4242-b85a-d10dcd08006e', N'RR_FIT_TOTAL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'RR_FIT Total bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'b7848c77-eb20-4a8f-863c-b4134a5ca467', N'RR_FIT_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'RR_FIT Total successful bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'90016b9f-4bfa-4a01-9d0f-ef0e8d516938', N'RR_FIT_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_TSO', 'MW', 180, N'RR_FIT Total successful bid amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'edcd80b0-2445-4549-ac52-e023163f79bd', N'RR_FIT_AMOUNT_SUCCESSFUL_BIDS', N'MW', 180, N'RR_FIT (Breakdown) Amount of successful bids from your area');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'59bd0b37-ae14-4926-b051-b00659f81c85', N'RR_RECRUITMENT_AMOUNT', N'MW', 180, N'RR Recruitment amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'bfafc72a-7264-4085-94be-bcd6f5f02b59', N'RR_AVERAGE_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'RR Average winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'43623371-a9c7-4fa8-b0f2-d45686ef3a9c', N'RR_AVERAGE_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'RR Average winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'c51ade47-8a0d-4bec-a18e-f04fb914040c', N'RR_HIGHEST_BID_PRICE_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'RR Highest bid price (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'd0de5d11-bbf8-46f8-aa3b-dd5d63b7d71b', N'RR_HIGHEST_BID_PRICE_BY_TSO', N'yen/kW - 30min', 180, N'RR Highest bid price (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'b6d061af-e719-46fa-9234-410d02d163d1', N'RR_MINIUM_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'RR Minimum winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'b1438fbe-dac0-4f78-abba-190679f9643b', N'RR_MINIUM_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'RR Minimum winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'db0c9167-8da4-49a1-9892-ff28f5d49615', N'RR_NUMBER_OF_BIDS_BY_POWER_SOURCE', N'cases', 180, N'RR Number of bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'f1d3f879-32fc-45e9-b83a-e480b9445bfe', N'RR_NUMBER_OF_SUCCESSFUL_BIDS_BY_POWER_SOURCE', N'cases', 180, N'RR Number of successful bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'deec5b77-856c-448e-b156-0f59a155e12f', N'RR_TOTAL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'RR Total bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ea409dc1-2397-46ee-94fe-ff5da55f6bb4', N'RR_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'RR Total successful bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8cbb66b3-5d43-42d2-bec2-b04b9b23ad69', N'RR_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_TSO', 'MW', 180, N'RR Total successful bid amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'692d3c06-98d2-4547-8c82-d83f471c1acc', N'RR_AMOUNT_SUCCESSFUL_BIDS', N'MW', 180, N'RR (Breakdown) Amount of successful bids from your area');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'4b847e9d-ae4a-4acb-a522-236a8494fefc', N'S_FRR_RECRUITMENT_AMOUNT', N'MW', 180, N'S_FRR Recruitment amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'cbd0129b-d887-48f7-bc83-68766ac79ab3', N'S_FRR_AVERAGE_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'S_FRR Average winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'3b327a23-2fe1-44a2-bf46-e014291e6d46', N'S_FRR_AVERAGE_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'S_FRR Average winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8335c91a-4efb-424f-bf6d-011628005908', N'S_FRR_HIGHEST_BID_PRICE_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'S_FRR Highest bid price (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'40dbc40f-c489-48d4-bc67-9ba2642782fb', N'S_FRR_HIGHEST_BID_PRICE_BY_TSO', N'yen/kW - 30min', 180, N'S_FRR Highest bid price (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'4e299ee6-7a72-4fe0-b74e-314f7e27e5d3', N'S_FRR_MINIUM_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'S_FRR Minimum winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'bc49fb52-34c4-43df-9c1d-70dcd2ac7b65', N'S_FRR_MINIUM_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'S_FRR Minimum winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'50ec67d7-4243-421b-aff3-bc0045f592cb', N'S_FRR_NUMBER_OF_BIDS_BY_POWER_SOURCE', N'cases', 180, N'S_FRR Number of bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'd4776883-f5f0-419e-aa70-41e8ee88301e', N'S_FRR_NUMBER_OF_SUCCESSFUL_BIDS_BY_POWER_SOURCE', N'cases', 180, N'S_FRR Number of successful bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'e0f5aec0-dd36-438b-9b76-ab75ee1cccc8', N'S_FRR_TOTAL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'S_FRR Total bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1a115912-ebd4-4d8b-98f3-1f6636583f0f', N'S_FRR_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'S_FRR Total successful bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'40ac02a2-6dac-49d3-ad8e-8de383e6d593', N'S_FRR_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_TSO', 'MW', 180, N'S_FRR Total successful bid amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'00e2e60b-89f7-4014-abd7-4066d928e36d', N'S_FRR_AMOUNT_SUCCESSFUL_BIDS', N'MW', 180, N'S_FRR (Breakdown) Amount of successful bids from your area');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'902c249f-eaa4-41d3-8a38-9f9e04033507', N'FRR_RECRUITMENT_AMOUNT', N'MW', 180, N'FRR Recruitment amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'6637407f-23b8-46e8-97bb-ce2bd619bdc7', N'FRR_AVERAGE_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FRR Average winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'5f020fd0-ecb4-4a4d-8c8f-988c37bad421', N'FRR_AVERAGE_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'FRR Average winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'9ed23fa6-690f-4148-ae4a-a4e77f1ec804', N'FRR_HIGHEST_BID_PRICE_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FRR Highest bid price (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'36d809a0-8994-468d-8c54-6832316c402b', N'FRR_HIGHEST_BID_PRICE_BY_TSO', N'yen/kW - 30min', 180, N'FRR Highest bid price (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8a0b7f8b-5c7f-4c25-8123-daec34f9c029', N'FRR_MINIUM_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FRR Minimum winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'bed1097e-7aa9-44c3-a46c-03ccdd50b747', N'FRR_MINIUM_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'FRR Minimum winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'97dbd6f2-3c54-4ac2-af70-60167f3fb43e', N'FRR_NUMBER_OF_BIDS_BY_POWER_SOURCE', N'cases', 180, N'FRR Number of bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'c08ac5da-f7a0-437f-87db-a69a6e036489', N'FRR_NUMBER_OF_SUCCESSFUL_BIDS_BY_POWER_SOURCE', N'cases', 180, N'FRR Number of successful bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'93a4f007-1c79-41c3-85a5-ac3afea16d13', N'FRR_TOTAL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'FRR Total bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'9e3eb67f-b9e1-42a4-b30a-fc00be33e2ed', N'FRR_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'FRR Total successful bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'eb3c22d3-0e9d-4bc0-a481-a5caafa8ba0f', N'FRR_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_TSO', 'MW', 180, N'FRR Total successful bid amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'0291f163-2031-4873-a7eb-5459e434c583', N'FRR_AMOUNT_SUCCESSFUL_BIDS', N'MW', 180, N'FRR (Breakdown) Amount of successful bids from your area');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'5d928783-8ad8-4011-adf2-57a0394950d8', N'FCR_RECRUITMENT_AMOUNT', N'MW', 180, N'FCR Recruitment amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'13167c19-d094-451d-8226-27469557cb16', N'FCR_AVERAGE_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FCR Average winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'379d9ec9-0c91-4353-96b6-84f20b6768eb', N'FCR_AVERAGE_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'FCR Average winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'a5c26f1e-4d3b-4f03-a7cb-1dbc4a564740', N'FCR_HIGHEST_BID_PRICE_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FCR Highest bid price (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1d088d2b-b7f6-4845-b8c6-fdce95268141', N'FCR_HIGHEST_BID_PRICE_BY_TSO', N'yen/kW - 30min', 180, N'FCR Highest bid price (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'9b37869e-6747-4a78-9567-2f9de5d3a3c3', N'FCR_MINIUM_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FCR Minimum winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'80383e30-24f8-4701-9a04-a421982c3478', N'FCR_MINIUM_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'FCR Minimum winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'e5c5703d-afcb-4b48-8cba-bfcd605ba748', N'FCR_NUMBER_OF_BIDS_BY_POWER_SOURCE', N'cases', 180, N'FCR Number of bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'7b8d6bde-81e6-45a5-b171-37ab7d4c9771', N'FCR_NUMBER_OF_SUCCESSFUL_BIDS_BY_POWER_SOURCE', N'cases', 180, N'FCR Number of successful bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'c1cbab21-8aa6-4b02-885b-c0290bfb724c', N'FCR_TOTAL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'FCR Total bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'd88c73ad-86f2-4141-9130-8e88deca9e77', N'FCR_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'FCR Total successful bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'60d0d63b-c007-4a3a-a78c-b3d38873a015', N'FCR_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_TSO', 'MW', 180, N'FCR Total successful bid amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'c6ba075c-7c4c-47f9-ac97-d49acba9f91e', N'FCR_AMOUNT_SUCCESSFUL_BIDS', N'MW', 180, N'FCR (Breakdown) Amount of successful bids from your area');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'81e00e3b-1ff6-4dd5-810c-62ce80e8cd06', N'FCR_OFFLINE_RECRUITMENT_AMOUNT', N'MW', 180, N'FCR_OFFLINE Recruitment amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'd9190579-6ab4-4f14-97e3-d7c54a71057d', N'FCR_OFFLINE_AVERAGE_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FCR_OFFLINE Average winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'c3539629-9105-406f-ae62-1590db8d1bcd', N'FCR_OFFLINE_AVERAGE_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'FCR_OFFLINE Average winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'd1661fba-6672-4607-a978-b1e4316f812f', N'FCR_OFFLINE_HIGHEST_BID_PRICE_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FCR_OFFLINE Highest bid price (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'50ee603c-7fc0-43f2-b0b2-87b33ee5e53d', N'FCR_OFFLINE_HIGHEST_BID_PRICE_BY_TSO', N'yen/kW - 30min', 180, N'FCR_OFFLINE Highest bid price (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'5784763d-1a7c-412b-86df-c47beccccbce', N'FCR_OFFLINE_MINIUM_WINNING_BID_BY_POWER_SOURCE', N'yen/kW - 30min', 180, N'FCR_OFFLINE Minimum winning bid (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'295ecd77-1ef8-43c0-be26-0effb938c948', N'FCR_OFFLINE_MINIUM_WINNING_BID_BY_TSO', N'yen/kW - 30min', 180, N'FCR_OFFLINE Minimum winning bid (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'915359dd-8223-43c3-939b-a8a7d49970c3', N'FCR_OFFLINE_NUMBER_OF_BIDS_BY_POWER_SOURCE', N'cases', 180, N'FCR_OFFLINE Number of bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'0c7fa412-d11a-4ec7-99e2-67202e8f4b70', N'FCR_OFFLINE_NUMBER_OF_SUCCESSFUL_BIDS_BY_POWER_SOURCE', N'cases', 180, N'FCR_OFFLINE Number of successful bids (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'42d9c5e0-7583-4b3f-b946-bce464b5a675', N'FCR_OFFLINE_TOTAL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'FCR_OFFLINE Total bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'd1588992-cb79-427f-a525-7deb32be48ca', N'FCR_OFFLINE_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_POWER_SOURCE', N'MW', 180, N'FCR_OFFLINE Total successful bid amount (by power source)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'404ed044-462c-4822-8811-d6175f85ccf7', N'FCR_OFFLINE_TOTAL_SUCCESSFUL_BID_AMOUNT_BY_TSO', 'MW', 180, N'FCR_OFFLINE Total successful bid amount (by TSO)');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'449ab766-1a5e-4f28-9127-9913c176dfc9', N'FCR_OFFLINE_AMOUNT_SUCCESSFUL_BIDS', N'MW', 180, N'FCR_OFFLINE (Breakdown) Amount of successful bids from your area');

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'95cc7b52-bb21-418b-b06e-adec1e42840a', N'AREA_PRICE', 'yen/kWh', 30, 'Area Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'e514a3fa-a704-4e6e-b746-7724425832db', N'SYSTEM_PRICE', 'yen/kWh', 30, 'System Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'931fd12b-d865-4fb5-b006-dc395419b351', N'SELLING_BID_VOLUME', 'kWh', 30, 'Selling Bid Volume')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'123b8de9-381a-4a89-b459-cde6ad006f2e', N'BUYING_BID_VOLUME', 'kWh', 30, 'Buying Bid Volume')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'c6843694-b942-415e-81d5-ee60d6e92426', N'TOTAL_CONTRACT_VOLUME', 'kWh', 30, 'Total Contract Volume')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'fce86cc4-6139-420f-9cf5-8ba1668ede1d', N'TOTAL_SELLING_BLOCK_BID_VOLUME', 'kWh', 30, 'Total Selling Block Bid Volume')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'60c2547c-2101-49ac-a76c-d27e4cf9f659', N'TOTAL_SELLING_BLOCK_CONTRACT_VOLUME', 'kWh', 30, 'Total Selling Block Contract Volume')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ec0b8c23-ef37-46e0-b648-0de7219dd4ff', N'TOTAL_BUYING_BLOCK_BID_VOLUME', 'kWh', 30, 'Total Buying Block Bid Volume')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1fcef969-d5b0-42e4-9720-936f41c8c3c1', N'TOTAL_BUYING_BLOCK_CONTRACT_VOLUME', 'kWh', 30, 'Total Buying Block Contract Volume')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1066ae97-3ec7-4001-a8a8-7a7602381a48', N'AVOIDABLE_COST', 'yen/kWh', 30, 'Avoidable Cost')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'd898980f-9f49-4354-a36c-595871cca953', N'FIP_REFERENCE_PRICE', 'yen/kWh', 30, 'FIP Reference Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8659a02f-bd2a-43dc-97ea-48d687f05531', N'AVOIDABLE_COST_NATIONAL_VALUE', 'yen/kWh', 30, 'Avoidable Cost National Value')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ad2a1bee-c228-4ca3-a649-1a964038063f', N'FIP_REFERENCE_PRICE_NATIONAL_VALUE', 'yen/kWh', 30, 'FIP Reference Price National Value')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ecc12fc0-73f7-4306-9110-a5e5c321c1b5', N'SPOT_HOURLY_AVERAGE_PRICE', 'yen/kWh', 30, 'Spot/hourly Average Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'aab3e0d6-a10b-42fd-a611-dab864cd6c77', N'UPPER_LIMIT_SPOT_HOURLY_AVERAGE_PRICE', 'yen/kWh', 30, 'Upper Limit x Spot/hourly Average Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8755c23a-94df-42c4-b2ae-cba62f74be69', N'LOWER_LIMIT_SPOT_HOURLY_AVERAGE_PRICE', 'yen/kWh', 30, 'Lower Limit x Spot/hourly Average Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'0047b940-a746-4042-84bf-dd00fb39c30a', N'PRELIMINARY_VALUE_SPOT_HOURLY_AVERAGE_PRICE', 'yen/kWh', 30, 'Preliminary Value x Spot/hourly Average Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'91378f3c-8938-469f-a2df-b132abae290b', N'CONFIRMED_VALUE_SPOT_HOURLY_AVERAGE_PRICE', 'yen/kWh', 30, 'Confirmed Value x Spot/hourly Average Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'f7d857a8-6f06-444a-b836-4aa0953264b9', N'INTRADAY_MARKET_OPENING_PRICE', 'yen/kWh', 30, 'Intraday Market Opening Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'34a112de-ced8-46e7-b1ed-a3aad5c18647', N'INTRADAY_MARKET_HIGHEST_PRICE', 'yen/kWh', 30, 'Intraday Market Highest Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'2ae9ebba-d117-4935-959f-847466bbd722', N'INTRADAY_MARKET_LOWEST_PRICE', 'yen/kWh', 30, 'Intraday Market Lowest Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'56563ab0-5bc2-435e-9b66-68ef0babd94a', N'INTRADAY_MARKET_LAST_PRICE', 'yen/kWh', 30, 'Intraday Market Last Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'321e1228-e1f1-4072-8859-0c11c2063c85', N'INTRADAY_MARKET_AVERAGE_PRICE', 'yen/kWh', 30, 'Intraday Market Average Price')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'394123b9-5788-430d-a7fb-560f2652a16b', N'INTRADAY_MARKET_TOTAL_VOLUME', 'kWh', 30, 'Intraday Market Total Volume')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'0996a585-e2c7-4799-af2f-a4c67436d104', N'WIDE_AREA_BLOCK_DEMAND_30M', 'MW', 30, 'Wide Area Block Demand 30 Minute')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'26f82ea1-e63b-4985-b68b-2babbed00525', N'WIDE_AREA_BLOCK_SUPPLY_CAPACITY_30M', 'MW', 30, 'Wide Area Block Supply Capacity 30 Minute')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'3fe29dd4-e2b5-400a-8cb6-501018922fa4', N'WIDE_AREA_BLOCK_RESERVE_CAPACITY_30M', 'MW', 30, 'Wide Area Block Reserve Capacity 30 Minute')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'9bf857fa-3b1e-4bec-a7fd-9828ca8c3f8b', N'WIDE_AREA_RESERVE_RATE_30M', '%', 30, 'Wide Area Reserve Rate 30 Minute')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'3289772e-c098-4818-a049-4565d20fb6d9', N'WIDE_AREA_UTILIZATION_RATE_30M', '%', 30, 'Wide Area Utilization Rate 30 Minute')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'7e78da8a-d92b-4a86-b040-9ea207326b96', N'AREA_SUPPLY_CAPACITY_30M', 'MW', 30, 'Area Supply Capacity 30 Minute')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'58ae3dbe-f450-4528-9241-6312bfb5adab', N'AREA_RESERVE_CAPACITY_30M', 'MW', 30, 'Area Reserve Capacity 30 Minute')

--insert power generation 30 minute feature
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'7f023a92-19a2-4732-bd28-caf5697faf2d', N'DEMAND_30M', N'MW', 30, N'Demand 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'698ed14f-ae79-4370-aed8-7b48aee822a8', N'NUCLEAR_GENERATION_30M', N'MW', 30, N'Nuclear Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ab8237da-838f-4db4-b042-ed6c7bc5ba11', N'THERMAL_GENERATION_30M', N'MW', 30, N'Thermal Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'07b7e6d1-9050-4d36-8517-f819f92df6f3', N'THERMAL_GENERATION_GAS_30M', N'MW', 30, N'Thermal Generation Gas 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1f5a7c1f-99fb-4c84-8e3b-f3a076188233', N'THERMAL_GENERATION_COAL_30M', N'MW', 30, N'Thermal Generation Coal 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'477cf1ba-4dec-45c7-8e0b-c8f98e93fcc0', N'THERMAL_GENERATION_OIL_30M', N'MW', 30, N'Thermal Generation Oil 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'f2929e9a-2799-488b-ac15-202ebb81654f', N'THERMAL_GENERATION_OTHERS_30M', N'MW', 30, N'Thermal Generation Others 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'5ef2d749-112f-4132-8406-d53f81c9ff62', N'HYDRO_GENERATION_30M', N'MW', 30, N'Hydro Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'48f1a410-bdbf-4fda-8025-7a2d43f45d6c', N'GEOTHERMAL_GENERATION_30M', N'MW', 30, N'Geothermal Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'2cc78154-1075-4e4a-be48-0c82b728d036', N'BIOMASS_GENERATION_30M', N'MW', 30, N'Biomass Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'6b5b73f2-717f-49db-8e10-238c679f640c', N'SOLAR_GENERATION_30M', N'MW', 30, N'Solar Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'e7b9c48b-97be-4bd3-93f1-2dc1332d5aea', N'SOLAR_CURTAILMENT_30M', N'MW', 30, N'Solar Curtailment 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'a0f460e1-7648-4e60-a236-61e293342999', N'WIND_GENERATION_30M', N'MW', 30, N'Wind Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'0d3531f1-9550-4cf1-9731-9b0c1112f9f7', N'WIND_CURTAILMENT_30M', N'MW', 30, N'Wind Curtailment 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'38b1b591-06b2-4594-ab82-6c7b50bfa17e', N'PUMPED_STORAGE_30M', N'MW', 30, N'Pumped Storage Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'2201f4fe-6bb2-4bb8-ac66-d2d2ca0a781a', N'BATTERY_STORAGE_30M', N'MW', 30, N'Battery Storage Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'a9b802d8-ebfe-4fe6-8096-bab2ca241bf7', N'OTHERS_GENERATION_30M', N'MW', 30, N'Others Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'7baca4df-55ec-4f01-8d79-a976e39508fe', N'CONNECTION_WIRE_30M', N'MW', 30, N'Connection Wire 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'001bf47d-b9ed-4552-af55-a38b43a042e0', N'TOTAL_GENERATION_30M', N'MW', 30, N'Total Generation 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'eb386316-6d57-4f2d-81e9-9ba2bc6ccc53', N'SG_REFINED_OIL', 'USD', 1440, 'Source: Enverus, #SGXNJF, SGX - Refined Oil  - Refined Oil - Platts Naphtha CFR Japan Index Futures - Forward Curve - Monthly (Front Month)')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'd5860f3d-7bac-4fba-9e11-1e0e06229b87', N'JPYUSD', 'JPY/USD', 1440, 'Source: Enverus, #fxJPYUSDBOJ, Japanese Yen vs. United States Dollar (Tokyo-Mitsubishi UFJ Bank)')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'705ba1b4-bef2-4ed0-8fa6-7dbbc44d1fa8', N'SG_GAS_OIL', 'USD', 1440, 'Source: Enverus, /xSG, NYMEX Singapore Gasoil (Platts) Futures Clearport (Front Month)')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1d4503a6-b35b-4733-b6df-8aff676fe78a', N'JCC', 'USD', 1440, 'Source: Enverus, /GJCC, NYMEX Japan Crude Cocktail (Detailed) Futures Electronic (Front Month)')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'f5c23c0d-8b2c-40a1-b106-f4acaa12a975', N'JKM', 'USD', 1440, 'Source: Enverus, /GJKM, NYMEX LNG Japan/Korea Marker (Platts) Futures Electronic (Front Month)')

--insert weather 30 minute feature
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'76f31735-3173-4655-9225-b0f12f9c98e0', N'TEMPERATURE_30M', N'C', 30, N'Temperature 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'e4a3315d-4d98-4446-9fbf-554030bbed47', N'DEW_POINT_30M', N'C', 30, N'Dew Point 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'8bfa5f1b-44c2-4149-bf56-948c3f92b3ad', N'HUMIDITY_30M', N'%', 30, N'Humidity 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'7dc69c7c-3210-4aa2-a8b7-9a0c3c087089', N'PRECIPITATION_TOTAL_30M', N'mm', 30, N'Precipitation total 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'13cf9256-4885-4a6d-a62e-c78e084ca94e', N'SNOW_DEPTH_30M', N'mm', 30, N'Snow Depth 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'ae122f14-04d9-47f1-8023-eaa3dc9b2673', N'WIND_DIRECTION_30M', N'degrees', 30, N'Wind Direction 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'b062b24e-1f6d-4a5f-a2cb-95c88bb53d6c', N'WIND_SPEED_30M', N'kph', 30, N'Wind Speed 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1ad2640b-b16b-49a5-8a94-e3fc6f489b32', N'WIND_GUST_30M', N'kph', 30, N'Wind Gust 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'fbabf248-b4d6-4dc1-832a-91539ad6cfe9', N'SEA_LEVEL_AIR_PRESSURE_30M', N'hPa', 30, N'Sea Level Air Pressure 30 Minute');
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1d1d64b3-9f95-44af-b24f-9d2d6e35493b', N'SUNSHINE_TOTAL_30M', N'mins', 30, N'Sunshine Total 30 Minute');
--interconnection feature
INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'006c408e-3229-4746-9e2d-e010dd59669f', N'DAILY_UPPER_LIMIT_OF_FORWARD_INTERCONNECTION_LINE_CAPACITY', 'MW', 180, 'Daily Upper Limit Of Forward Interconnection Line Capacity')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'346a4779-75ee-4323-96ce-0900bcc717df', N'DAILY_UPPER_LIMIT_OF_REVERSE_INTERCONNECTION_LINE_CAPACITY', 'MW', 180, 'Daily Upper Limit Of Reverse Interconnection Line Capacity')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'6c92c5f2-1dff-4da6-9409-13b81497d79a', N'DAILY_AMOUNT_OF_TERTIARY_FORWARD_INTERCONNECTION_LINE_CAPACITY_SECURED', 'MW', 180, 'Daily Amount Of Tertiary Forward Interconnection Line Capacity Secured')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'7655990d-3f02-4919-be15-959fdfb98657', N'DAILY_AMOUNT_OF_TERTIARY_REVERSE_INTERCONNECTION_LINE_CAPACITY_SECURED', 'MW', 180, 'Daily Amount Of Tertiary Reverse Interconnection Line Capacity Secured')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'635e3b8a-0d07-40ac-b02b-db2d120f78b4', N'WEEKLY_UPPER_LIMIT_OF_FORWARD_INTERCONNECTION_LINE_CAPACITY', 'MW', 180, 'Weekly Upper Limit Of Forward Interconnection Line Capacity')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'150f6db3-7aed-4a11-b169-f23851106bbe', N'WEEKLY_UPPER_LIMIT_OF_REVERSE_INTERCONNECTION_LINE_CAPACITY', 'MW', 180, 'Weekly Upper Limit Of Reverse Interconnection Line Capacity')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'23a1d601-62c8-446d-bf4a-4353d9048f0b', N'WEEKLY_AMOUNT_OF_TERTIARY_FORWARD_INTERCONNECTION_LINE_CAPACITY_SECURED', 'MW', 180, 'Weekly Amount Of Tertiary Forward Interconnection Line Capacity Secured')

INSERT INTO japan.data_feature (feature_id, feature_name, unit, sampling_interval_minute, description)
VALUES (N'1f7b64f4-f957-4007-b9da-e435ead4e845', N'WEEKLY_AMOUNT_OF_TERTIARY_REVERSE_INTERCONNECTION_LINE_CAPACITY_SECURED', 'MW', 180, 'Weekly Amount Of Tertiary Reverse Interconnection Line Capacity Secured')


------------------------INSERT grid_transmission------------------------------------------

INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'25a1dbe4-e581-4d05-8a85-1768ebb5c71a', N'HOKKAIDO_TO_TOHOKU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'HOKKAIDO', N'TOHOKU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'94f83b25-0d1c-4bd8-9a46-8077b4a403de', N'TOHOKU_TO_KANTO', N'd4dc70cd-8b07-431f-956d-66120577088a', N'TOHOKU', N'KANTO');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'95fe2c4a-f9c3-428a-b2b8-278bbe048609', N'KANTO_TO_CHUBU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'KANTO', N'CHUBU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'c2866c87-47fe-44f1-a3f3-8aac4957617a', N'CHUBU_TO_KANSAI', N'd4dc70cd-8b07-431f-956d-66120577088a', N'CHUBU', N'KANSAI');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'4fc70ccb-40b8-4ff0-aabb-5c8e99414598', N'CHUBU_TO_HOKURIKU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'CHUBU', N'HOKURIKU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'baa9a102-1e03-4afd-b1ff-a7a227da1df1', N'HOKURIKU_TO_KANSAI', N'd4dc70cd-8b07-431f-956d-66120577088a', N'HOKURIKU', N'KANSAI');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'b8bdea6e-76bb-46e3-9ed9-4ddabd7ed8db', N'KANSAI_KANSAI_CHUGOKU_EAST_TO_CHUGOKU_KANSAI_CHUGOKU_EAST', N'd4dc70cd-8b07-431f-956d-66120577088a', N'KANSAI_KANSAI_CHUGOKU_EAST', N'CHUGOKU_KANSAI_CHUGOKU_EAST');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'18fee443-8b25-4fc8-aa32-05dc316dae64', N'KANSAI_KANSAI_CHUGOKU_WEST_TO_CHUGOKU_KANSAI_CHUGOKU_WEST', N'd4dc70cd-8b07-431f-956d-66120577088a', N'KANSAI_KANSAI_CHUGOKU_WEST', N'CHUGOKU_KANSAI_CHUGOKU_WEST');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'5a95f775-d1de-4e3e-899e-558f7e1906f4', N'KANSAI_TO_SHIKOKU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'KANSAI', N'SHIKOKU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'7b3e0090-297e-42ed-9bf1-d4c27e43f333', N'CHUGOKU_TO_SHIKOKU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'CHUGOKU', N'SHIKOKU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'f4fb31d3-9e39-4678-bc31-32903287c388', N'CHUGOKU_TO_KYUSHU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'CHUGOKU', N'KYUSHU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'ef74b20f-8db7-4735-8a73-6a2b20da0284', N'TOHOKU_TO_HOKKAIDO', N'd4dc70cd-8b07-431f-956d-66120577088a', N'TOHOKU', N'HOKKAIDO');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'7ae11416-2756-434c-b2cc-a871f228514d', N'KANTO_TO_TOHOKU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'KANTO', N'TOHOKU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'd5a5ffa0-32a2-4cc8-a8f2-8ad616ab510e', N'CHUBU_TO_KANTO', N'd4dc70cd-8b07-431f-956d-66120577088a', N'CHUBU', N'KANTO');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'40d3617f-3040-461d-b9f6-9b5531cb1d9d', N'KANSAI_TO_CHUBU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'KANSAI', N'CHUBU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'e519191b-da54-43e7-a37b-404e272686c8', N'HOKURIKU_TO_CHUBU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'HOKURIKU', N'CHUBU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'7e9499d2-55fc-4fd2-8a38-16f2b4d11148', N'KANSAI_TO_HOKURIKU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'KANSAI', N'HOKURIKU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'31b36bca-2237-43d8-85af-93d12865ac1b', N'CHUGOKU_KANSAI_CHUGOKU_EAST_TO_KANSAI_KANSAI_CHUGOKU_EAST', N'd4dc70cd-8b07-431f-956d-66120577088a', N'CHUGOKU_KANSAI_CHUGOKU_EAST', N'KANSAI_KANSAI_CHUGOKU_EAST');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'cc75d4e4-0e58-4978-b271-c718d78d45a3', N'CHUGOKU_KANSAI_CHUGOKU_WEST_TO_KANSAI_KANSAI_CHUGOKU_WEST', N'd4dc70cd-8b07-431f-956d-66120577088a', N'CHUGOKU_KANSAI_CHUGOKU_WEST', N'KANSAI_KANSAI_CHUGOKU_WEST');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'2e0eed77-3b78-4e1a-87d1-eb184676c9aa', N'SHIKOKU_TO_KANSAI', N'd4dc70cd-8b07-431f-956d-66120577088a', N'SHIKOKU', N'KANSAI');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'6857d5a9-87b6-4c7c-89df-9044c90d43e2', N'SHIKOKU_TO_CHUGOKU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'SHIKOKU', N'CHUGOKU');
INSERT INTO japan.grid_transmission (resource_id, resource_name, grid_id, from_region, to_region)
VALUES (N'69dc8179-1b15-46d2-943d-b3693f647070', N'KYUSHU_TO_CHUGOKU', N'd4dc70cd-8b07-431f-956d-66120577088a', N'KYUSHU', N'CHUGOKU');