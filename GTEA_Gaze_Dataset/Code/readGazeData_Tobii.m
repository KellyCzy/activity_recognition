function data = readGazeData_Tobii(seq)

  filestr = sprintf('./gazeData_%03d.mat', seq);
fid = fopen(filestr);
if(fid > 2)
    load(filestr);
    fclose(fid);
    return;
end

fid = fopen(sprintf('../Gaze/%03d-Glasses-Data.tsv',  seq));
for i=1:22
    linestr = fgetl(fid);
end

data = [];

while(ischar(linestr))
    linestr = fgetl(fid);
    k = strfind(linestr, '	');
    if(length(k) < 2)
        continue;
    end
    if(k(2)-k(1) == 1 || k(3)-k(2) == 1)
        continue;
    end
    timestep = sscanf(linestr(1:k(1)-1), '%d');
    x = sscanf(linestr(k(1)+1:k(2)-1), '%d');
    y = sscanf(linestr(k(2)+1:k(3)-1), '%d');
    data = cat(1, data, [timestep x y]);
end

save(filestr, 'data');



