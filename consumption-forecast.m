% Predict consumption of gas for domestic needs
% model: polynomial regression
% alogrithm: normal equation
% 
% Author: Tomasz Ceszke

clear ; close all; clc

% get training & test data
fprintf('Loading data ...\n');
data = load('data/data_month.txt');
data_train = data(1:end-12,:);
data_test = sortrows(data(end-11:end,:));

fprintf('Loaded %d samples:\n',length(data));
X_train = data_train(:,1);
y_train = data_train(:,2);
m = length(y_train);
fprintf("  training %d samples\n",m);
X_test = data_test(:,1);
y_test = data_test(:,2);
fprintf("  test %d samples\n",length(y_test));

% plot training data
figure;
plot(X_train, y_train, 'rx', 'MarkerSize', 10);
ylabel('Consumption [m3/month]'); 
xlabel('Month'); 
fprintf('\nProgram paused. Press any key to continue.\n\n');
pause;

% --------------------- linear regression - linear model -----------------------
X_train = [ones(m, 1) X_train]; # added interceptor
theta = pinv(X_train'*X_train)*X_train'*y_train; % normal equation
fprintf('Hypothesis function: h(x)=%.2f+%.2fx \n',theta(1),theta(2));

hold on; 
%plot(X_train(:,2), X_train*theta, '-')
x_plot = [1:.1:12]';
%y_plot = [ones(rows(x_plot),1) x_plot]*theta; 
linear = plot(x_plot, theta(1)+theta(2)*x_plot, '-');
%plot(x_plot, y_plot, '-')
legend('Training data', 'Linear regression')
fprintf('\nProgram paused. Press any key to continue.\n\n');
pause;
%set(linear,'Visible','off');

% --------------------- linear regression - quadratic model --------------------
X_train = [X_train X_train(:,2).^2];
theta = pinv(X_train'*X_train)*X_train'*y_train;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2 \n',theta(1),theta(2), theta(3));

%ezplot(@(x) theta(1)+theta(2)*x+theta(3)*x.^2);
%plot(X_train(:,2), X_train*theta, '-', 'color','g')
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2]*theta; 
%plot(x_plot, y_plot,'-','color','g')
quadratic = plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2, '-');
legend('Training data', 'Linear', 'Quadratic')
fprintf('\nProgram paused. Press any key to continue.\n\n');
pause;
%set(quadratic,'Visible','off');

% ---------------------linear regression - cubic model -------------------------
X_train = [X_train X_train(:,2).^3];
theta = pinv(X_train'*X_train)*X_train'*y_train;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3 \n',theta(1),theta(2), theta(3), theta(4));
%plot(X_train(:,2), X_train*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3]*theta; 
%plot(x_plot, y_plot,'-','color','k')
cubic = plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3, '-'); 
legend('Training data', 'Linear', 'Quadratic', 'Cubic')
fprintf('\nProgram paused. Press any key to continue.\n\n');
pause;
%set(cubic,'Visible','off');

% --------------------- linear regression - quartic model ----------------------
X_train = [X_train X_train(:,2).^4];
theta = pinv(X_train'*X_train)*X_train'*y_train;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3+%.2fx^4 \n',theta(1),theta(2), theta(3), theta(4), theta(5));
%plot(X_train(:,2), X_train*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3 x_plot.^4]*theta; 
%plot(x_plot, y_plot,'-','color','m')
quartic = plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3+theta(5)*x_plot.^4, '-');
legend('Training data', 'Linear', 'Quadratic', 'Cubic', 'Quartic')
fprintf('\nProgram paused. Press any key to continue.\n\n');
pause;
%set(quartic,'Visible','off');

% --------------------- linear regression - quintic model ----------------------
X_train = [X_train X_train(:,2).^5];
theta = pinv(X_train'*X_train)*X_train'*y_train;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3+%.2fx^4+%.2fx^5 \n',theta(1), theta(2), theta(3), theta(4), theta(5), theta(6));
%plot(X_train(:,2), X_train*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3 x_plot.^4 x_plot.^5]*theta; 
%plot(x_plot, y_plot,'-','color','c')
quintic = plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3+theta(5)*x_plot.^4+theta(6)*x_plot.^5, '-');
legend('Training data', 'Linear', 'Quadratic', 'Cubic', 'Quartic', 'Quintic')
%fprintf('\nProgram paused. Press any key to continue.\n\n');
hold off 

% predictions %
function y = predict5(X, theta)
  y = theta(1)+theta(2)*X+theta(3)*X.^2+theta(4)*X.^3+theta(5)*X.^4+theta(6)*X.^5;
end  

y_pred = predict5(X_test, theta)

fprintf('\nPredictions:\n')
[X_test y_pred]

plot(X_test, y_pred, '-'); hold on
plot(X_test, y_test, '-'); hold off
ylabel('Consumption [m3/month]'); 
xlabel('Month'); 
legend('Predicted','Real')


