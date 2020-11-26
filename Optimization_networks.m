%Input matrix adjacency matrix B, and compare the optimization effects of bridges backup and bridges optimization (random attack on the optimized network)
%This program needs to use MATLAB_ Bgl-4.0.1 graph theory toolbox
%The first run will report an error "function or variable 'Gebian' is not defined." Because there is no bridges input
%Copy the data in the "Eclipsesr" that has been obtained, and use the Java program "BombingImportantBridge.java" Calculate gebian and input it into Matlab (get the bridge edge in the network)
%In addition, you need "Youhua jiabian data", and copy the data in the "Eclipse SR" that has been obtained, and use Java program "OptBridge.java" to get youhuajiabian and input matlab (get the optimized edge of bridge edge elimination)

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

%random failure
SuiJi=b;
[N2,M2]=size(b);
LinJieBiao1=LinJieBiao;
for JiaBian=1:MMMM
    QuDongJieDian(1,JiaBian)=max(1,N2-rank(SuiJi));
    [ciii sizesss] = components(sparse(SuiJi));
    ZuiDaLLianTong(1,JiaBian)=max(sizesss);
    [l,k]=size(LinJieBiao1);
    result = unidrnd(l);
    FuJieDian=LinJieBiao1(result,1);
    ZiJieDian=LinJieBiao1(result,2);
    SuiJi(FuJieDian,ZiJieDian)=0;
    SuiJi(ZiJieDian,FuJieDian)=0;
    LinJieBiao1(result,:)=[];
end

%bridges failure
Optimization=b;
[GeH GeL]=size(YouHuaJiaBian);
for JiaBian=1:GeH
    FuJieDian11=YouHuaJiaBian(JiaBian,1);
    ZiJieDian11=YouHuaJiaBian(JiaBian,2);
    Optimization(FuJieDian11,ZiJieDian11)=1;
    Optimization(ZiJieDian11,FuJieDian11)=1;
end

%Controllability calculation
LinJieBiao2=LinJieBiao;
[N2,M2]=size(b);
for JiaBian=1:MMMM
    QuDongJieDian1(1,JiaBian)=max(1,N2-rank(Optimization));
    [ciii sizesss] = components(sparse(Optimization));
    ZuiDaLLianTong1(1,JiaBian)=max(sizesss);
    [l,k]=size(LinJieBiao2);
    result = unidrnd(l);
    FuJieDian=LinJieBiao2(result,1);
    ZiJieDian=LinJieBiao2(result,2);
    Optimization(FuJieDian,ZiJieDian)=0;
    Optimization(ZiJieDian,FuJieDian)=0;
    LinJieBiao2(result,:)=[];
end

%BackUp
jjj=0;
BackUp=b;
GeBian2=GeBian;
LinJieBiao3=LinJieBiao;
[N2,M2]=size(b);
for JiaBian2=1:MMMM
    QuDongJieDian2(1,JiaBian2)=max(1,N2-rank(BackUp));
    [ciii sizesss] = components(sparse(BackUp));
    ZuiDaLLianTong2(1,JiaBian2)=max(sizesss);
    [l,k]=size(LinJieBiao3);
    result = unidrnd(l);
    FuJieDian2=LinJieBiao3(result,1);
    ZiJieDian2=LinJieBiao3(result,2);
    
    [g,f]=size(GeBian2);
    clear hh
    for k=1:g
        if GeBian2(k,1)==FuJieDian2&&GeBian2(k,2)==ZiJieDian2||GeBian2(k,2)==FuJieDian2&&GeBian2(k,1)==ZiJieDian2
            hh=k;
            jjj=1;
        end
    end
    if jjj==0
        BackUp(FuJieDian2,ZiJieDian2)=0;
        BackUp(ZiJieDian2,FuJieDian2)=0;
        LinJieBiao3(result,:)=[];
    else
        if hh~=0
            GeBian2(hh,:)=[];
            jjj=0;
        end 
    end
end

%BackUpR
jjj=0;
BackUpR=b;
LinJieBiao3=LinJieBiao;
[gg,f]=size(GeBian);
[ggg,f]=size(LinJieBiao3);
random=[randperm(ggg,gg)]';
for i=1:gg
    GeBian2(i,1)=LinJieBiao3(random(i,1),1);
    GeBian2(i,2)=LinJieBiao3(random(i,1),2);
end

