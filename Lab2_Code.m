%% Lab 2

%% Problem 1
% For this section, I selected my average cosmic-ray background value as 
% X = 8 and my average number of gamma-rays emmitted as Y = 16. 

%% Section 1A
poissonD = makedist("Poisson",'lambda',8);
background = pdf(poissonD,0:10);
w = conv(background,background);
plot(0:length(w)-1, w); 
title("PLOT 1"); figure;

%% Section 1B
w2 = conv(w,w);
for c = 1:5
   w2 = conv(w2,w); 
end
plot(0:length(w2)-1, w2); 
title("PLOT 2"); figure;

%% Section 1C
w2 = conv(w,w);
for c = 1:50
   w2 = conv(w2,w); 
end
x = 0:length(w2)-1;
plot(x/2, w2); 
title("PLOT 3");

%% Section 1D


%% Problem 2

%% Section 2A

%% Section 2B

%% Problem 3

%% Section 3A

%% Section 3B

%% Section 3C

%% Problem 4

%% Section 4A

%% Section 4B

%% Section 4C

%% Section 4D

%% Section 4E (extra credit)