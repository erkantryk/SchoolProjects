function y = my_convolution(x, h)
    % Custom convolution function
    % x: First input vector
    % h: Second input vector

    % Get the lengths of the input vectors
    lx = length(x);
    lh = length(h);
    
    % Define the length of the output vector
    y = zeros(1, lx + lh - 1);
    
    % Perform the convolution operation
    for n = 1:length(y)
        for k = 1:lx
            if (n - k + 1) > 0 && (n - k + 1) <= lh
                y(n) = y(n) + x(k) * h(n - k + 1);
            end
        end
    end
end
