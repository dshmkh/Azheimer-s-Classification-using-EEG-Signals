%% Dataset Initialization
X = [a1];
y1 = transpose(linspace (1,1,79617));
%y2 = transpose(linspace (2,2,78529));
%y3 = transpose(linspace (2,2,77697));
y = [y1];


x_rand_num = randperm(79617);
len = length(x_rand_num);
rand_num = x_rand_num(randi(len,1,100));

X = X(rand_num(1:80),:);
y = y(rand_num(1:80),:);

%% Creating KNN model
mdl = fitcknn(X,y);

%% Cross Validation model
cvmdl =crossval(mdl);

%% Calculating Loss in prediction
cvmdlloss = kfoldLoss(cvmdl);
Accuracy = (1 - cvmdlloss) * 100

if (Accuracy < 50)
    disp('Healthy');

else
    disp('Alzheimers');
    
end