[N2,M2]=size(b);
for JiaBian2=1:MMMM
    QuDongJieDian3(1,JiaBian2)=max(1,N2-rank(BackUpR));
    [ciii sizesss] = components(sparse(BackUpR));
    ZuiDaLLianTong3(1,JiaBian2)=max(sizesss);
    [l,k]=size(LinJieBiao3);
    result = unidrnd(l);
    FuJieDian2=LinJieBiao3(result,1);
    ZiJieDian2=LinJieBiao3(result,2);
    
    [g,f]=size(GeBian2);
    clear hh
    for k=1:g
        if GeBian2(k,1)==FuJieDian2&&GeBian2(k,2)==ZiJieDian2||GeBian2(k,2)==FuJieDian2&&GeBian2(k,1)==ZiJieDian2
            hh=k;
            jjj=1;
        end
    end
    if jjj==0
        BackUpR(FuJieDian2,ZiJieDian2)=0;
        BackUpR(ZiJieDian2,FuJieDian2)=0;
        LinJieBiao3(result,:)=[];
    else
        
        if hh~=0
            GeBian2(hh,:)=[];
            jjj=0;
        end
    end
end

%BackUpB
jjj=0;
BackUpB=b;
LinJieBiao3=LinJieBiao;
[gg,f]=size(GeBian);
[ggg,f]=size(LinJieBiao3);

[bc,E] = betweenness_centrality(sparse(BackUpB));
Bian=full(E);
[JieShuPaiXu]=sort(Bian(:),'descend');

ZuiDa=JieShuPaiXu(1,1);
[JieDian0 JieDian1]=find(Bian==ZuiDa);
[ppp,pppp]=size(JieDian0);
if(ppp==1)
    GeBian2(1,1)=JieDian0;
    GeBian2(1,2)=JieDian1;
else
    for j=1:ppp
        GeBian2(j,1)=JieDian0(j,1);
        GeBian2(j,2)=JieDian1(j,1);
    end
end

for i=2:gg
    ZuiDa1=JieShuPaiXu(i,1);
    if (ZuiDa==ZuiDa1)
        continue
    end
    ZuiDa=ZuiDa1;
    [JieDian0 JieDian1]=find(Bian==ZuiDa);
    [ppp,pppp]=size(JieDian0);
    if(ppp==1)
        GeBian2(i,1)=JieDian0;
        GeBian2(i,2)=JieDian1;
    else
        for j=1:ppp
            GeBian2(i,1)=JieDian0(j,1);
            GeBian2(i,2)=JieDian1(j,1);
        end
    end
end

[N2,M2]=size(b);
for JiaBian2=1:MMMM
    QuDongJieDian4(1,JiaBian2)=max(1,N2-rank(BackUpB));
    [ciii sizesss] = components(sparse(BackUpB));
    ZuiDaLLianTong4(1,JiaBian2)=max(sizesss);
    [l,k]=size(LinJieBiao3);
    result = unidrnd(l);
    FuJieDian2=LinJieBiao3(result,1);
    ZiJieDian2=LinJieBiao3(result,2);
    
    [g,f]=size(GeBian2);
    clear hh
    for k=1:g
        if GeBian2(k,1)==FuJieDian2&&GeBian2(k,2)==ZiJieDian2||GeBian2(k,2)==FuJieDian2&&GeBian2(k,1)==ZiJieDian2
            hh=k;
            jjj=1;
        end
    end
    if jjj==0
        BackUpB(FuJieDian2,ZiJieDian2)=0;
        BackUpB(ZiJieDian2,FuJieDian2)=0;
        LinJieBiao3(result,:)=[];
    else
        if hh~=0
            GeBian2(hh,:)=[];
            jjj=0;
        end
    end
end

%BackUpD
jjj=0;
BackUpD=b;
LinJieBiao3=LinJieBiao;
[gg,f]=size(GeBian);
[ggg,f]=size(LinJieBiao3);

[Num1,M]=size(b);  
for i=1:Num1       
    C(i,1)=1;
end
Du=b*C;             
[BianShu,q]=size(LinJieBiao)
for i=1:BianShu
    BianDu(i,1)=Du(LinJieBiao(i,1),1)*Du(LinJieBiao(i,2),1);
end
[q HangHao]=sort(BianDu,'descend');

for i=1:gg
    GeBian2(i,1)=LinJieBiao3(HangHao(i,1),1);
    GeBian2(i,2)=LinJieBiao3(HangHao(i,1),2);
end

