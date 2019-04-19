train_clears = dir('Train/Clear/');
train_hazes = dir('Train/Haze/');
train_waters = dir('Train/Underwater/');

total_rows = numel(train_clears) + numel(train_hazes) + numel(train_waters) - 6;
features = zeros(total_rows, 1);
%features = zeros(total_rows, 2);
%features = zeros(total_rows, 500);
labels = zeros(total_rows, 1);
row = 1;

for i = 3 : numel(train_clears)
  img = imread(strcat(train_clears(i).folder, '\', train_clears(i).name));
  features(row,:) = getMeanSaturation(img);
  %features(row,:) = [getMeanSaturation(img) getModeSaturation(img)];
  %features(row,:) = getMeanSaturation(img);
  labels(row) = 0;
  row++;
endfor

for i = 3 : numel(train_hazes)
  img = imread(strcat(train_hazes(i).folder, '\', train_hazes(i).name));
  features(row,:) = getMeanSaturation(img);
  %features(row,:) = [getMeanSaturation(img) getModeSaturation(img)];
  %features(row,:) = getMeanSaturation(img);
  labels(row) = 1;
  row++;
endfor

for i = 3 : numel(train_waters)
  img = imread(strcat(train_waters(i).folder, '\', train_waters(i).name));
  features(row,:) = getMeanSaturation(img);
  %features(row,:) = [getMeanSaturation(img) getModeSaturation(img)];
  %features(row,:) = getMeanSaturation(img);
  labels(row) = 2;
  row++;
endfor

model = svmtrain(labels, features, '-t 0');
