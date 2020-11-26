%The same operation as bridgecomplex networks is suitable for counting the effect of edge cutting failure without comparing graphs

%%%-----------------------------------------------------------------------
%Adjacency label reading
%Please enter adjacency matrix b

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

%Controllability and maximum connected subgraph after bridges failure
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

[MMM NNN]=size(QuDongJieDian);
QuDongBianHua=QuDongJieDian(1,NNN)-QuDongJieDian(1,1);
LianTongBianHua=ZuiDaLLianTong(1,1)-ZuiDaLLianTong(1,NNN);
QuDongBianHua=QuDongBianHua/N;
LianTongBianHua= LianTongBianHua/N;
ZuiDaShu=ZuiDaLLianTong(1,NNN);

CR = ZuiDaLLianTong(1,1)/QuDongJieDian(1,1)-ZuiDaLLianTong(1,NNN)/QuDongJieDian(1,NNN);
CR1= ZuiDaLLianTong(1,NNN)/QuDongJieDian(1,NNN);
CR3=QuDongJieDian(1,NNN)/N-QuDongJieDian(1,1)/N % \triangle n_D

GeBianH %number of bridges
MMMM*2 %number of edges
N %number of nodes
awvgk %average degree