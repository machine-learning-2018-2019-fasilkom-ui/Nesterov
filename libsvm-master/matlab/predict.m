test_clears = dir('Test/Clear/');
test_hazes = dir('Test/Haze/');
test_waters = dir('Test/Underwater/');

total_rows = numel(test_clears) + numel(test_hazes) + numel(test_waters) - 6;
features = zeros(total_rows, 1);
%features = zeros(total_rows, 2);
%features = zeros(total_rows, 500);
answer = zeros(total_rows, 1);
row = 1;

for i = 3 : numel(test_clears)
  img = imread(strcat(test_clears(i).folder, '\', test_clears(i).name));
  features(row,:) = getMeanSaturation(img);
%  features(row,:) = [getMeanSaturation(img) getModeSaturation(img)];
%  features(row,:) = getMeanSaturation(img);
  answer(row) = 0;
  row++;
endfor

for i = 3 : numel(test_hazes)
  img = imread(strcat(test_hazes(i).folder, '\', test_hazes(i).name));
  features(row,:) = getMeanSaturation(img);
%  features(row,:) = [getMeanSaturation(img) getModeSaturation(img)];
%  features(row,:) = getMeanSaturation(img);
  answer(row) = 1;
  row++;
endfor

for i = 3 : numel(test_waters)
  img = imread(strcat(test_waters(i).folder, '\', test_waters(i).name));
  features(row,:) = getMeanSaturation(img);
%  features(row,:) = [getMeanSaturation(img) getModeSaturation(img)];
%  features(row,:) = getMeanSaturation(img);
  answer(row) = 2;
  row++;
endfor

pred = svmpredict(answer, features, model)
