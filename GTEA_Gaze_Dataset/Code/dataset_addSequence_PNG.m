function dataset_addSequence_PNG(seq)

frameRate = 15;

upngstr = sprintf('../png/%03d', seq);

command = sprintf('rm -rf %s', upngstr);
system(command);
command = sprintf('mkdir %s', upngstr);
system(command);

command = sprintf('ffmpeg -i ../Videos/%03d.mpg -r %d -f image2 %s/%%010d.png', seq, frameRate, upngstr);
    
fprintf('%s\n', command);
system(command);

