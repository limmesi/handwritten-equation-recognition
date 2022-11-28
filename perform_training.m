function finalparam=perform_training(input,output,parameters,lr,batch_size, epoch_num)
    [~,len]=size(input);
    batch_num=floor(len/batch_size);
    tot_loss=0;

    for i=0:(batch_num-1)
        in = input(:,batch_size*i+1:batch_size*(i+1))';
        out = output(:,batch_size*i+1:batch_size*(i+1))';
        [grad,loss] = dlfeval(@train,in,out,parameters);
        for j=1:6
            parameters{j}=parameters{j}-lr*grad{j};
        end
        tot_loss = tot_loss + extractdata(loss);
    end

    in = input(:,batch_size*batch_num+1:end)';
    out = output(:,batch_size*batch_num+1:end)';
    [grad,~] = dlfeval(@train,in,out,parameters);
    for j=1:6
        parameters{j}=parameters{j}-lr*grad{j};
    end
    finalparam=parameters;
    disp(['per-batch loss for ', num2str(epoch_num),' epoch : ',num2str(tot_loss/batch_num)]);
end