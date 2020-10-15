%% Homework 2

%% Problem 1
% The probability of rolling snake eyes is given by the product of the
% probability of rolling a one on each die which is 1/36. The probability
% of rolling a sum of seven is 6/36 or 1/6. I arrived at this answer since
% the probability of rolling a sum of seven given the first dice already
% has a value is 1/36. There are six different ways to roll a sum of seven
% so 6*(1/36) is 6/36 or 1/6. This means it is more probable to roll a sum
% of seven than it is to roll snake eyes since 1/6 is greater than 1/36. 

%% Problem 2
% Analytic Method (Math and Counting)
% Shows the probability of rolling a certain sum using two dice. Also lists
% the possible outcomes to achieve that sum. 
% Sum of 1:  0/36 {}
% Sum of 2:  1/36 {(1,1)}
% Sum of 3:  2/36 {(1,2),(2,1)}
% Sum of 4:  3/36 {(1,3),(2,2),(3,1)}
% Sum of 5:  4/36 {(1,4),(2,3),(3,2),(4,1)}
% Sum of 6:  5/36 {(1,5),(2,4),(3,3),(4,2),(5,1)}
% Sum of 7:  6/36 {(1,6),(2,5),(3,4),(4,3),(5,2),(6,1)}
% Sum of 8:  5/36 {(2,6),(3,5),(4,4),(5,3),(6,2)}
% Sum of 9:  4/36 {(3,6),(4,5),(5,4),(6,3)}
% Sum of 10: 3/36 {(4,6),(5,5),(6,4)}
% Sum of 11: 2/36 {(5,6),(6,5)}
% Sum of 12: 1/36 {(6,6)}
% Sum of 13: 0/36 {}

% Numeric Method (Computer Program)
probs = [0,1/6,1/6,1/6,1/6,1/6,1/6,0];
convu = conv(probs,probs);
plot(0:length(convu)-1, convu);
title("Probability of Sum of Two Six-Sided Dice");
xlabel("Sum"); ylabel("Probability"); figure;

%% Problem 3
% Mean
% From the plot in the previous problem, the mean is 7. The mean is given
% by sum[x*f(x)] where f(x)=1/6 for all values since there is an equal
% chance to roll each value. The values of x are {1,2,3,4,5,6,1,2,3,4,5,6}
% which are all the values that can be rolled from two dice. So if we
% compute sum[x*f(x)], we get 1/6*sum(x)=42/6=7. This mathematical approach
% is consistent with the mean shown in the graph since mean is 7.  

x = [1,1,2,2,3,3,4,4,5,5,6,6];
mean = sum(x)/6;
disp(mean);

% Variance
% The variance is given by sum[(x-mean)f(x)]. From the previous part, we
% know f(x)=1/6 for all values since there is an equal chance to roll each
% value. Also, mean is 7 and values of x are {1,2,3,4,5,6,1,2,3,4,5,6}. So
% if we compute sum[f(x)*(x-mean)^2], we get 1/6*sum[(x-7)^2]=30.333. 

variance = 0;
for c = 1:length(x)
variance = variance+(x(1,c)-mean)^2/6;
end
disp(variance);

%% Problem 4
probs = [0,1/6,1/6,1/6,1/6,1/6,1/6,0];
convu = conv(probs,probs);
for c = 1:8
   convu = conv(convu,probs); 
end
x = 0:length(convu)-1;
plot(x, convu); %CHANGE THIS FOR AVG: x/2 or x/10???
title("Probability of Sum of Ten Six-Sided Dice");
xlabel("Sum"); ylabel("Probability");

% This looks like a Gaussian distribution. 

%% Problem 5
