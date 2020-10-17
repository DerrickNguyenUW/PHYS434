%% Lab 2

%% Problem 1
% For this section, I selected my average cosmic-ray background value as 
% X = 8 and my average number of gamma-rays emmitted as Y = 16. 

%% Section 1A
% Shows how the probability distribution changes as we integrate (sum) for
% more days by convolving the background with itself N times. We notice how
% the mean shifts and the amplitude at the mean decreases as we integrate
% for more days. Also, the distribution is still a Poisson distribution. 
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
% Shows how the summed probability distribution is still a Poisson
% distribution after 5 days. 

% Sum over 5 days
pconv = multiconv(pbg,5);
px = 0:length(pconv)-1;
stairs(px, pconv); 
title("Probability Distribution After 5 Days"); 
xlabel("Number of Cosmic-Ray Background"); ylabel("Probability"); figure;

% From a mathematical perspective, . From a conceptual perspective, .

% CONTINUE SENTENCE

%% Section 1C % INCORRECT
% Shows how the probability distribution evolves as we average days. The
% shape of the distribution gets thinner and the discrete features almost
% smooths out as the number of days become larger. This can be explained by
% the Central Limit Theorem which states a distribution will approximate a
% normal distribution as the sample size becomes larger. In relation to
% Problem 1B, we 

%Also, the
% amplitude at the mean decreases but the mean doesn't shift when we
% average days. 

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
% this problem, I will see Y*N gamma rays which is 128. In order to find
% the associated sigma to the signal of 128, I must first find the
% distribution after eight days. This is found by convolving the background
% with itself 8 times. Afterwards, I must integrate my distribution from
% negative infinity to the signal to find the associated sigma. 
pconv = multiconv(pbg,8);
psum = 0;
for c = 1:128
   psum = psum+pconv(c); 
end
psigma = norminv(psum);
disp(psigma);

%% Problem 2

%% Section 2A
% Shows how Rayleigh distribution changes as we average over more observing
% intevals. Similar to the previous problem, we notice how the mean doesn't
% shift and the amplitude at the mean decreases. Also, the shape of the
% distribution approximates a normal distribution when the sample size
% becomes large enough according to the Central Limit Theorem. 
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
legend("N = 10","N = 20","N = 30","N = 40"); hold off;

%% Section 2B
% According to the Central Limit Theorem, the distribution should
% approximate a normal distribution when the sample size gets large. As the
% average over more observing intervals increased, the Rayleigh
% distribution changed. Specifically, the width of the distribution became
% thinner, the amplitude at the mean decreased, and the shape became
% smoother. However, the mean did not shift. The Rayleigh distribution
% approached a Gaussian distribution after approximately 30 intervals. 

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
gdist = makedist("Normal",'mu',0,'sigma',5);
gpdf = pdf(gdist,-30:30);
gprobf = gpdf*10000;
gbg = plot(-30:30,gprobf);
title("Probability Distribution of Background");
xlabel("Observations"); ylabel("Probability");

% The probability we get at least one signal-like event from the background
% is the probability we get from one of these pixels. If we assume the
% distributions for each pixel are identical and independent from one
% another, we simply multiply the pdf of one pixel by 10k. 

%% Section 3C (Version 2) % iNCOrrECT
% Calculates the signifance of the detection of the brightest candidtate 
% pixel from the region with signal 8.6. 
gdist = makedist("Normal",'mu',0,'sigma',gsigma);
gprob = cdf(gdist,8.6);
gsigma = norminv(gprob);
disp(gsigma);

%% Problem 4

%% Section 4A
% Calculates the signal required for a 5-sigma detection in Problem 3A
% Version 1. Uses norminv() function with mu=0 and sigma=5. 
gsignal = norminv(normcdf(5),0,5);
disp(gsignal);

%% Section 4B %INCORRECT
% Calculates the signal required for a 5-sigma detection in Problem 3C
% Version 2. Uses norminv() function with mu=0 and sigma=5. 
gsignal = norminv(normcdf(5),0,500);
disp(gsignal);

%% Section 4C
% 

%% Section 4D
% 
