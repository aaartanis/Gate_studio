
clc;clear;
aa=importdata('C:\Users\15764\Documents\RF\6cm\RF_Shape.txt');
%aa=importdata('C:\Users\15764\Documents\RF\chongce6cm Al\RF_Shape.txt');
a=aa.data;
    fid=fopen('C:\Users\15764\Documents\Gate\RF\RF5.0Al\Al-5.0(6cm).txt','wt'); 

 
    for j=1:240;
    fprintf(fid,'#RF%d.\n',j);
    fprintf(fid,'/gate/world/daughters/name RF%d\n',j);
    fprintf(fid,'/gate/world/daughters/insert      box\n');
    fprintf(fid,'/gate/RF%d/setMaterial            Aluminium\n',j);
    fprintf(fid,'/gate/RF%d/geometry/setXLength     ',j);
    b(j)=a(2*j,1)-a(2*j-1,1); %x的长度
    fprintf(fid,'%f   mm\n',b(j));
    fprintf(fid,'/gate/RF%d/geometry/setYLength    20   cm\n',j);
    fprintf(fid,'/gate/RF%d/geometry/setZLength     ',j);
    c(j)=a(2*j,2);    %z的长度
    fprintf(fid,'%f   mm\n',c(j));
    fprintf(fid,'/gate/RF%d/placement/setTranslation',j);
    d(j)=a(2*j-1,1)+b(j)/2; %x的坐标
    fprintf(fid,'    %f',d(j));
    e(j)=613+c(j)/2;     %z的坐标
    fprintf(fid,'   0    %f    mm\n',e(j));
    fprintf(fid,'/gate/RF%d/vis/forceSolid\n',j);
    fprintf(fid,'/gate/RF%d/vis/setColor              yellow\n',j);
    fprintf(fid,'/gate/RF%d/repeaters/insert          linear\n',j);
    fprintf(fid,'/gate/RF%d/linear/setRepeatNumber    40\n',j);
    fprintf(fid,'/gate/RF%d/linear/setRepeatVector    5   0   0   mm\n',j);
    fprintf(fid,'/gate/RF%d/linear/autoCenter  true\n',j);
    end
 