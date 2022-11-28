function [all_images, all_lables] = read_data()
    len = 11803;
    cls = 34;
    symbols = dir('handwritten_math_symbols_dataset_short');
    all_images = zeros(2025, len, "uint8");
    all_lables = zeros(cls, len, "uint8");
    index = 1;
    
    for k=3:length(symbols)
        files = dir(strcat('handwritten_math_symbols_dataset_short\',symbols(k).name,'\*.jpg'));
        
        if str2double(symbols(k).name) == 19
            for i=1:length(files)
                all_lables(uint8(str2double(symbols(k).name)), index) = 1;
                filename = strcat(files(i).folder, '\' ,files(i).name);
                x = imread(filename);
                x = imgaussfilt(x);
                x = squeeze(x);
                x = imresize(x, [45 45]);
                x = x(:,:, 1);
                x = imgaussfilt(x,2);
                %imshow(x);
                x = imbinarize(x);
                %imshow(x);
                x = x(:);
                all_images(:,index) = ~x;
                index = index + 1;
            end
    
        else
    
            for i=1:length(files)
                all_lables(uint8(str2double(symbols(k).name)), index) = 1;
                %disp(all_lables(:,index))
                %disp(size(all_lables))
                filename = strcat(files(i).folder, '\' ,files(i).name);
                x = imread(filename);
                %imshow(x);
                x = imgaussfilt(x,2);
                %imshow(x);
                x = imbinarize(x);
                %imshow(x);
                x = x(:);
                all_images(:,index) = ~x;
                index = index + 1;
            end
        end
        fprintf(symbols(k).name);
        fprintf(' ');
    
    end
    fprintf("   DATA READ   ");
end

