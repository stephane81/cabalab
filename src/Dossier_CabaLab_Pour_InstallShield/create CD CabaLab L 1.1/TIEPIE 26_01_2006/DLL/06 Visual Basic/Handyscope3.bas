Attribute VB_Name = "Module1"
'
'  Return codes = bit values -> usualy an error
'
Public Const E_NO_ERRORS       = &H00
Public Const E_NO_HARDWARE     = &H01
Public Const E_NOT_SUPPORTED   = &H04
Public Const E_NOT_SUPPORTED   = &H04
Public Const E_NO_GENERATOR    = &H08
Public Const E_INVALID_CHANNEL = &H10
Public Const E_INVALID_VALUE   = &H20
'
' Measure mode Channel constants ( ONLY!!!! for setting Measure mode!!! )
'
' To measure more channels, add the required channel constants together, e.g.
'   SetMeasureMode( lCh1 + lCh2 )
'
Public Const lCh1 = 1    ' 00000001
Public Const lCh2 = 2    ' 00000010
Public Const lCh3 = 4    ' 00000100
Public Const lCh4 = 8    ' 00001000
'
' COUPLING constants
'
Public Const lctAC = 0
Public Const lctDC = 1
'
' Trigger mode constants
'
Public Const ltkRising      = 0      ' Trigger when signal passes level in positive direction       }
Public Const ltkFalling     = 1      ' Trigger when signal passes level in negative direction       }
Public Const ltkInWindow    = 2      ' Trigger when signal gets inside marked window                }
Public Const ltkOutWindow   = 3      ' Trigger when signal gets outside marked window               }
Public Const ltkTVLine      = 4      ' Trigger at TV line sync pulse                                }
Public Const ltkTVFieldOdd  = 5      ' Trigger at Odd TV field sync pulse                           }
Public Const ltkTVFieldEven = 6      ' Trigger at Even TV field sync pulse                          }
'
' Trigger source constants
'
Public Const ltsCh1       = 0
Public Const ltsCh2       = 1
Public Const ltsCh3       = 2
Public Const ltsCh4       = 3
Public Const ltsExternal  = 4
Public Const ltsAnalogExt = 5
Public Const ltsAnd       = 6
Public Const ltsOr        = 7
Public Const ltsXor       = 8
Public Const ltsNoTrig    = 9
Public Const ltsNever     = 10  ' not used
Public Const ltsPxiExt    = 11
Public Const ltsGenStart  = 12
Public Const ltsGenStop   = 13
Public Const ltsGenNew    = 14
'
' Function Generator Signal Types
'
Public Const fgSine       = 0
Public Const fgTriangle   = 1
Public Const fgSquare     = 2
Public Const fgNoise      = 3
Public Const fgDC         = 4
Public Const fgArbitrary  = 5
'
'
'
Public Const tmBlock      = 0
Public Const tmStream     = 1
'
' Event message identifiers
'
Public Const DLLTransUpDate = 1
Public Const DLLTransReady  = 2


