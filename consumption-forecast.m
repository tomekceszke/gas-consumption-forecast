clear ; close all; clc

% get training data
fprintf('Loading data ...\n');
data = load('data.txt');
X = data(:, 1); y = data(:, 2);
m = length(y);
fprintf('Loaded %d samples\n',m);

% plot training data
figure;
plot(X, y, 'rx', 'MarkerSize', 10);
ylabel('Consumption [m3/month]'); 
xlabel('Average outdoor temperature [C]'); 
fprintf('Program paused. Press any key to continue.\n');
pause;

% linear regression - linear model
X = [ones(m, 1) X];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx \n',theta(1),theta(2));

hold on; 
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
fprintf('Program paused. Press any key to continue.\n');
pause;

% linear regression - quadratic model
X = [X X(:,2).^2];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2 \n',theta(1),theta(2), theta(3));

%ezplot(@(x) theta(1)+theta(2)*x+theta(3)*x.^2);
plot(X(:,2), X*theta, '-', "color","g")
legend('Training data', 'Linear', 'Quadratic')
fprintf('Program paused. Press any key to continue.\n');
pause;

% linear regression - cubic model
X = [X X(:,2).^3];
theta = pinv(X'*X)*X'*y;
fprintf('Hypothesis function: h(x)=%.2f+%.2fx+%.2fx^2+%.2fx^3 \n',theta(1),theta(2), theta(3), theta(4));

plot(X(:,2), X*theta, '-', "color","k")
legend('Training data', 'Linear', 'Quadratic', 'Cubic')
hold off 