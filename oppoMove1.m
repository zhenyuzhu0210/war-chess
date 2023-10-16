function oppoMove1(~,~)
global t_server textresource2 resource2 numGen numGen2 bloodInit Drawrifle Drawrifle2 Drawrider Drawrider2 Drawarcher Drawarcher2...
    Drawblack Drawblack2 Drawgreen Drawgreen2 DrawredTown1 rifle rifle2 rider rider2 archer archer2 black bloodRifle1 bloodRifle2...
    bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodTown1 green battleType2 rec_player1 harm2 harmOwn2 gonnaAttack2...
    xrifle2 xrider2 xarcher2
if t_server.BytesAvailable>0  % 表示接收到玩家1传输过来的指令及数据
    dataRec=fread(t_server,t_server.BytesAvailable/8,'double');
    if dataRec(1)==-1  % 接收到玩家2招募步兵的指令
        delete(textresource2);
        resource2=resource2-20;
        resourceText2;
        numGen2.rifle=numGen2.rifle+1;  % numGen2.rifle用来记录这是场上造的的第几个步兵
        Drawrifle2(numGen2.rifle,1)=image([0 rifle2.Size(2)]+rifle2.Pos2(1),[0 rifle2.Size(1)]+rifle2.Pos2(2),...
            rifle2.CData,'alphaData',rifle2.AlpData);
        Drawblack2.rifle(numGen2.rifle,1)=rectangle('Position',[black.riflePos2(1),black.riflePos2(2),bloodInit,5],...
            'LineStyle','none','FaceColor','k');
        Drawgreen2.rifle(numGen2.rifle,1)=rectangle('Position',[green.riflePos2(1),green.riflePos2(2),bloodInit,5],...
            'LineStyle','none','FaceColor','g');
        rifle2.posStore2=[rifle2.posStore2;[rifle2.Pos2,1,1]]; % 将新造的兵的位置与原有兵的位置合并构成一个新矩阵，1表示新招募的兵当回合不能移动或攻击
        rifle2.posInit2=rifle2.Pos2;  % 表示本回合已招募过步兵
        black.rifleposStore2=[black.rifleposStore2;black.riflePos2];
        bloodRifle2=[bloodRifle2;80];
        green.rifleposStore2=[green.rifleposStore2;green.riflePos2];
    elseif dataRec(1)==-2  % 接收到玩家2招募骑兵的指令
        delete(textresource2);
        resource2=resource2-25;
        resourceText2;
        numGen2.rider=numGen2.rider+1;  % numGen.rider用来记录这是场上造的的第几个骑兵
        Drawrider2(numGen2.rider,1)=image([0 rider2.Size(2)]+rider2.Pos2(1),[0 rider2.Size(1)]+rider2.Pos2(2),...
            rider2.CData,'alphaData',rider2.AlpData);
        Drawblack2.rider(numGen2.rider,1)=rectangle('Position',[black.riderPos2(1),black.riderPos2(2),bloodInit,5],...
            'LineStyle','none','FaceColor','k');
        Drawgreen2.rider(numGen2.rider,1)=rectangle('Position',[green.riderPos2(1),green.riderPos2(2),bloodInit,5],...
            'LineStyle','none','FaceColor','g');
        rider2.posStore2=[rider2.posStore2;[rider2.Pos2,1,1]]; % 将新造的兵的位置与原有兵的位置合并构成一个新矩阵，1表示新招募的兵当回合不能移动或攻击
        rider2.posInit2=rider2.Pos2;  % 表示本回合已招募过骑兵
        black.riderposStore2=[black.riderposStore2;black.riderPos2];
        bloodRider2=[bloodRider2;80];
        green.riderposStore2=[green.riderposStore2;green.riderPos2];
    elseif dataRec(1)==-3  % 接收到玩家2招募弓箭兵的指令
        delete(textresource2);
        resource2=resource2-25;
        resourceText2;
        numGen2.archer=numGen2.archer+1;  % numGen2.archer用来记录这是场上造的的第几个弓箭兵
        Drawarcher2(numGen2.archer,1)=image([0 archer2.Size(2)]+archer2.Pos2(1),[0 archer2.Size(1)]+archer2.Pos2(2),...
            archer2.CData,'alphaData',archer2.AlpData);
        Drawblack2.archer(numGen2.archer,1)=rectangle('Position',[black.archerPos2(1),black.archerPos2(2),bloodInit,5],...
            'LineStyle','none','FaceColor','k');
        Drawgreen2.archer(numGen2.archer,1)=rectangle('Position',[green.archerPos2(1),green.archerPos2(2),bloodInit,5],...
            'LineStyle','none','FaceColor','g');
        archer2.posStore2=[archer2.posStore2;[archer2.Pos2,1,1]]; % 将新造的兵的位置与原有兵的位置合并构成一个新矩阵，1表示新招募的兵当回合不能移动或攻击
        archer2.posInit2=archer2.Pos2;  % 表示本回合已招募过弓箭兵
        black.archerposStore2=[black.archerposStore2;black.archerPos2];
        bloodArcher2=[bloodArcher2;80];
        green.archerposStore2=[green.archerposStore2;green.archerPos2];
    elseif dataRec(1)==-4  % 接收到玩家2步兵移动的指令
        xrifle2=dataRec(2);
        gonnaMove2=[dataRec(3),dataRec(4)];
        set(Drawrifle2(xrifle2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % 刷新步兵的位置
        set(Drawblack2.rifle(xrifle2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
        set(Drawgreen2.rifle(xrifle2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodRifle2(xrifle2,1),5]);
        rifle2.posStore2(xrifle2,1:2)=gonnaMove2;  % 更新该步兵的位置为移动后的位置
        black.rifleposStore2(xrifle2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
        green.rifleposStore2(xrifle2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
    elseif dataRec(1)==-5  % 接收到玩家2骑兵移动的指令
        xrider2=dataRec(2);
        gonnaMove2=[dataRec(3),dataRec(4)];
        set(Drawrider2(xrider2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % 刷新骑兵的位置
        set(Drawblack2.rider(xrider2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
        set(Drawgreen2.rider(xrider2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodRider2(xrider2,1),5]);
        rider2.posStore2(xrider2,1:2)=gonnaMove2;  % 更新该骑兵的位置为移动后的位置
        black.riderposStore2(xrider2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
        green.riderposStore2(xrider2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
    elseif dataRec(1)==-6  % 接收到玩家2弓箭兵移动的指令
        xarcher2=dataRec(2);
        gonnaMove2=[dataRec(3),dataRec(4)];
        set(Drawarcher2(xarcher2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % 刷新弓箭兵的位置
        set(Drawblack2.archer(xarcher2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
        set(Drawgreen2.archer(xarcher2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodArcher2(xarcher2,1),5]);
        archer2.posStore2(xarcher2,1:2)=gonnaMove2;  % 更新该弓箭兵的位置为移动后的位置
        black.archerposStore2(xarcher2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
        green.archerposStore2(xarcher2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
    elseif dataRec(1)==-7  % 接收到玩家2步兵攻击步兵的指令
        battleType2=1;  % 是步兵发起攻击
        xrifle2=dataRec(2);  % 玩家2的第几个步兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击步兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个步兵被攻击
        harm2=dataRec(7);  % 玩家2步兵对玩家1步兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2步兵受到的反击伤害
        blood=bloodRifle1(ordg,1);  % 确定受到攻击的玩家1步兵的起始血量
        bloodRifle1(ordg,1)=blood-harm2;  % 更新受到攻击的玩家1步兵的血量
        harmText2;
        % 更新受到攻击的玩家1步兵信息
        if bloodRifle1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % 步兵初始80血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
            delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
            delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
            rifle.posStore1(ordg,:)=[]; black.rifleposStore1(ordg,:)=[]; green.rifleposStore1(ordg,:)=[]; bloodRifle1(ordg,:)=[];
            numGen.rifle=numGen.rifle-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2步兵信息
        bloodOwn=bloodRifle2(xrifle2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRifle2(xrifle2,1)=bloodOwn-harmOwn2;  % 更新玩家2步兵血量
        if bloodRifle2(xrifle2,1)>0  % 受反击己方步兵没有死
            set(Drawgreen2.rifle(xrifle2,1),'Position',[rifle2.posStore2(xrifle2,1)+10,rifle2.posStore2(xrifle2,2)+5,bloodOwn-harmOwn2,5]);
        else
            delete(Drawrifle2(xrifle2,1)); Drawrifle2(xrifle2,:)=[];
            delete(Drawblack2.rifle(xrifle2,1)); Drawblack2.rifle(xrifle2,:)=[];
            delete(Drawgreen2.rifle(xrifle2,1)); Drawgreen2.rifle(xrifle2,:)=[];
            rifle2.posStore2(xrifle2,:)=[]; black.rifleposStore2(xrifle2,:)=[]; green.rifleposStore2(xrifle2,:)=[]; bloodRifle2(xrifle2,:)=[];
            numGen2.rifle=numGen2.rifle-1;
        end
    elseif dataRec(1)==-8  % 接收到玩家2步兵攻击骑兵的指令
        battleType2=1;  % 是步兵发起攻击
        xrifle2=dataRec(2);  % 玩家2的第几个步兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击骑兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个骑兵被攻击
        harm2=dataRec(7);  % 玩家2步兵对玩家1骑兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2步兵受到的反击伤害
        blood=bloodRider1(ordg,1);  % 确定受到攻击的玩家1骑兵的起始血量
        bloodRider1(ordg,1)=blood-80/65*harm2;  % 更新受到攻击的玩家1步兵的血量
        harmText2;
        % 更新受到攻击的玩家1骑兵信息
        if bloodRider1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % 骑兵初始65血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
            delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
            delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
            rider.posStore1(ordg,:)=[]; black.riderposStore1(ordg,:)=[]; green.riderposStore1(ordg,:)=[]; bloodRider1(ordg,:)=[];
            numGen.rider=numGen.rider-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2步兵信息
        bloodOwn=bloodRifle2(xrifle2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRifle2(xrifle2,1)=bloodOwn-harmOwn2;  % 更新玩家2步兵血量
        if bloodRifle2(xrifle2,1)>0  % 受反击己方步兵没有死
            set(Drawgreen2.rifle(xrifle2,1),'Position',[rifle2.posStore2(xrifle2,1)+10,rifle2.posStore2(xrifle2,2)+5,bloodOwn-harmOwn2,5]);
        else
            delete(Drawrifle2(xrifle2,1)); Drawrifle2(xrifle2,:)=[];
            delete(Drawblack2.rifle(xrifle2,1)); Drawblack2.rifle(xrifle2,:)=[];
            delete(Drawgreen2.rifle(xrifle2,1)); Drawgreen2.rifle(xrifle2,:)=[];
            rifle2.posStore2(xrifle2,:)=[]; black.rifleposStore2(xrifle2,:)=[]; green.rifleposStore2(xrifle2,:)=[]; bloodRifle2(xrifle2,:)=[];
            numGen2.rifle=numGen2.rifle-1;
        end
    elseif dataRec(1)==-9  % 接收到玩家2步兵攻击弓箭兵的指令
        battleType2=1;  % 是步兵发起攻击
        xrifle2=dataRec(2);  % 玩家2的第几个步兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击弓箭兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个弓箭兵被攻击
        harm2=dataRec(7);  % 玩家2步兵对玩家1弓箭兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2步兵受到的反击伤害
        blood=bloodArcher1(ordg,1);  % 确定受到攻击的玩家1弓箭兵的起始血量
        bloodArcher1(ordg,1)=blood-80/55*harm2;  % 更新受到攻击的玩家1弓箭兵的血量
        harmText2;
        % 更新受到攻击的玩家1弓箭兵信息
        if bloodArcher1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % 弓箭兵初始55血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
            delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
            delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
            archer.posStore1(ordg,:)=[]; black.archerposStore1(ordg,:)=[]; green.archerposStore1(ordg,:)=[]; bloodArcher1(ordg,:)=[];
            numGen.archer=numGen.archer-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2步兵信息
        bloodOwn=bloodRifle2(xrifle2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRifle2(xrifle2,1)=bloodOwn-harmOwn2;  % 更新玩家2步兵血量
        if bloodRifle2(xrifle2,1)>0  % 受反击己方步兵没有死
            set(Drawgreen2.rifle(xrifle2,1),'Position',[rifle2.posStore2(xrifle2,1)+10,rifle2.posStore2(xrifle2,2)+5,bloodOwn-harmOwn2,5]);
        else
            delete(Drawrifle2(xrifle2,1)); Drawrifle2(xrifle2,:)=[];
            delete(Drawblack2.rifle(xrifle2,1)); Drawblack2.rifle(xrifle2,:)=[];
            delete(Drawgreen2.rifle(xrifle2,1)); Drawgreen2.rifle(xrifle2,:)=[];
            rifle2.posStore2(xrifle2,:)=[]; black.rifleposStore2(xrifle2,:)=[]; green.rifleposStore2(xrifle2,:)=[]; bloodRifle2(xrifle2,:)=[];
            numGen2.rifle=numGen2.rifle-1;
        end
    elseif dataRec(1)==-10  % 接收到玩家2步兵攻击主塔的指令
        harm2=dataRec(2);  % 玩家2步兵对玩家1主塔造成的伤害
        blood=bloodTown1;
        bloodTown1=blood-harm2;
        harmTextTown2;
        % 更新受到攻击的玩家1主塔信息
        if bloodTown1>0
            set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
        else
            delete(DrawredTown1);
        end
    elseif dataRec(1)==-11  % 接收到玩家2骑兵攻击步兵的指令
        battleType2=2;  % 是骑兵发起攻击
        xrider2=dataRec(2);  % 玩家2的第几个骑兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击步兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个步兵被攻击
        harm2=dataRec(7);  % 玩家2骑兵对玩家1步兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2骑兵受到的反击伤害
        blood=bloodRifle1(ordg,1);  % 确定受到攻击的玩家1步兵的起始血量
        bloodRifle1(ordg,1)=blood-harm2;  % 更新受到攻击的玩家1步兵的血量
        harmText2;
        % 更新受到攻击的玩家1步兵信息
        if bloodRifle1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % 步兵初始80血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
            delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
            delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
            rifle.posStore1(ordg,:)=[]; black.rifleposStore1(ordg,:)=[]; green.rifleposStore1(ordg,:)=[]; bloodRifle1(ordg,:)=[];
            numGen.rifle=numGen.rifle-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2骑兵信息
        bloodOwn=bloodRider2(xrider2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRider2(xrider2,1)=bloodOwn-80/65*harmOwn2;  % 更新玩家2骑兵血量
        if bloodRider2(xrider2,1)>0  % 受反击己方骑兵没有死
            set(Drawgreen2.rider(xrider2,1),'Position',[rider2.posStore2(xrider2,1)+10,rider2.posStore2(xrider2,2)+5,bloodOwn-80/65*harmOwn2,5]);
        else
            delete(Drawrider2(xrider2,1)); Drawrider2(xrider2,:)=[];
            delete(Drawblack2.rider(xrider2,1)); Drawblack2.rider(xrider2,:)=[];
            delete(Drawgreen2.rider(xrider2,1)); Drawgreen2.rider(xrider2,:)=[];
            rider2.posStore2(xrider2,:)=[]; black.riderposStore2(xrider2,:)=[]; green.riderposStore2(xrider2,:)=[]; bloodRider2(xrider2,:)=[];
            numGen2.rider=numGen2.rider-1;
        end
    elseif dataRec(1)==-12  % 接收到玩家2骑兵攻击骑兵的指令
        battleType2=2;  % 是骑兵发起攻击
        xrider2=dataRec(2);  % 玩家2的第几个骑兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击骑兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个骑兵被攻击
        harm2=dataRec(7);  % 玩家2骑兵对玩家1骑兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2骑兵受到的反击伤害
        blood=bloodRider1(ordg,1);  % 确定受到攻击的玩家1骑兵的起始血量
        bloodRider1(ordg,1)=blood-80/65*harm2;  % 更新受到攻击的玩家1骑兵的血量
        harmText2;
        % 更新受到攻击的玩家1骑兵信息
        if bloodRider1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % 骑兵初始65血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
            delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
            delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
            rider.posStore1(ordg,:)=[]; black.riderposStore1(ordg,:)=[]; green.riderposStore1(ordg,:)=[]; bloodRider1(ordg,:)=[];
            numGen.rider=numGen.rider-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2骑兵信息
        bloodOwn=bloodRider2(xrider2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRider2(xrider2,1)=bloodOwn-80/65*harmOwn2;  % 更新玩家2骑兵血量
        if bloodRider2(xrider2,1)>0  % 受反击己方骑兵没有死
            set(Drawgreen2.rider(xrider2,1),'Position',[rider2.posStore2(xrider2,1)+10,rider2.posStore2(xrider2,2)+5,bloodOwn-80/65*harmOwn2,5]);
        else
            delete(Drawrider2(xrider2,1)); Drawrider2(xrider2,:)=[];
            delete(Drawblack2.rider(xrider2,1)); Drawblack2.rider(xrider2,:)=[];
            delete(Drawgreen2.rider(xrider2,1)); Drawgreen2.rider(xrider2,:)=[];
            rider2.posStore2(xrider2,:)=[]; black.riderposStore2(xrider2,:)=[]; green.riderposStore2(xrider2,:)=[]; bloodRider2(xrider2,:)=[];
            numGen2.rider=numGen2.rider-1;
        end
    elseif dataRec(1)==-13  % 接收到玩家2骑兵攻击弓箭兵的指令
        battleType2=2;  % 是骑兵发起攻击
        xrider2=dataRec(2);  % 玩家2的第几个骑兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击弓箭兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个弓箭兵被攻击
        harm2=dataRec(7);  % 玩家2骑兵对玩家1弓箭兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2骑兵受到的反击伤害
        blood=bloodArcher1(ordg,1);  % 确定受到攻击的玩家1弓箭兵的起始血量
        bloodArcher1(ordg,1)=blood-80/55*harm2;  % 更新受到攻击的玩家1弓箭兵的血量
        harmText2;
        % 更新受到攻击的玩家1弓箭兵信息
        if bloodArcher1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % 弓箭兵初始55血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
            delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
            delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
            archer.posStore1(ordg,:)=[]; black.archerposStore1(ordg,:)=[]; green.archerposStore1(ordg,:)=[]; bloodArcher1(ordg,:)=[];
            numGen.archer=numGen.archer-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2骑兵信息
        bloodOwn=bloodRider2(xrider2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRider2(xrider2,1)=bloodOwn-80/65*harmOwn2;  % 更新玩家2骑兵血量
        if bloodRider2(xrider2,1)>0  % 受反击己方骑兵没有死
            set(Drawgreen2.rider(xrider2,1),'Position',[rider2.posStore2(xrider2,1)+10,rider2.posStore2(xrider2,2)+5,bloodOwn-80/65*harmOwn2,5]);
        else
            delete(Drawrider2(xrider2,1)); Drawrider2(xrider2,:)=[];
            delete(Drawblack2.rider(xrider2,1)); Drawblack2.rider(xrider2,:)=[];
            delete(Drawgreen2.rider(xrider2,1)); Drawgreen2.rider(xrider2,:)=[];
            rider2.posStore2(xrider2,:)=[]; black.riderposStore2(xrider2,:)=[]; green.riderposStore2(xrider2,:)=[]; bloodRider2(xrider2,:)=[];
            numGen2.rider=numGen2.rider-1;
        end
    elseif dataRec(1)==-14  % 接收到玩家2骑兵攻击主塔的指令
        harm2=dataRec(2);  % 玩家2骑兵对玩家1主塔造成的伤害
        blood=bloodTown1;
        bloodTown1=blood-harm2;
        harmTextTown2;
        % 更新受到攻击的玩家1主塔信息
        if bloodTown1>0
            set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
        else
            delete(DrawredTown1);
        end
    elseif dataRec(1)==-15  % 接收到玩家2弓箭兵攻击步兵的指令
        battleType2=3;  % 是弓箭兵发起攻击
        xarcher2=dataRec(2);  % 玩家2的第几个弓箭兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击步兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个步兵被攻击
        harm2=dataRec(7);  % 玩家2弓箭兵对玩家1步兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2弓箭兵受到的反击伤害
        blood=bloodRifle1(ordg,1);  % 确定受到攻击的玩家1步兵的起始血量
        bloodRifle1(ordg,1)=blood-harm2;  % 更新受到攻击的玩家1步兵的血量
        harmText2;
        % 更新受到攻击的玩家1步兵信息
        if bloodRifle1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % 步兵初始80血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
            delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
            delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
            rifle.posStore1(ordg,:)=[]; black.rifleposStore1(ordg,:)=[]; green.rifleposStore1(ordg,:)=[]; bloodRifle1(ordg,:)=[];
            numGen.rifle=numGen.rifle-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2弓箭兵信息
        bloodOwn=bloodArcher2(xarcher2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodArcher2(xarcher2,1)=bloodOwn-80/55*harmOwn2;  % 更新己方弓箭兵血量
        if bloodArcher2(xarcher2,1)>0  % 受反击己方弓箭兵没有死
            set(Drawgreen2.archer(xarcher2,1),'Position',[archer2.posStore2(xarcher2,1)+10,archer2.posStore2(xarcher2,2)+5,bloodOwn-80/55*harmOwn2,5]);
            archer2.posStore2(xarcher2,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
        else
            delete(Drawarcher2(xarcher2,1)); Drawarcher2(xarcher2,:)=[];
            delete(Drawblack2.archer(xarcher2,1)); Drawblack2.archer(xarcher2,:)=[];
            delete(Drawgreen2.archer(xarcher2,1)); Drawgreen2.archer(xarcher2,:)=[];
            archer2.posStore2(xarcher2,:)=[]; black.archerposStore2(xarcher2,:)=[]; green.archerposStore2(xarcher2,:)=[]; bloodArcher2(xarcher2,:)=[];
            numGen2.archer=numGen2.archer-1;
        end
    elseif dataRec(1)==-16  % 接收到玩家2弓箭兵攻击骑兵的指令
        battleType2=3;  % 是弓箭兵发起攻击
        xarcher2=dataRec(2);  % 玩家2的第几个弓箭兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击骑兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个骑兵被攻击
        harm2=dataRec(7);  % 玩家2弓箭兵对玩家1骑兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2弓箭兵受到的反击伤害
        blood=bloodRider1(ordg,1);  % 确定受到攻击的玩家1骑兵的起始血量
        bloodRider1(ordg,1)=blood-80/65*harm2;  % 更新受到攻击的玩家1骑兵的血量
        harmText2;
        % 更新受到攻击的玩家1骑兵信息
        if bloodRider1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % 骑兵初始65血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
            delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
            delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
            rider.posStore1(ordg,:)=[]; black.riderposStore1(ordg,:)=[]; green.riderposStore1(ordg,:)=[]; bloodRider1(ordg,:)=[];
            numGen.rider=numGen.rider-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2弓箭兵信息
        bloodOwn=bloodArcher2(xarcher2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodArcher2(xarcher2,1)=bloodOwn-80/55*harmOwn2;  % 更新己方弓箭兵血量
        if bloodArcher2(xarcher2,1)>0  % 受反击己方弓箭兵没有死
            set(Drawgreen2.archer(xarcher2,1),'Position',[archer2.posStore2(xarcher2,1)+10,archer2.posStore2(xarcher2,2)+5,bloodOwn-80/55*harmOwn2,5]);
            archer2.posStore2(xarcher2,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
        else
            delete(Drawarcher2(xarcher2,1)); Drawarcher2(xarcher2,:)=[];
            delete(Drawblack2.archer(xarcher2,1)); Drawblack2.archer(xarcher2,:)=[];
            delete(Drawgreen2.archer(xarcher2,1)); Drawgreen2.archer(xarcher2,:)=[];
            archer2.posStore2(xarcher2,:)=[]; black.archerposStore2(xarcher2,:)=[]; green.archerposStore2(xarcher2,:)=[]; bloodArcher2(xarcher2,:)=[];
            numGen2.archer=numGen2.archer-1;
        end
    elseif dataRec(1)==-17  % 接收到玩家2弓箭兵攻击弓箭兵的指令
        battleType2=3;  % 是弓箭兵发起攻击
        xarcher2=dataRec(2);  % 玩家2的第几个弓箭兵攻击
        gonnaAttack2=[dataRec(3),dataRec(4)];  % 玩家1被攻击弓箭兵所处的格子
        ordg=dataRec(6);  % 玩家1的第几个弓箭兵被攻击
        harm2=dataRec(7);  % 玩家2弓箭兵对玩家1弓箭兵造成的伤害
        harmOwn2=dataRec(5);  % 玩家2弓箭兵受到的反击伤害
        blood=bloodArcher1(ordg,1);  % 确定受到攻击的玩家1弓箭兵的起始血量
        bloodArcher1(ordg,1)=blood-80/55*harm2;  % 更新受到攻击的玩家1弓箭兵的血量
        harmText2;
        % 更新受到攻击的玩家1弓箭兵信息
        if bloodArcher1(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % 弓箭兵初始55血
        else
            harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
            delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
            delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
            archer.posStore1(ordg,:)=[]; black.archerposStore1(ordg,:)=[]; green.archerposStore1(ordg,:)=[]; bloodArcher1(ordg,:)=[];
            numGen.archer=numGen.archer-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % 更新发起攻击的玩家2弓箭兵信息
        bloodOwn=bloodArcher2(xarcher2,1);  % 确定自己的血量
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodArcher2(xarcher2,1)=bloodOwn-80/55*harmOwn2;  % 更新己方弓箭兵血量
        if bloodArcher2(xarcher2,1)>0  % 受反击己方弓箭兵没有死
            set(Drawgreen2.archer(xarcher2,1),'Position',[archer2.posStore2(xarcher2,1)+10,archer2.posStore2(xarcher2,2)+5,bloodOwn-80/55*harmOwn2,5]);
            archer2.posStore2(xarcher2,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
        else
            delete(Drawarcher2(xarcher2,1)); Drawarcher2(xarcher2,:)=[];
            delete(Drawblack2.archer(xarcher2,1)); Drawblack2.archer(xarcher2,:)=[];
            delete(Drawgreen2.archer(xarcher2,1)); Drawgreen2.archer(xarcher2,:)=[];
            archer2.posStore2(xarcher2,:)=[]; black.archerposStore2(xarcher2,:)=[]; green.archerposStore2(xarcher2,:)=[]; bloodArcher2(xarcher2,:)=[];
            numGen2.archer=numGen2.archer-1;
        end
    elseif dataRec(1)==-18  % 接收到玩家2弓箭兵攻击主塔的指令
        harm2=dataRec(2);  % 玩家2弓箭兵对玩家1主塔造成的伤害
        blood=bloodTown1;
        bloodTown1=blood-harm2;
        harmTextTown2;
        % 更新受到攻击的玩家1主塔信息
        if bloodTown1>0
            set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
        else
            delete(DrawredTown1);
        end
    elseif dataRec(1)==-19  % 接收到玩家2回合结束的指令
        resource2=resource2+5;
        delete(textresource2);
        resourceText2;
        delete(rec_player1);
        questdlg('你的回合','回合','确定','确定');
        set(gcf,'WindowButtonDownFcn',@clicktown1);  % 检测鼠标点击
    elseif dataRec(1)==-20  % 接受到玩家2投降的指令
        buttonEnd=questdlg('玩家一获胜！','游戏结束','重新开始','返回主页','重新开始');
        if strcmp(buttonEnd,'重新开始')
            clf;
            chessWarRestart1;
        else
            delete(rec_player1);
            gui2;
        end
    end
end
if bloodTown1<=0
    buttonEnd=questdlg('玩家二获胜！','游戏结束','重新开始','返回主页','重新开始');
    if strcmp(buttonEnd,'重新开始')
        clf;
        chessWarRestart1;
    else
        delete(rec_player1);
        gui2;
    end
end
end