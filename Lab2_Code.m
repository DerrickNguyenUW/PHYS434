%% Lab 2

%% Problem 1
% For this section, I selected my average cosmic-ray background value as 
% X = 8 and my average number of gamma-rays emmitted as Y = 16. 

%% Section 1A
pdist = makedist("Poisson",'lambda',8);
pbg = pdf(pdist,0:20);

% Sum over 2 days
pconv = multiconv(pbg,2);
px = 0:length(pconv)-1;
stairs(px, pconv); hold on;

% Sum over 3 days
pconv = multiconv(pbg,3);
px = 0:length(pconv)-1;
stairs(px, pconv); hold on;

% Sum over 4 days
pconv = multiconv(pbg,4);
px = 0:length(pconv)-1;
stairs(px, pconv); hold on;

title("Probability Distribution of Background Summed Over N Days");
xlabel("Number of Cosmic-Ray Background"); ylabel("Probability");
legend("N = 2","N = 3","N = 4"); hold off; figure;

%% Section 1B
% Sum over 5 days
pconv = multiconv(pbg,5);
px = 0:length(pconv)-1;
stairs(px, pconv); 
title("Probability Distribution After 5 Days"); 
xlabel("Number of Cosmic-Ray Background"); ylabel("Probability"); figure;

% From a mathematical perspective, . From a conceptual perspective, .

% CONTINUE SENTENCE

%% Section 1C
% Average over 2 days
pconv = multiconv(pbg,2);
px = 0:length(pconv)-1;
stairs(px/2, pconv); hold on;

% Average over 5 days
pconv = multiconv(pbg,5);
px = 0:length(pconv)-1;
stairs(px/5, pconv); hold on;

% Average over 10 days
pconv = multiconv(pbg,10);
px = 0:length(pconv)-1;
stairs(px/10, pconv); hold on; 

% Average over 15 days
pconv = multiconv(pbg,15);
px = 0:length(pconv)-1;
stairs(px/15, pconv); hold on;

% Average over 20 days
pconv = multiconv(pbg,20);
px = 0:length(pconv)-1;
stairs(px/20, pconv); hold on;

title("Average Probability Distribution After N Days"); 
xlabel("Number of Cosmic-Ray Background"); ylabel("Probability"); 
legend("N = 2","N = 10","N = 15","N = 20"); hold off; figure;

%% Section 1D
% For this problem, I will choose my number of days as N = 8. According to
% this problem, I will see Y*N gamma rays which is 128. 

pconv = multiconv(pbg,8);
psum = 0;
for c = 1:128
   psum = psum+pconv(c); 
end
psigma = norminv(psum);
disp(psigma);

%% Problem 2

%% Section 2A
rdist = makedist("Rayleigh");
rbg = pdf(rdist,0:3);

% Average over 15 observing intervals
rconv = multiconv(rbg,15);
rx = 0:length(rconv)-1;
plot(rx/15,rconv); hold on;

% Average over 20 observing intervals
rconv = multiconv(rbg,20);
rx = 0:length(rconv)-1;
plot(rx/20,rconv); hold on;

% Average over 30 observing intervals
rconv = multiconv(rbg,30);
rx = 0:length(rconv)-1;
plot(rx/30,rconv); hold on;

% Average over 40 observing intervals
rconv = multiconv(rbg,40);
rx = 0:length(rconv)-1;
plot(rx/40,rconv); hold on;

title("Average Probability Distribution After N Intervals"); 
xlabel("Observations"); ylabel("Probability"); 
legend("N = 10","N = 20","N = 30","N = 40"); hold off; figure;

%% Section 2B
% As the average over more observing intervals increased, the Rayleigh
% distribution changed. Specifically, the width of the Rayleigh
% distribution became thinner, the amplitude at the mean became smaller,
% and the shape became smoother. However, the mean did not shift as the
% observing intervals increased. The Rayleigh distribution became a
% Gaussian distribution after around 30 intervals. 

%% Problem 3
% For this section, I selected the width of the background Gaussian
% distribution as X = 5 and the signal of strength as Y = 8.6. 

%% Section 3A (Version 1)
% Here, we make a Gaussian distribution with mu = 0 and sigma = 5.
% Afterwards, we calculate the probability of an 8.6 signal using the cdf()
% function. We put this value into the norminv() function calculate the
% sigma. From this, we get a sigma of 1.72 which means we cannot claim a
% discovery since that's associated with 5-sigma. 
gdist = makedist("Normal",'mu',0,'sigma',5);
gprob = cdf(gdist,8.6);
gsigma = norminv(gprob);
disp(gsigma);

%% Section 3B (Version 2)
% The statistical question I want to ask is...
gvars = 5^2 * 10000;
gsigma = sqrt(gvars);
disp(gsigma);
% In a Gaussian distribution, the mean doesn't shift. However, we know the
% sigma will change as we perform a convolution of the distribution with
% itself. Specifically, the width of the distribution gets wider. We can
% find this by taking the square root of the sum of the variances of each
% Gaussian distribution. Since each pixel has the same distribution and are
% independent of one another, we can simply take the square root of the sum
% of the variances to find sigma. Since they are independent of one
% another, we can just multiply the variance by N pixels where N = 10k. The
% reason why we don't perform 10k convolutions is because it would take the
% computer too long to compute compared to this method. 

%% Section 3C (Version 2)
gdist = makedist("Normal",'mu',0,'sigma',gsigma);
gprob = cdf(gdist,8.6);
gsigma = norminv(gprob);
disp(gsigma);

%% Problem 4

%% Section 4A
gsignal = norminv(normcdf(5),0,5);
disp(gsignal);

%% Section 4B
gsignal = norminv(normcdf(5),0,500);
disp(gsignal);

%% Section 4C
% 

%% Section 4D
% 
