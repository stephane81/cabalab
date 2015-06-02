chdir('C:\Documents and Settings\JACQUES\Mes documents\TIEPIE_2\hs3_test\hs3_licencepro\Nouveau dossier\');
//u=file('open','essai_bis.dat','unknow');
//yn=read(u,-1,2);
//file('close',u);
//ys=yn';
//xset("window",1);
//plot2d(ys(1,:),ys(2,:),[2]);
//xgrid(0:0.1);

//stacksize(11e6);

uf=file('open','blocsignal.dat','unknow');

yn=read(uf,-1,3);
file('close',uf);
ys=yn';
t=ys(1,:);
N=size(t,2)
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
//xset("window",1);
//plot2d(ys(1,:),ys(2,:),[4],"000");

NF3=round(N/4)-1;
NF4=round((NF3+1)/2);
NF2=round(NF4/4);
NF2=NF4*4;
y2=ys(2,:);
xcomplex=zeros(NF3,1);
y=zeros(N,1);
tabi=zeros(NF2,1);tabr=zeros(NF2,1);
for z=0:1

    for u=0:3

	for nn=1:NF3+1
	b=4*(nn-1)+u+1;
	 xreal=y2(b)*(1-cos(2*%pi*b/N))*cos(2*%pi*z*(nn-1)/(N/2));
	 ximag=-y2(b)*(1-cos(2*%pi*b/N))*sin(2*%pi*z*(nn-1)/(N/2));
	 xcomplex(nn)=xreal+ximag*%i;
	end;
	Xf=fft(xcomplex,-1);
	for w=1:NF3+1
	c=2*w+z-1;
	 tabr(c)=tabr(c)+real(Xf(w))*cos(2*%pi*u*(w-1)/N)+imag(Xf(w))*sin(2*%pi*u*(w-1)/N);
	 tabi(c)=tabi(c)+imag(Xf(w))*cos(2*%pi*u*(w-1)/N)-real(Xf(w))*sin(2*%pi*u*(w-1)/N);
	end;
    end;
end;	
for i=1:NF2
    y(i)=sqrt(tabr(i)*tabr(i)+tabi(i)*tabi(i))/N*2;
end;
//fin du calcul de la 1ere partie du spectre

tabi=zeros(NF2,1);tabr=zeros(NF2,1);
for z=0:1

    for u=0:3

	for nn=1:NF3+1
	b=4*(nn-1)+u+1;
	 xreal=y2(b)*(1-cos(2*%pi*b/N))*cos(2*%pi*(z*(nn-1)/(N/2)+b/4));
	 ximag=-y2(b)*(1-cos(2*%pi*b/N))*sin(2*%pi*(z*(nn-1)/(N/2)+b/4));
	 xcomplex(nn)=xreal+ximag*%i;
	end;
	Xf=fft(xcomplex,-1);
	for w=1:NF3+1
	c=2*w+z-1;
	 tabr(c)=tabr(c)+real(Xf(w))*cos(2*%pi*u*(w-1)/N)+imag(Xf(w))*sin(2*%pi*u*(w-1)/N);
	 tabi(c)=tabi(c)+imag(Xf(w))*cos(2*%pi*u*(w-1)/N)-real(Xf(w))*sin(2*%pi*u*(w-1)/N);
	end;
    end;
end;	
for i=1:NF2
    y(i+NF2)=sqrt(tabr(i)*tabr(i)+tabi(i)*tabi(i))/N*2;
end;

//fin du calcul de la 2eme partie du spectre

pas=ys(1,2)-ys(1,1);
deltaf=1/pas/2/N;
f=[0:deltaf:(N-1)*deltaf];
xset("window",3);
plot2d(f,y(1:N)',[5]);



