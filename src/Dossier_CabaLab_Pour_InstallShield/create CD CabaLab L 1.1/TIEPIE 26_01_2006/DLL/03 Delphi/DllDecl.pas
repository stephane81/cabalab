unit DllDecl;
{* DESCRIPTION
 *   This unit contains all definitions and declarations that are required
 *   to use a TiePie instrument in a Delphi application.
 *   This is a universal unit, therefor it may contain definitions and declarations
 *   that are not supported by the instrument you are writing software for.
 *   Using these will be handled properly by the dll and should not cause problems
 * NOTE
 *   Despite the care taken to generate the dll's and the accomanying files,
 *   TiePie engineering can not be held responsible for any damage as a result of using
 *   the dll's and the accompanying source files.
 * COPYRIGHT
 *   TiePie engineering
 *}
interface

uses Windows;

const
     {*
      * Return codes = bit values -> usualy an error
      *}
      E_NO_ERRORS       = $0000;       { 0000 0000 0000 0000 }
      E_NO_HARDWARE     = $0001;       { 0000 0000 0000 0001 }
      E_NOT_INITIALIZED = $0002;       { 0000 0000 0000 0010 }
      E_NOT_SUPPORTED   = $0004;       { 0000 0000 0000 0100 }
      E_NO_GENERATOR    = $0008;       { 0000 0000 0000 1000 }
      E_INVALID_CHANNEL = $0010;       { 0000 0000 0001 0000 }
      E_INVALID_VALUE   = $0020;       { 0000 0000 0010 0000 }
     {*
      * Other useful constants
      *
      * Channel constants
      * DO NOT USE FOR Get/SetMeasureMode !!!
      *}
      lCh1              = 1;
      lCh2              = 2;
      lCh3              = 3;
      lCh4              = 4;
     {*
      * Measure mode constants
      * To measure more than one channel, simply add the required sonsts together: mCh1 + mCh2
      *}
      mCh1              = 1;
      mCh2              = 2;
      mCh3              = 4;
      mCh4              = 8;
      mCh12             = 3;
     {*
      * Coupling constants
      *}
      lctAC             = 0;
      lctDC             = 1;
     {*
      * Trigger mode constants
      *}
      ltkRising         =  0; { Trigger when signal passes level in positive direction       }
      ltkFalling        =  1; { Trigger when signal passes level in negative direction       }
      ltkInWindow       =  2; { Trigger when signal gets inside marked window                }
      ltkOutWindow      =  3; { Trigger when signal gets outside marked window               }
      ltkTVLine         =  4; { Trigger at TV line sync pulse                                }
      ltkTVFieldOdd     =  5; { Trigger at Odd TV field sync pulse                           }
      ltkTVFieldEven    =  6; { Trigger at Even TV field sync pulse                          }
     {*
      * Trigger source constants
      *}
      ltsCh1            = 0;
      ltsCh2            = 1;
      ltsCh3            = 2;
      ltsCh4            = 3;
      ltsExternal       = 4;
      ltsAnaExt         = 5;
      ltsAnd            = 6;
      ltsOr             = 7;
      ltsXor            = 8;
      ltsNoTrig         = 9;
      ltsNeverTrig      = 10;  { not used }
      ltsPxiExt         = 11;
      ltsGenStart       = 12;
      ltsGenStop        = 13;
      ltsGenNew         = 14;
     {*
      * function generator signal type constants
      *}
      lstSine           = 0;
      lstTriangle       = 1;
      lstSquare         = 2;
      lstDC             = 3;
      lstNoise          = 4;
      lstarbitrary      = 5;
     {*
      * Transfer mode constants
      *}
      tmBlock             = 0;
      tmStream            = 1;
     {*
      * Event message identifiers
      *}
      DLLTransUpDate      = 1;
      DLLTransReady       = 2;


