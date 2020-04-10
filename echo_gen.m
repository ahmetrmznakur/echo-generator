function lastans = echo_gen(input, fs, delay, amp)
    % Expect four inputs: input, fs, delay and amp
    %  input must be a digitized sound data and must be represented as a column vector
    %  fs is sample rate in a second(usually 44100 for audio Cds)
    %  delay is the timespan after how many seconds echo will start
    %  amp is the amplification degree of echo and must be smaller than 1
    %  (amp < 1, because for maintaining loudness of echo must be smaller than original sound)
    
    totallong = length(input);
    ampVec = zeros(totallong,1);
    for ii = 1:totallong
        ampVec(ii,1) = input(ii,1)*amp;   % creates digitized sound vector of pure echo
    end
    combinedVecLong = totallong+round(delay*fs);
    combinedVec = zeros(combinedVecLong,1);
    for zz = 1:length(input)
        combinedVec(zz,1) = input(zz,1);
    end
    index = 0;
    for jj = ((round(delay*fs))+1) : combinedVecLong
        index = index+1;
        combinedVec(jj,1) = combinedVec(jj,1)+ampVec(index,1);  % sound vector superimposed with echo
    end
    for tt = 1:combinedVecLong
        if combinedVec(tt,1) < -1  % for clearing sound a little it is keepen in a certain range
            combinedVec(tt,1) = -1;
        elseif combinedVec(tt,1) > 1 % same clearing purposes
            combinedVec(tt,1) = 1;
        end
    end
    lastans = combinedVec; 
end
