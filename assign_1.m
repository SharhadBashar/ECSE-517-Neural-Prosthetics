%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Course:      ECSE 517
%Assignment:  Assignment 1
%Author:      Sharhad Bashar
%File name:   assign_1.m
%Description: This file contains the code for Dimensionally Reduction 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Waves = Data1.Waves;
data = Waves(1:end,:)';
Awaves = Waves;
dataSize = size(data,2);

%Part 1
[minVal,Index] = min(data); % Gets the min of the data set, as well as the location of the minimum
minIndex = mode(Index); % stores them in a data
modeIndex = mode(minIndex);
for i = 1:dataSize
    displacement = Index(i) - modeIndex;
    if (abs(displacement > 3))
        displacement = 3;
    end
    if (displacement ~= 0 )
        Awaves(i,:) = circshift(Awaves(i,:),[0 -displacement]);
    end
end

figure;
plot (Waves(1:100:end,:)');
grid on;
title('Original Waveform');
figure;
plot (Awaves(1:100:end,:)');
grid on;
title('Awaves Waveform');

%Part 2
[coeff,score,latent,tsquared,explained,mu] = pca(Awaves);
figure;
pareto (explained);
title('Explained Variance');

%Part 3
edg = prctile(score(:,1:2),[0.1,99.9]);
De = min(diff(edg))/30;
e1{1} = (edg(1,1):De:edg(2,1));
e1{2} = (edg(1,2):De:edg(2,2));
hst = hist3(score(:,1:2),e1);
Shand = pcolor(e1{1},e1{2},hst');
title('Clusters');
set(Shand,'LineStyle','none'); 

%Part 4
idxAw = kmeans(Awaves,4);
figure;
[silh,clust] = silhouette(Awaves,idxAw);
title('Awaves Cluster');
xlabel ('Silhouette Value');
ylabel ('Cluster');

Tw = Data1.Tw;
idxTw = kmeans(Tw,4);
figure;
[silh,clust] = silhouette(Tw,idxTw);
title('Tw Cluster');
xlabel ('Silhouette Value');
ylabel ('Cluster');
