-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--
-- CityGML Energy ADE 3.0 (beta 7)
--
-- Last update: 2025-10-14
--
-- This DDL script installs the 3DCityDB schema for the Energy ADE. It must be run
-- from within the ADE Manager plugin of the 3DCityDB Importer/Exporter.
--
-- This script was first automatically generated using the 3DCityDB ADE Manager
-- and successively edited and restructured by:
--
-- Dr. Giorgio Agugiaro
-- 3D Geoinformation group
-- Delft University of Technology
-- The Netherlands
--
-- https://3d.bk.tudelft.nl/gagugiaro/
--
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- ***************************** CREATE_ADE_DB.SQL execution START ************************ 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Create Sequences *********************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

CREATE SEQUENCE ng3_ctyobj_relation_seq INCREMENT BY 1 MINVALUE 0 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1 NO CYCLE OWNED BY NONE;
CREATE SEQUENCE ng3_optical_property_seq INCREMENT BY 1 MINVALUE 0 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1 NO CYCLE OWNED BY NONE;
CREATE SEQUENCE ng3_qualified_attribute_seq INCREMENT BY 1 MINVALUE 0 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1 NO CYCLE OWNED BY NONE;
CREATE SEQUENCE ng3_suitability_seq INCREMENT BY 1 MINVALUE 0 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1 NO CYCLE OWNED BY NONE;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Create tables ************************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

-- -------------------------------------------------------------------- 
-- ng3_address_to_building_unit 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_address_to_building_unit (
    address_id       BIGINT NOT NULL,
    building_unit_id BIGINT NOT NULL,
    PRIMARY KEY (address_id, building_unit_id)
);

-- -------------------------------------------------------------------- 
-- ng3_building - extends building table
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_building (
    id                      BIGINT PRIMARY KEY,
    type                    VARCHAR,
    type_codespace          VARCHAR,
    is_protected            NUMERIC,
    constr_weight           VARCHAR,
    constr_weight_codespace VARCHAR,
    attic_thm_status        VARCHAR,
    basement_thm_status     VARCHAR
);

