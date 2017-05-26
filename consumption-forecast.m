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
%pause;

% --------------------- linear regression - linear model -----------------------
X = [ones(m, 1) X];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx \n',theta(1),theta(2));

hold on; 
%plot(X(:,2), X*theta, '-')
x_plot = [1:.1:12]';
%y_plot = [ones(rows(x_plot),1) x_plot]*theta; 
plot(x_plot, theta(1)+theta(2)*x_plot, '-')
%plot(x_plot, y_plot, '-')
legend('Training data', 'Linear regression')
fprintf('Program paused. Press any key to continue.\n');
%pause;

% --------------------- linear regression - quadratic model --------------------
X = [X X(:,2).^2];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2 \n',theta(1),theta(2), theta(3));


%ezplot(@(x) theta(1)+theta(2)*x+theta(3)*x.^2);
%plot(X(:,2), X*theta, '-', 'color','g')
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2]*theta; 
%plot(x_plot, y_plot,'-','color','g')
plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2, '-')
legend('Training data', 'Linear', 'Quadratic')
fprintf('Program paused. Press any key to continue.\n');
%pause;

% ---------------------linear regression - cubic model -------------------------
X = [X X(:,2).^3];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3 \n',theta(1),theta(2), theta(3), theta(4));
%plot(X(:,2), X*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3]*theta; 
%plot(x_plot, y_plot,'-','color','k')
plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3, '-')
legend('Training data', 'Linear', 'Quadratic', 'Cubic')
fprintf('Program paused. Press any key to continue.\n');
%pause;

% --------------------- linear regression - quartic model ----------------------
X = [X X(:,2).^4];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3+%.2fx^4 \n',theta(1),theta(2), theta(3), theta(4), theta(5));
%plot(X(:,2), X*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3 x_plot.^4]*theta; 
%plot(x_plot, y_plot,'-','color','m')
plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3+theta(5)*x_plot.^4, '-')
legend('Training data', 'Linear', 'Quadratic', 'Cubic', 'Quartic')
fprintf('Program paused. Press any key to continue.\n');
%pause;

% --------------------- linear regression - quintic model ----------------------
X = [X X(:,2).^5];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3+%.2fx^4 \n',theta(1),theta(2), theta(3), theta(4), theta(5), theta(6));
%plot(X(:,2), X*theta, '-', "color","k")
%y_plot = [ones(rows(x_plot),1) x_plot x_plot.^2 x_plot.^3 x_plot.^4 x_plot.^5]*theta; 
%plot(x_plot, y_plot,'-','color','c')
plot(x_plot, theta(1)+theta(2)*x_plot+theta(3)*x_plot.^2+theta(4)*x_plot.^3+theta(5)*x_plot.^4+theta(6)*x_plot.^5, '-')
legend('Training data', 'Linear', 'Quadratic', 'Cubic', 'Quartic', 'Quintic')
fprintf('Program paused. Press any key to continue.\n');
%pause;

hold off 




