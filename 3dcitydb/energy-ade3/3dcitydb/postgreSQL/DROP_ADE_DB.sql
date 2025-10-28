-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--
-- CityGML Energy ADE 3.0 (beta 7)
--
-- Last update: 2025-10-14
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
ALTER TABLE ng3_address_to_building_unit DROP CONSTRAINT ng3_addr_to_bdgu_fk1;
ALTER TABLE ng3_address_to_building_unit DROP CONSTRAINT ng3_addr_to_bdgu_fk2;
ALTER TABLE ng3_building DROP CONSTRAINT ng3_bdg_fk;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_bdg_fk;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_fk;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_lod1_fk;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_lod2_fk;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_lod3_fk;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_oc_fk;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_sched_fk1;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_sched_fk2;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_sched_fk3;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_tz_fk;
ALTER TABLE ng3_building_partition DROP CONSTRAINT ng3_bdgp_uz_fk;
ALTER TABLE ng3_cityobject DROP CONSTRAINT ng3_cto_fk;
ALTER TABLE ng3_cityobject DROP CONSTRAINT ng3_cto_lcns_fk;
ALTER TABLE ng3_ctyobj_relation DROP CONSTRAINT ng3_cto_rel_fk1;
ALTER TABLE ng3_ctyobj_relation DROP CONSTRAINT ng3_cto_rel_fk2;
ALTER TABLE ng3_device DROP CONSTRAINT ng3_dev_fk;
ALTER TABLE ng3_device DROP CONSTRAINT ng3_dev_ng3_cto_fk;
ALTER TABLE ng3_device DROP CONSTRAINT ng3_dev_oc_fk;
ALTER TABLE ng3_device DROP CONSTRAINT ng3_dev_opt_fk;
ALTER TABLE ng3_device_operation DROP CONSTRAINT ng3_dev_opr_fk;
ALTER TABLE ng3_device_operation DROP CONSTRAINT ng3_dev_opr_dev_fk;
ALTER TABLE ng3_device_operation DROP CONSTRAINT ng3_dev_opr_sched_fk;
ALTER TABLE ng3_energy_perf_cert DROP CONSTRAINT ng3_epc_fk;
ALTER TABLE ng3_energy_perf_cert DROP CONSTRAINT ng3_epc_bdg_fk;
ALTER TABLE ng3_energy_perf_cert DROP CONSTRAINT ng3_epc_bdg_part_fk;
ALTER TABLE ng3_layer DROP CONSTRAINT ng3_lyr_fk;
ALTER TABLE ng3_layer DROP CONSTRAINT ng3_lyr_lcns_fk;
ALTER TABLE ng3_layer DROP CONSTRAINT ng3_lyr_mat_fk;
ALTER TABLE ng3_layered_construction DROP CONSTRAINT ng3_lcns_fk;
ALTER TABLE ng3_layered_construction DROP CONSTRAINT ng3_lcns_lcns_fk;
ALTER TABLE ng3_layered_construction DROP CONSTRAINT ng3_lcns_oc_fk;
ALTER TABLE ng3_layered_construction DROP CONSTRAINT ng3_lcns_lib_fk;
ALTER TABLE ng3_library DROP CONSTRAINT ng3_lib_fk;
ALTER TABLE ng3_library DROP CONSTRAINT ng3_lib_oc_fk;
ALTER TABLE ng3_material DROP CONSTRAINT ng3_mat_fk;
ALTER TABLE ng3_material DROP CONSTRAINT ng3_mat_lib_fk;
ALTER TABLE ng3_occupants DROP CONSTRAINT ng3_occ_fk;
ALTER TABLE ng3_occupants DROP CONSTRAINT ng3_occ_ng3_bdgp_fk;
ALTER TABLE ng3_occupants DROP CONSTRAINT ng3_occ_sched_fk;
ALTER TABLE ng3_opening DROP CONSTRAINT ng3_opn_fk;
ALTER TABLE ng3_optical_property DROP CONSTRAINT ng3_optpty_lcns_fk;
ALTER TABLE ng3_optical_property DROP CONSTRAINT ng3_optpty_oc_fk; 
ALTER TABLE ng3_qualified_attribute DROP CONSTRAINT ng3_qatt_oc_fk; 
ALTER TABLE ng3_qualified_attribute DROP CONSTRAINT ng3_qatt_bdg_fk;
ALTER TABLE ng3_qualified_attribute DROP CONSTRAINT ng3_qatt_bdg_part_fk;
ALTER TABLE ng3_refurbishment_measure DROP CONSTRAINT ng3_refurb_fk;
ALTER TABLE ng3_refurbishment_measure DROP CONSTRAINT ng3_refurb_bdg_fk;
ALTER TABLE ng3_refurbishment_measure DROP CONSTRAINT ng3_refurb_bdg_part_fk;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_fk;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_oc_fk;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_ts_fk;
ALTER TABLE ng3_resource DROP CONSTRAINT ng3_res_cto_fk;
ALTER TABLE ng3_schedule DROP CONSTRAINT ng3_sched_fk;
ALTER TABLE ng3_schedule DROP CONSTRAINT ng3_sched_oc_fk;
ALTER TABLE ng3_schedule DROP CONSTRAINT ng3_sched_ts_fk;
ALTER TABLE ng3_schedule DROP CONSTRAINT ng3_sched_lib_fk;
ALTER TABLE ng3_schedule_component DROP CONSTRAINT ng3_sched_comp_fk;
ALTER TABLE ng3_schedule_component DROP CONSTRAINT ng3_sched_comp_sched_fk1;
ALTER TABLE ng3_schedule_component DROP CONSTRAINT ng3_sched_comp_sched_fk2;
ALTER TABLE ng3_solar_collector DROP CONSTRAINT ng3_sol_coll_fk;
ALTER TABLE ng3_solar_collector DROP CONSTRAINT ng3_sol_coll_oc_fk;
ALTER TABLE ng3_solar_collector DROP CONSTRAINT ng3_sol_coll_lod2_fk;
ALTER TABLE ng3_solar_collector DROP CONSTRAINT ng3_sol_coll_lod3_fk;
ALTER TABLE ng3_storage_device DROP CONSTRAINT ng3_sto_dev_fk;
ALTER TABLE ng3_storage_device DROP CONSTRAINT ng3_sto_dev_oc_fk;
ALTER TABLE ng3_suitability DROP CONSTRAINT ng3_suit_cto_fk;
ALTER TABLE ng3_suitability DROP CONSTRAINT ng3_suit_sched_fk;
ALTER TABLE ng3_them_surf_to_thermal_zone DROP CONSTRAINT ng3_thm_surf_to_tz_fk1;
ALTER TABLE ng3_them_surf_to_thermal_zone DROP CONSTRAINT ng3_thm_surf_to_tz_fk2;
ALTER TABLE ng3_thematic_surface DROP CONSTRAINT ng3_them_surf_fk;
ALTER TABLE ng3_time_series DROP CONSTRAINT ng3_ts_fk;
ALTER TABLE ng3_time_series DROP CONSTRAINT ng3_ts_oc_fk;
ALTER TABLE ng3_urban_function_area DROP CONSTRAINT ng3_ufa_fk;
ALTER TABLE ng3_utl_ntw_connection DROP CONSTRAINT ng3_utl_ntw_con_cto_fk;
ALTER TABLE ng3_utl_ntw_connection DROP CONSTRAINT ng3_utl_ntw_con_fk;
ALTER TABLE ng3_weather_data DROP CONSTRAINT ng3_wth_data_fk;
ALTER TABLE ng3_weather_data DROP CONSTRAINT ng3_wth_data_ng3_cto_fk;
ALTER TABLE ng3_weather_data DROP CONSTRAINT ng3_wth_data_ts_fk;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Drop tables *************************************** 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
DROP TABLE ng3_address_to_building_unit CASCADE;
DROP TABLE ng3_building CASCADE;
DROP TABLE ng3_building_partition CASCADE;
DROP TABLE ng3_cityobject CASCADE;
DROP TABLE ng3_ctyobj_relation CASCADE;
DROP TABLE ng3_device CASCADE;
DROP TABLE ng3_device_operation CASCADE;
DROP TABLE ng3_energy_perf_cert CASCADE;
DROP TABLE ng3_layer CASCADE;
DROP TABLE ng3_layered_construction CASCADE;
DROP TABLE ng3_library CASCADE;
DROP TABLE ng3_material CASCADE;
DROP TABLE ng3_occupants CASCADE;
DROP TABLE ng3_opening CASCADE;
DROP TABLE ng3_optical_property CASCADE;
DROP TABLE ng3_qualified_attribute CASCADE;
DROP TABLE ng3_refurbishment_measure CASCADE;
DROP TABLE ng3_resource CASCADE;
DROP TABLE ng3_schedule CASCADE;
DROP TABLE ng3_schedule_component CASCADE;
DROP TABLE ng3_solar_collector CASCADE;
DROP TABLE ng3_storage_device CASCADE;
DROP TABLE ng3_suitability CASCADE;
DROP TABLE ng3_them_surf_to_thermal_zone CASCADE;
DROP TABLE ng3_thematic_surface CASCADE;
DROP TABLE ng3_time_series CASCADE;
DROP TABLE ng3_urban_function_area CASCADE;
DROP TABLE ng3_utl_ntw_connection CASCADE;
DROP TABLE ng3_weather_data CASCADE;

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
-- *********************************** Drop Sequences ************************************* 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
DROP SEQUENCE ng3_ctyobj_relation_seq;
DROP SEQUENCE ng3_optical_property_seq;
DROP SEQUENCE ng3_qualified_attribute_seq;
DROP SEQUENCE ng3_suitability_seq;