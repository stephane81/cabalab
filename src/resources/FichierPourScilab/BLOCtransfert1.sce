chdir('C:\Documents and Settings\JACQUES\Mes documents\Oscilloscope_licencePro\');
//u=file('open','essai_bis.dat','unknow');
//yn=read(u,-1,2);
//file('close',u);
//ys=yn';
//xset("window",1);
//plot2d(ys(1,:),ys(2,:),[2]);
//xgrid(0:0.1);

stacksize(11e7);

u=file('open','blocsignal.dat','unknow');

yn=read(u,-1,3);
file('close',u);
ys=yn';
//xset("window",1);
t=ys(1,:);
N=size(t,2)
select N
  case 1024 then 
    c=2;
  case 2048 then
    c=3;
  case 4096 then
    c=4;
  case 8192 then 
    c=5;
  case 16384 then
    c=6;
  case 32768 then 
    c=7;
  case 65536 then
    c=9;
end;
//-ys(1,512);
xin=ys(2,:);
//plot2d(t,xin,3);
cxxin=corr(ys(2,:),N);
xout=ys(3,:);
//plot2d(t,xout,[4]);
cxxout=corr(ys(3,:),N);

//xset("window",2);
//plot2d(t,cxxin,[3]);
//plot2d(t,cxxout,[4]);
//xset("window",3);
Xin=fft(cxxin,-1);
Xout=fft(cxxout,-1);

pas=t(1,2)-t(1,1);
deltaf=1/pas/N;
f=[0:deltaf:(N-1)*deltaf];

//plot2d(f,Xin(1:N)',[5]);
//plot2d(f,Xout(1:N)',[6]);

for j=1:N
Trans(j)=Xout(j)/Xin(j);
end;
xset("window",4);
plot2d('nn',f,Trans(1:N)',[4]);
M=N/2
for i=1:M
a(i)=f(i);
b(i)=Trans(i);
end;
xset("window",5);
plot2d('ln',f,(10*log10(Trans(1:N)))',4);
//plot2d('oln',a',10*log10(abs(b))',2);
//u=file('open','sig','unknow');
//for k=1:N
//a1(1,k)=y1(k);
//a1(2,k)=y2(k);
//end;
//write(u,a1');
//file('close',u);
//unix_w("Spec_102.exe");
//u=file('open','spec.dat','unknow');
//yn=read(u,-1,2);
//file('close',u);
//ys=yn';
//xset("window",1)3
//plot2d(ys(1,:),ys(2,:),[4],"000");






