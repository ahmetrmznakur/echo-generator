function output = echo_gen(input,fs,delay,amp)
N = round(fs*delay)
S1 = [ input ; zeros(N,1)]
S2 = [zeros(N,1); input.*amp]
output = S1 + S2
if max(abs(output)) > 1
    output = output ./ max(abs(output))
else
    output = output
end
