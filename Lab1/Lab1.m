% Derrick Nguyen
% PHYS 434 AA
% Lab 1

% A Little Statistics 

% Section 1B
% Integrates a standard normal distribution using normcdf(x). These
% values are approximately equal to the expected values listed on
% the z-table on Wikipedia. 
disp(normcdf(0))
disp(normcdf(0.1))
disp(normcdf(0.3))
disp(normcdf(0.5))
disp(normcdf(1))
disp(normcdf(-1))

% Section 1C
% Finds the associated sigma of the inverse of the standard normal 
% distribution using norminv(x). These values are approximately 
% equal to the expected value. 
disp(norminv(0.84134))
disp(norminv(0.97725))
disp(norminv(0.99865))
disp(norminv(0.99997))
disp(norminv(0.00003))

% Section 1D
% The negative sign from norminv(x) indicates 

% Section 2B
% Plots of expontential distribution with 100k samples and mu at 1.
x = linspace(0,20,100000);
expD = makedist("Exponential",'mu', 1);
subplot(2,2,2)
plot(x,pdf(expD,x),"LineWidth",2);
set(gca,'YScale','log')

subplot(2,2,1)
plot(x,pdf(expD,x),"LineWidth",2); hold on;

% Plot of exponential distribution with 100k samples and mu at 3.
x = linspace(0,20,100000);
expD = makedist("Exponential",'mu', 3);
subplot(2,2,4)
plot(x,pdf(expD,x),"LineWidth",2);
set(gca,'YScale','log')

subplot(2,2,3)
plot(x,pdf(expD,x),"LineWidth",2); hold on;
% Here, I have shown four exponential distributions but the second and 
% fourth plots have the y axis in log scale. The top row has mu at 1 and
% the bottom row has mu at 3. We see how the distribution gets wider and
% initial y value decreases as mu increases. This means the slope decreases
% in the plot where y is in log scale. 

% Section 3A
% I selected a value of #VALUE as my hypothetical measurement. 

% Section 3B
% The statistical question I want to ask is

% Section 3C
% Converts my statistical question into an integral.

% Section 3D
% Calculates the probabilty of background producing a signal.

% Section 3E
% Converts probabilty into equivalent sigma.

% Section 4
% Some patterns I noticed from using various hypothetical measurement
% values is how the probabilities and the sigmas change. Specifically,
% 

% Non-Continuous Distributions

% Section 1B
% Plots a series of plots with different parameters. Some features
% I notice are

% Section 1C
% My hypothetical question is . Calculates the corresponding 
% probability. 

% Section 1D
% Since the distributions are discrete, the probabilities and sigmas
% are also discrete. The implications of this in experiments are
%

% Section 1E
% Although the results are discrete, the parameters aren't. The reason
% why this makes sense is because 
