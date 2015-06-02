chdir('C:\Documents and Settings\JACQUES\Mes documents\Oscilloscope_licencePro\');
//u=file('open','essai_bis.dat','unknow');
//yn=read(u,-1,2);
//file('close',u);
//ys=yn';
//xset("window",1);
//plot2d(ys(1,:),ys(2,:),[2]);
//xgrid(0:0.1);

//stacksize(11e6);

u=file('open','blocsignal.dat','unknow');

yn=read(u,-1,3);
file('close',u);
ys=yn';
xset("window",1);
plot2d(ys(1,:),ys(2,:),[3]);

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






