function [x1, y1, x2, y2] = getGazeLocation_Tobii(seq, frame)

% frames per second
fps = 15;

data = readGazeData_Tobii(seq);

if(frame <= 0)
    x1 = 0;
    y1 = 0;
    x2 = 0;
    y2 = 0;
    return;
end

ts = (frame-1)*1000/fps;

temp1 = floor(ts / 100);
temp2 = mod(ts, 100);
temp3 = round(temp2 / 33);

if(temp3 == 0)
    ts1 = temp1*100;
    ts2 = ts1 + 33;
end
if(temp3 == 1)
    ts1 = temp1*100 + 33;
    ts2 = ts1 + 34;
end
if(temp3 == 2)
    ts1 = temp1*100 + 67;
    ts2 = ts1 + 33;
end
if(temp3 == 3)
    ts1 = temp1*100 + 100;
    ts2 = ts1 + 33;
end

r = find(data(:,1) == ts1);
x1 = data(r,2);
y1 = data(r,3);

r = find(data(:,1) == ts2);
x2 = data(r,2);
y2 = data(r,3);

if(seq == 8)
    yind = 68;
    xind = -40;
    if(y1 ~= 0)
        y1 = y1 + yind;
        x1 = x1 + xind;
    end
    if(y2 ~= 0)
        y2 = y2 + yind;
        x2 = x2 + xind;
    end
end

