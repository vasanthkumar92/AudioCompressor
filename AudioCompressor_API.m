function [drcDataOut] = AudioCompressor_API(drc_Param,drcDataIn,Fs,init)

%Global variable for drc band parameters
global  drc_Band_instance

if(init == 1)
    %AudioCompressor_API_Initialize : This API is to initialize the compressor
    %Input Parameters:
    %drc_Param : Compression Parameter object
    %Fs        : Sampling Frequency of the audio
    %Output Parameters:
    %drc_Band_instance : Object created for the compression 
    [drc_Band_instance] = AudioCompressor_API_Initialize(drc_Param,Fs);
    
    %Visualize is to plot the compressor static characteristics
     visualize(drc_Band_instance)
end

%AudioCompressor_API_Process : This API is to do the compression using the object
%Input Parameters:
%drc_Band_instance : Compressor instance
%drcDataIn         : Input samples of the audio
%Output Parameters:
%drcDataOut        : Processed output data
[drcDataOut] = AudioCompressor_API_Process(drc_Band_instance,drcDataIn);

end