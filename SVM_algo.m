%% Dataset Initialization

X = [a1;n1;m1];
y1 = transpose(linspace (1,1,79617));
y2 = transpose(linspace (2,2,78529));
y3 = transpose(linspace (2,2,77697));
y = [y1;y2;y3];

x_rand_num = randperm(235843);
len = length(x_rand_num);
rand_num = x_rand_num(randi(len,1,100));

X_train = X(rand_num(1:80),:);
y_train = y(rand_num(1:80),:);

X_test = X(rand_num(81:end),:);
y_test = y(rand_num(81:end),:);

%% K-Fold Cross Validation 

c = cvpartition(y_train,'k',10);

%% Channel Determination using CV

opts = statset('display','iter');
classf = @(train_data, train_labels, test_data, test_labels)...
    sum(predict(fitcsvm(train_data, train_labels,'KernelFunction','rbf'), test_data) ~= test_labels);

[fs, history] = sequentialfs(classf, X_train, y_train, 'cv', c, 'options', opts,'nfeatures',5); % only 5 columns

%% SVM training using best chennels

X_train_w_best_feature = X_train(:,fs);

Md1 = fitcsvm(X_train_w_best_feature,y_train,'KernelFunction','rbf','OptimizeHyperparameters','auto',...
      'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
      'expected-improvement-plus','ShowPlots',true));
  
%% Testing for accuracy 

X_test_w_best_feature = X_test(:,fs);
test_accuracy_for_iter = sum((predict(Md1,X_test_w_best_feature) == y_test))/length(y_test)*100

%% SVM Plot

figure;
hgscatter = gscatter(X_train_w_best_feature(:,1),X_train_w_best_feature(:,2),y_train);
hold on;
h_sv=plot(Md1.SupportVectors(:,1),Md1.SupportVectors(:,2),'ko','markersize',8);