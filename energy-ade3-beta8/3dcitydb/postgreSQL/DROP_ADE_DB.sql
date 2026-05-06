-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--
-- CityGML Energy ADE 3.0 (beta 8)
--
-- Last update: 2026-05-06
--
-- This DDL script uninstalls the 3DCityDB schema for the Energy ADE. It must be run
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
-- ******************************* DROP_ADE_DB.SQL execution START ************************ 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Drop foreign keys ********************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
--ALTER TABLE ng3_relation DROP CONSTRAINT ng3_rel_oc_fk;
ALTER TABLE ng3_relation DROP CONSTRAINT ng3_rel_fk1;
ALTER TABLE ng3_relation DROP CONSTRAINT ng3_rel_fk2;
ALTER TABLE ng3_optical_property DROP CONSTRAINT ng3_optpty_oc_fk;
ALTER TABLE ng3_optical_property DROP CONSTRAINT ng3_optpty_ng3_lcns_fk;
ALTER TABLE ng3_optical_property DROP CONSTRAINT ng3_optpty_ng3_mat_fk;
ALTER TABLE ng3_qualified_attribute DROP CONSTRAINT ng3_qatt_oc_fk;
ALTER TABLE ng3_qualified_attribute DROP CONSTRAINT ng3_qatt_ng3_bdg_fk;
ALTER TABLE ng3_qualified_attribute DROP CONSTRAINT ng3_qatt_ng3_spc_fk;
ALTER TABLE ng3_indicator DROP CONSTRAINT ng3_ind_ng3_cto_fk;
ALTER TABLE ng3_intervention DROP CONSTRAINT ng3_int_ng3_cto_fk;
ALTER TABLE ng3_metadata DROP CONSTRAINT ng3_md_ng3_cto_fk;
ALTER TABLE ng3_irr_time_series_value DROP CONSTRAINT ng3_itsv_ng3_ts_fk;
ALTER TABLE ng3_cityobject DROP CONSTRAINT ng3_cto_fk;
ALTER TABLE ng3_cityobject DROP CONSTRAINT ng3_cto_oc_fk;
ALTER TABLE ng3_cityobject DROP CONSTRAINT ng3_cto_ng3_lcns_fk;
ALTER TABLE ng3_time_series DROP CONSTRAINT ng3_ts_fk;
ALTER TABLE ng3_time_series DROP CONSTRAINT ng3_ts_oc_fk;
ALTER TABLE ng3_schedule DROP CONSTRAINT ng3_sched_fk;
ALTER TABLE ng3_schedule DROP CONSTRAINT ng3_sched_oc_fk;
ALTER TABLE ng3_schedule DROP CONSTRAINT ng3_sched_ng3_ts_fk;
ALTER TABLE ng3_schedule DROP CONSTRAINT ng3_sched_ng3_lib_fk;
ALTER TABLE ng3_schedule_component DROP CONSTRAINT ng3_sched_comp_fk;
ALTER TABLE ng3_schedule_component DROP CONSTRAINT ng3_sched_comp_ng3_sched_fk1;
ALTER TABLE ng3_schedule_component DROP CONSTRAINT ng3_sched_comp_ng3_sched_fk2;
ALTER TABLE ng3_device_operation DROP CONSTRAINT ng3_dev_opr_fk;
ALTER TABLE ng3_device_operation DROP CONSTRAINT ng3_dev_opr_ng3_sched_fk;
ALTER TABLE ng3_device_operation DROP CONSTRAINT ng3_dev_opr_ng3_dev_fk;
ALTER TABLE ng3_sensor_data DROP CONSTRAINT ng3_sns_data_fk;
ALTER TABLE ng3_sensor_data DROP CONSTRAINT ng3_sns_data_oc_fk;
ALTER TABLE ng3_sensor_data DROP CONSTRAINT ng3_sns_data_ng3_ts_fk;
ALTER TABLE ng3_sensor_data DROP CONSTRAINT ng3_sns_data_ng3_cto_fk;
ALTER TABLE ng3_layered_construction DROP CONSTRAINT ng3_lcns_fk;
ALTER TABLE ng3_layered_construction DROP CONSTRAINT ng3_lcns_oc_fk;
ALTER TABLE ng3_layered_construction DROP CONSTRAINT ng3_lcns_ng3_lcns_fk;
ALTER TABLE ng3_layered_construction DROP CONSTRAINT ng3_lcns_ng3_lib_fk;
ALTER TABLE ng3_utl_ntw_connection DROP CONSTRAINT ng3_utl_ntw_con_fk;
ALTER TABLE ng3_utl_ntw_connection DROP CONSTRAINT ng3_utl_ntw_con_ng3_cto_fk;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_fk;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_oc_fk;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_ng3_ts_fk1;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_ng3_ts_fk2;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_ng3_ts_fk3;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_ng3_sched_fk3;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_ng3_cto_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_oc_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_ng3_bdg_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_ng3_zn_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_ng3_bdgu_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_ng3_sched_fk1;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_ng3_sched_fk2;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_ng3_sched_fk3;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_lod0_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_lod1_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_lod2_fk;
ALTER TABLE ng3_space DROP CONSTRAINT ng3_spc_lod3_fk;
ALTER TABLE ng3_library DROP CONSTRAINT ng3_lib_fk;
ALTER TABLE ng3_library DROP CONSTRAINT ng3_lib_oc_fk;
ALTER TABLE ng3_energy_perf_cert DROP CONSTRAINT ng3_epc_fk;
ALTER TABLE ng3_energy_perf_cert DROP CONSTRAINT ng3_epc_ng3_bdg_fk;
ALTER TABLE ng3_energy_perf_cert DROP CONSTRAINT ng3_epc_ng3_spc_fk;
ALTER TABLE ng3_occupants DROP CONSTRAINT ng3_occ_fk;
ALTER TABLE ng3_occupants DROP CONSTRAINT ng3_occ_ng3_sched_fk;
ALTER TABLE ng3_occupants DROP CONSTRAINT ng3_occ_ng3_spc_fk;
ALTER TABLE ng3_occupants DROP CONSTRAINT ng3_occ_ng3_bdg_fk;
ALTER TABLE ng3_building DROP CONSTRAINT ng3_bdg_fk;
ALTER TABLE ng3_thematic_surface DROP CONSTRAINT ng3_them_surf_fk;
ALTER TABLE ng3_opening DROP CONSTRAINT ng3_opn_fk;
ALTER TABLE ng3_address_to_building_unit DROP CONSTRAINT ng3_addr_to_bdgu_fk1;
ALTER TABLE ng3_address_to_building_unit DROP CONSTRAINT ng3_addr_to_bdgu_fk2;
ALTER TABLE ng3_zone_thematic_surface DROP CONSTRAINT ng3_zn_thm_surf_fk;
ALTER TABLE ng3_zone_thematic_surface DROP CONSTRAINT ng3_zn_thm_surf_oc_fk;
ALTER TABLE ng3_zone_thematic_surface DROP CONSTRAINT ng3_zn_thm_surf_n3g_zn_fk;
ALTER TABLE ng3_zone_opening DROP CONSTRAINT ng3_zn_opn_fk;
ALTER TABLE ng3_zone_opening DROP CONSTRAINT ng3_zn_opn_oc_fk;
ALTER TABLE ng3_zone_opening DROP CONSTRAINT ng3_zn_opn_ng3_zn_thm_surf_fk;
ALTER TABLE ng3_device DROP CONSTRAINT ng3_dev_fk;
ALTER TABLE ng3_device DROP CONSTRAINT ng3_dev_oc_fk;
ALTER TABLE ng3_device DROP CONSTRAINT ng3_dev_cto_fk;
ALTER TABLE ng3_other_device DROP CONSTRAINT ng3_oth_dev_fk;
ALTER TABLE ng3_other_device DROP CONSTRAINT ng3_oth_dev_oc_fk;
ALTER TABLE ng3_solar_collector DROP CONSTRAINT ng3_sol_coll_fk;
ALTER TABLE ng3_solar_collector DROP CONSTRAINT ng3_sol_coll_oc_fk;
ALTER TABLE ng3_solar_collector DROP CONSTRAINT ng3_sol_coll_lod2_fk;
ALTER TABLE ng3_solar_collector DROP CONSTRAINT ng3_sol_coll_lod3_fk;
ALTER TABLE ng3_storage_device DROP CONSTRAINT ng3_sto_dev_fk;
ALTER TABLE ng3_storage_device DROP CONSTRAINT ng3_sto_dev_oc_fk;
ALTER TABLE ng3_distribution_device DROP CONSTRAINT ng3_dist_dev_fk;
ALTER TABLE ng3_distribution_device DROP CONSTRAINT ng3_dist_dev_oc_fk;
ALTER TABLE ng3_urban_function_area DROP CONSTRAINT ng3_ufa_fk;
ALTER TABLE ng3_layer DROP CONSTRAINT ng3_lyr_fk;
ALTER TABLE ng3_layer DROP CONSTRAINT ng3_lyr_ng3_lcns_fk;
ALTER TABLE ng3_layer DROP CONSTRAINT ng3_lyr_ng3_mat_fk;
ALTER TABLE ng3_material DROP CONSTRAINT ng3_mat_fk;
ALTER TABLE ng3_material DROP CONSTRAINT ng3_mat_oc_fk;
ALTER TABLE ng3_material DROP CONSTRAINT ng3_mat_ng3_lib_fk;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Drop tables *************************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

