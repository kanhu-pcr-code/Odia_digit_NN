function createDataset (target,N, pixel)

% createDataset function will create  learnig data set 
% target : the target folder name containing traning imagesc
% N: expected number of data intances for each training category
% pixel: must be a square of equal size e.g 20
% Call it from the "working direcotry"/"target folder"
% output name must be same as the folder sub-folder name e.g> we are in ./grey, and trainig sets for zero(0) is in a folder named '0'


folders = dir(target)(3:end,:);
X = zeros(length(folders)*N,pixel*pixel);
y = zeros(length(folders)*N,1);
obs=0;
for f=1:length(folders)
 printf("Processing %s ...\t",folders(f).name)
 files= dir(strcat(target,"/",folders(f).name))(3:end,:);
 for t=1:length(files)
 %printf("file: %s\n",files(t).name);
  img = imread(strcat(target,"/",folders(f).name,"/",files(t).name));
  X(++obs,:)=img(:);
  y(obs)=str2num(folders(f).name); 
  endfor
  printf("-DONE-\n")
endfor
obs
save -binary "trainingSet.mat" X y;
printf("Saved as -trainingSet.mat-\n")



