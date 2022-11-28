function test_net(XTest, parameters, batch_size, YTest)
    correct=permform_test(XTest,parameters,batch_size,YTest);
    accuracy=correct/length(YTest)*100;
    disp(['The accuracy on the test set is: ',num2str(accuracy)])
end