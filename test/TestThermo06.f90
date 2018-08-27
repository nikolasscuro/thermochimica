
program TestThermo06

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
    !    05/07/2018    B.W.N. Fitzpatrick  Modified purpose of code (to see if unspecified mass exists gracefully)
    !
    ! Purpose:
    ! ========
    !
    ! To verify that Thermochimica gracefully exits when mass is not specified.
    ! 
    !-------------------------------------------------------------------------------------------------------------


    USE ModuleThermoIO
    USE ModuleThermo 

    implicit none
                
        
    ! Initialize variables:
    dTemperature            = 2000D0
    dPressure               = 1D0
    cInputUnitTemperature   = 'K'    
    cInputUnitPressure      = 'atm'
    cInputUnitMass          = 'moles'
    cThermoFileName         = '../data/C-O.dat'


    ! Parse the ChemSage data-file:
    call ParseCSDataFile(cThermoFileName)
        
    ! Call Thermochimica:
    call Thermochimica
                                                                             
    if (INFOThermo == 5) then
        ! The unit test passed: the correct error code was reported and exited gracefully.
        print *, 'TestThermo06: PASS'
    else
        ! The unit test failed.
        print *, 'TestThermo06: FAIL <---'
    end if
    
    ! Reset Thermochimica:
    call ResetThermo
    
end program TestThermo06
