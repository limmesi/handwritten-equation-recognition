learning_rate = 0.01;
num_epochs = 100;
batch_size = 32;
len = 11803;
cls = 34;

[X, Y] = read_data();

rand_pos = randperm(len); 
shuffled_x = zeros(2025, len);
shuffled_y = zeros(cls, len);
for k = 1:len
    shuffled_x(:,k) = X(:,rand_pos(k));
    shuffled_y(:,k) = Y(:,rand_pos(k));
end

XTrain = shuffled_x(:,    1:9000);
YTrain = shuffled_y(:,    1:9000);
XTest  = shuffled_x(:, 9001:end);
YTest  = shuffled_y(:, 9001:end);

W1 = dlarray(rand([2025,200])*2-1);
W2 = dlarray(rand([200,200])*2-1);
W3 = dlarray(rand([200, cls])*2-1);
B1 = dlarray(rand([1,200])*2-1);
B2 = dlarray(rand([1,200])*2-1);
B3 = dlarray(rand([1, cls])*2-1);

parameters= {W1,W2,W3,B1,B2,B3};

for i=1:num_epochs
    parameters = perform_training(XTrain,YTrain,parameters,learning_rate,batch_size,i);
end

test_net(XTest, parameters, batch_size, YTest);
