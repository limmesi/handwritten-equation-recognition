function [grads,losstot]=train(input,output,parameters)
    W1 = parameters{1};
    W2 = parameters{2};
    W3 = parameters{3};
    b1 = parameters{4};
    b2 = parameters{5};
    b3 = parameters{6};

    H1 = input * W1 + b1;
    A1 = relu(H1);
    H2 = A1 * W2 + b2;
    A2 = relu(H2);
    H3 = A2 * W3 + b3;
    A3 = softmax(H3,'DataFormat','BC');
    loss = crossentropy(A3,output,'DataFormat','BC');
    losstot = sum(loss);

    grads = dlgradient(losstot,parameters);
end
