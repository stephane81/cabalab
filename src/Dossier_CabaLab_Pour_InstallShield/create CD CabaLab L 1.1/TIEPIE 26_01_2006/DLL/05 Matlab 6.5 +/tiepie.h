#ifndef _tiepie
#define _tiepie

/*
 * This file contains the declarations for the low level routines
 * for the TiePie engineering instrument dll's
 */

#include <windows.h>


/*
 * declarations to match pascal-types to c-types
 */
 typedef unsigned char      byte;
 typedef unsigned int       dword;
 typedef unsigned short int word;
 typedef signed   long int  integer;

/*
 * Error-codes
 */
 #define E_NO_ERRORS        0x0000
 #define E_NO_HARDWARE      0x0001
 #define E_NOT_INITIALISED  0x0002
 #define E_NOT_SUPPORTED    0x0004
 #define E_NO_GENERATOR     0x0008
 #define E_INVALID_CHANNEL  0x0010
 #define E_INVALID_VALUE    0x0020
/*
 * channel indicators
 */
 #define Ch1                1
 #define Ch2                2
 #define Ch3                3
 #define Ch4                4
/*
 * Measure mode settings
 * When measuring more chanels, simply add the required constants together : e.g. mmCh1 + mmCh2 to measure both Ch1 and Ch2
 */
 #define mmCh1              1
 #define mmCh2              2
 #define mmCh3              4
 #define mmCh4              8
/*
 * Coupling settings
 */
 #define ctAC               0
 #define ctDC               1
/*
 * Trigger sources
 */
 #define tsCh1              0
 #define tsCh2              1
 #define tsCh3              2
 #define tsCh4              3
 #define tsExternal         4
 #define tsAnalogExt        5
 #define tsAnd              6
 #define tsOr               7
 #define tsXor              8
 #define tsNoTrig           9
 #define tsNeverTRig       10 // not used
 #define tsPxiExt          11
 #define tsGenStart        12
 #define tsGenStop         13
 #define tsGenNew          14
/*
 * Trigger modes
 */
 #define tmRising           0
 #define tmFalling          1
 #define tmInWindow         2
 #define tmOutWindow        3
 #define tmTVLine           4
 #define tmTVFrameOdd       5
 #define tmTVFrameEven      6
/*
 * Function generator signal types
 */
 #define stSine             0
 #define stTriangle         1
 #define stSquare           2
 #define stDC               3
 #define stNoise            4
 #define stArbitrary        5
/*
 * Transfer mode constants
 */
 #define tmBlock            0
 #define tmStream           1
/*
 * Event message identifiers
 */
 #define DLLTransUpDate     1
 #define DLLTransReady      2


/*
 * Declarations for functions from dynamically loaded librarie(s)
 *
 * Open / Close the instrument
 */
 extern word  InitInstrument            (word                      );
 extern word  ExitInstrument            (void                      );
/*
 * Information retrieval
 */
 extern word  GetCalibrationDate        (dword*                    );
 extern word  GetSerialNumber           (dword*                    );
 extern dword GetMaxSampleFrequency     (void                      );
 extern dword GetMaxRecordLength        (void                      );
 extern word  GetDCLevelStatus          (void                      );
 extern word  GetSquareWaveGenStatus    (void                      );
 extern word  GetFunctionGenStatus      (void                      );
 extern word  GetFuncGenMaxAmplitude    (double*                   );
 extern word  GetAvailableResolutions   (double*                   );
 extern word  GetAvailableSensitivities (double*                   );
 extern word  GetNrChannels             (word*                     );
/*
 * Controlling the input resolution
 */
 extern word  GetResolution             (byte*                     );
 extern word  SetResolution             (byte                      );
/*
 * Control which channels are measured
 */
 extern word  GetMeasureMode            (byte*                     );
 extern word  SetMeasureMode            (byte                      );
/*
 * Perform a measurement
 */
 extern word  StartMeasurement          (void                      );
/*
 * Retrieve the measured data
 */
 extern word  GetMeasurementRaw         (word*,   word*            );
 extern word  GetOneMeasurementRaw      (int,     word*,   word*   );
 extern word  GetMeasurement            (double*, double*          );
 extern word  GetOneMeasurement         (int,     double*, double* );
 extern word  GetDigitalInputValues     (word*                     );
 extern word  GetOneDigitalValue        (dword,   word*            );
