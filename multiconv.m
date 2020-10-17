function multiconv = multiconv(bg,n)
% This function takes in a background 'bg' and number of times user wants to
% perform a convolution on itself 'n'. This function doesn't consider cases
% like negative numbers, zero, and one. 
multiconv = conv(bg,bg);
for c = 0:n-3
   multiconv = conv(multiconv, bg); 
end

end

