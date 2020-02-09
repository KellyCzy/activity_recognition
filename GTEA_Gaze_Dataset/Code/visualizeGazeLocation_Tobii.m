function visualizeGazeLocation_Tobii(seq, frame)

imySize = 480;
imxSize = 640;

[gx1, gy1, gx2, gy2] = getGazeLocation_Tobii(seq, frame);

im = imread(sprintf('../png/%03d/%010d.png', seq, frame));
imshow(im);

[x,y,z] = cylinder(3,200);

if(gy1 > 0 && gy1 <= imySize && gx1 > 0 && gx1 <= imxSize)
    hold on
    plot(gx1+x(1,:), gy1+y(1,:), 'linewidth', 5, 'color', 'r');
    hold off
end
