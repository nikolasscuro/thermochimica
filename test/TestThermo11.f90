
program ThermoTest11

    !-------------------------------------------------------------------------------------------------------------
    !
    ! DISCLAIMER
    ! ==========
    ! 
    ! All of the programming herein is original unless otherwise specified.  Details of contributions to the 
    ! programming are given below.
    !
    !
    ! Revisions:
    ! ==========
    ! 
    !    Date          Programmer          Description of change
    !    ----          ----------          ---------------------
    !    02/07/2012    M.H.A. Piro         Original code
    !    11/07/2018    B.W.N. Fitzpatrick  Changed to a C-O database 
    !
    ! Purpose:
    ! ========
    !
    ! The purpose of this unit test is to ensure that Thermochimica does not proceed if the temperature of the 
    ! system is an INF.  
    !
    !-------------------------------------------------------------------------------------------------------------


    USE ModuleThermoIO

    implicit none


    ! Initialize variables:
    dTemperature            = 1E37
    dPressure               = 0D0
    dElementMass            = 1D0
    cInputUnitTemperature   = 'K'
    cInputUnitPressure      = 'atm'
    cInputUnitMass          = 'moles'
    cThermoFileName         = '../data/C-O.dat'


    dTemperature = dTemperature * dTemperature

    ! Parse the ChemSage data-file:
    call ParseCSDataFile(cThermoFileName)
        
    ! Call Thermochimica:
    call Thermochimica
                
    if (INFOThermo == 1) then
        ! The unit test passed: the correct error code was reported and exited gracefully.
        print *, 'TestThermo11: PASS'
    else
        ! The unit test failed.
        print *, 'TestThermo11: FAIL <---'
    end if
        
    ! Reset Thermochimica:
    call ResetThermo
    
end program ThermoTest11
