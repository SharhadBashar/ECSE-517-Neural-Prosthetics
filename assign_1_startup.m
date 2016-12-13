%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Course:      ECSE 517
%Assignment:  Assignment 1
%Author:      Sharhad Bashar
%File name:   assign_1_startup.m
%Description: This file contains all the pre-assignment requirments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Random data set S1
%1000 x 2 points, mean = 0, variance = 1
S1 = randn(1000,2);

%Set S2:
%First coloumn is x axis, second coloumn is y axis
S2(1:1000,1) = S1(:,1);
S2(1:1000,2) = S1(:,1) + randn(1000,1);

%Calculate the covariance of the two sets
cv1 = cov(S1);
cv2 = cov(S2);

%Eigenvector of covariance
[Evec,Eval] = eig(cv2);
Evec
Eval

[BigEvec,BigEval]= eigs(cv2,1);
BigEval
BigEvec = BigEvec * (-1); % becuase BigEvec was returning negative values of the largest row
BigEvec

figure;
subplot(2,1,1);
scatter(S1(:,1),S1(:,2),4);
title('S1');
xlabel('1st Dimention');
ylabel('2nd Dimention');
subplot(2,1,2);
scatter(S2(:,1),S2(:,2),4); 
title('S2');
xlabel('1st Dimention');
ylabel('2nd Dimention');
hold on;
quiver(0,0,BigEvec(1,1),BigEvec(2,1), 4,'color', 'red');
hold on;
quiver(0,0,-BigEvec(1,1),-BigEvec(2,1), 4,'color', 'red');
hold off;
SortEval = sort(diag(Eval),'descend');
PCnorm = zeros(size(SortEval));
for i = 1:size(SortEval);
    PCnorm(i)=SortEval(i)/sum(SortEval);
end

%Plot the  data bases
figure;
pareto(PCnorm);
title('Cumulative Explained Variance');
xlabel('Eigenvalue');
ylabel('Cumulative Variance');




