%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Course:      ECSE 517
%Assignment:  Assignment 1
%Author:      Sharhad Bashar
%File name:   assign_2.m
%Description: This file contains the code for Decode with Spikes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Tw = Data1.Tw;
T0 = Data1.T0; %start of each trial
T19 = Data1.T19; %end of each trial

idxTw = kmeans(Tw,4);
idxTwLen = length(idxTw);
%spike times
unitIT1s = [];
unitIT2s = [];
unitIT3s = [];
unitIT4s = [];

%Grouping units
for i = 1:idxTwLen
    if (idxTw(i) == 1)
        unitIT1s = [unitIT1s,Tw(i)];
    elseif (idxTw(i) == 2)
         unitIT2s = [unitIT2s,Tw(i)];
    elseif (idxTw(i) == 3)
         unitIT3s = [unitIT3s,Tw(i)];
    else 
        unitIT4s = [unitIT4s,Tw(i)]; 
    end
end

%transpose the arrays
unitIT1s = unitIT1s';
unitIT2s = unitIT2s';
unitIT3s = unitIT3s';
unitIT4s = unitIT4s';

%Initialize spkTrials
%1
for i = 1:length(T0)
    spkInTrial = [];
    tsByTrial = [];
    for j = 1:length(unitIT1s)
        if (unitIT1s(j) > T0(i) && unitIT1s(j) < T19(i))
            spkInTrial = [spkInTrial,j];
        end
    end
    spkInTrial = spkInTrial';
    for j = 1:length(spkInTrial)
        tsByTrial = [tsByTrial,unitIT1s(spkInTrial(j))]; 
    end
    tsByTrial = tsByTrial';
    if ~isempty(tsByTrial)
        spkTrials1(i, 1:length(spkInTrial)) = tsByTrial - tsByTrial(1);
    end
end

%2
for i = 1:length(T0);
    spkInTrial = [];
    tsByTrial = [];
    for j = 1:length(unitIT2s)
        if (unitIT2s(j) > T0(i) && unitIT2s(j) < T19(i))
            spkInTrial = [spkInTrial,j];
        end
    end
    spkInTrial = spkInTrial';   
    for j = 1:length(spkInTrial)
        tsByTrial = [tsByTrial,unitIT2s(spkInTrial(j))]; 
    end
    tsByTrial =tsByTrial';
    if ~isempty(tsByTrial)
        spkTrials2(i, 1:length(spkInTrial)) = tsByTrial - tsByTrial(1);
    end
end

%3
for i = 1:length(T0);
    spkInTrial = [];
    tsByTrial = [];
    for j = 1:length(unitIT3s)
        if (unitIT3s(j) > T0(i) && unitIT3s(j) < T19(i))
            spkInTrial = [spkInTrial,j];
        end
    end
    spkInTrial = spkInTrial';
    for j = 1:length(spkInTrial)
        tsByTrial = [tsByTrial,unitIT3s(spkInTrial(j))]; 
    end
    tsByTrial = tsByTrial';
    if ~isempty(tsByTrial)
        spkTrials3(i, 1:length(spkInTrial)) = tsByTrial - tsByTrial(1);
    end
end

%4
for i = 1:length(T0);
    spkInTrial = [];
    tsByTrial = [];
    for j = 1:length(unitIT4s)
        if (unitIT4s(j) > T0(i) && unitIT4s(j) < T19(i))
            spkInTrial = [spkInTrial,j];
        end
    end
    spkInTrial = spkInTrial';
    for j = 1:length(spkInTrial)
        tsByTrial = [tsByTrial,unitIT4s(spkInTrial(j))]; 
    end
    tsByTrial =tsByTrial';
    if ~isempty(tsByTrial)
        spkTrials4(i, 1:length(spkInTrial)) = tsByTrial - tsByTrial(1);
    end
end

figure;
subplot(4,1,1);
plot (Tw);
title('Original data set');

subplot(4,1,2);
plot (unitIT1s);
title('Grouped Unit 1');

subplot(4,1,3);
plot (unitIT2s);
title('Grouped Unit 2');

subplot(4,1,4);
plot (unitIT3s);
title('Grouped Unit 3');

subplot(4,1,5);
plot (unitIT4s);
title('Grouped Unit 4');