/*
 * Advanced measurement routines
 */
 extern word  ADC_Start                 (void                      );
 extern word  ADC_Running               (void                      );
 extern word  ADC_Abort                 (void                      );
 extern word  ADC_Triggered             (void                      );
 extern word  ADC_Ready                 (void                      );
 extern word  ADC_ForceTrig             (void                      );
 extern word  ADC_GetData               (word*,   word*            );
 extern word  ADC_GetDataVolt           (double*, double*          );
 extern word  ADC_GetDataCh             (word,    word*            );
 extern word  ADC_GetDataVoltCh         (word,    double*          );
/*
 * streaming measurements
 */
 extern word  SetReceiverHandle         (HWND                      );
 extern word  GetMessageID              (dword,   dword*           );
 extern word  SetTransferMode           (dword                     );
 extern word  GetTransferMode           (dword*                    );
/*
 * Control the time base
 */
 extern dword GetRecordLength           (void                      );
 extern word  SetRecordLength           (dword                     );
 extern dword GetPostSamples            (void                      );
 extern word  SetPostSamples            (dword                     );
 extern dword GetSampleFrequency        (void                      );
 extern word  SetSampleFrequency        (dword*                    );
 extern word  GetExternalClock          (word*                     );
 extern word  SetExternalClock          (word                      );
/*
 * Control the analog input channels
 */
 extern word  SetSensitivity            (byte,    double*          );
 extern word  GetSensitivity            (byte,    double*          );
 extern word  GetCoupling               (byte,    byte*            );
 extern word  SetCoupling               (byte,    byte             );
 extern word  GetDcLevel                (byte,    double*          );
 extern word  SetDcLevel                (byte,    double           );
 extern word  GetAutoRanging            (byte,    byte*            );
 extern word  SetAutoRanging            (byte,    byte             );
/*
 * Control the trigger system
 */
 extern word  GetTriggerSource          (byte*                     );
 extern word  SetTriggerSource          (byte                      );
 extern word  GetTriggerMode            (byte*                     );
 extern word  SetTriggerMode            (byte                      );
 extern word  GetTriggerLevel           (byte,    double*          );
 extern word  SetTriggerLevel           (byte,    double           );
 extern word  GetTriggerHys             (byte,    double*          );
 extern word  SetTriggerHys             (byte,    double           );
 extern word  SetPXITriggerEnables      (byte                      );
 extern word  GetPXITriggerEnables      (byte*                     );
 extern word  SetPXITriggerSlopes       (byte                      );
 extern word  GetPXITriggerSlopes       (byte*                     );
 extern dword GetTriggerTimeOut         (void                      );
 extern word  SetTriggerTimeOut         (dword                     );
/*
 * Control the digital outputs
 */
 extern word  SetDigitalOutputs         (byte                      ); 
 extern word  GetDigitalOutputs         (byte*                     ); 
/*
 * Control the Square Wave Generator
 */
 extern word  SetSquareWaveGenFrequency (double*                   );
 extern word  GetSquareWaveGenFrequency (double*                   );
/*
 * Control the Arbitrary Waveform Generator
 */
 extern word  SetFuncGenSignalType      (word                      );
 extern word  GetFuncGenSignalType      (word*                     );
 extern word  SetFuncGenAmplitude       (double                    );
 extern word  GetFuncGenAmplitude       (double*                   );
 extern word  SetFuncGenDCOffset        (double                    );
 extern word  GetFuncGenDCOffset        (double*                   );
 extern word  SetFuncGenSymmetry        (double                    );
 extern word  GetFuncGenSymmetry        (double*                   );
 extern word  SetFuncGenFrequency       (double*                   );
 extern word  GetFuncGenFrequency       (double*                   );
 extern word  FillFuncGenMemory         (dword,   word*            );
 extern word  SetFuncGenOutputOn        (word                      );
 extern word  GetFuncGenOutputOn        (word*                     );
 extern word  FuncGenBurst              (word                      );
 extern word  SetFuncGenTrigSource      (byte                      );
 extern word  GetFuncGenTrigSource      (byte*                     );
/*
 * 
 */
 extern word  SetInstrumentConfig       (word                      );





#endif
