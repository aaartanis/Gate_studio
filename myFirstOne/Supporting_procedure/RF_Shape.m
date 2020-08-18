clc;
clear;
file=importdata('D:\Document\RFdata\RF_Shape.txt');
a=file.data;

fid=fopen('D:\Document\RFdata\gate\RF_5.0(6cm).txt','wt');
for j=1:240
    fprintf(fid,'#RF%d.\n',j);
    b(j)=a(2*j,1)-a(2*j-1,1); %x的长度
    if b(j)==0
        continue;
    end
    fprintf(fid,'/gate/world/daughters/name RF%d\n',j);
    fprintf(fid,'/gate/world/daughters/insert box\n');
    fprintf(fid,'/gate/RF%d/setMaterial  Aluminium\n',j);
    %set XLength
    fprintf(fid,'/gate/RF%d/geometry/setXLength     ',j);
    fprintf(fid,'%f cm\n',b(j));
    %set YLength
    fprintf(fid,'/gate/RF%d/geometry/setYLength  20 cm\n',j);
    %set ZLength
    fprintf(fid,'/gate/RF%d/geometry/setZLength    ',j);
    c(j)=a(2*j,2); %z的长度
    fprintf(fid,'%f  cm\n',c(j));
    fprintf(fid,'/gate/RF%d/placement/setTranslation',j);
    d(j)=a(2*j-1,1)+b(j)/2;%x的坐标
    e(j)=-220+c(j)/2;%z的坐标
    fprintf(fid,'   %f   0   %f   cm\n',d(j),e(j));
    fprintf(fid,'/gate/RF%d/vis/forceSolid\n',j);
    fprintf(fid,'/gate/RF%d/vis/setColor    yellow\n',j);
    fprintf(fid,'/gate/RF%d/repeaters/insert   linear\n',j);
    fprintf(fid,'/gate/RF%d/linear/setRepeatNumber  40\n',j);
    fprintf(fid,'/gate/RF%d/linear/setRepeatVector 5  0  0 mm\n',j);
    fprintf(fid,'/gate/RF%d/linear/autoCenter true\n',j);
end
 
