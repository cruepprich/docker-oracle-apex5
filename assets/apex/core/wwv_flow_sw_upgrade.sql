set define '^'
set verify off
prompt ...wwv_flow_sw_upgrade

Rem    Arguments:
Rem     1:  
Rem     2:
Rem     3:  Flow user

Rem    MODIFIED (MM/DD/YYYY)
Rem    cbcho     06/13/2005 - Created
Rem    cbcho     06/17/2005 - Added sw_archive_cleanup
Rem    cbcho     06/23/2005 - Changed sw_archive_cleanup to accept p_sql as clob


create or replace package wwv_flow_sw_upgrade
as
--
--
--
--  Copyright (c) Oracle Corporation 2000 - 2005. All Rights Reserved.
--
--    NAME
--      wwv_flow_sw_upgrade.sql
--
--    DESCRIPTION
--      Package to upgrade SQL Workshop meta data between versions
--
--    NOTES
--
--    INTERNATIONALIZATION
--      unknown
--
--    MULTI-CUSTOMER
--      unknown
--
--    CUSTOMER MAY CUSTOMIZE
--      NO
--
--    RUNTIME DEPLOYMENT: YES
--
--

procedure sw_script_name_cleanup;

procedure sw_ctrl_file_cleanup (
    p_ctrl_filename     in varchar2,
    p_security_group_id in number,
    p_ctrl_files        in wwv_flow_global.vc_arr2
    );

procedure sw_archive_cleanup (
    p_owner              in varchar2,
    p_title              in varchar2,
    p_created_by         in varchar2,
    p_created_on         in date,
    p_security_group_id  in number,
    p_sql                in clob,
    p_description        in varchar2 default null
    );    
end wwv_flow_sw_upgrade;
/
show errors