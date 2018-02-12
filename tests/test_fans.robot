*** Settings ***

Documentation  Fan checks.

# Test Parameters:
# OPENBMC_HOST       The BMC host name or IP address.
# OPENBMC_USERNAME   The userID for the BMC login.
# OPENBMC_PASSWORD   The password for OPENBMC_USERNAME.
#
# Approximate run time:  15 seconds.

Resource         ../lib/state_manager.robot
Resource         ../lib/fan_utils.robot
Resource         ../lib/openbmc_ffdc.robot

Test Teardown    FFDC On Test Case Fail


*** Test Cases ***

Fan Base Check Number Of Fans
    [Documentation]  Verify minimum number of fans.
    [Tags]  Fan_Base_Check_Number_Of_Fans

    # Determine if system is water cooled.
    ${water_coooled}=  Is Water Cooled

    Verify Minimum Number Of Fans With Cooling Type  ${water_coooled}


Fan Base Check Number Of Fan Monitors
    [Documentation]  Verify number of fan monitor daemons.
    [Tags]  Fan_Base_Check_Number_Of_Fan_Monitors

    ${power_state}=  Get Chassis Power State
    Verify Fan Monitors With State  ${power_state}
