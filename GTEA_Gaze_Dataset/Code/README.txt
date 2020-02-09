README
-----------------------------------

getGazeLocation_Tobii.m:
reads the gaze data for all frames of a sequence

getGazeLocation_Tobii.m:
returns the (x,y) gaze location at a particular frame of a particular sequence
Since Tobii eye-tracking glasses record at 30 fps, but we extract images from the video in 15 fps,
it returns two gaze points for each frame

parseLabels.m:
returns an array of actions of a sequence
each action's info is set in a struct
each struct contains the following information: name of the verb, set of nouns, sequence, start frame and end frame

dataset_addSequence_PNG.m
it extracts images from the videos for a sequence
In order to run this function you need to have ffmpeg installed

visualizeGazeLocation_Tobii.m
shows the gaze location in a particular frame of a particular sequence
In order to use this function, you need to have extracted images using dataset_addSequence_PNG.m

visualizeGazeArea_Tobii.m
makes all the areas in image dark but a small circle around gaze location

