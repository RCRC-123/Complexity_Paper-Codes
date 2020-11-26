%Input matrix adjacency matrix B, compare bridges failure, betweenness failure ,random failure and degree failure on controllability, connectivity and controllability divided by connected contrast graph
%This program needs to use MATLAB_ Bgl-4.0.1 graph theory toolbox
%The first run will report an error "no function or variable 'Gebia' "is defined because no bridges is input
%Copy the data in the "Eclipsesr" that has been obtained, and use the Java program "BombingImportantBridge.java ”After calculating Gebian and inputting it, we can run the program again to get the contrast graph

%%%-----------------------------------------------------------------------
%Adjacency label reading
%Please enter adjacency matrix b

b = linjie(1);
LinJieBiao=0;
a=b; 
[ZhuanHuann,ZhuanHuanm]=size(a);
ZhiZhen=0;
for wai=1:ZhuanHuann
    for nei=wai:ZhuanHuann
        if a(wai,nei)==1
            ZhiZhen=ZhiZhen+1;
            LinJieBiao(ZhiZhen,1)=wai;
            LinJieBiao(ZhiZhen,2)=nei;
        end
    end
end
[MMMM NNNN]=size(LinJieBiao);
EclipseSR(1,1)=ZhuanHuann;
EclipseSR(1,2)=MMMM;
for i=1:MMMM
    j=i+1;
    EclipseSR(j,1)=LinJieBiao(i,1);
    EclipseSR(j,2)=LinJieBiao(i,2);
end

%Average degree <k> of the network
a=b;
[N,M]=size(a);
c=sum(a);
d=sum(c,2);
if rank(a-a')==0
    awvgk=d/N;
    awvgk;
else
    awvgk=2*d/N;
    awvgk;
end

%bridges failure
Opt=b;
[GeBianH GeBianL]=size(GeBian);
for JiaBian=1:GeBianH
    [N,M]=size(b);
    QuDongJieDian(1,JiaBian)=max(1,N-rank(Opt));
     [ciii sizesss] = components(sparse(Opt));
    ZuiDaLLianTong(1,JiaBian)=max(sizesss);
    
    FuJieDian=GeBian(JiaBian,1);
    ZiJieDian=GeBian(JiaBian,2);
    Opt(FuJieDian,ZiJieDian)=0;
    Opt(ZiJieDian,FuJieDian)=0;
end

JieShu=b;
for JiaBian1=1:GeBianH
    [N1,M1]=size(b);
    QuDongJieDian1(1,JiaBian1)=max(1,N1-rank(JieShu));
     [ciii sizesss] = components(sparse(JieShu));
    ZuiDaLLianTong1(1,JiaBian1)=max(sizesss);
    
    
    [bc,E] = betweenness_centrality(sparse(JieShu));
    Bian=full(E);
    [JieDian0 JieDian1]=find(Bian==max(max(Bian)));
    FuJieDian1=JieDian0(1,1);
    ZiJieDian1=JieDian1(1,1);
    JieShu(FuJieDian1,ZiJieDian1)=0;
    JieShu(ZiJieDian1,FuJieDian1)=0;
end

SuiJi=b;
LinJieBiao1=LinJieBiao;
for JiaBian2=1:GeBianH
    [N2,M2]=size(b);
    QuDongJieDian2(1,JiaBian2)=max(1,N2-rank(SuiJi));
    [ciii sizesss] = components(sparse(SuiJi));
    ZuiDaLLianTong2(1,JiaBian2)=max(sizesss);
    
    [l,k]=size(LinJieBiao1);
    result = unidrnd(l);
    FuJieDian2=LinJieBiao1(result,1);
    ZiJieDian2=LinJieBiao1(result,2);
    SuiJi(FuJieDian2,ZiJieDian2)=0;
    SuiJi(ZiJieDian2,FuJieDian2)=0;
    LinJieBiao1(result,:)=[];
end

%The degree of an edge
[Num1,M]=size(b);  %求邻接矩阵的行数和列数
for i=1:Num1       %做全为1的一列矩阵
    C(i,1)=1;
end
Du=b*C;             %求a的行和（度最大）
[BianShu,q]=size(LinJieBiao)
for i=1:BianShu
    BianDu(i,1)=Du(LinJieBiao(i,1),1)*Du(LinJieBiao(i,2),1);
end
[q HangHao]=sort(BianDu,'descend');

BianDuFa=b;
for JiaBian3=1:GeBianH
    [N2,M2]=size(b);
    QuDongJieDian3(1,JiaBian3)=max(1,N2-rank(BianDuFa));
    [ciii sizesss] = components(sparse(BianDuFa));
    ZuiDaLLianTong3(1,JiaBian3)=max(sizesss);
    
    result=HangHao(JiaBian3,1);
    FuJieDian3=LinJieBiao(result,1);
    ZiJieDian3=LinJieBiao(result,2);
    BianDuFa(FuJieDian3,ZiJieDian3)=0;
    BianDuFa(ZiJieDian3,FuJieDian3)=0;
end

%Number of nodes removed
n=0;
for i=1:JiaBian1
    j(1,i)=n/MMMM;
    n=n+1;
end

%Drawing
[N,M]=size(b);
QuDongJieDian=QuDongJieDian/N;
QuDongJieDian1=QuDongJieDian1/N;
QuDongJieDian2=QuDongJieDian2/N;
QuDongJieDian3=QuDongJieDian3/N;

ZuiDaLLianTong = ZuiDaLLianTong/N;
ZuiDaLLianTong1 = ZuiDaLLianTong1/N;
ZuiDaLLianTong2 = ZuiDaLLianTong2/N;
ZuiDaLLianTong3 = ZuiDaLLianTong3/N;

figure(1);
scatter(j,QuDongJieDian,3,'rv')
hold on
scatter(j,QuDongJieDian1,3,'k^')
hold on
scatter(j,QuDongJieDian2,3,'g*')
hold on
scatter(j,QuDongJieDian3,3,'b>')

plot(j,QuDongJieDian,'r',j,QuDongJieDian1,'k',j,QuDongJieDian2,'g',j,QuDongJieDian3,'b')
legend('Bridges','Betweenness','Randomly','Degree')
xlabel('p')
ylabel('n_{D}')

figure(2)
scatter(j,ZuiDaLLianTong,30,'rv')
hold on
scatter(j,ZuiDaLLianTong1,30,'k^')
hold on
scatter(j,ZuiDaLLianTong2,30,'g*')
hold on
scatter(j,ZuiDaLLianTong3,30,'b>')

plot(j,ZuiDaLLianTong,'r',j,ZuiDaLLianTong1,'k',j,ZuiDaLLianTong2,'g',j,ZuiDaLLianTong3,'b')
legend('Bridges','Betweenness','Randomly','Degree')
xlabel('p')
ylabel('S(q)')