function [drc_Band_instance] = AudioCompressor_API_Initialize(drc_Param,Fs)

    %Matlab API : Creating the system object for compression
    drc_Band_instance = compressor('Threshold',drc_Param.Threshold,'Ratio',drc_Param.comp_ratio,'KneeWidth',drc_Param.KneeWidth,'AttackTime',drc_Param.AttackTime,'ReleaseTime',drc_Param.ReleaseTime,'MakeUpGainMode','Property','SampleRate',Fs); 
    drc_Band_instance.MakeUpGain =drc_Param.MakeUpGain;
   
end