-- -------------------------------------------------------------------- 
-- ng3_building_partition
-- --------------------------------------------------------------------
CREATE TABLE ng3_building_partition (
    id                        BIGINT PRIMARY KEY,
    objectclass_id            INTEGER,
-- Thermal Zone attributes
    heat_capacity             NUMERIC,
    heat_capacity_uom         VARCHAR,
    infiltration_rate         NUMERIC,
    infiltration_rate_uom     VARCHAR,
    is_cooled                 NUMERIC,
    is_heated                 NUMERIC,
    coincides_with_lod2_hull  NUMERIC,
    coincides_with_lod3_hull  NUMERIC,
-- Usage Zone and BuildingUnit attributes
    type                      VARCHAR,
    type_codespace            VARCHAR,
-- Usage Zone attributes
    is_primary                NUMERIC,
    num_of_building_units     INTEGER,
    int_heat_gains            NUMERIC,
    int_heat_gains_uom        VARCHAR,
    int_heat_gains_conv       NUMERIC,
    int_heat_gains_conv_uom   VARCHAR,
    int_heat_gains_lat        NUMERIC,
    int_heat_gains_lat_uom    VARCHAR,
    int_heat_gains_rad        NUMERIC,
    int_heat_gains_rad_uom    VARCHAR,
-- BuildingUnit attributes
    num_of_rooms              INTEGER,
    owner_name                VARCHAR,
    ownership_type            VARCHAR,
    ownership_type_codespace  VARCHAR,
-- Used to store the FK to the schedule(s)
    cooling_schedule_id       BIGINT,
    heating_schedule_id       BIGINT,
    ventilation_schedule_id   BIGINT,
-- Used to store the association from UsageZone to BuildingUnit
    usage_zone_id             BIGINT,
-- Used to store the association from ThermalZone to UsageZone
    thermal_zone_id           BIGINT,
-- Parent id (Building(Part) of a ThermalZone, UsageZone or BuildintUnit
	building_id               BIGINT,
-- FK to the geometries in the surface_geometry table
    lod1_solid_id             BIGINT,
    lod2_solid_id             BIGINT,
    lod3_solid_id             BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_cityobject - extends cityobject table
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_cityobject (
    id                      BIGINT PRIMARY KEY,
    layered_construction_id BIGINT,
    ref_point               geometry(POINTZ)
);

-- -------------------------------------------------------------------- 
-- ng3_ctyobj_relation
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_ctyobj_relation (
    id                      BIGINT PRIMARY KEY DEFAULT nextval('ng3_ctyobj_relation_seq'::regclass),
-- this refers to ng3_cityobject (id), i.e. the source
    ng3_cityobject_id       BIGINT,
-- this refers to cityobject (id), i.e. the target
    cityobject_id           BIGINT,
    relation_type           VARCHAR,
    relation_type_codespace VARCHAR
);

-- -------------------------------------------------------------------- 
-- ng3_device 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_device (
    id                     BIGINT PRIMARY KEY,
    objectclass_id         INTEGER,
-- AbstractDevice attributes (also for LightingDevice, GenericDevice, GenericElectricalDevice)
    model                  VARCHAR,
    num_of_devices         INTEGER,
    year_of_manufacture    INTEGER,
    installed_power        NUMERIC,
    installed_power_uom    VARCHAR,
    nominal_efficiency     NUMERIC,
    nominal_efficiency_uom VARCHAR,
    efficiency_indicator   VARCHAR,
  	heat_diss              NUMERIC,
  	heat_diss_uom          VARCHAR,
  	heat_diss_conv         NUMERIC,
  	heat_diss_conv_uom     VARCHAR,
  	heat_diss_lat          NUMERIC,
  	heat_diss_lat_uom      VARCHAR,
  	heat_diss_rad          NUMERIC,
  	heat_diss_rad_uom      VARCHAR,
-- HeatPump attributes
    heat_source            VARCHAR,
	cop_source_temp        NUMERIC,
	cop_source_temp_uom    VARCHAR,
	cop_operation_temp     NUMERIC,
	cop_operation_temp_uom VARCHAR,
-- Boiler attributes
	has_condensation       NUMERIC,
-- MovableShadingDevice attributes
	type                   VARCHAR,
	type_codespace         VARCHAR,
    installation_side      VARCHAR,
	max_cover_ratio        NUMERIC,
	max_cover_ratio_uom    VARCHAR,
-- FK to table optical_property 
	transmittance_id       BIGINT,
    cityobject_id          BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_device_operation 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_device_operation (
    id                       BIGINT PRIMARY KEY,
    type                     VARCHAR,
    type_codespace           VARCHAR,
    yearly_global_efficiency NUMERIC,
-- FK
    schedule_id              BIGINT,
    device_id                BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_energy_perf_cert 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_energy_perf_cert (
    id                    BIGINT PRIMARY KEY,
    type                  VARCHAR,
    type_codespace        VARCHAR,
    label                 VARCHAR,
    value                 NUMERIC,
    value_uom             VARCHAR,
    issue_date            DATE,
    expiration_date       DATE,
    cert_method           VARCHAR,
    cert_uri              VARCHAR,
-- FK
    building_id           BIGINT,
	building_partition_id BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_layer 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_layer (
    id                      BIGINT PRIMARY KEY,
    thickness               NUMERIC,
    thickness_uom           VARCHAR,
    material_id             BIGINT,
-- FK
    layered_construction_id BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_layered_construction
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_layered_construction (
    id                      BIGINT PRIMARY KEY,
    objectclass_id          INTEGER,
    u_value                 NUMERIC,
    u_value_uom             VARCHAR,
    g_value                 NUMERIC,
    g_value_uom             VARCHAR,
    glazing_ratio           NUMERIC,
    glazing_ratio_uom       VARCHAR,
	library_code            VARCHAR,
    library_code_codespace  VARCHAR,
-- FKs
	layered_construction_id BIGINT,
    library_id              BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_library 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_library (
    id                     BIGINT PRIMARY KEY,
    objectclass_id         INTEGER,
    type                   VARCHAR,
    type_codespace         VARCHAR,
    author                 VARCHAR,
    source                 VARCHAR
);

-- -------------------------------------------------------------------- 
-- ng3_material 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_material (
    id                     BIGINT PRIMARY KEY,
    objectclass_id         INTEGER,
-- Abstract library attributes
	library_code           VARCHAR,
    library_code_codespace VARCHAR,
-- SolidMaterial attributes
    thm_conductivity       NUMERIC,
    thm_conductivity_uom   VARCHAR,
    spec_heat_capacity     NUMERIC,
    spec_heat_capacity_uom VARCHAR,
    density                NUMERIC,
    density_uom            VARCHAR,
    permeance              NUMERIC,
    permeance_uom          VARCHAR,
    porosity               NUMERIC,
    porosity_uom           VARCHAR,
    embodied_carbon        NUMERIC,
    embodied_carbon_uom    VARCHAR,
    embodied_energy        NUMERIC,
    embodied_energy_uom    VARCHAR,	
-- Gas attributes
    is_ventilated          NUMERIC,
    r_value                NUMERIC,
    r_value_uom            VARCHAR,
-- FK
    library_id             BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_occupants 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_occupants (
    id                         BIGINT PRIMARY KEY,
    type                       VARCHAR,
    type_codespace             VARCHAR,
    num_of_occupants           INTEGER,
  	heat_diss                  NUMERIC,
  	heat_diss_uom              VARCHAR,
  	heat_diss_conv             NUMERIC,
  	heat_diss_conv_uom         VARCHAR,
  	heat_diss_lat              NUMERIC,
  	heat_diss_lat_uom          VARCHAR,
  	heat_diss_rad              NUMERIC,
  	heat_diss_rad_uom          VARCHAR,
    avg_diet_type              VARCHAR,
    avg_diet_type_codespace    VARCHAR,	
    avg_income_level           VARCHAR,	
    avg_income_level_codespace VARCHAR,	
    avg_instr_level            VARCHAR,	
    avg_instr_level_codespace  VARCHAR,
-- FK
    schedule_id                BIGINT,
	building_partition_id      BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_opening - extends (building) opening table
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_opening (
    id                     BIGINT PRIMARY KEY,
    area                   NUMERIC,
    area_uom               VARCHAR,
    azimuth                NUMERIC,
    azimuth_uom            VARCHAR,
    inclination            NUMERIC,
    inclination_uom        VARCHAR,
    ground_view_factor     NUMERIC,
    ground_view_factor_uom VARCHAR,
    sky_view_factor        NUMERIC,
    sky_view_factor_uom    VARCHAR
);

-- -------------------------------------------------------------------- 
-- ng3_optical_property 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_optical_property (
    id                      BIGINT PRIMARY KEY DEFAULT nextval('ng3_optical_property_seq'::regclass),
    objectclass_id          INTEGER,
    fraction                NUMERIC,
    fraction_uom            VARCHAR,
    surface                 VARCHAR,
    wavelength_range        VARCHAR,
-- FK
    layered_construction_id BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_qualified_attribute
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_qualified_attribute (
    id                    BIGINT PRIMARY KEY DEFAULT nextval('ng3_qualified_attribute_seq'::regclass),
    objectclass_id        INTEGER,
    type                  VARCHAR,
    type_codespace        VARCHAR,
    value                 NUMERIC,
    value_uom             VARCHAR,
	description           VARCHAR,
	source                VARCHAR,
-- FK
    building_id           BIGINT,
	building_partition_id BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_refurbishment_measure 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_refurbishment_measure (
    id                     BIGINT PRIMARY KEY,
    type                   VARCHAR,
    type_codespace         VARCHAR,
    start_date             DATE,
    end_date               DATE,	
    library_code           VARCHAR,
    library_code_codespace VARCHAR,
-- FK
    building_id            BIGINT,
	building_partition_id  BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_resource 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_resource (
    id                       BIGINT PRIMARY KEY,
    objectclass_id           INTEGER,
    type                     VARCHAR,
    type_codespace           VARCHAR,
    enduse                   VARCHAR,
    enduse_codespace         VARCHAR,
    status                   VARCHAR,
    operation_type           VARCHAR,
    operation_type_codespace VARCHAR,
    year                     INTEGER,	
    amount_type              VARCHAR,
    amount_type_codespace    VARCHAR,
    amount                   NUMERIC,
    amount_uom               VARCHAR,
    time_series_id            BIGINT,
    is_amount_normalized     NUMERIC,
    normalization_param      VARCHAR,
    normalization_value      NUMERIC,
    normalization_value_uom  VARCHAR,
    co2_equivalent           NUMERIC,
    co2_equivalent_uom       VARCHAR,
    costs_money              NUMERIC,
    costs_money_uom          VARCHAR,
    yields_money             NUMERIC,
    yields_money_uom         VARCHAR,
-- Attributes for Energy
    energy_carrier           VARCHAR,
    energy_carrier_codespace VARCHAR,
    maximum_load             NUMERIC,
    maximum_load_uom         VARCHAR,
    source                   VARCHAR,
    source_codespace         VARCHAR,
-- Attributes for Waste
    is_dangerous             NUMERIC,
    is_recyclable            NUMERIC,
-- FK
    cityobject_id            BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_schedule 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_schedule (
    id                     BIGINT PRIMARY KEY,
    objectclass_id         INTEGER,
    library_code           VARCHAR,
    library_code_codespace VARCHAR,
    type                   VARCHAR,
    type_codespace         VARCHAR,
    start_time             TIME WITHOUT TIME ZONE,
    start_day              INTEGER,
    start_month            INTEGER,
    start_year             INTEGER,
    time_interval          NUMERIC,
    time_interval_unit     VARCHAR,
--    time_interval_factor   INTEGER, -- used for temporalExtent
--    time_interval_radix    INTEGER, -- used for temporalExtent
-- DualValue Schedule
    idle_value             NUMERIC,
    idle_value_uom         VARCHAR,
    usage_value            NUMERIC,
    usage_value_uom        VARCHAR,
    start_usage_time       TIME WITHOUT TIME ZONE,
    end_usage_time         TIME WITHOUT TIME ZONE,
-- Atomic Schedule
    constant_value         NUMERIC,
    constant_value_uom     VARCHAR,	
-- FK
    time_series_id         BIGINT,
    library_id             BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_schedule_component
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_schedule_component (
    id                     BIGINT PRIMARY KEY,
    type                   VARCHAR,
    type_codespace         VARCHAR,
    repetitions            INTEGER NOT NULL DEFAULT 1,
    additional_gap         NUMERIC,
    additional_gap_unit    VARCHAR,
--    additional_gap_factor   INTEGER, 
--    additional_gap_radix    INTEGER,
-- FK
	parent_schedule_id     BIGINT,
	schedule_id            BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_solar_collector
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_solar_collector (
    id                    BIGINT PRIMARY KEY,
    objectclass_id        INTEGER,
	type                  VARCHAR,
	type_codespace        VARCHAR,
	cell_type             VARCHAR,
	cell_type_codespace   VARCHAR,
    module_area           NUMERIC,
    module_area_uom       VARCHAR,
    azimuth               NUMERIC,
    azimuth_uom           VARCHAR,
    inclination           NUMERIC,
    inclination_uom       VARCHAR,
    aperture_area         NUMERIC,
    aperture_area_uom     VARCHAR,
	opt_efficiency        NUMERIC,
	opt_efficiency_uom    VARCHAR,
    lin_heat_loss_coeff   NUMERIC,
    quad_heat_loss_coeff  NUMERIC,
-- FK
    lod2_multi_surface_id BIGINT,
	lod3_multi_surface_id BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_storage_device
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_storage_device (
    id                    BIGINT PRIMARY KEY,
    objectclass_id        INTEGER,
	medium                VARCHAR,
	medium_codespace      VARCHAR,
    preparation_temp      NUMERIC,
    preparation_temp_uom  VARCHAR,
    thm_losses_factor     NUMERIC,
    thm_losses_factor_uom VARCHAR,
    volume                NUMERIC,
    volume_uom            VARCHAR,
    batt_techn            VARCHAR,
	batt_techn_codespace  VARCHAR,
	power_capacity        NUMERIC,
	power_capacity_uom    VARCHAR
);

-- -------------------------------------------------------------------- 
-- ng3_suitability 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_suitability (
    id               BIGINT PRIMARY KEY DEFAULT nextval('ng3_suitability_seq'::regclass),
    reason           VARCHAR,
    reason_codespace VARCHAR,
    value            NUMERIC,
    value_uom        VARCHAR,
    description      VARCHAR,
    schedule_id      BIGINT,
-- FK
    cityobject_id    BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_them_surf_to_thermal_zone
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_them_surf_to_thermal_zone (
    thematic_surface_id BIGINT NOT NULL,
    thermal_zone_id     BIGINT NOT NULL,
    PRIMARY KEY (thematic_surface_id, thermal_zone_id)
);

-- -------------------------------------------------------------------- 
-- ng3_thematic_surface - extends (building) thematic_surface table
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_thematic_surface (
    id                     BIGINT PRIMARY KEY,
    total_surf_area        NUMERIC,
    total_surf_area_uom    VARCHAR,
    opaque_surf_area       NUMERIC,
    opaque_surf_area_uom   VARCHAR,
    open_to_surf_ratio     NUMERIC,
    open_to_surf_ratio_uom VARCHAR,
    thickness              NUMERIC,
    thickness_uom          VARCHAR,
    azimuth                NUMERIC,
    azimuth_uom            VARCHAR,
    inclination            NUMERIC,
    inclination_uom        VARCHAR,
    ground_view_factor     NUMERIC,
    ground_view_factor_uom VARCHAR,
    sky_view_factor        NUMERIC,
    sky_view_factor_uom    VARCHAR,
    is_adiabatic           NUMERIC,
    heat_capacity          NUMERIC,
    heat_capacity_uom      VARCHAR
);

-- -------------------------------------------------------------------- 
-- ng3_time_series 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_time_series (
    id                           BIGINT PRIMARY KEY,
    objectclass_id               INTEGER,
-- AbstractTieSeries attributes
    acquisition_method           VARCHAR,
    acquisition_method_codespace VARCHAR,
    interpolation_type           VARCHAR,
    source                       VARCHAR,
-- Other attributes
    period_begin                 TIMESTAMP WITH TIME ZONE,
    period_end                   TIMESTAMP WITH TIME ZONE,
    start_time                   TIME WITHOUT TIME ZONE,
    start_day                    INTEGER,
    start_month                  INTEGER,	
    temporal_extent              NUMERIC,
    temporal_extent_unit         VARCHAR,
--    temporal_extent_factor       INTEGER,
--    temporal_extent_radix        INTEGER,
    time_interval                NUMERIC,
    time_interval_unit           VARCHAR,
--    time_interval_factor         INTEGER,
--    time_interval_radix          INTEGER,
    values_list                  TEXT,
    values_list_uom              VARCHAR,
    uom                          VARCHAR,
    file_uri                     VARCHAR,
    num_of_header_lines          INTEGER,
    field_separator              VARCHAR,
    record_separator             VARCHAR,
    value_column_number          INTEGER,
    decimal_symbol               VARCHAR,
    auth_type                    VARCHAR,
    auth_type_codespace          VARCHAR,
    base_url                     VARCHAR,
    connection_type              VARCHAR,
    connection_type_codespace    VARCHAR,
    datastream_id                VARCHAR,
    link_to_observation          VARCHAR,
    link_to_sensor_description   VARCHAR,
    mqtt_server                  VARCHAR,
    mqtt_topic                   VARCHAR,
    observation_id               VARCHAR,
    observation_property         VARCHAR,
    sensor_id                    VARCHAR,
    sensor_name                  VARCHAR
);

-- -------------------------------------------------------------------- 
-- ng3_urban_function_area 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_urban_function_area (
    id             BIGINT PRIMARY KEY,
    type           VARCHAR,
    type_codespace VARCHAR,
    code           VARCHAR,
    code_codespace VARCHAR
);

-- -------------------------------------------------------------------- 
-- ng3_utl_ntw_connection 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_utl_ntw_connection (
    id                            BIGINT PRIMARY KEY,
    network_type                  VARCHAR,
    network_type_codespace        VARCHAR,
    connection_status             VARCHAR,
    function_in_network           VARCHAR,
    function_in_network_codespace VARCHAR,
    usage_in_network              VARCHAR,
    usage_in_network_codespace    VARCHAR,
    network_id                    VARCHAR,
    network_node_id               VARCHAR,
-- FK
    cityobject_id                 BIGINT
);

-- -------------------------------------------------------------------- 
-- ng3_weather_data 
-- -------------------------------------------------------------------- 
CREATE TABLE ng3_weather_data (
    id                     BIGINT PRIMARY KEY,
    type                   VARCHAR,
    type_codespace         VARCHAR,
	value_type             VARCHAR,
	value_type_codespace   VARCHAR,	
    yearly_value           NUMERIC,
    yearly_value_uom       VARCHAR,
    library_code           VARCHAR,
    library_code_codespace VARCHAR,
-- FK
	time_series_id         BIGINT,
    cityobject_id          BIGINT,
--
    position               geometry(POINTZ)
);

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Create foreign keys ******************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- -------------------------------------------------------------------- 
-- ng3_address_to_building_unit 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_address_to_building_unit ADD CONSTRAINT ng3_addr_to_bdgu_fk1 FOREIGN KEY (address_id) REFERENCES address (id) ON DELETE CASCADE;
ALTER TABLE ng3_address_to_building_unit ADD CONSTRAINT ng3_addr_to_bdgu_fk2 FOREIGN KEY (building_unit_id) REFERENCES ng3_building_partition (id) ON DELETE CASCADE;

-- -------------------------------------------------------------------- 
-- ng3_building 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_building ADD CONSTRAINT ng3_bdg_fk FOREIGN KEY (id) REFERENCES building (id);

-- -------------------------------------------------------------------- 
-- ng3_building_partition 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_lod1_fk FOREIGN KEY (lod1_solid_id) REFERENCES surface_geometry (id);
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_lod2_fk FOREIGN KEY (lod2_solid_id) REFERENCES surface_geometry (id);
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_lod3_fk FOREIGN KEY (lod3_solid_id) REFERENCES surface_geometry (id);
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_uz_fk FOREIGN KEY (usage_zone_id) REFERENCES ng3_building_partition (id) ON DELETE SET NULL;
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_tz_fk FOREIGN KEY (thermal_zone_id) REFERENCES ng3_building_partition (id) ON DELETE SET NULL;
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_bdg_fk FOREIGN KEY (building_id) REFERENCES ng3_building (id);
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_sched_fk1 FOREIGN KEY (cooling_schedule_id) REFERENCES ng3_schedule (id) ON DELETE SET NULL;
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_sched_fk2 FOREIGN KEY (heating_schedule_id) REFERENCES ng3_schedule (id) ON DELETE SET NULL;
ALTER TABLE ng3_building_partition ADD CONSTRAINT ng3_bdgp_sched_fk3 FOREIGN KEY (ventilation_schedule_id) REFERENCES ng3_schedule (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_cityobject 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_cityobject ADD CONSTRAINT ng3_cto_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_cityobject ADD CONSTRAINT ng3_cto_lcns_fk FOREIGN KEY (layered_construction_id) REFERENCES ng3_layered_construction (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_ctyobj_relation 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_ctyobj_relation ADD CONSTRAINT ng3_cto_rel_fk2 FOREIGN KEY (cityobject_id) REFERENCES cityobject (id) ON DELETE SET NULL;
ALTER TABLE ng3_ctyobj_relation ADD CONSTRAINT ng3_cto_rel_fk1 FOREIGN KEY (ng3_cityobject_id) REFERENCES ng3_cityobject (id);

-- -------------------------------------------------------------------- 
-- ng3_device
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_device ADD CONSTRAINT ng3_dev_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_device ADD CONSTRAINT ng3_dev_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);
ALTER TABLE ng3_device ADD CONSTRAINT ng3_dev_opt_fk FOREIGN KEY (transmittance_id) REFERENCES ng3_optical_property (id) ON DELETE SET NULL;
ALTER TABLE ng3_device ADD CONSTRAINT ng3_dev_ng3_cto_fk FOREIGN KEY (cityobject_id) REFERENCES ng3_cityobject (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_device_operation 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_device_operation ADD CONSTRAINT ng3_dev_opr_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_device_operation ADD CONSTRAINT ng3_dev_opr_sched_fk FOREIGN KEY (schedule_id) REFERENCES ng3_schedule (id) ON DELETE SET NULL;
ALTER TABLE ng3_device_operation ADD CONSTRAINT ng3_dev_opr_dev_fk FOREIGN KEY (device_id) REFERENCES ng3_device (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_energy_perf_cert 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_energy_perf_cert ADD CONSTRAINT ng3_epc_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_energy_perf_cert ADD CONSTRAINT ng3_epc_bdg_fk FOREIGN KEY (building_id) REFERENCES ng3_building (id) ON DELETE SET NULL;
ALTER TABLE ng3_energy_perf_cert ADD CONSTRAINT ng3_epc_bdg_part_fk FOREIGN KEY (building_partition_id) REFERENCES ng3_building_partition (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_layer 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_layer ADD CONSTRAINT ng3_lyr_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_layer ADD CONSTRAINT ng3_lyr_mat_fk FOREIGN KEY (material_id) REFERENCES ng3_material (id) ON DELETE SET NULL;
ALTER TABLE ng3_layer ADD CONSTRAINT ng3_lyr_lcns_fk FOREIGN KEY (layered_construction_id) REFERENCES ng3_layered_construction (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_layered_construction
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_layered_construction ADD CONSTRAINT ng3_lcns_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_layered_construction ADD CONSTRAINT ng3_lcns_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);
ALTER TABLE ng3_layered_construction ADD CONSTRAINT ng3_lcns_lcns_fk FOREIGN KEY (layered_construction_id) REFERENCES ng3_layered_construction (id) ON DELETE SET NULL;
ALTER TABLE ng3_layered_construction ADD CONSTRAINT ng3_lcns_lib_fk FOREIGN KEY (library_id) REFERENCES ng3_library (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_library 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_library ADD CONSTRAINT ng3_lib_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_library ADD CONSTRAINT ng3_lib_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);

-- -------------------------------------------------------------------- 
-- ng3_material 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_material ADD CONSTRAINT ng3_mat_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_material ADD CONSTRAINT ng3_mat_lib_fk FOREIGN KEY (library_id) REFERENCES ng3_library (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_occupants 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_occupants ADD CONSTRAINT ng3_occ_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_occupants ADD CONSTRAINT ng3_occ_sched_fk FOREIGN KEY (schedule_id) REFERENCES ng3_schedule (id) ON DELETE SET NULL;
ALTER TABLE ng3_occupants ADD CONSTRAINT ng3_occ_ng3_bdgp_fk FOREIGN KEY (building_partition_id) REFERENCES ng3_building_partition (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_opening
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_opening ADD CONSTRAINT ng3_opn_fk FOREIGN KEY (id) REFERENCES opening (id);

-- -------------------------------------------------------------------- 
-- ng3_optical_property
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_optical_property ADD CONSTRAINT ng3_optpty_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id); 
ALTER TABLE ng3_optical_property ADD CONSTRAINT ng3_optpty_lcns_fk FOREIGN KEY (layered_construction_id) REFERENCES ng3_layered_construction (id);

-- -------------------------------------------------------------------- 
-- ng3_qualified_attribute
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_qualified_attribute ADD CONSTRAINT ng3_qatt_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id); 
ALTER TABLE ng3_qualified_attribute ADD CONSTRAINT ng3_qatt_bdg_fk FOREIGN KEY (building_id) REFERENCES ng3_building (id);
ALTER TABLE ng3_qualified_attribute ADD CONSTRAINT ng3_qatt_bdg_part_fk FOREIGN KEY (building_partition_id) REFERENCES ng3_building_partition (id);

-- -------------------------------------------------------------------- 
-- ng3_refurbishment_measure 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_refurbishment_measure ADD CONSTRAINT ng3_refurb_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_refurbishment_measure ADD CONSTRAINT ng3_refurb_bdg_fk FOREIGN KEY (building_id) REFERENCES ng3_building (id) ON DELETE SET NULL;
ALTER TABLE ng3_refurbishment_measure ADD CONSTRAINT ng3_refurb_bdg_part_fk FOREIGN KEY (building_partition_id) REFERENCES ng3_building_partition (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_resource 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_resource ADD CONSTRAINT ng3_res_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_resource ADD CONSTRAINT ng3_res_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);
ALTER TABLE ng3_resource ADD CONSTRAINT ng3_res_ts_fk FOREIGN KEY (time_series_id) REFERENCES ng3_time_series (id) ON DELETE SET NULL;
ALTER TABLE ng3_resource ADD CONSTRAINT ng3_res_cto_fk FOREIGN KEY (cityobject_id) REFERENCES ng3_cityobject (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_schedule 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_schedule ADD CONSTRAINT ng3_sched_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_schedule ADD CONSTRAINT ng3_sched_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);
ALTER TABLE ng3_schedule ADD CONSTRAINT ng3_sched_ts_fk FOREIGN KEY (time_series_id) REFERENCES ng3_time_series (id) ON DELETE SET NULL;
ALTER TABLE ng3_schedule ADD CONSTRAINT ng3_sched_lib_fk FOREIGN KEY (library_id) REFERENCES ng3_library (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_schedule_component 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_schedule_component ADD CONSTRAINT ng3_sched_comp_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_schedule_component ADD CONSTRAINT ng3_sched_comp_sched_fk1 FOREIGN KEY (parent_schedule_id) REFERENCES ng3_schedule (id);
ALTER TABLE ng3_schedule_component ADD CONSTRAINT ng3_sched_comp_sched_fk2 FOREIGN KEY (schedule_id) REFERENCES ng3_schedule (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_solar_collector
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_solar_collector ADD CONSTRAINT ng3_sol_coll_fk FOREIGN KEY (id) REFERENCES ng3_device (id);
ALTER TABLE ng3_solar_collector ADD CONSTRAINT ng3_sol_coll_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);
ALTER TABLE ng3_solar_collector ADD CONSTRAINT ng3_sol_coll_lod2_fk FOREIGN KEY (lod2_multi_surface_id) REFERENCES surface_geometry (id);
ALTER TABLE ng3_solar_collector ADD CONSTRAINT ng3_sol_coll_lod3_fk FOREIGN KEY (lod3_multi_surface_id) REFERENCES surface_geometry (id);

-- -------------------------------------------------------------------- 
-- ng3_storage_device
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_storage_device ADD CONSTRAINT ng3_sto_dev_fk FOREIGN KEY (id) REFERENCES ng3_device (id);
ALTER TABLE ng3_storage_device ADD CONSTRAINT ng3_sto_dev_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);

-- -------------------------------------------------------------------- 
-- ng3_suitability
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_suitability ADD CONSTRAINT ng3_suit_cto_fk FOREIGN KEY (cityobject_id) REFERENCES ng3_cityobject (id);
ALTER TABLE ng3_suitability ADD CONSTRAINT ng3_suit_sched_fk FOREIGN KEY (schedule_id) REFERENCES ng3_schedule (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_them_surf_to_thermal_zone
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_them_surf_to_thermal_zone ADD CONSTRAINT ng3_thm_surf_to_tz_fk2 FOREIGN KEY (thermal_zone_id) REFERENCES ng3_building_partition (id);
ALTER TABLE ng3_them_surf_to_thermal_zone ADD CONSTRAINT ng3_thm_surf_to_tz_fk1 FOREIGN KEY (thematic_surface_id) REFERENCES thematic_surface (id) ON DELETE CASCADE;

-- -------------------------------------------------------------------- 
-- ng3_thematic_surface 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_thematic_surface ADD CONSTRAINT ng3_them_surf_fk FOREIGN KEY (id) REFERENCES thematic_surface (id);

-- -------------------------------------------------------------------- 
-- ng3_time_series 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_time_series ADD CONSTRAINT ng3_ts_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_time_series ADD CONSTRAINT ng3_ts_oc_fk FOREIGN KEY (objectclass_id) REFERENCES objectclass (id);

-- -------------------------------------------------------------------- 
-- ng3_urban_function_area
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_urban_function_area ADD CONSTRAINT ng3_ufa_fk FOREIGN KEY (id) REFERENCES cityobjectgroup (id);

-- -------------------------------------------------------------------- 
-- ng3_utl_ntw_connection 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_utl_ntw_connection ADD CONSTRAINT ng3_utl_ntw_con_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_utl_ntw_connection ADD CONSTRAINT ng3_utl_ntw_con_cto_fk FOREIGN KEY (cityobject_id) REFERENCES ng3_cityobject (id) ON DELETE SET NULL;

-- -------------------------------------------------------------------- 
-- ng3_weather_data 
-- -------------------------------------------------------------------- 
ALTER TABLE ng3_weather_data ADD CONSTRAINT ng3_wth_data_fk FOREIGN KEY (id) REFERENCES cityobject (id);
ALTER TABLE ng3_weather_data ADD CONSTRAINT ng3_wth_data_ts_fk FOREIGN KEY (time_series_id) REFERENCES ng3_time_series (id) ON DELETE SET NULL;
ALTER TABLE ng3_weather_data ADD CONSTRAINT ng3_wth_data_ng3_cto_fk FOREIGN KEY (cityobject_id) REFERENCES ng3_cityobject (id) ON DELETE SET NULL;


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Create Indexes ************************************* 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

-- -------------------------------------------------------------------- 
-- ng3_address_to_building_unit
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_address_to_bdgu_fk1x ON ng3_address_to_building_unit USING btree (address_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_address_to_bdgu_fk2x ON ng3_address_to_building_unit USING btree (building_unit_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_building
-- -------------------------------------------------------------------- 
-- no indices needed

-- -------------------------------------------------------------------- 
-- ng3_building_partition 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_bdgp_oc_fkx       ON ng3_building_partition USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_sched_fk1x   ON ng3_building_partition USING btree (cooling_schedule_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_sched_fk2x   ON ng3_building_partition USING btree (heating_schedule_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_sched_fk3x   ON ng3_building_partition USING btree (ventilation_schedule_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_uz_fkx       ON ng3_building_partition USING btree (usage_zone_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_tz_fkx       ON ng3_building_partition USING btree (thermal_zone_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_bdg_fkx      ON ng3_building_partition USING btree (building_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_solid1_fkx   ON ng3_building_partition USING btree (lod1_solid_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_solid2_fkx   ON ng3_building_partition USING btree (lod2_solid_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_bdgp_solid3_fkx   ON ng3_building_partition USING btree (lod3_solid_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_cityobject 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_cto_ref_point_spx ON ng3_cityobject USING gist (ref_point);
CREATE INDEX ng3_cto_lcns_fkx      ON ng3_cityobject USING btree (layered_construction_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_ctyobj_relation 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_cto_rel_fk1x ON ng3_ctyobj_relation USING btree (ng3_cityobject_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_cto_rel_fk2x ON ng3_ctyobj_relation USING btree (cityobject_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_device
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_dev_oc_fkx       ON ng3_device USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_dev_opt_fkx      ON ng3_device USING btree (transmittance_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_dev_cto_fkx      ON ng3_device USING btree (cityobject_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_device_operation
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_dev_opr_sched_fkx ON ng3_device_operation USING btree (schedule_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_dev_opr_dev_fkx   ON ng3_device_operation USING btree (device_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_energy_perf_cert 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_epc_bdg_fkx      ON ng3_energy_perf_cert USING btree (building_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_epc_bdg_part_fkx ON ng3_energy_perf_cert USING btree (building_partition_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_layer 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_lyr_mat_fkx  ON ng3_layer USING btree (material_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_lyr_lcns_fkx ON ng3_layer USING btree (layered_construction_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_layered_constr
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_lcns_oc_fkx       ON ng3_layered_construction USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_lcns_lcns_fkx     ON ng3_layered_construction USING btree (layered_construction_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_lcns_lib_fkx      ON ng3_layered_construction USING btree (library_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_library
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_lib_oc_fkx ON ng3_library USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_material 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_mat_oc_fkx  ON ng3_material USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_mat_lib_fkx ON ng3_material USING btree (library_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_occupants 
-- --------------------------------------------------------------------
CREATE INDEX ng3_occ_sched_fkx    ON ng3_occupants USING btree (schedule_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_occ_ng3_bdgp_fkx ON ng3_occupants USING btree (building_partition_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_opening
-- --------------------------------------------------------------------
-- no indices needed

-- -------------------------------------------------------------------- 
-- ng3_optical_property
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_optpty_oc_fkx   ON ng3_optical_property USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_optpty_lcns_fkx ON ng3_optical_property USING btree (layered_construction_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_qualified_attribute
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_qual_attr_oc_fkx       ON ng3_qualified_attribute USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_qual_attr_bdg_fkx      ON ng3_qualified_attribute USING btree (building_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_qual_attr_bdg_part_fkx ON ng3_qualified_attribute USING btree (building_partition_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_qual_attr_type_idx     ON ng3_qualified_attribute USING btree (type ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_refurbishment_measure 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_ref_meas_bdg_fkx      ON ng3_refurbishment_measure USING btree (building_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_ref_meas_bdg_part_fkx ON ng3_refurbishment_measure USING btree (building_partition_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_resource 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_res_oc_fkx  ON ng3_resource USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_res_ts_fkx  ON ng3_resource USING btree (time_series_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_res_cto_fkx ON ng3_resource USING btree (cityobject_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_schedule 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_sched_oc_fkx  ON ng3_schedule USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_sched_ts_fkx  ON ng3_schedule USING btree (time_series_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_sched_lib_fkx ON ng3_schedule USING btree (library_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_schedule_component
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_sched_comp_sched_fk1x ON ng3_schedule_component USING btree (parent_schedule_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_sched_comp_sched_fk2x ON ng3_schedule_component USING btree (schedule_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_solar_collector
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_sol_col_oc_fkx   ON ng3_solar_collector USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_sol_col_lod2_fkx ON ng3_solar_collector USING btree (lod2_multi_surface_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_sol_col_lod3_fkx ON ng3_solar_collector USING btree (lod2_multi_surface_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_storage_device
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_sto_dev_oc_fkx ON ng3_storage_device USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_suitability 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_suit_cto_fkx   ON ng3_suitability USING btree (cityobject_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_suit_sched_fkx ON ng3_suitability USING btree (schedule_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_suit_reas_fkx  ON ng3_suitability USING btree (reason ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_them_surf_to_thermal_zone
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_thm_surf_to_tz_fk1x ON ng3_them_surf_to_thermal_zone USING btree (thematic_surface_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_thm_surf_to_tz_fk2x ON ng3_them_surf_to_thermal_zone USING btree (thermal_zone_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_thematic_surface
-- -------------------------------------------------------------------- 
-- no indices needed

-- -------------------------------------------------------------------- 
-- ng3_time_series 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_ts_oc_fkx  ON ng3_time_series USING btree (objectclass_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_urban_function_area 
-- --------------------------------------------------------------------
-- no indices needed

-- -------------------------------------------------------------------- 
-- ng3_utl_ntw_connection 
-- -------------------------------------------------------------------- 
CREATE INDEX ng3_utl_ntw_conn_cto_fkx ON ng3_utl_ntw_connection USING btree (cityobject_id ASC NULLS LAST) WITH (FILLFACTOR = 90);

-- -------------------------------------------------------------------- 
-- ng3_weather_data 
-- --------------------------------------------------------------------
CREATE INDEX ng3_wht_data_ts_fkx  ON ng3_weather_data USING btree (time_series_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
CREATE INDEX ng3_wht_data_cto_fkx ON ng3_weather_data USING btree (cityobject_id ASC NULLS LAST) WITH (FILLFACTOR = 90);