type  ERROR      = word;
      DArray     = array[0..{131092}512 * 1024] of double;
      PDArray    = ^DArray;
      PDouble    = ^Double;
      Pbyte      = ^byte;
      PWord      = ^word;
      PDword     = ^dword;
      TWArray    = array [0..{131092}512 * 1024] of word;
      TWArray2   = array [0..{131092}512 * 1024] of word;
      PTWArray   = ^TWArray;
      PTDarray   = ^DArray;
      TInfoArray = array[0..19] of double;
      PInfoArray = ^TInfoArray;
     {*
      * Function prototypes
      *
      * Open / Close the instrument
      *}
      TInitInstrument            = function( wAddress       : word                                        ) : ERROR; stdcall; { initializes instrument                     }
      TExitInstrument            = function                                                                 : ERROR; stdcall; { gives resources free from instrument       }
     {*
      * Get information about my instrument
      *}
      TGetCalibrationDate        = function( dwDate         : PDWord                                      ) : ERROR; stdcall; { Gives cal date                             }
      TGetSerialNumber           = function( dwNumber       : PDWord                                      ) : ERROR; stdcall; { Gives Serial Number                        }
      TGetAvailableSensitivities = function( dSensitivities : PInfoArray                                  ) : ERROR; stdcall;
      TGetAvailableResolutions   = function( dResolutions   : PInfoArray                                  ) : ERROR; stdcall;
      TGetMaxSampleFrequency     = function                                                                 : dword; stdcall; { gets the max samplefrequency from a device }
      TGetMaxRecordLength        = function                                                                 : dword; stdcall; { gets the maximum record length             }
      TGetDCLevelStatus          = function                                                                 : dword; stdcall;
      TGetSquareWaveGenStatus    = function                                                                 : ERROR; stdcall;
      TGetFunctionGenStatus      = function                                                                 : ERROR; stdcall;
      TGetFuncGenMaxAmplitude    = function( dAmplitude     : PDouble                                     ) : ERROR; stdcall;
      TGetNrChannels             = function( wValue         : PWord                                       ) : ERROR; stdcall;
     {*
      * Controlling the input resolution
      *}
      TSetResolution             = function( byValue        : byte                                        ) : ERROR; stdcall;
      TGetResolution             = function( byValue        : PByte                                       ) : ERROR; stdcall;
     {*
      * Control which channels are measured
      *}
      TGetMeasureMode            = function( byMode      : Pbyte                                          ) : ERROR; stdcall; { gets the measuremode                       }
      TSetMeasureMode            = function( byMode      : byte                                           ) : ERROR; stdcall; { Sets the measuremode                       }
     {*
      * Perform a measurement
      *}
      TStartMeasurement          = function                                                                 : ERROR; stdcall; { Starts measurement                         }
     {*
      * Retrieve the measured data
      *}
      TGetMeasurement            = function( dCh1        : PDouble; dCh2        : PDouble                 ) : ERROR; stdcall; { gets the measured data (continuously       }
      TGetOneMeasurement         = function( dIndex      : dword;   dCh1        : PDouble; dCh2 : PDouble ) : ERROR; stdcall; { gets the measured data (one shot)          }
      TGetMeasurementRaw         = function( wCh1        : PWord;   wCh2        : PWord                   ) : ERROR; stdcall;
      TGetOneMeasurementRaw      = function( dIndex      : dword;   wCh1        : PWord;   wCh2 : PWord   ) : ERROR; stdcall;
      TGetDigitalInputValues     = function( wValues     : PWord                                          ) : ERROR; stdcall; { gets the measured digital input data       }
      TGetOneDigitalValue        = function( wIndex      : dword;   wValue      : PWord                   ) : ERROR; stdcall; { gets one measured digital input sample     }
     {*
      * Advanced measurement routines
      *}
      TADC_Start                 = function                                                                 : ERROR; stdcall;
      TADC_Running               = function                                                                 : word;  stdcall;
      TADC_Abort                 = function                                                                 : ERROR; stdcall;
      TADC_ForceTrig             = function                                                                 : ERROR; stdcall;
      TADC_Triggered             = function                                                                 : word;  stdcall;
      TADC_Ready                 = function                                                                 : word;  stdcall;
      TADC_GetData               = function( wCh1 : PTWArray; wCh2  : PTWArray                            ) : ERROR; stdcall;
      TADC_GetDataVolt           = function( dCh1 : PTDArray; dCh2  : PTDArray                            ) : ERROR; stdcall;
      TADC_GetDataCh             = function( wCh  : PTWArray; wData : PTWArray                            ) : ERROR; stdcall;
      TADC_GetDataVoltCh         = function( wCh  : PTDArray; dData : PTDArray                            ) : ERROR; stdcall;
     {*
      * Streaming measurements
      *}
      TSetReceiverHandle         = function( Handle      : HWND                                           ) : ERROR; stdcall;
      TGetMessageID              = function( dwMessage   : dword;   dwIdentifier : Pdword                 ) : ERROR; stdcall;
      TSetTransferMode           = function( dwMode      : dword                                          ) : ERROR; stdcall;
      TGetTransferMode           = function( dwMode      : Pdword                                         ) : ERROR; stdcall;
     {*
      * Control the time base
      *}
      TGetRecordLength           = function                                                                 : dword; stdcall; { Gets the recordlength                      }
      TSetRecordLength           = function( dTotal      : dword                                          ) : ERROR; stdcall; { Sets The recordlength                      }
      TGetPostSamples            = function                                                                 : dword; stdcall; { Gets the postsamples at that moment        }
      TSetPostSamples            = function( dPost       : dword                                          ) : ERROR; stdcall; { Sets the postsamples                       }
      TGetSampleFrequency        = function                                                                 : dword; stdcall; { gets The sample frequency                  }
      TSetSampleFrequency        = function( dFreq       : Pdword                                         ) : ERROR; stdcall; { sets the sample frequency                  }
      TGetExternalClock          = function( wMode       : PWord                                          ) : ERROR; stdcall;
      TSetExternalClock          = function( wMode       : Word                                           ) : ERROR; stdcall;
     {*
      * Control the analog input channels
      *}
      TGetSensitivity            = function( byCh        : byte;    dSens       : PDouble                 ) : ERROR; stdcall; { gets the sensitivity of a channel          }
      TSetSensitivity            = function( byCh        : byte;    dSens       : PDouble                 ) : ERROR; stdcall; { sets the sensitivity of a channel          }
      TGetAutoRanging            = function( byCh        : byte;    byMode      : Pbyte                   ) : ERROR; stdcall; { gets autoranging value for a channel       }
      TSetAutoRanging            = function( byCh        : byte;    byMode      : byte                    ) : ERROR; stdcall; { sets the autoranging value for a channel   }
      TGetCoupling               = function( byCh        : byte;    byMode      : Pbyte                   ) : ERROR; stdcall; { get the coupling AC or DC for a channel    }
      TSetCoupling               = function( byCh        : byte;    byMode      : byte                    ) : ERROR; stdcall; { set the Coupling AC or DC for a channel    }
      TGetDcLevel                = function( byCh        : byte;    dLevel      : PDouble                 ) : ERROR; stdcall; { Gets the DC level value for a channel      }
      TSetDcLevel                = function( byCh        : byte;    dLevel      : double                  ) : ERROR; stdcall; { Sets the DC level value for a channel      }
     {*
      * Control the trigger system
      *}
      TGetTriggerSource          = function( bySource    : pbyte                                          ) : ERROR; stdcall; { gets the trigger source                    }
      TSetTriggerSource          = function( bysource    : byte                                           ) : ERROR; stdcall; { sets the trigger source                    }
      TGetTriggerMode            = function( byMode      : pByte                                          ) : ERROR; stdcall; { Gets the slope for a channel               }
      TSetTriggerMode            = function( byMode      : Byte                                           ) : ERROR; stdcall; { Sets The slope for a channel               }
      TGetTriggerLevel           = function( byCh        : byte;    dLevel      : PDouble                 ) : ERROR; stdcall; { gets trigger level for a channel           }
      TSetTriggerLevel           = function( byCh        : byte;    dLevel      : double                  ) : ERROR; stdcall; { sets trigger level for a channel           }
      TGetTriggerHys             = function( byCh        : byte;    dHysteresis : PDouble                 ) : ERROR; stdcall; { gets trigger hysteresis                    }
      TSetTriggerHys             = function( byCh        : byte;    dHysteresis : double                  ) : ERROR; stdcall; { sets trigger hysteresis                    }
      TGetPXITriggerSlopes       = function( bySlopes    : pbyte                                          ) : ERROR; stdcall;
      TSetPXITriggerSlopes       = function( bySlopes    : byte                                           ) : ERROR; stdcall;
      TGetPXITriggerEnables      = function( byEnables   : pbyte                                          ) : ERROR; stdcall;
      TSetPXITriggerEnables      = function( byEnables   : byte                                           ) : ERROR; stdcall;
      TGetTriggerTimeOut         = function                                                                 : dword; stdcall; { gets the trigger time out                  }
      TSetTriggerTimeOut         = function( lTimeout    : dword                                          ) : ERROR; stdcall; { sets trigger time out                      }
     {*
      * Control the digital outputs
      *}
      TSetDigitalOutputs         = function( byValue     : byte                                           ) : ERROR; stdcall; {  sets the digital outputs                  }
      TGetDigitalOutputs         = function( byValue     : pbyte                                          ) : ERROR; stdcall; {  sets the digital outputs                  }
     {*
      * Control the Square Wave Generator
      *}
      TSetSquareWaveGenFrequency = function( dFreq       : PDword                                         ) : ERROR; stdcall; { set generator frequency                    }
      TGetSquareWaveGenFrequency = function                                                                 : dword; stdcall; { get generator frequency                    }
     {*
      * Control the Arbitrary Waveform Generator
      *}
      TGetFuncGenFrequency       = function( rValue      : pdouble                                        ) : ERROR; stdcall;
      TSetFuncGenFrequency       = function( rValue      : pdouble                                        ) : ERROR; stdcall;
      TGetFuncGenAmplitude       = function( rValue      : pdouble                                        ) : ERROR; stdcall;
      TSetFuncGenAmplitude       = function( rValue      : double                                         ) : ERROR; stdcall;
      TGetFuncGenSignalType      = function( wValue      : pword                                          ) : ERROR; stdcall;
      TSetFuncGenSignalType      = function( wValue      : word                                           ) : ERROR; stdcall;
      TGetFuncGenDCOffset        = function( rValue      : pdouble                                        ) : ERROR; stdcall;
      TSetFuncGenDCOffset        = function( rValue      : double                                         ) : ERROR; stdcall;
      TGetFuncGenSymmetry        = function( rValue      : pdouble                                        ) : ERROR; stdcall;
      TSetFuncGenSymmetry        = function( rValue      : double                                         ) : ERROR; stdcall;
      TGetFuncGenOutputOn        = function( wValue      : pword                                          ) : ERROR; stdcall;
      TSetFuncGenOutputOn        = function( wValue      : word                                           ) : ERROR; stdcall;
      TFillFuncGenMemory         = function( dwNrSamples : dword;   FuncGenData : pword                   ) : ERROR; stdcall;
      TFuncGenBurst              = function( wNrPeriods  : word                                           ) : ERROR; stdcall;
      TSetFuncGenTrigSource      = function( byValue     : byte                                           ) : ERROR; stdcall;
      TGetFuncGenTrigSource      = function( byValue     : pbyte                                          ) : ERROR; stdcall;
     {*
      * Customer specific routines
      *}
      TSetMotorOn                = function( byMotor1    : byte;    byMotor2    : byte                    ) : ERROR; stdcall;
      TSetDAC1451                = function( dMotor1     : double;  dMotor2     : double                  ) : ERROR; stdcall;

      TSetActiveHS2              = function( byActiveHS2 : byte                                           ) : ERROR; stdcall;
      TGetActiveHS2              = function( byActiveHS2 : PByte                                          ) : ERROR; stdcall;

      TSetInstrConfig            = function( wMode       : word                                           ) : dword; stdcall;

      TSetupOhmMeasurements      = function( wMode       : word                                           ) : dword; stdcall;
      TGetOhmValues              = function( dValue1     : pdouble; dValue2     : pdouble                 ) : dword; stdcall;

var   Ch1DoubleArray            : DArray;
      Ch2DoubleArray            : DArray;

      Ch1WordArray              : TWArray;
      Ch2WordArray              : TWArray;
      DigitalArray              : TWArray;
      FuncGenArray              : TWArray2;

      DllHandle                 : THandle;

      WM_TRANS_UPDATE           : dword = 0;
      WM_TRANS_READY            : dword = 0;

      InitInstrument            : TInitInstrument;
      ExitInstrument            : TExitInstrument;

      GetCalibrationDate        : TGetCalibrationDate;
      GetSerialNumber           : TGetSerialNumber;
      GetMaxSampleFrequency     : TGetMaxSampleFrequency;
      GetMaxRecordLength        : TGetMaxRecordLength;
      GetDCLevelStatus          : TGetDCLevelStatus;
      GetSquareWaveGenStatus    : TGetSquareWaveGenStatus;
      GetFunctionGenStatus      : TGetFunctionGenStatus;
      GetAvailableResolutions   : TGetAvailableResolutions;
      GetAvailableSensitivities : TGetAvailableSensitivities;
      GetNrChannels             : TGetNrChannels;

      StartMeasurement          : TStartMeasurement;

      GetMeasurement            : TGetMeasurement;
      GetOneMeasurement         : TGetOneMeasurement;
      GetMeasurementRaw         : TGetMeasurementRaw;
      GetOneMeasurementRaw      : TGetOneMeasurementRaw;

      GetMeasureMode            : TGetMeasureMode;
      SetMeasureMode            : TSetMeasureMode;

      GetRecordLength           : TGetRecordLength;
      SetRecordLength           : TSetRecordLength;
      GetPostSamples            : TGetPostSamples;
      SetPostSamples            : TSetPostSamples;
      GetSampleFrequency        : TGetSampleFrequency;
      SetSampleFrequency        : TSetSampleFrequency;

      GetExternalClock          : TGetExternalClock;
      SetExternalClock          : TSetExternalClock;

      GetSensitivity            : TGetSensitivity;
      SetSensitivity            : TSetSensitivity;
      GetAutoRanging            : TGetAutoRanging;
      SetAutoRanging            : TSetAutoranging;
      GetCoupling               : TGetCoupling;
      SetCoupling               : TSetCoupling;
      GetDcLevel                : TGetDcLevel;
      SetDcLevel                : TSetDcLevel;

      GetTriggerSource          : TGetTriggerSource;
      SetTriggerSource          : TSetTriggerSource;
      GetTriggerMode            : TGetTriggerMode;
      SetTriggerMode            : TSetTriggerMode;
      GetTriggerLevel           : TGetTriggerLevel;
      SetTriggerLevel           : TSetTriggerLevel;
      GetTriggerHys             : TGetTriggerHys;
      SetTriggerHys             : TSetTriggerHys;
      GetPXITriggerSlopes       : TGetPXITriggerSlopes;
      SetPXITriggerSlopes       : TSetPXITriggerSlopes;
      GetPXITriggerEnables      : TGetPXITriggerEnables;
      SetPXITriggerEnables      : TSetPXITriggerEnables;
      GetTriggerTimeOut         : TGetTriggerTimeOut;
      SetTriggerTimeOut         : TSetTRiggerTimeOut;

      GetSquareWaveGenFrequency : TGetSquareWaveGenFrequency;
      SetSquareWaveGenFrequency : TSetSquareWaveGenFrequency;

      GetFuncGenFrequency       : TGetFuncGenFrequency;
      SetFuncGenFrequency       : TSetFuncGenFrequency;
      GetFuncGenAmplitude       : TGetFuncGenAmplitude;
      SetFuncGenAmplitude       : TSetFuncGenAmplitude;
      GetFuncGenSignalType      : TGetFuncGenSignalType;
      SetFuncGenSignalType      : TSetFuncGenSignalType;
      GetFuncGenDCOffset        : TGetFuncGenDCOffset;
      SetFuncGenDCOffset        : TSetFuncGenDCOffset;
      GetFuncGenSymmetry        : TGetFuncGenSymmetry;
      SetFuncGenSymmetry        : TSetFuncGenSymmetry;
      GetFuncGenOutputOn        : TGetFuncGenOutputOn;
      SetFuncGenOutputOn        : TSetFuncGenOutputOn;
      FillFuncGenMemory         : TFillFuncGenMemory;
      FuncGenBurst              : TFuncGenBurst;
      SetFuncGenTrigSource      : TSetFuncGenTrigSource;
      GetFuncGenTrigSource      : TGetFuncGenTrigSource;

      GetActiveHS2              : TGetActiveHS2;
      SetActiveHS2              : TSetActiveHS2;
      SetMotorOn                : TSetMotorOn;
      SetDAC1451                : TSetDAC1451;

      SetDigitalOutputs         : TSetDigitalOutputs;
      GetDigitalInputValues     : TGetDigitalInputValues;
      GetOneDigitalValue        : TGetOneDigitalValue;

      ADC_Start                 : TADC_Start;
      ADC_Running               : TADC_Running;
      ADC_Abort                 : TADC_Abort;
      ADC_ForceTrig             : TADC_ForceTrig;
      ADC_Triggered             : TADC_Triggered;
      ADC_Ready                 : TADC_Ready;
      ADC_GetData               : TADC_GetData;
      ADC_GetDataVolt           : TADC_GetDataVolt;
      ADC_GetDataCh             : TADC_GetDataCh;
      ADC_GetDataVoltCh         : TADC_GetDataVoltCh;

      SetResolution             : TSetResolution;
      GetResolution             : TGetResolution;

      SetInstrConfig            : TSetInstrConfig;

      SetupOhmMeasurements      : TSetupOhmMeasurements;
      GetOhmValues              : TGetOhmValues;

      SetReceiverHandle         : TSetReceiverHandle;
      GetMessageID              : TGetMessageID;
      SetTransferMode           : TSetTransferMode;
      GetTransferMode           : TGetTransferMode;


procedure RetrieveAllProcAddresses;
procedure NilAllProcAddresses;


implementation


procedure RetrieveAllProcAddresses;
{* DESCRIPTION
 *   This routine gets the procedure addresses of all routines in the dll
 *   It should be called after the dll has been loaded and the global variable
 *   DLLHandle points to the proper dll.
 * INPUT
 *   -
 * OUTPUT
 *   -
 *}
begin
  @InitInstrument            := GetProcAddress( DLLHandle, 'InitInstrument'            );
  @ExitInstrument            := GetProcAddress( DLLHandle, 'ExitInstrument'            );

  @GetCalibrationDate        := GetProcAddress( DLLHandle, 'GetCalibrationDate'        );
  @GetSerialNumber           := GetProcAddress( DLLHandle, 'GetSerialNumber'           );
  @GetMaxSampleFrequency     := getprocaddress( DLLHandle, 'GetMaxSampleFrequency'     ); {}
  @GetMaxRecordLength        := GetProcAddress( DLLHandle, 'GetMaxRecordLength'        ); {}
  @GetDCLevelStatus          := GetProcAddress( DLLHandle, 'GetDCLevelStatus'          );
  @GetSquareWaveGenStatus    := getprocaddress( DLLHandle, 'GetSquareWaveGenStatus'    ); {}
  @GetFunctionGenStatus      := getprocaddress( DLLHandle, 'GetFunctionGenStatus'      ); {}
  @GetAvailableResolutions   := GetProcAddress( DLLHandle, 'GetAvailableResolutions'   );
  @GetAvailableSensitivities := GetProcAddress( DLLHandle, 'GetAvailableSensitivities' );
  @GetNrChannels             := GetProcAddress( DllHandle, 'GetNrChannels'             );

  @StartMeasurement          := getprocaddress( DLLHandle, 'StartMeasurement'          );

  @GetMeasurement            := getprocaddress( DLLHandle, 'GetMeasurement'            );
  @GetOneMeasurement         := getprocaddress( DLLHandle, 'GetOneMeasurement'         );
  @GetMeasurementRaw         := getprocaddress( DLLHandle, 'GetMeasurementRaw'         );
  @GetOneMeasurementRaw      := getprocaddress( DLLHandle, 'GetOneMeasurementRaw'      );

  @GetMeasureMode            := getprocaddress( DLLHandle, 'GetMeasureMode'            );
  @SetMeasureMode            := getprocaddress( DLLHandle, 'SetMeasureMode'            );

  @GetRecordLength           := getprocaddress( DLLHandle, 'GetRecordLength'           );
  @SetRecordLength           := getprocaddress( DLLHandle, 'SetRecordLength'           );
  @GetPostSamples            := getprocaddress( DLLHandle, 'GetPostSamples'            );
  @SetPostSamples            := getprocaddress( DLLHandle, 'SetPostSamples'            );
  @GetSampleFrequency        := getprocaddress( DLLHandle, 'GetSampleFrequency'        ); {}
  @SetSampleFrequency        := getprocaddress( DLLHandle, 'SetSampleFrequency'        ); {}

  @GetExternalClock          := getprocaddress( DLLHandle, 'GetExternalClock'          );
  @SetExternalClock          := getprocaddress( DLLHandle, 'SetExternalClock'          );

  @GetSensitivity            := getprocaddress( DLLHandle, 'GetSensitivity'            );
  @SetSensitivity            := getprocaddress( DLLHandle, 'SetSensitivity'            );
  @GetAutoRanging            := getprocaddress( DLLHandle, 'GetAutoRanging'            );
  @SetAutoRanging            := getprocaddress( DLLHandle, 'SetAutoRanging'            );
  @GetCoupling               := getprocaddress( DLLHandle, 'GetCoupling'               );
  @SetCoupling               := getprocaddress( DLLHandle, 'SetCoupling'               );
  @GetDcLevel                := getprocaddress( DLLHandle, 'GetDcLevel'                );
  @SetDcLevel                := getprocaddress( DLLHandle, 'SetDcLevel'                );

  @GetTriggerSource          := getprocaddress( DLLHandle, 'GetTriggerSource'          );
  @SetTriggerSource          := getprocaddress( DLLHandle, 'SetTriggerSource'          );
  @GetTriggerMode            := getprocaddress( DLLHandle, 'GetTriggerMode'            );
  @SetTriggerMode            := getprocaddress( DLLHandle, 'SetTriggerMode'            );
  @GetTriggerLevel           := getprocaddress( DLLHandle, 'GetTriggerLevel'           );
  @SetTriggerLevel           := getprocaddress( DLLHandle, 'SetTriggerLevel'           );
  @GetTriggerHys             := getprocaddress( DLLHandle, 'GetTriggerHys'             );
  @SetTriggerHys             := getprocaddress( DLLHandle, 'SetTriggerHys'             );
  @GetPXITriggerSlopes       := getprocaddress( DLLHandle, 'GetPXITriggerSlopes'       );
  @SetPXITriggerSlopes       := getprocaddress( DLLHandle, 'SetPXITriggerSlopes'       );
  @GetPXITriggerEnables      := getprocaddress( DLLHandle, 'GetPXITriggerEnables'      );
  @SetPXITriggerEnables      := getprocaddress( DLLHandle, 'SetPXITriggerEnables'      );
  @GetTriggerTimeOut         := getprocaddress( DLLHandle, 'GetTriggerTimeOut'         );
  @SetTriggerTimeOut         := getprocaddress( DLLHandle, 'SetTriggerTimeOut'         );

  @GetSquareWaveGenFrequency := getprocaddress( DLLHandle, 'GetSquareWaveGenFrequency' ); {}
  @SetSquareWaveGenFrequency := getprocaddress( DLLHandle, 'SetSquareWaveGenFrequency' ); {}

  @GetFuncGenFrequency       := getprocaddress( DLLHandle, 'GetFuncGenFrequency'       );
  @SetFuncGenFrequency       := getprocaddress( DLLHandle, 'SetFuncGenFrequency'       );
  @GetFuncGenAmplitude       := getprocaddress( DLLHandle, 'GetFuncGenAmplitude'       );
  @SetFuncGenAmplitude       := getprocaddress( DLLHandle, 'SetFuncGenAmplitude'       );
  @GetFuncGenSignalType      := getprocaddress( DLLHandle, 'GetFuncGenSignalType'      );
  @SetFuncGenSignalType      := getprocaddress( DLLHandle, 'SetFuncGenSignalType'      );
  @GetFuncGenDCOffset        := getprocaddress( DLLHandle, 'GetFuncGenDCOffset'        );
  @SetFuncGenDCOffset        := getprocaddress( DLLHandle, 'SetFuncGenDCOffset'        );
  @GetFuncGenSymmetry        := getprocaddress( DLLHandle, 'GetFuncGenSymmetry'        );
  @SetFuncGenSymmetry        := getprocaddress( DLLHandle, 'SetFuncGenSymmetry'        );
  @GetFuncGenOutputOn        := getprocaddress( DLLHandle, 'GetFuncGenOutputOn'        );
  @SetFuncGenOutputOn        := getprocaddress( DLLHandle, 'SetFuncGenOutputOn'        );
  @FillFuncGenMemory         := getprocaddress( DLLHandle, 'FillFuncGenMemory'         );
  @FuncGenBurst              := getprocaddress( DLLHandle, 'FuncGenBurst'              );
  @SetFuncGenTrigSource      := getprocaddress( DLLHandle, 'TSetFuncGenTrigSource'     );
  @GetFuncGenTrigSource      := getprocaddress( DLLHandle, 'TGetFuncGenTrigSource'     );
 {*
  * Special Handyscope 2 only
  *}
  @GetActiveHS2              := GetProcAddress( DllHandle, 'GetActiveHS2'              );
  @SetActiveHS2              := GetProcAddress( DllHandle, 'SetActiveHS2'              );
  @SetDAC1451                := GetProcAddress( DllHandle, 'SetDAC1451'                );
  @SetMotorOn                := GetProcAddress( DllHandle, 'SetMotorOn'                );

 {*
  * TP112 only
  *}
  @SetDigitalOutputs         := GetProcAddress( DllHandle, 'SetDigitalOutputs'         );
  @GetDigitalInputValues     := GetProcAddress( DllHandle, 'GetDigitalInputValues'     );
  @GetOneDigitalValue        := GetProcAddress( DllHandle, 'GetOneDigitalValue'        );

  @ADC_Start                 := GetProcAddress( DllHandle, 'ADC_Start'                 );
  @ADC_Running               := GetProcAddress( DllHandle, 'ADC_Running'               );
  @ADC_Abort                 := GetProcAddress( DllHandle, 'ADC_Abort'                 );
  @ADC_ForceTrig             := GetProcAddress( DllHandle, 'ADC_ForceTrig'             );
  @ADC_Triggered             := GetProcAddress( DllHandle, 'ADC_Triggered'             );
  @ADC_Ready                 := GetProcAddress( DllHandle, 'ADC_Ready'                 );
  @ADC_GetData               := GetProcAddress( DllHandle, 'ADC_GetData'               );
  @ADC_GetDataVolt           := GetProcAddress( DllHandle, 'ADC_GetDataVolt'           );
  @ADC_GetDataCh             := GetProcAddress( DllHandle, 'ADC_GetDataCh'             );
  @ADC_GetDataVoltCh         := GetProcAddress( DllHandle, 'ADC_GetDataVoltCh'         );

  @SetResolution             := GetProcAddress( DllHandle, 'SetResolution'             );
  @GetResolution             := GetProcAddress( DllHandle, 'GetResolution'             );

  @SetInstrConfig            := GetProcAddress( DllHandle, 'SetInstrumentConfig'       );

  @SetupOhmMeasurements      := GetProcAddress( DllHandle, 'SetupOhmMeasurements'      );
  @GetOhmValues              := GetProcAddress( DllHandle, 'GetOhmValues'              );

  @SetReceiverHandle         := GetProcAddress( DllHandle, 'SetReceiverHandle'         );
  @GetMessageID              := GetProcAddress( DllHandle, 'GetMessageID'              );
  @SetTransferMode           := GetProcAddress( DllHandle, 'SetTransferMode'           );
  @GetTransferMode           := GetProcAddress( DllHandle, 'GetTransferMode'           );
end; { RetrieveAllProcAddresses }



procedure NilAllProcAddresses;
{* DESCRIPTION
 *   This routine is used to clear procedure addresses from the routines in the dll.
 * INPUT
 *   -
 * OUTPUT
 *   -
 *}
begin
  @InitInstrument            := nil;
  @ExitInstrument            := nil;

  @GetCalibrationDate        := nil;
  @GetSerialNumber           := nil;
  @GetMaxSampleFrequency     := nil;
  @GetMaxRecordLength        := nil;
  @GetDCLevelStatus          := nil;
  @GetSquareWaveGenStatus    := nil;
  @GetFunctionGenStatus      := nil;
  @GetAvailableResolutions   := nil;
  @GetAvailableSensitivities := nil;
  @GetNrChannels             := nil;

  @StartMeasurement          := nil;

  @GetMeasurement            := nil;
  @GetOneMeasurement         := nil;
  @GetMeasurementRaw         := nil;
  @GetOneMeasurementRaw      := nil;

  @GetMeasureMode            := nil;
  @SetMeasureMode            := nil;

  @GetRecordLength           := nil;
  @SetRecordLength           := nil;
  @GetPostSamples            := nil;
  @SetPostSamples            := nil;
  @GetSampleFrequency        := nil;
  @SetSampleFrequency        := nil;

  @GetExternalClock          := nil;
  @SetExternalClock          := nil;

  @GetSensitivity            := nil;
  @SetSensitivity            := nil;
  @GetAutoRanging            := nil;
  @SetAutoRanging            := nil;
  @GetCoupling               := nil;
  @SetCoupling               := nil;
  @GetDcLevel                := nil;
  @SetDcLevel                := nil;

  @GetTriggerSource          := nil;
  @SetTriggerSource          := nil;
  @GetTriggerMode            := nil;
  @SetTriggerMode            := nil;
  @GetTriggerLevel           := nil;
  @SetTriggerLevel           := nil;
  @GetTriggerHys             := nil;
  @SetTriggerHys             := nil;
  @GetPXITriggerSlopes       := nil;
  @SetPXITriggerSlopes       := nil;
  @GetPXITriggerEnables      := nil;
  @SetPXITriggerEnables      := nil;
  @GetTriggerTimeOut         := nil;
  @SetTriggerTimeOut         := nil;

  @SetSquareWaveGenFrequency := nil;

  @GetFuncGenFrequency       := nil;
  @SetFuncGenFrequency       := nil;
  @GetFuncGenAmplitude       := nil;
  @SetFuncGenAmplitude       := nil;
  @GetFuncGenSignalType      := nil;
  @SetFuncGenSignalType      := nil;
  @GetFuncGenDCOffset        := nil;
  @SetFuncGenDCOffset        := nil;
  @GetFuncGenSymmetry        := nil;
  @SetFuncGenSymmetry        := nil;
  @GetFuncGenOutputOn        := nil;
  @SetFuncGenOutputOn        := nil;
  @FillFuncGenMemory         := nil;

  @SetFuncGenTrigSource      := nil;
  @GetFuncGenTrigSource      := nil;

  @GetActiveHS2              := nil;
  @SetActiveHS2              := nil;
  @SetDAC1451                := nil;
  @SetMotorOn                := nil;

  @SetDigitalOutputs         := nil;
  @GetDigitalInputValues     := nil;
  @GetOneDigitalValue        := nil;

  @ADC_Start                 := nil;
  @ADC_Running               := nil;
  @ADC_Abort                 := nil;
  @ADC_ForceTrig             := nil;
  @ADC_Triggered             := nil;
  @ADC_Ready                 := nil;
  @ADC_GetData               := nil;
  @ADC_GetDataVolt           := nil;
  @ADC_GetDataCh             := nil;
  @ADC_GetDataVoltCh         := nil;

  @SetResolution             := nil;
  @GetResolution             := nil;

  @SetInstrConfig            := nil;

  @SetupOhmMeasurements      := nil;
  @GetOhmValues              := nil;

  @SetReceiverHandle         := nil;
  @GetMessageID              := nil;
  @SetTransferMode           := nil;
  @GetTransferMode           := nil;
end; { NilAllProcAddresses }



end.

