unit scilabpecdecl;

interface
 const ScilabBLOCSPEC:array[0..8] of shortstring=('',
'chdir(''''C:\temp\'''');',
'u=file(''''open'''',''''blocsignal.dat'''',''''unknow'''');',
'yn=read(u,-1,3);',
'file(''''close'''',u);',
'ys=yn'''';',
'xset("window",1);',
'plot2d(ys(1,:),ys(2,:),[3]);',
 '');
implementation

end.
