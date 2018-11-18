clc;
clear all;
close all;

Input_FileName = 'file_example_WAV_1MG_mono';

[drcDataIn_Samp,Fs] = audioread([Input_FileName '.wav']);

BLKSIZE = 256;
Length = length(drcDataIn_Samp);
inc = 1;
init = 0;
drcDataOut = [];
drcDataOut_tmp=[];

%Compression Parameters
drc_Param.Threshold = -24;
drc_Param.comp_ratio = 4;
drc_Param.AttackTime = 1e-3;
drc_Param.ReleaseTime = 10e-3;
drc_Param.KneeWidth = 0;
drc_Param.MakeUpGain = 0;


while ( (inc+BLKSIZE-1)<Length)
    init = init+1;
    frame_size = round((Length/BLKSIZE)-1);
    
    % Split the signal into frames with size as BLKSIZE
    drcDataIn = drcDataIn_Samp( inc:inc+BLKSIZE-1, : );
    
    %Audio Compressor module has main API : AudioCompressor_API
    %Input Parameters
    %drc_Param : Compression parameters 
    %drcDataIn : Input samples of the audio with size as BLKSIZE
    %Fs        : Sampling Rate of the audio 
    %init      : Initialization variable to reset the parameters
    
    %Output Parameters:
    %drcDataOut_tmp : Processed output data in temporary variable
    drcDataOut_tmp = AudioCompressor_API(drc_Param,drcDataIn,Fs,init);
    
    %Processed output data dumped into the variable
    drcDataOut( inc:inc+BLKSIZE-1, : ) = drcDataOut_tmp;
    
    %Calculating the frame count
    inc = inc+BLKSIZE;
    
    %Displaying the frame count
    fprintf('TOT framesize = %d:: current_frame = %d\n',frame_size,init);
    
end

%Writing out the output data into a wav file
audiowrite([ Input_FileName '_Output' '.wav'],drcDataOut,Fs);


disp('end')
