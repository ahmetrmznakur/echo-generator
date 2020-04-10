function lastans = echo_gen(input, fs, delay, amp)
    totallong = length(input);
    ampVec = zeros(totallong,1);
    for ii = 1:totallong
        ampVec(ii,1) = input(ii,1)*amp;
    end
    combinedVecLong = totallong+round(delay*fs);
    combinedVec = zeros(combinedVecLong,1);
    for zz = 1:length(input)
        combinedVec(zz,1) = input(zz,1);
    end
    index = 0;
    for jj = ((round(delay*fs))+1) : combinedVecLong
        index = index+1;
        combinedVec(jj,1) = combinedVec(jj,1)+ampVec(index,1);
    end
    for tt = 1:combinedVecLong
        if combinedVec(tt,1) < -1
            combinedVec(tt,1) = -1;
        elseif combinedVec(tt,1) > 1
            combinedVec(tt,1) = 1;
        end
    end
    lastans = combinedVec; 
end