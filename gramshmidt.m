function [Q, R] = gramshmidt(A)
% Gramshmidt 


[n, m]=size(A);

% Checking of input here: A is a square matrix
if n==m
    res=1;
else 
    res=0;
end
% (:, 1) - first column
% dot() - scalar product function
if res
    Q=[];
    R=zeros(n);

    R(1,1)=norm(A(:,1));
    Q(:,1)=1/R(1,1)*A(:,1); 
    
    for k=2:n
        v=A(:,k);
        for ly=1:k-1
            R(ly,k)=dot(Q(:,ly), A(:,k));
            v=v-R(ly,k)*Q(:,ly);
        end
        R(k,k)=norm(v, 2); % second norm of 'v'
        Q(:,k)=1/R(k,k)*v;
    end
   Q
   R
end