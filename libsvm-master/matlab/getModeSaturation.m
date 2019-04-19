function mode_sat = getModeSaturation(img)
  hsv = rgb2hsv(img);
  sat = hsv(:,:,2);
  mode_sat = mode(mode(sat));
endfunction
