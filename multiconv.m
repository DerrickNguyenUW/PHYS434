function multiconv = multiconv(bg,n)
% This function takes in a background "bg" and a number of times user wants
% to convolute the background with itself "n". This function does not
% handle the case where n is negative, zero, or one. 
multiconv = conv(bg,bg);
for c = 0:n-3
   multiconv = conv(multiconv, bg); 
end

end

