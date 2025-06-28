-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--
-- CityGML Energy ADE 2.0 (beta 7)
--
-- Last update: 2025-05-09
--
-- This DDL script uninstalls the 3DCityDB schema for the Energy ADE 2.0. It must be run
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
ALTER TABLE ng2_address_to_building_unit DROP CONSTRAINT ng2_addr_to_bdgu_fk1;
ALTER TABLE ng2_address_to_building_unit DROP CONSTRAINT ng2_addr_to_bdgu_fk2;
ALTER TABLE ng2_building DROP CONSTRAINT ng2_bdg_fk;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_bdg_fk;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_fk;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_lod1_fk;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_lod2_fk;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_lod3_fk;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_oc_fk;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_sched_fk1;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_sched_fk2;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_sched_fk3;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_tz_fk;
ALTER TABLE ng2_building_partition DROP CONSTRAINT ng2_bdgp_uz_fk;
ALTER TABLE ng2_cityobject DROP CONSTRAINT ng2_cto_fk;
ALTER TABLE ng2_cityobject DROP CONSTRAINT ng2_cto_lcns_fk;
ALTER TABLE ng2_ctyobj_relation DROP CONSTRAINT ng2_cto_rel_fk1;
ALTER TABLE ng2_ctyobj_relation DROP CONSTRAINT ng2_cto_rel_fk2;
ALTER TABLE ng2_device DROP CONSTRAINT ng2_dev_fk;
ALTER TABLE ng2_device DROP CONSTRAINT ng2_dev_ng2_cto_fk;
ALTER TABLE ng2_device DROP CONSTRAINT ng2_dev_oc_fk;
ALTER TABLE ng2_device DROP CONSTRAINT ng2_dev_opt_fk;
ALTER TABLE ng2_device_operation DROP CONSTRAINT ng2_dev_opr_fk;
ALTER TABLE ng2_device_operation DROP CONSTRAINT ng2_dev_opr_dev_fk;
ALTER TABLE ng2_device_operation DROP CONSTRAINT ng2_dev_opr_sched_fk;
ALTER TABLE ng2_energy_perf_cert DROP CONSTRAINT ng2_epc_fk;
ALTER TABLE ng2_energy_perf_cert DROP CONSTRAINT ng2_epc_bdg_fk;
ALTER TABLE ng2_energy_perf_cert DROP CONSTRAINT ng2_epc_bdg_part_fk;
ALTER TABLE ng2_layer DROP CONSTRAINT ng2_lyr_fk;
ALTER TABLE ng2_layer DROP CONSTRAINT ng2_lyr_lcns_fk;
ALTER TABLE ng2_layer DROP CONSTRAINT ng2_lyr_mat_fk;
ALTER TABLE ng2_layered_construction DROP CONSTRAINT ng2_lcns_fk;
ALTER TABLE ng2_layered_construction DROP CONSTRAINT ng2_lcns_lcns_fk;
ALTER TABLE ng2_layered_construction DROP CONSTRAINT ng2_lcns_oc_fk;
ALTER TABLE ng2_layered_construction DROP CONSTRAINT ng2_lcns_lib_fk;
ALTER TABLE ng2_library DROP CONSTRAINT ng2_lib_fk;
ALTER TABLE ng2_library DROP CONSTRAINT ng2_lib_oc_fk;
ALTER TABLE ng2_material DROP CONSTRAINT ng2_mat_fk;
ALTER TABLE ng2_material DROP CONSTRAINT ng2_mat_lib_fk;
ALTER TABLE ng2_occupants DROP CONSTRAINT ng2_occ_fk;
ALTER TABLE ng2_occupants DROP CONSTRAINT ng2_occ_ng2_bdgp_fk;
ALTER TABLE ng2_occupants DROP CONSTRAINT ng2_occ_sched_fk;
ALTER TABLE ng2_opening DROP CONSTRAINT ng2_opn_fk;
ALTER TABLE ng2_optical_property DROP CONSTRAINT ng2_optpty_lcns_fk;
ALTER TABLE ng2_optical_property DROP CONSTRAINT ng2_optpty_oc_fk; 
ALTER TABLE ng2_qualified_attribute DROP CONSTRAINT ng2_qatt_oc_fk; 
ALTER TABLE ng2_qualified_attribute DROP CONSTRAINT ng2_qatt_bdg_fk;
ALTER TABLE ng2_qualified_attribute DROP CONSTRAINT ng2_qatt_bdg_part_fk;
ALTER TABLE ng2_refurbishment_measure DROP CONSTRAINT ng2_refurb_fk;
ALTER TABLE ng2_refurbishment_measure DROP CONSTRAINT ng2_refurb_bdg_fk;
ALTER TABLE ng2_refurbishment_measure DROP CONSTRAINT ng2_refurb_bdg_part_fk;
ALTER TABLE ng2_resource DROP CONSTRAINT ng2_res_fk;
ALTER TABLE ng2_resource DROP CONSTRAINT ng2_res_oc_fk;
ALTER TABLE ng2_resource DROP CONSTRAINT ng2_res_ts_fk;
ALTER TABLE ng2_resource DROP CONSTRAINT ng2_res_cto_fk;
ALTER TABLE ng2_schedule DROP CONSTRAINT ng2_sched_fk;
ALTER TABLE ng2_schedule DROP CONSTRAINT ng2_sched_oc_fk;
ALTER TABLE ng2_schedule DROP CONSTRAINT ng2_sched_ts_fk;
ALTER TABLE ng2_schedule DROP CONSTRAINT ng2_sched_lib_fk;
ALTER TABLE ng2_schedule_component DROP CONSTRAINT ng2_sched_comp_fk;
ALTER TABLE ng2_schedule_component DROP CONSTRAINT ng2_sched_comp_sched_fk1;
ALTER TABLE ng2_schedule_component DROP CONSTRAINT ng2_sched_comp_sched_fk2;
ALTER TABLE ng2_solar_collector DROP CONSTRAINT ng2_sol_coll_fk;
ALTER TABLE ng2_solar_collector DROP CONSTRAINT ng2_sol_coll_oc_fk;
ALTER TABLE ng2_solar_collector DROP CONSTRAINT ng2_sol_coll_lod2_fk;
ALTER TABLE ng2_solar_collector DROP CONSTRAINT ng2_sol_coll_lod3_fk;
ALTER TABLE ng2_storage_device DROP CONSTRAINT ng2_sto_dev_fk;
ALTER TABLE ng2_storage_device DROP CONSTRAINT ng2_sto_dev_oc_fk;
ALTER TABLE ng2_suitability DROP CONSTRAINT ng2_suit_cto_fk;
ALTER TABLE ng2_suitability DROP CONSTRAINT ng2_suit_sched_fk;
--ALTER TABLE ng2_them_surf_to_thermal_zone DROP CONSTRAINT ng2_thm_surf_to_tz_fk1;
--ALTER TABLE ng2_them_surf_to_thermal_zone DROP CONSTRAINT ng2_thm_surf_to_tz_fk2;
ALTER TABLE ng2_thematic_surface DROP CONSTRAINT ng2_them_surf_fk;
ALTER TABLE ng2_thematic_surface DROP CONSTRAINT ng2_them_surf_ng2_thm_zone_fk;
ALTER TABLE ng2_time_series DROP CONSTRAINT ng2_ts_fk;
ALTER TABLE ng2_time_series DROP CONSTRAINT ng2_ts_oc_fk;
ALTER TABLE ng2_urban_function_area DROP CONSTRAINT ng2_ufa_fk;
ALTER TABLE ng2_utl_ntw_connection DROP CONSTRAINT ng2_utl_ntw_con_cto_fk;
ALTER TABLE ng2_utl_ntw_connection DROP CONSTRAINT ng2_utl_ntw_con_fk;
ALTER TABLE ng2_weather_data DROP CONSTRAINT ng2_wth_data_fk;
ALTER TABLE ng2_weather_data DROP CONSTRAINT ng2_wth_data_ng2_cto_fk;
ALTER TABLE ng2_weather_data DROP CONSTRAINT ng2_wth_data_ts_fk;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Drop tables *************************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
DROP TABLE ng2_address_to_building_unit CASCADE;
DROP TABLE ng2_building CASCADE;
DROP TABLE ng2_building_partition CASCADE;
DROP TABLE ng2_cityobject CASCADE;
DROP TABLE ng2_ctyobj_relation CASCADE;
DROP TABLE ng2_device CASCADE;
DROP TABLE ng2_device_operation CASCADE;
DROP TABLE ng2_energy_perf_cert CASCADE;
DROP TABLE ng2_layer CASCADE;
DROP TABLE ng2_layered_construction CASCADE;
DROP TABLE ng2_library CASCADE;
DROP TABLE ng2_material CASCADE;
DROP TABLE ng2_occupants CASCADE;
DROP TABLE ng2_opening CASCADE;
DROP TABLE ng2_optical_property CASCADE;
DROP TABLE ng2_qualified_attribute CASCADE;
DROP TABLE ng2_refurbishment_measure CASCADE;
DROP TABLE ng2_resource CASCADE;
DROP TABLE ng2_schedule CASCADE;
DROP TABLE ng2_schedule_component CASCADE;
DROP TABLE ng2_solar_collector CASCADE;
DROP TABLE ng2_storage_device CASCADE;
DROP TABLE ng2_suitability CASCADE;
--DROP TABLE ng2_them_surf_to_thermal_zone CASCADE;
DROP TABLE ng2_thematic_surface CASCADE;
DROP TABLE ng2_time_series CASCADE;
DROP TABLE ng2_urban_function_area CASCADE;
DROP TABLE ng2_utl_ntw_connection CASCADE;
DROP TABLE ng2_weather_data CASCADE;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Drop Sequences ************************************* 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
DROP SEQUENCE ng2_ctyobj_relation_seq;
DROP SEQUENCE ng2_optical_property_seq;
DROP SEQUENCE ng2_qualified_attribute_seq;
DROP SEQUENCE ng2_suitability_seq;