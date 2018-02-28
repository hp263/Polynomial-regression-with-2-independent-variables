% This function is for polynomial multivariable regression with 2
% independent variables, using a known degree (order). the input of x_tran
% is a n*2 matrix which contains x1 and x2,and y_tran is a n*1 matrix
% which contains the true output value. Degree is the order of polynomial
% fit model. The output y_predict is our regression result using our model.
% error is the model predict error using LSE method.

function [ y_predict,error ] = Polyfit_high_degree( x_tran,y_tran,degree )

x1=x_tran(:,1); 
x2=x_tran(:,2);
x=[];
for i = 0:degree
    for j=0:degree
        if i+j<=degree
            x=[x x1.^i.*x2.^j];
        end
    end
end 
w=inv(x'*x)*x'*y_tran;
y_predict=x*w;
error=length(x1)*sum((x*w-y_tran).^2);

% syms x1 x2;
% xx=[];
% for i = 0:degree
%     for j=0:degree
%         if i+j<=degree
%             xx=[xx x1^i*x2^j];
%         end
%     end
% end 
% fprintf('when degree is %d, the basis function can be writen as:\n',degree);
% disp(xx)
% w=inv(x'*x)*x'*y_tran;
% disp('The coefficients for basis function are:');
% disp(w');



end