'
' Open / Close the instrument
'
Public Declare Function InitInstrument            Lib "hs3.dll" ( ByVal wAddress As Integer                                           ) As Integer
Public Declare Function ExitInstrument            Lib "hs3.dll" (                                                                     ) As Integer
'
' Get information about my instrument
'
Public Declare Function GetCalibrationDate        Lib "hs3.dll" ( ByRef dwDate As Long                                                ) As Integer
Public Declare Function GetSerialNumber           Lib "hs3.dll" ( ByRef dwNumber As Long                                              ) As Integer
Public Declare Function GetAvailableSensitivities Lib "hs3.dll" ( ByRef dSensitivities as Double                                      ) as Integer
Public Declare Function GetAvailableResolutions   Lib "hs3.dll" ( ByRef dResolutions   as Double                                      ) as Integer
Public Declare Function GetMaxSampleFrequency     Lib "hs3.dll" (                                                                     ) As Long     
Public Declare Function GetMaxRecordLength        Lib "hs3.dll" (                                                                     ) As Long     
Public Declare Function GetDCLevelStatus          Lib "hs3.dll" (                                                                     ) As integer  
Public Declare Function GetSquareWaveGenStatus    Lib "hs3.dll" (                                                                     ) as Integer
Public Declare Function GetFunctionGenStatus      Lib "hs3.dll" (                                                                     ) as Integer
Public Declare Function GetFuncGenMaxAmplitude    Lib "hs3.dll" ( byRef dAmplitude     as Double                                      ) as Integer
Public Declare Function GetNrChannels             Lib "hs3.dll" ( byRef wNrChannels    as word                                        ) as Integer
'
' Controlling the input resolution
'
Public Declare Function SetResolution             Lib "hs3.dll" ( ByVal byValue as Byte                                               ) As Integer
Public Declare Function GetResolution             Lib "hs3.dll" ( ByRef byValue as Byte                                               ) As Integer
'
' Control which channels are measured
'
Public Declare Function GetMeasureMode            Lib "hs3.dll" ( ByRef byMode As Byte                                                ) As Integer  'see predefined consts
Public Declare Function SetMeasureMode            Lib "hs3.dll" ( ByVal byMode As Byte                                                ) As Integer  
'
' Perform a measurement
'
Public Declare Function StartMeasurement          Lib "hs3.dll" (                                                                     ) As Integer  
'
' Retrieve the measured data
'
Public Declare Function GetMeasurement            Lib "hs3.dll" (                        ByRef dCh1 As PDouble, ByRef dCh2 As Double  ) As Integer  
Public Declare Function GetOneMeasurement         Lib "hs3.dll" ( ByVal dwIndex As Long, ByRef dCh1 As Double,  ByRef dCh2 As Double  ) As Integer
Public Declare Function GetMeasurementRaw         Lib "hs3.dll" (                        ByRef wCh1 As Integer, ByRef wCh2 As Integer ) As Integer
Public Declare Function GetOneMeasurementRaw      Lib "hs3.dll" ( ByVal dwIndex As Long, ByRef wCh1 As Integer, ByRef wCh2 As Integer ) As Integer
Public Declare Function GetDigitalInputValues     Lib "hs3.dll" (                        ByRef wValues as Integer                     ) As Integer  
Public Declare Function GetOneDigitalValue        Lib "hs3.dll" ( ByVal dwIndex As Long, ByRef wValue  as Integer                     ) As Integer  
'
' Advanced measurement routines
'                                               
Public Declare Function ADC_Start                 Lib "hs3.dll" (                                                                     ) As Integer
Public Declare Function ADC_Running               Lib "hs3.dll" (                                                                     ) As Integer
Public Declare Function ADC_Abort                 Lib "hs3.dll" (                                                                     ) As Integer
Public Declare Function ADC_ForceTrig             Lib "hs3.dll" (                                                                     ) As Integer
Public Declare Function ADC_Triggered             Lib "hs3.dll" (                                                                     ) As Integer
Public Declare Function ADC_Ready                 Lib "hs3.dll" (                                                                     ) As Integer
Public Declare Function ADC_GetData               Lib "hs3.dll" ( ByRef wCh1 As Integer, ByRef wCh2 As Integer                        ) As Integer
Public Declare Function ADC_GetDataVolt           Lib "hs3.dll" ( ByRef dCh1 As Double,  ByRef dCh2 As Double                         ) As Integer
Public Declare Function ADC_GetDataCh             Lib "hs3.dll" ( ByVal wCh  As Integer, ByRef wData As Integer                       ) As Integer
Public Declare Function ADC_GetDataVoltCh         Lib "hs3.dll" ( ByVal wCh  As Integer, ByRef dData As Double                        ) As Integer'
'
' streaming measurements
'
'Public Declare Function SetReceiverHandle         Lib "hs3.dll" ( ByVal Handle As HWND                                                ) as Integer
Public Declare Function GetMessageID              Lib "hs3.dll" ( ByVal dwMessage As Long, ByRef dwIdentifier As Long                 ) as Integer
Public Declare Function SetTransferMode           Lib "hs3.dll" ( ByVal dwMode As Long                                                ) as Integer
Public Declare Function GetTransferMode           Lib "hs3.dll" ( ByRef dwMode As Long                                                ) as Integer
'
' Control the time base
'
Public Declare Function GetRecordLength           Lib "hs3.dll" (                                                                     ) As Long     
Public Declare Function SetRecordLength           Lib "hs3.dll" ( ByVal dTotal As Long                                                ) As Integer  
Public Declare Function GetPostSamples            Lib "hs3.dll" (                                                                     ) As Long     
Public Declare Function SetPostSamples            Lib "hs3.dll" ( ByVal dPost As Long                                                 ) As Integer  
Public Declare Function GetSampleFrequency        Lib "hs3.dll" (                                                                     ) As Long     
Public Declare Function SetSampleFrequency        Lib "hs3.dll" ( ByRef dwFreq As Long                                                ) As Integer  
Public Declare Function GetExternalClock          Lib "hs3.dll" ( ByRef wMode As Integer                                              ) As Integer
Public Declare Function SetExternalClock          Lib "hs3.dll" ( ByVal wMode As Integer                                              ) As Integer
'
' Control the analog input channels
'
Public Declare Function GetSensitivity            Lib "hs3.dll" ( ByVal byCh As Byte, ByRef dSens As Double                           ) As Integer  
Public Declare Function SetSensitivity            Lib "hs3.dll" ( ByVal byCh As Byte, ByRef dSens As Double                           ) As Integer  
Public Declare Function GetAutoRanging            Lib "hs3.dll" ( ByVal byCh As Byte, ByRef byMode As Byte                            ) As Integer
Public Declare Function SetAutoRanging            Lib "hs3.dll" ( ByVal byCh As Byte, ByVal byMode As Byte                            ) As Integer
Public Declare Function GetCoupling               Lib "hs3.dll" ( ByVal byCh As Byte, ByRef byMode As Byte                            ) As Integer  'see predefined consts
Public Declare Function SetCoupling               Lib "hs3.dll" ( ByVal byCh As Byte, ByVal byMode As Byte                            ) As Integer  
Public Declare Function GetDcLevel                Lib "hs3.dll" ( ByVal byCh As Byte; ByRef dLevel AsDouble                           ) As Integer  
Public Declare Function SetDcLevel                Lib "hs3.dll" ( ByVal byCh As Byte; ByVal dLevel AsDouble                           ) As Integer  
'
'Control the trigger system
'
Public Declare Function GetTriggerSource          Lib "hs3.dll" ( ByRef bySource  As Byte                                              ) As Integer  'see predefined consts
Public Declare Function SetTriggerSource          Lib "hs3.dll" ( ByVal bySource  As Byte                                              ) As Integer  
Public Declare Function GetTriggerMode            Lib "hs3.dll" ( ByRef byMode    As Byte                                              ) As Integer  'see predefined consts
Public Declare Function SetTriggerMode            Lib "hs3.dll" ( ByVal byMode    As Byte                                              ) As Integer  
Public Declare Function GetTriggerLevel           Lib "hs3.dll" ( ByVal byCh      As Byte, ByRef dLevel      As Double                 ) As Integer  
Public Declare Function SetTriggerLevel           Lib "hs3.dll" ( ByVal byCh      As Byte, ByVal dLevel      As Double                 ) As Integer  
Public Declare Function GetTriggerHys             Lib "hs3.dll" ( ByVal byCh      As Byte, ByRef dHysteresis As Double                 ) As Integer  
Public Declare Function SetTriggerHys             Lib "hs3.dll" ( ByVal byCh      As Byte, ByVal dHysteresis As Double                 ) As Integer  
Public Declare Function GetPXITriggerEnables      Lib "hs3.dll" ( ByRef byEnables As byte                                              ) As Integer 
Public Declare Function SetPXITriggerEnables      Lib "hs3.dll" ( ByVal byEnables As byte                                              ) As Integer
Public Declare Function GetPXITriggerSlopes       Lib "hs3.dll" ( ByRef bySlopes  As byte                                              ) As Integer
Public Declare Function SetPXITriggerSlopes       Lib "hs3.dll" ( ByVal bySlopes  As byte                                              ) As Integer
Public Declare Function GetTriggerTimeOut         Lib "hs3.dll" (                                                                      ) As Long     
Public Declare Function SetTriggerTimeOut         Lib "hs3.dll" ( ByVal lTimeout  As Long                                              ) As Integer  
'
' Control the digital outputs
'
Public Declare Function SetDigitalOutputs         Lib "hs3.dll" ( ByVal byValue   As Byte                                              ) As Integer
Public Declare Function GetDigitalOutputs         Lib "hs3.dll" ( ByRef byValue   As Byte                                              ) As Integer
'
' Control the Square Wave Generator
'
Public Declare Function SetSquareWaveGenFrequency Lib "hs3.dll" ( ByRef dFreq as Long                                                  ) As Integer
Public Declare Function GetSquareWaveGenFrequency Lib "hs3.dll" (                                                                      ) As Long
'
' Control the Arbitrary Waveform Generator
'
Public Declare Function SetFuncGenSignalType  Lib "hs3.dll" ( ByVal SignalType   As Integer                                            ) As Integer  ' see predefined consts
Public Declare Function GetFuncGenSignalType  Lib "hs3.dll" ( ByRef SignalType   As Integer                                            ) As Integer
Public Declare Function SetFuncGenAmplitude   Lib "hs3.dll" ( ByVal Amplitude    As Double                                             ) As Integer
Public Declare Function GetFuncGenAmplitude   Lib "hs3.dll" ( ByRef Amplitude    As Double                                             ) As Integer
Public Declare Function SetFuncGenDCOffset    Lib "hs3.dll" ( ByVal Offset       As Double                                             ) As Integer
Public Declare Function GetFuncGenDCOffset    Lib "hs3.dll" ( ByRef Offset       As Double                                             ) As Integer
Public Declare Function SetFuncGenSymmetry    Lib "hs3.dll" ( ByVal Symmetry     As Double                                             ) As Integer
Public Declare Function GetFuncGenSymmetry    Lib "hs3.dll" ( ByRef Symmetry     As Double                                             ) As Integer
Public Declare Function SetFuncGenFrequency   Lib "hs3.dll" ( ByRef Frequency    As Double                                             ) As Integer
Public Declare Function GetFuncGenFrequency   Lib "hs3.dll" ( ByRef Frequency    As Double                                             ) As Integer
Public Declare Function FillFuncGenMemory     Lib "hs3.dll" ( ByVal dwNrSamples  As Long, ByRef FuncGenData As Integer                 ) As Integer
Public Declare Function SetFuncGenOutputOn    Lib "hs3.dll" ( ByVal OutputStatus As Integer                                            ) As Integer
Public Declare Function GetFuncGenOutputOn    Lib "hs3.dll" ( ByRef OutputStatus As Integer                                            ) As Integer
Public Declare Function FuncGenBurst          Lib "hs3.dll" ( ByVal NrPeriods    As Integer                                            ) As Integer
Public Declare Function SetFuncGenTrigSource  Lib "hs3.dll" ( ByVal Source       As Byte                                               ) As Integer  ' see predefined consts
Public Declare Function GetFuncGenTrigSource  Lib "hs3.dll" ( ByRef Source       As Byte                                               ) As Integer