[N2,M2]=size(b);
for JiaBian2=1:MMMM
    QuDongJieDian5(1,JiaBian2)=max(1,N2-rank(BackUpD));
    [ciii sizesss] = components(sparse(BackUpD));
    ZuiDaLLianTong5(1,JiaBian2)=max(sizesss);
    [l,k]=size(LinJieBiao3);
    result = unidrnd(l);
    FuJieDian2=LinJieBiao3(result,1);
    ZiJieDian2=LinJieBiao3(result,2);
    
    [g,f]=size(GeBian2);
    clear hh
    for k=1:g
        if GeBian2(k,1)==FuJieDian2&&GeBian2(k,2)==ZiJieDian2||GeBian2(k,2)==FuJieDian2&&GeBian2(k,1)==ZiJieDian2
            hh=k;
            jjj=1;
        end
    end
    if jjj==0
        BackUpD(FuJieDian2,ZiJieDian2)=0;
        BackUpD(ZiJieDian2,FuJieDian2)=0;
        LinJieBiao3(result,:)=[];
    else
        if hh~=0
            GeBian2(hh,:)=[];
            jjj=0;
        end  
    end
end

[N,M]=size(b);
QuDongJieDian=ZuiDaLLianTong./QuDongJieDian;
QuDongJieDian1=ZuiDaLLianTong1./QuDongJieDian1;
QuDongJieDian2=ZuiDaLLianTong2./QuDongJieDian2;
QuDongJieDian3=ZuiDaLLianTong3./QuDongJieDian3;
QuDongJieDian4=ZuiDaLLianTong4./QuDongJieDian4;
QuDongJieDian5=ZuiDaLLianTong5./QuDongJieDian5;

%Drawing -- take 40%
figure(1)
clear uu ZB ZB1 ZB2 ZB3 ZB4 ZB5
n=1
m=1
for i=1:9
    ZB(1,i)=QuDongJieDian(1,m);
    ZB1(1,i)=QuDongJieDian1(1,m);
    ZB2(1,i)=QuDongJieDian2(1,m);
    ZB3(1,i)=QuDongJieDian3(1,m);
    ZB4(1,i)=QuDongJieDian4(1,m);
    ZB5(1,i)=QuDongJieDian5(1,m);
    n=n+1;
    m=floor(n*(MMMM/20));
end

n=0
for i=1:9
    uu(1,i)=n;
    n=n+1;
end

uu=uu/20;

scatter(uu,ZB,30,'rv')
hold on
scatter(uu,ZB1,30,'k^')
hold on
scatter(uu,ZB2,30,'g*')
hold on
scatter(uu,ZB3,30,'b*')
hold on
scatter(uu,ZB4,30,'y*')
hold on
scatter(uu,ZB5,30,'c*')

plot(uu,ZB,'r',uu,ZB1,'k',uu,ZB2,'g',uu,ZB3,'b',uu,ZB4,'y',uu,ZB5,'c')
legend('Initial','Bridges Elimination','Bridges Backup','Randomly Backup','Betweenness Backup','Degree Backup')
xlabel('p')
ylabel('R')

%Drawing -- take 100%
figure(2)

n=1;
m=1;
for i=1:11
    ZB(1,i)=QuDongJieDian(1,m);
    ZB1(1,i)=QuDongJieDian1(1,m);
    ZB2(1,i)=QuDongJieDian2(1,m);
    ZB3(1,i)=QuDongJieDian3(1,m);
    ZB4(1,i)=QuDongJieDian4(1,m);
    ZB5(1,i)=QuDongJieDian5(1,m);
    n=n+1;
    m=floor(n*(MMMM/11));
end

n=0;
for i=1:11
    uu(1,i)=n;
    n=n+1;
end

uu=uu/10;

scatter(uu,ZB,30,'rv')
hold on
scatter(uu,ZB1,30,'k^')
hold on
scatter(uu,ZB2,30,'g*')
hold on
scatter(uu,ZB3,30,'b*')
hold on
scatter(uu,ZB4,30,'y*')
hold on
scatter(uu,ZB5,30,'c*')

plot(uu,ZB,'r',uu,ZB1,'k',uu,ZB2,'g',uu,ZB3,'b',uu,ZB4,'y',uu,ZB5,'c')
legend('Initial','Bridges Elimination','Bridges Backup','Randomly Backup','Betweenness Backup','Degree Backup')
xlabel('p')
ylabel('R')