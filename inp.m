sHH=load('sparse_ham_sz_2.txt');
%H = diag(ones(20, 1),0) +  0.5*diag(ones(19,1), 1)  + 0.5*diag(ones(19,1), -1);
%H(20,1)=1;H(1,20)=1;
%D=[2 0 1;   0 3 0;   1 0 2;];
%u =[0.171799151874028;   0.751483050929023;   0.636991582033681;];

A=spconvert(H);
%save('A_mat.txt','A');
issparse(A)
g=eig(A);
disp(g);
[~,n]=size(A);
[S,D]=eigs(A); %S is the matrix with the eigenvectors as column
S;
[T,V,u]=Lanczos(A,n);
T;
V;
k=eig(T);
disp(k);
[X,Z]=eig(T); % X is the matrix with the eigenvectors as column
X;
B=eig(T)-eig(A);
disp(B);
disp([g,k]);
disp(u);
 