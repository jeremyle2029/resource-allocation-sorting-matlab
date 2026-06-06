clc
clear
close all
%Task 1
load("Processes.mat");
timesValid = isnumeric(Times) && isvector(Times) && length(Times) > 1;
namesValid = isstring(Names) && isvector(Names) && length(Names) > 1;
if ~timesValid && ~namesValid
    error("Both provided variables are invalid.");
elseif ~timesValid
    error("Provided Times variable is invalid.");
elseif ~namesValid
    error("Provided Names variable is invalid.");
end
%Task 2
sortedNames = SortProcesses(Names, Times);
save("MA6_sorted.mat", "sortedNames");

%Task 3
Core1 = []; 
Core2 = [];
for k = 1:length(sortedNames)
    if mod(k, 2) == 1
        Core1 = [Core1; sortedNames(k)];
    else
        Core2 = [Core2; sortedNames(k)];
    end
end
save("Core1.mat", "Core1");
save("Core2.mat", "Core2");
%Function
function [sortedNames] = SortProcesses(Names, Times)
    N = length(Times);
    for i = 1:N
        for j = 1:(N - i)
            if Times(j) > Times(j + 1)
                tempTime = Times(j);
                Times(j) = Times(j + 1);
                Times(j + 1) = tempTime;
                tempName = Names(j);
                Names(j) = Names(j + 1);
                Names(j + 1) = tempName;
            end
        end
    end
    sortedNames = Names;
end