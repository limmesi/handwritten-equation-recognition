function out=predict(input,parameters)
    W1 = parameters{1};
    W2 = parameters{2};
    W3 = parameters{3};
    b1 = parameters{4};
    b2 = parameters{5};
    b3 = parameters{6};
    inp = input';
    H1 = inp * W1 + b1;
    A1 = relu(H1);
    H2 = A1 * W2 + b2;
    A2 = relu(H2);
    H3 = A2 * W3 + b3;
    A3 = softmax(H3,'DataFormat','BC');
    
    out = extractdata(A3);
    out = uint8(out);
    out = transpose(out);
end