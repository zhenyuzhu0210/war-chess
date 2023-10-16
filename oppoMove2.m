function oppoMove2(~,~)
global t_client textresource1 resource1 numGen numGen2 bloodInit Drawrifle Drawrifle2 Drawrider Drawrider2 Drawarcher Drawarcher2...
    Drawblack Drawblack2 Drawgreen Drawgreen2 DrawredTown2 rifle rifle2 rider rider2 archer archer2 black bloodRifle1 bloodRifle2...
    bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodTown2 green battleType rec_player2 harm harmOwn gonnaAttack...
    xrifle xrider xarcher
if t_client.BytesAvailable>0  % 表示接收到玩家1传输过来的指令及数据
    dataRec=fread(t_client,t_client.BytesAvailable/8,'double');
    if dataRec(1)==-1  % 接收到玩家1招募步兵的指令
        delete(textresource1);
        resource1=resource1-20;
        resourceText1;
        numGen.rifle=numGen.rifle+1;  % numGen.rifle用来记录这是场上造的的第几个步兵
        Drawrifle(numGen.rifle,1)=image([0 rifle.Size(2)]+rifle.Pos1(1),[0 rifle.Size(1)]+rifle.Pos1(2),...
            rifle.CData,'alphaData',rifle.AlpData);
        Drawblack.rifle(numGen.rifle,1)=rectangle('Position',[black.riflePos1(1),black.riflePos1(2),bloodInit,5],...
            'LineStyle','none','FaceColor','k');
        Drawgreen.rifle(numGen.rifle,1)=rectangle('Position',[green.riflePos1(1),green.riflePos1(2),bloodInit,5],...
            'LineStyle','none','FaceColor','g');
        rifle.posStore1=[rifle.posStore1;[rifle.Pos1,1,1]]; % 将新造的兵的位置与原有兵的位置合并构成一个新矩阵，1表示新招募的兵当回合不能移动也不能攻击
        rifle.posInit1=rifle.Pos1;  % 表示本回合已招募过步兵
        black.rifleposStore1=[black.rifleposStore1;black.riflePos1];
        bloodRifle1=[bloodRifle1;80];
        green.rifleposStore1=[green.rifleposStore1;green.riflePos1];
    elseif dataRec(1)==-2  % 接收到玩家1招募骑兵的指令
        delete(textresource1);
        resource1=resource1-25;
        resourceText1;
        numGen.rider=numGen.rider+1;  % numGen.rider用来记录这是场上造的的第几个骑兵
        Drawrider(numGen.rider,1)=image([0 rider.Size(2)]+rider.Pos1(1),[0 rider.Size(1)]+rider.Pos1(2),...
            rider.CData,'alphaData',rider.AlpData);
        Drawblack.rider(numGen.rider,1)=rectangle('Position',[black.riderPos1(1),black.riderPos1(2),bloodInit,5],...
            'LineStyle','none','FaceColor','k');
        Drawgreen.rider(numGen.rider,1)=rectangle('Position',[green.riderPos1(1),green.riderPos1(2),bloodInit,5],...
            'LineStyle','none','FaceColor','g');
        rider.posStore1=[rider.posStore1;[rider.Pos1,1,1]]; % 将新造的兵的位置与原有兵的位置合并构成一个新矩阵，1表示新招募的兵当回合不能移动也不能攻击
        rider.posInit1=rider.Pos1;  % 表示本回合已招募过骑兵
        black.riderposStore1=[black.riderposStore1;black.riderPos1];
        bloodRider1=[bloodRider1;80];
        green.riderposStore1=[green.riderposStore1;green.riderPos1];
    elseif dataRec(1)==-3  % 接收到玩家1招募弓箭兵的指令
        delete(textresource1);
        resource1=resource1-25;
        resourceText1;
        numGen.archer=numGen.archer+1;  % numGen.archer用来记录这是场上造的的第几个弓箭兵
        Drawarcher(numGen.archer,1)=image([0 archer.Size(2)]+archer.Pos1(1),[0 archer.Size(1)]+archer.Pos1(2),...
            archer.CData,'alphaData',archer.AlpData);
        Drawblack.archer(numGen.archer,1)=rectangle('Position',[black.archerPos1(1),black.archerPos1(2),bloodInit,5],...
            'LineStyle','none','FaceColor','k');
        Drawgreen.archer(numGen.archer,1)=rectangle('Position',[green.archerPos1(1),green.archerPos1(2),bloodInit,5],...
            'LineStyle','none','FaceColor','g');
        archer.posStore1=[archer.posStore1;[archer.Pos1,1,1]]; % 将新造的兵的位置与原有兵的位置合并构成一个新矩阵，1表示新招募的兵当回合不能移动也不能攻击
        archer.posInit1=archer.Pos1;  % 表示本回合已招募过弓箭兵
        black.archerposStore1=[black.archerposStore1;black.archerPos1];
        bloodArcher1=[bloodArcher1;80];
        green.archerposStore1=[green.archerposStore1;green.archerPos1];
    elseif dataRec(1)==-4  % 接收到玩家1步兵移动的指令
        xrifle=dataRec(2);
        gonnaMove=[dataRec(3),dataRec(4)];
        set(Drawrifle(xrifle,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % 刷新步兵的位置
        set(Drawblack.rifle(xrifle,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
        set(Drawgreen.rifle(xrifle,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodRifle1(xrifle,1),5]);
        rifle.posStore1(xrifle,1:2)=gonnaMove;  % 更新该步兵的位置为移动后的位置
        black.rifleposStore1(xrifle,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
        green.rifleposStore1(xrifle,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
    elseif dataRec(1)==-5  % 接收到玩家1骑兵移动的指令
        xrider=dataRec(2);
        gonnaMove=[dataRec(3),dataRec(4)];
        set(Drawrider(xrider,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % 刷新骑兵的位置
        set(Drawblack.rider(xrider,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
        set(Drawgreen.rider(xrider,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodRider1(xrider,1),5]);
        rider.posStore1(xrider,1:2)=gonnaMove;  % 更新该骑兵的位置为移动后的位置
        black.riderposStore1(xrider,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
        green.riderposStore1(xrider,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
    elseif dataRec(1)==-6  % 接收到玩家1弓箭兵移动的指令
        xarcher=dataRec(2);
        gonnaMove=[dataRec(3),dataRec(4)];
        set(Drawarcher(xarcher,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % 刷新弓箭兵的位置
        set(Drawblack.archer(xarcher,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
        set(Drawgreen.archer(xarcher,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodArcher1(xarcher,1),5]);
        archer.posStore1(xarcher,1:2)=gonnaMove;  % 更新该弓箭兵的位置为移动后的位置
        black.archerposStore1(xarcher,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
        green.archerposStore1(xarcher,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
    elseif dataRec(1)==-7  % 接收到玩家1步兵攻击步兵的指令
        battleType=1;  % 是步兵发起攻击
        xrifle=dataRec(2);  % 玩家1的第几个步兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击步兵所处的格子
        ordg=dataRec(6);  % 玩家2的第几个步兵被攻击
        harm=dataRec(7);  % 玩家1步兵对玩家2步兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1步兵受到的反击伤害
        blood=bloodRifle2(ordg,1);  % 确定受到攻击的玩家2步兵的起始血量
        bloodRifle2(ordg,1)=blood-harm;  % 更新受到攻击的玩家2步兵的血量
        harmText;
        % 更新受到攻击的玩家2步兵信息
        if bloodRifle2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
            delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
            delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
            rifle2.posStore2(ordg,:)=[]; black.rifleposStore2(ordg,:)=[]; green.rifleposStore2(ordg,:)=[]; bloodRifle2(ordg,:)=[];
            numGen2.rifle=numGen2.rifle-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1步兵信息
        bloodOwn=bloodRifle1(xrifle,1);  % 玩家1步兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRifle1(xrifle,1)=bloodOwn-harmOwn;  % 更新玩家1步兵血量
        if bloodRifle1(xrifle,1)>0  % 受反击己方步兵没有死
            set(Drawgreen.rifle(xrifle,1),'Position',[rifle.posStore1(xrifle,1)+10,rifle.posStore1(xrifle,2)+5,bloodOwn-harmOwn,5]);
        else
            delete(Drawrifle(xrifle,1)); Drawrifle(xrifle,:)=[];
            delete(Drawblack.rifle(xrifle,1)); Drawblack.rifle(xrifle,:)=[];
            delete(Drawgreen.rifle(xrifle,1)); Drawgreen.rifle(xrifle,:)=[];
            rifle.posStore1(xrifle,:)=[]; black.rifleposStore1(xrifle,:)=[]; green.rifleposStore1(xrifle,:)=[]; bloodRifle1(xrifle,:)=[];
            numGen.rifle=numGen.rifle-1;
        end
    elseif dataRec(1)==-8  % 接收到玩家1步兵攻击骑兵的指令
        battleType=1;  % 是步兵发起攻击
        xrifle=dataRec(2);  % 玩家1的第几个步兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击骑兵所处的格子
        ordg=dataRec(6);  % 玩家2的第几个骑兵被攻击
        harm=dataRec(7);  % 玩家1步兵对玩家2骑兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1步兵受到的反击伤害
        blood=bloodRider2(ordg,1);  % 确定受到攻击的玩家2骑兵的起始血量
        bloodRider2(ordg,1)=blood-80/65*harm;  % 更新受到攻击的玩家2骑兵的血量
        harmText;
        % 更新受到攻击的玩家2骑兵信息
        if bloodRider2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % 骑兵初始65血
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
            delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
            delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
            rider2.posStore2(ordg,:)=[]; black.riderposStore2(ordg,:)=[]; green.riderposStore2(ordg,:)=[]; bloodRider2(ordg,:)=[];
            numGen2.rider=numGen2.rider-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1步兵信息
        bloodOwn=bloodRifle1(xrifle,1);  % 玩家1步兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRifle1(xrifle,1)=bloodOwn-harmOwn;  % 更新玩家1步兵血量
        if bloodRifle1(xrifle,1)>0  % 受反击己方步兵没有死
            set(Drawgreen.rifle(xrifle,1),'Position',[rifle.posStore1(xrifle,1)+10,rifle.posStore1(xrifle,2)+5,bloodOwn-harmOwn,5]);
        else
            delete(Drawrifle(xrifle,1)); Drawrifle(xrifle,:)=[];
            delete(Drawblack.rifle(xrifle,1)); Drawblack.rifle(xrifle,:)=[];
            delete(Drawgreen.rifle(xrifle,1)); Drawgreen.rifle(xrifle,:)=[];
            rifle.posStore1(xrifle,:)=[]; black.rifleposStore1(xrifle,:)=[]; green.rifleposStore1(xrifle,:)=[]; bloodRifle1(xrifle,:)=[];
            numGen.rifle=numGen.rifle-1;
        end
    elseif dataRec(1)==-9  % 接收到玩家1步兵攻击弓箭兵的指令
        battleType=1;  % 是步兵发起攻击
        xrifle=dataRec(2);  % 玩家1的第几个步兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击弓箭所处的格子
        ordg=dataRec(6);  % 玩家2的第几个弓箭兵被攻击
        harm=dataRec(7);  % 玩家1步兵对玩家2弓箭兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1步兵受到的反击伤害
        blood=bloodArcher2(ordg,1);  % 确定受到攻击的玩家2弓箭兵的起始血量
        bloodArcher2(ordg,1)=blood-80/55*harm;  % 更新受到攻击的玩家2弓箭兵的血量
        harmText;
        % 更新受到攻击的玩家2弓箭兵信息
        if bloodArcher2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % 弓箭兵初始55血
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
            delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
            delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
            archer2.posStore2(ordg,:)=[]; black.archerposStore2(ordg,:)=[]; green.archerposStore2(ordg,:)=[]; bloodArcher2(ordg,:)=[];
            numGen2.archer=numGen2.archer-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1步兵信息
        bloodOwn=bloodRifle1(xrifle,1);  % 玩家1步兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRifle1(xrifle,1)=bloodOwn-harmOwn;  % 更新玩家1步兵血量
        if bloodRifle1(xrifle,1)>0  % 受反击己方步兵没有死
            set(Drawgreen.rifle(xrifle,1),'Position',[rifle.posStore1(xrifle,1)+10,rifle.posStore1(xrifle,2)+5,bloodOwn-harmOwn,5]);
        else
            delete(Drawrifle(xrifle,1)); Drawrifle(xrifle,:)=[];
            delete(Drawblack.rifle(xrifle,1)); Drawblack.rifle(xrifle,:)=[];
            delete(Drawgreen.rifle(xrifle,1)); Drawgreen.rifle(xrifle,:)=[];
            rifle.posStore1(xrifle,:)=[]; black.rifleposStore1(xrifle,:)=[]; green.rifleposStore1(xrifle,:)=[]; bloodRifle1(xrifle,:)=[];
            numGen.rifle=numGen.rifle-1;
        end
    elseif dataRec(1)==-10  % 接收到玩家1步兵攻击主塔的指令
        harm=dataRec(2);  % 玩家1步兵对玩家2主塔造成的伤害
        blood=bloodTown2;
        bloodTown2=blood-harm;
        harmTextTown1;
        % 更新受到攻击的玩家2主塔信息
        if bloodTown2>0
            set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
        else
            delete(DrawredTown2);
        end
    elseif dataRec(1)==-11  % 接收到玩家1骑兵攻击步兵的指令
        battleType=2;  % 是骑兵发起攻击
        xrider=dataRec(2);  % 玩家1的第几个骑兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击步兵所处的格子
        ordg=dataRec(6);  % 玩家2的第几个步兵被攻击
        harm=dataRec(7);  % 玩家1骑兵对玩家2步兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1骑兵受到的反击伤害
        blood=bloodRifle2(ordg,1);  % 确定受到攻击的玩家2步兵的起始血量
        bloodRifle2(ordg,1)=blood-harm;  % 更新受到攻击的玩家2步兵的血量
        harmText;
        % 更新受到攻击的玩家2步兵信息
        if bloodRifle2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
            delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
            delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
            rifle2.posStore2(ordg,:)=[]; black.rifleposStore2(ordg,:)=[]; green.rifleposStore2(ordg,:)=[]; bloodRifle2(ordg,:)=[];
            numGen2.rifle=numGen2.rifle-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1骑兵信息
        bloodOwn=bloodRider1(xrider,1);  % 玩家1骑兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRider1(xrider,1)=bloodOwn-80/65*harmOwn;  % 更新玩家1骑兵血量
        if bloodRider1(xrider,1)>0  % 受反击己方骑兵没有死
            set(Drawgreen.rider(xrider,1),'Position',[rider.posStore1(xrider,1)+10,rider.posStore1(xrider,2)+5,bloodOwn-80/65*harmOwn,5]);
        else
            delete(Drawrider(xrider,1)); Drawrider(xrider,:)=[];
            delete(Drawblack.rider(xrider,1)); Drawblack.rider(xrider,:)=[];
            delete(Drawgreen.rider(xrider,1)); Drawgreen.rider(xrider,:)=[];
            rider.posStore1(xrider,:)=[]; black.riderposStore1(xrider,:)=[]; green.riderposStore1(xrider,:)=[]; bloodRider1(xrider,:)=[];
            numGen.rider=numGen.rider-1;
        end
    elseif dataRec(1)==-12  % 接收到玩家1骑兵攻击骑兵的指令
        battleType=2;  % 是骑兵发起攻击
        xrider=dataRec(2);  % 玩家1的第几个骑兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击骑兵所处的格子
        ordg=dataRec(6);  % 玩家2的第几个骑兵被攻击
        harm=dataRec(7);  % 玩家1骑兵对玩家2骑兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1骑兵受到的反击伤害
        blood=bloodRider2(ordg,1);  % 确定受到攻击的玩家2骑兵的起始血量
        bloodRider2(ordg,1)=blood-80/65*harm;  % 更新受到攻击的玩家2骑兵的血量
        harmText;
        % 更新受到攻击的玩家2骑兵信息
        if bloodRider2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % 骑兵初始65血
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
            delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
            delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
            rider2.posStore2(ordg,:)=[]; black.riderposStore2(ordg,:)=[]; green.riderposStore2(ordg,:)=[]; bloodRider2(ordg,:)=[];
            numGen2.rider=numGen2.rider-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1骑兵信息
        bloodOwn=bloodRider1(xrider,1);  % 玩家1骑兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRider1(xrider,1)=bloodOwn-80/65*harmOwn;  % 更新玩家1骑兵血量
        if bloodRider1(xrider,1)>0  % 受反击己方骑兵没有死
            set(Drawgreen.rider(xrider,1),'Position',[rider.posStore1(xrider,1)+10,rider.posStore1(xrider,2)+5,bloodOwn-80/65*harmOwn,5]);
        else
            delete(Drawrider(xrider,1)); Drawrider(xrider,:)=[];
            delete(Drawblack.rider(xrider,1)); Drawblack.rider(xrider,:)=[];
            delete(Drawgreen.rider(xrider,1)); Drawgreen.rider(xrider,:)=[];
            rider.posStore1(xrider,:)=[]; black.riderposStore1(xrider,:)=[]; green.riderposStore1(xrider,:)=[]; bloodRider1(xrider,:)=[];
            numGen.rider=numGen.rider-1;
        end
    elseif dataRec(1)==-13  % 接收到玩家1骑兵攻击弓箭兵的指令
        battleType=2;  % 是骑兵发起攻击
        xrider=dataRec(2);  % 玩家1的第几个骑兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击弓箭所处的格子
        ordg=dataRec(6);  % 玩家2的第几个弓箭兵被攻击
        harm=dataRec(7);  % 玩家1骑兵对玩家2弓箭兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1骑兵受到的反击伤害
        blood=bloodArcher2(ordg,1);  % 确定受到攻击的玩家2弓箭兵的起始血量
        bloodArcher2(ordg,1)=blood-80/55*harm;  % 更新受到攻击的玩家2弓箭兵的血量
        harmText;
        % 更新受到攻击的玩家2弓箭兵信息
        if bloodArcher2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % 弓箭兵初始55血
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
            delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
            delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
            archer2.posStore2(ordg,:)=[]; black.archerposStore2(ordg,:)=[]; green.archerposStore2(ordg,:)=[]; bloodArcher2(ordg,:)=[];
            numGen2.archer=numGen2.archer-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1骑兵信息
        bloodOwn=bloodRider1(xrider,1);  % 玩家1骑兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRider1(xrider,1)=bloodOwn-80/65*harmOwn;  % 更新玩家1骑兵血量
        if bloodRider1(xrider,1)>0  % 受反击己方骑兵没有死
            set(Drawgreen.rider(xrider,1),'Position',[rider.posStore1(xrider,1)+10,rider.posStore1(xrider,2)+5,bloodOwn-80/65*harmOwn,5]);
        else
            delete(Drawrider(xrider,1)); Drawrider(xrider,:)=[];
            delete(Drawblack.rider(xrider,1)); Drawblack.rider(xrider,:)=[];
            delete(Drawgreen.rider(xrider,1)); Drawgreen.rider(xrider,:)=[];
            rider.posStore1(xrider,:)=[]; black.riderposStore1(xrider,:)=[]; green.riderposStore1(xrider,:)=[]; bloodRider1(xrider,:)=[];
            numGen.rider=numGen.rider-1;
        end
    elseif dataRec(1)==-14  % 接收到玩家1骑兵攻击主塔的指令
        harm=dataRec(2);  % 玩家1骑兵对玩家2主塔造成的伤害
        blood=bloodTown2;
        bloodTown2=blood-harm;
        harmTextTown1;
        % 更新受到攻击的玩家2主塔信息
        if bloodTown2>0
            set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
        else
            delete(DrawredTown2);
        end
    elseif dataRec(1)==-15  % 接收到玩家1弓箭兵攻击步兵的指令
        battleType=3;  % 是弓箭兵发起攻击
        xarcher=dataRec(2);  % 玩家1的第几个弓箭兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击步兵所处的格子
        ordg=dataRec(6);  % 玩家2的第几个步兵被攻击
        harm=dataRec(7);  % 玩家1弓箭兵对玩家2步兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1弓箭兵受到的反击伤害
        blood=bloodRifle2(ordg,1);  % 确定受到攻击的玩家2步兵的起始血量
        bloodRifle2(ordg,1)=blood-harm;  % 更新受到攻击的玩家2步兵的血量
        harmText;
        % 更新受到攻击的玩家2步兵信息
        if bloodRifle2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
            delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
            delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
            rifle2.posStore2(ordg,:)=[]; black.rifleposStore2(ordg,:)=[]; green.rifleposStore2(ordg,:)=[]; bloodRifle2(ordg,:)=[];
            numGen2.rifle=numGen2.rifle-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1弓箭兵信息
        bloodOwn=bloodArcher1(xarcher,1);  % 玩家1弓箭兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodArcher1(xarcher,1)=bloodOwn-80/55*harmOwn;  % 更新己方弓箭兵血量
        if bloodArcher1(xarcher,1)>0  % 受反击己方弓箭兵没有死
            set(Drawgreen.archer(xarcher,1),'Position',[archer.posStore1(xarcher,1)+10,archer.posStore1(xarcher,2)+5,bloodOwn-80/55*harmOwn,5]);
            archer.posStore1(xarcher,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
        else
            delete(Drawarcher(xarcher,1)); Drawarcher(xarcher,:)=[];
            delete(Drawblack.archer(xarcher,1)); Drawblack.archer(xarcher,:)=[];
            delete(Drawgreen.archer(xarcher,1)); Drawgreen.archer(xarcher,:)=[];
            archer.posStore1(xarcher,:)=[]; black.archerposStore1(xarcher,:)=[]; green.archerposStore1(xarcher,:)=[]; bloodArcher1(xarcher,:)=[];
            numGen.archer=numGen.archer-1;
        end
    elseif dataRec(1)==-16  % 接收到玩家1弓箭兵攻击骑兵的指令
        battleType=3;  % 是弓箭兵发起攻击
        xarcher=dataRec(2);  % 玩家1的第几个弓箭兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击骑兵所处的格子
        ordg=dataRec(6);  % 玩家2的第几个骑兵被攻击
        harm=dataRec(7);  % 玩家1弓箭兵对玩家2骑兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1弓箭兵受到的反击伤害
        blood=bloodRider2(ordg,1);  % 确定受到攻击的玩家2骑兵的起始血量
        bloodRider2(ordg,1)=blood-80/65*harm;  % 更新受到攻击的玩家2骑兵的血量
        harmText;
        % 更新受到攻击的玩家2骑兵信息
        if bloodRider2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % 骑兵初始65血
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
            delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
            delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
            rider2.posStore2(ordg,:)=[]; black.riderposStore2(ordg,:)=[]; green.riderposStore2(ordg,:)=[]; bloodRider2(ordg,:)=[];
            numGen2.rider=numGen2.rider-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1弓箭兵信息
        bloodOwn=bloodArcher1(xarcher,1);  % 玩家1弓箭兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodArcher1(xarcher,1)=bloodOwn-80/55*harmOwn;  % 更新己方弓箭兵血量
        if bloodArcher1(xarcher,1)>0  % 受反击己方弓箭兵没有死
            set(Drawgreen.archer(xarcher,1),'Position',[archer.posStore1(xarcher,1)+10,archer.posStore1(xarcher,2)+5,bloodOwn-80/55*harmOwn,5]);
            archer.posStore1(xarcher,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
        else
            delete(Drawarcher(xarcher,1)); Drawarcher(xarcher,:)=[];
            delete(Drawblack.archer(xarcher,1)); Drawblack.archer(xarcher,:)=[];
            delete(Drawgreen.archer(xarcher,1)); Drawgreen.archer(xarcher,:)=[];
            archer.posStore1(xarcher,:)=[]; black.archerposStore1(xarcher,:)=[]; green.archerposStore1(xarcher,:)=[]; bloodArcher1(xarcher,:)=[];
            numGen.archer=numGen.archer-1;
        end
    elseif dataRec(1)==-17  % 接收到玩家1弓箭兵攻击弓箭兵的指令
        battleType=3;  % 是弓箭兵发起攻击
        xarcher=dataRec(2);  % 玩家1的第几个弓箭兵攻击
        gonnaAttack=[dataRec(3),dataRec(4)];  % 玩家2被攻击弓箭所处的格子
        ordg=dataRec(6);  % 玩家2的第几个弓箭兵被攻击
        harm=dataRec(7);  % 玩家1弓箭兵对玩家2弓箭兵造成的伤害
        harmOwn=dataRec(5);  % 玩家1弓箭兵受到的反击伤害
        blood=bloodArcher2(ordg,1);  % 确定受到攻击的玩家2弓箭兵的起始血量
        bloodArcher2(ordg,1)=blood-80/55*harm;  % 更新受到攻击的玩家2弓箭兵的血量
        harmText;
        % 更新受到攻击的玩家2弓箭兵信息
        if bloodArcher2(ordg,1)>0  % 受攻击敌兵没有死
            set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % 弓箭兵初始55血
        else
            harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
            delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
            delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
            delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
            archer2.posStore2(ordg,:)=[]; black.archerposStore2(ordg,:)=[]; green.archerposStore2(ordg,:)=[]; bloodArcher2(ordg,:)=[];
            numGen2.archer=numGen2.archer-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % 更新发起攻击的玩家1弓箭兵信息
        bloodOwn=bloodArcher1(xarcher,1);  % 玩家1弓箭兵的初始血量
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodArcher1(xarcher,1)=bloodOwn-80/55*harmOwn;  % 更新己方弓箭兵血量
        if bloodArcher1(xarcher,1)>0  % 受反击己方弓箭兵没有死
            set(Drawgreen.archer(xarcher,1),'Position',[archer.posStore1(xarcher,1)+10,archer.posStore1(xarcher,2)+5,bloodOwn-80/55*harmOwn,5]);
            archer.posStore1(xarcher,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
        else
            delete(Drawarcher(xarcher,1)); Drawarcher(xarcher,:)=[];
            delete(Drawblack.archer(xarcher,1)); Drawblack.archer(xarcher,:)=[];
            delete(Drawgreen.archer(xarcher,1)); Drawgreen.archer(xarcher,:)=[];
            archer.posStore1(xarcher,:)=[]; black.archerposStore1(xarcher,:)=[]; green.archerposStore1(xarcher,:)=[]; bloodArcher1(xarcher,:)=[];
            numGen.archer=numGen.archer-1;
        end
    elseif dataRec(1)==-18  % 接收到玩家1弓箭兵攻击主塔的指令
        harm=dataRec(2);  % 玩家1弓箭兵对玩家2主塔造成的伤害
        blood=bloodTown2;
        bloodTown2=blood-harm;
        harmTextTown1;
        % 更新受到攻击的玩家2主塔信息
        if bloodTown2>0
            set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
        else
            delete(DrawredTown2);
        end
    elseif dataRec(1)==-19  % 接收到玩家1回合结束的指令
        resource1=resource1+5;
        delete(textresource1);
        resourceText1;
        delete(rec_player2);
        questdlg('你的回合','回合','确定','确定');
        set(gcf,'WindowButtonDownFcn',@clicktown2);  % 检测鼠标点击
    elseif dataRec(1)==-20  % 接受到玩家1投降的指令
        buttonEnd=questdlg('玩家二获胜！','游戏结束','重新开始','返回主页','重新开始');
        if strcmp(buttonEnd,'重新开始')
            clf;
            chessWarRestart2;
        else
            delete(rec_player2);
            gui2;
        end
    end
end
if bloodTown2<=0
    buttonEnd=questdlg('玩家一获胜！','游戏结束','重新开始','返回主页','重新开始');
    if strcmp(buttonEnd,'重新开始')
        clf;
        chessWarRestart2;
    else
        delete(rec_player2);
        gui2;
    end
end
end