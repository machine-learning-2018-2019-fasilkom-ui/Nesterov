function mean_sat = getMeanSaturation(img)
  hsv = rgb2hsv(img);
  sat = hsv(:,:,2);
  mean_sat = mean(mean(sat));
endfunction
