x = 0.0;
h = waitbar(x, 'We are loading, babe');

while x <= 1.0
    waitbar(x, h, ['Now ' num2str(x*100) '% is done']);
    f = num2str(x);
    pause(0.1);
    x = x + 0.1;
end
