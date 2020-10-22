%% HW3

%% Problem 1
% In this problem, we have an identification system which prevents birds
% from escaping from an aviary. However, it is imperfect because it
% misidentifies birds as people and vice versa. However, these errors are
% not equally probable. We are told it is OK to misidentify a human but not
% OK to misidentify a bird. Below are truth tables for two algorithms
% called NN and NA respectively. 

% turth table for NN
nn_orig = table([45;3],[5;47], 'VariableNames',{'True_Bird',...
          'True_Person'},'RowNames',{'NN Bird','NN Person'})

% truth table for NA
na_orig = table([47;1],[11;42], 'VariableNames',{'True_Bird',...
          'True_Person'},'RowNames',{'NN Bird','NN Person'})
      
%% Section 1A
% We are given two algorithms labeled NN and NA. Out of 100 photos, NN 
% makes a total of 8 miscategorizations. Out of 101 photos, NA makes a
% total of 11 miscategorizations. Based off of these numbers, we can say
% how NN makes fewer mistakes than NA since 8 mistakes is less than 11
% mistakes. 

%% Section 1B
% Now, we have to determine which algorithm is better for the zoo. It is
% the zoo's main priority to prevent birds from escaping the aviary. This
% means it is OK with human misidentifications. In other words, we only
% care about less bird misidentifications and don't care about the number
% of human misidentifications. From the data, we see how NN makes 3 bird
% misidentifications and NA makes 1 bird misidentification. This manes NA
% is a better algorithm for the zoo because it prevents more birds from
% escaping the aviary. It is better for the zoo to have 1 bird escape than
% 3 birds. Thus, NA is the better algorithm for the zoo. 

%% Section 1C
% Now, we are given a situation where there are less people who frequent
% the zoo due to a pandemic. This means only 1% of the photos will be of
% humans instead of 52%. Below are the new truth tables with 1k photos to 
% compensate for the fewer number of people visiting the zoo. The new
% numbers are determined to best maintain the ratio of number of a type of
% misidentification and total number of a type of animal. For example, NA
% misidentified 1 bird but correctly identified 47 birds. The ratio is then
% 1/(1+47). Now since birds represent 99% of the photos, we multiply this
% by 990 since 990 is 99% of 1000. In the case of a person, we multiply the
% ratio by 10 since 10 is 1% of 1000. 

% ratios for NA
na_birdp = 1/(1+47); 
na_personp = 11/(11+42);

% ratios for NN
nn_birdp = 3/(3+45);
nn_personp = 5/(5+47);

% misidentifications for NN during pandemic
nn_bird = round(nn_birdp*990);
nn_person = round(nn_personp*10);

% misidentifications for NA during pandemic
na_bird = round(na_birdp*990);
na_person = round(na_personp*10);

% new truth tables for NN and NA during pandemic with 1k photos
nn_pand = table([(990-nn_bird);nn_bird],[nn_person;(10-nn_person)],...
          'VariableNames',{'True_Bird','True_Person'},'RowNames',...
          {'NN Bird','NN Person'})
      
na_pand = table([(990-na_bird);na_bird],[na_person;(10-na_person)],...
          'VariableNames',{'True_Bird','True_Person'},'RowNames',...
          {'NA Bird','NA Person'})

%% Problem 2

%% Section 2A
% The pdf of the sum of two identical exponential distributions is Erlang
% distribution with shape 2 and parameter lambda which is the same as the
% original distribution. The Erlang distribution is a special case of the
% Gamma distribution. I found this answer on "Exponential Distribution"
% page on Wikipedia under the "Sum of two independent exponential random
% variables" section. 

%% Section 2B
% The pdf of the ratio of two zero-mean unity variance normal distributions
% is a Cauchy distribution. I found this answer on "Normal Ratio
% Distribution" page on Wolfram Math World. 

%% Section 2C
% The pdf of the amplitude of a vector of a 2D Gaussian distribution is a
% Rayleigh distribution. This is from the Lab 3 when we had to analyze a 2D
% Gaussian distribution from a picture of the sky.