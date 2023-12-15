%probability,target value and pattern of input vector p1
p1 = 0.2;
t1 = [26];
z1 = [2;4];

%initial weight and learning rate
w0 = [0 0];
lr = 0.05;

%start with k=0
%Equation: Wk+1 = Wk + 2*lr*ek*zk'
%step1: FInd output a(k)
a = purelin(w0*z1)

%step2:Calculate error
e = t1-a

%step3:Compute weight
w1 = w0+2*lr*e*z1'