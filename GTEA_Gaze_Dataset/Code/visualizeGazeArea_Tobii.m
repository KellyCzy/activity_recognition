function im = visualizeGazeArea_Tobii(seq, frame)

imxSize = 640;
imySize = 480;

[X,Y] = meshgrid(1:imxSize, 1:imySize);

brightness = zeros(size(X));
history = 5;
for f=frame-history:frame+history
    [xg,yg] = getGazeLocation_Tobii(seq, f);
    if(xg == 0)
        continue;
    end
    X_ = X - xg;
    Y_ = Y - yg;
    temp = 100^2 - (X_ .^ 2) - (Y_ .^ 2);
    temp(temp < 0) = 0;
    brightness = brightness + temp * (1/((abs(frame-f)+1))^0.1);
end

im = imread(sprintf('../png/%03d/%010d.png', seq, frame));

brightness = brightness / max(brightness(:));

im(:,:,1) = uint8(shiftdim(double(im(:,:,1))) .* brightness);
im(:,:,2) = uint8(shiftdim(double(im(:,:,2))) .* brightness);
im(:,:,3) = uint8(shiftdim(double(im(:,:,3))) .* brightness);

figure; imshow(im);


