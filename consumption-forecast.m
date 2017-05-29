clear ; close all; clc

% get training data
fprintf('Loading data ...\n');
data = load('data/data_month.txt');
X = data(:, 1); y = data(:, 2);
m = length(y);
fprintf('Loaded %d samples\n',m);

% plot training data
figure;
plot(X, y, 'rx', 'MarkerSize', 10);
ylabel('Consumption [m3/month]'); 
xlabel('Month'); 
fprintf('Program paused. Press any key to continue.\n');
pause;

% --------------------- linear regression - linear model -----------------------
X = [ones(m, 1) X];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx \n',theta(1),theta(2));

hold on; 
%plot(X(:,2), X*theta, '-')
x_plot = [1:.1:12]';
%y_plot = [ones(rows(x_plot),1) x_plot]*theta; 
linear = plot(x_plot, theta(1)+theta(2)*x_plot, '-');
%plot(x_plot, y_plot, '-')
legend('Training data', 'Linear regression')
fprintf('Program paused. Press any key to continue.\n');
pause;
%set(linear,'Visible','off');

% --------------------- linear regression - quadratic model --------------------
X = [X X(:,2).^2];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2 \n',theta(1),theta(2), theta(3));

%ezplot(@(x) theta(1)+theta(2)*x+theta(3)*x.^2);
%plot(X(:,2), X*theta, '-', 'color','g')
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2]*theta; 
%plot(x_plot, y_plot,'-','color','g')
quadratic = plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2, '-');
legend('Training data', 'Linear', 'Quadratic')
fprintf('Program paused. Press any key to continue.\n');
pause;
%set(quadratic,'Visible','off');

% ---------------------linear regression - cubic model -------------------------
X = [X X(:,2).^3];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3 \n',theta(1),theta(2), theta(3), theta(4));
%plot(X(:,2), X*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3]*theta; 
%plot(x_plot, y_plot,'-','color','k')
cubic = plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3, '-'); 
legend('Training data', 'Linear', 'Quadratic', 'Cubic')
fprintf('Program paused. Press any key to continue.\n');
pause;
%set(cubic,'Visible','off');

% --------------------- linear regression - quartic model ----------------------
X = [X X(:,2).^4];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3+%.2fx^4 \n',theta(1),theta(2), theta(3), theta(4), theta(5));
%plot(X(:,2), X*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3 x_plot.^4]*theta; 
%plot(x_plot, y_plot,'-','color','m')
quartic = plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3+theta(5)*x_plot.^4, '-');
legend('Training data', 'Linear', 'Quadratic', 'Cubic', 'Quartic')
fprintf('Program paused. Press any key to continue.\n');
pause;
%set(quartic,'Visible','off');

% --------------------- linear regression - quintic model ----------------------
X = [X X(:,2).^5];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3+%.2fx^4+%.2fx^5 \n',theta(1), theta(2), theta(3), theta(4), theta(5), theta(6));
%plot(X(:,2), X*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3 x_plot.^4 x_plot.^5]*theta; 
%plot(x_plot, y_plot,'-','color','c')
quintic = plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3+theta(5)*x_plot.^4+theta(6)*x_plot.^5, '-');
legend('Training data', 'Linear', 'Quadratic', 'Cubic', 'Quartic', 'Quintic')
%fprintf('Program paused. Press any key to continue.\n');
hold off 

% predictions %

predict_months = [1:1:12]';
predictions = theta(1)+theta(2)*predict_months+theta(3)*predict_months.^2+theta(4)*predict_months.^3+theta(5)*predict_months.^4+theta(6)*predict_months.^5;

fprintf('Predictions:\n')
[predict_months predictions]