-- DataTypes tables
DROP TABLE ng3_relation CASCADE;
DROP TABLE ng3_optical_property CASCADE;
DROP TABLE ng3_indicator CASCADE;
DROP TABLE ng3_intervention CASCADE;
DROP TABLE ng3_irr_time_series_value CASCADE;
DROP TABLE ng3_metadata CASCADE;
DROP TABLE ng3_qualified_attribute CASCADE;

-- Core tables
DROP TABLE ng3_cityobject CASCADE;
DROP TABLE ng3_time_series CASCADE;
DROP TABLE ng3_schedule CASCADE;
DROP TABLE ng3_schedule_component CASCADE;
DROP TABLE ng3_device_operation CASCADE;
DROP TABLE ng3_sensor_data CASCADE;
DROP TABLE ng3_layered_construction CASCADE;
DROP TABLE ng3_utl_ntw_connection CASCADE;
DROP TABLE ng3_resource CASCADE;
DROP TABLE ng3_space CASCADE;
DROP TABLE ng3_library CASCADE;
DROP TABLE ng3_device CASCADE;

-- Time Series tables (no additional tables needed)
-- Schedules (no additional tables needed)

-- Layered construction tables
DROP TABLE ng3_layer CASCADE;
DROP TABLE ng3_material CASCADE;

-- Building tables
DROP TABLE ng3_energy_perf_cert CASCADE;
DROP TABLE ng3_address_to_building_unit CASCADE;
DROP TABLE ng3_building CASCADE;
DROP TABLE ng3_occupants CASCADE;
DROP TABLE ng3_opening CASCADE;
DROP TABLE ng3_thematic_surface CASCADE;
DROP TABLE ng3_zone_opening CASCADE;
DROP TABLE ng3_zone_thematic_surface CASCADE;

-- Urban function area
DROP TABLE ng3_urban_function_area CASCADE;

-- Devices
DROP TABLE ng3_other_device CASCADE;
DROP TABLE ng3_solar_collector CASCADE;
DROP TABLE ng3_storage_device CASCADE;
DROP TABLE ng3_distribution_device CASCADE;

-- Weather station (no additional tables needed)

-- Resources (no additional tables needed)




-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Drop Sequences ************************************* 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
DROP SEQUENCE ng3_relation_seq;
DROP SEQUENCE ng3_indicator_seq;
DROP SEQUENCE ng3_irr_ts_value_seq;
DROP SEQUENCE ng3_metadata_seq;
DROP SEQUENCE ng3_optical_property_seq;
DROP SEQUENCE ng3_qualified_attribute_seq;