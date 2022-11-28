function corect=permform_test(input,parameters,batch_size,target)
    [~,len]=size(input);
    mult=floor(len/batch_size);
    corect = 0;
    for i=0:(mult-1)
        in = input(:,batch_size*i+1:batch_size*(i+1));
        trg = target(:,batch_size*i+1:batch_size*(i+1));
        idx = predict(in,parameters);
        for j=1:size(idx, 2)
            for k=1:size(idx,1)
                if idx(k,j) == 1 && trg(k,j) == 1
                    corect = corect + 1;
                    break
                end
            end
        end

    end
    in = input(:,batch_size*mult+1:end);
    trg = target(:,batch_size*mult+1:end);
    idx = predict(in,parameters);

    for j=1:size(idx, 2)
        for k=1:size(idx,1)
            if idx(k,j) == 1 && trg(k,j) == 1
                corect = corect + 1;
                break
            end
        end
    end

end