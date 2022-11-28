img = imread(fullfile('images','equation.png'));
imshow(img);
modImg = rgb2gray(img); 
modImg = medfilt2(modImg);
modImg = imgaussfilt(modImg,2);
threshold = graythresh(modImg);
modImg = ~imbinarize(modImg,threshold); 
modImg = bwareaopen(modImg,30);
figure(2);
title('Modified Image');

[characters, chracters_quantity] = bwlabel(modImg);
box = regionprops(characters,'BoundingBox');

for n=1:chracters_quantity
    [r,c] = find(characters==n);
    to_net = modImg(min(r):max(r),min(c):max(c));
     %imshow(to_net)
    hight = size(to_net, 1);
    width = size(to_net, 2);
    if max(size(to_net)) == hight                
        add_small = floor((hight-width)/10);
        add_big = floor((hight-width)/2) + add_small;
        to_net = padarray(to_net, [add_small, add_big], 0, 'both');
    else                                                       
        add_small = floor((width-hight)/10);
        add_big = floor((width-hight)/2) + add_small;
        to_net = padarray(to_net, [add_big, add_small], 0,'both');
    end
     %imshow(to_net)
    to_net = imgaussfilt(double(to_net));
     %imshow(to_net)
    to_net = imresize(to_net, [45 45]);
    %to_net = padarray(to_net, [2, 2], 0, 'both');
     %imshow(to_net)
    %to_net = ~logical(~to_net);
    to_net = imbinarize(to_net);
     %imshow(to_net);
    to_net = imgaussfilt(double(to_net),0.15);
    to_net = ~logical(~to_net);
     %imshow(to_net);
    imwrite(to_net, fullfile('splited', sprintf('image%d.png', n)));
     %pause(1)
end

detectedSymbols = string(length(chracters_quantity));
for i=1:chracters_quantity
    inputVector = reshape(double(imread(fullfile('splited', sprintf('image%d.png', i)))) , 2025, 1);
    outputVector = predict(inputVector, parameters);
    detectedSymbols(i) = encode(outputVector);
end

fprintf('Detected Text:')
disp(detectedSymbols)

