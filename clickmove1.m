function clickmove1(~,~)
global whitePos battlePos numWhite numBattle Drawrifle Drawrider Drawarcher Drawwhite Drawblack Drawblack2 Drawgreen Drawgreen2...
    Drawfocus rifle rider archer black green xrifle xrider xarcher moveType battleType underAttackPos1...
    bloodRifle1 bloodRifle2 bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodInit gonnaAttack harm harmOwn oppPos1...
    Drawrifle2 Drawrider2 Drawarcher2 rifle2 rider2 archer2 numGen numGen2 bloodTown2 DrawredTown2 DrawfocusTown showFocusTown1...
    buttonEnd resource1 textresource1 t_server
switch (get(gcbf,'SelectionType'))
    case 'normal'
        ptmove=get(gca,'CurrentPoint');
        ptmove_x=round(ptmove(1));
        ptmove_y=round(ptmove(3));
        judgemove=[];
        % 是否点击了士兵可移动范围内的某个格子且士兵该回合未移动过
        if (moveType==1 && rifle.posStore1(xrifle,3)==0)||(moveType==2 && rider.posStore1(xrider,3)==0)||(moveType==3 && archer.posStore1(xarcher,3)==0)
            for jmove=1:numWhite
                judgemove(jmove,1)=ptmove_x>whitePos(jmove,1) && ptmove_x<whitePos(jmove,1)+100 &&...
                    ptmove_y>whitePos(jmove,2) && ptmove_y<whitePos(jmove,2)+100;  % 依次判断是否点击了士兵可移动范围内的某个格子
            end
        end
        judgebattle=[];
        for jbattle=1:numBattle
            judgebattle(jbattle,1)=ptmove_x>battlePos(jbattle,1) && ptmove_x<battlePos(jbattle,1)+100 &&...
                ptmove_y>battlePos(jbattle,2) && ptmove_y<battlePos(jbattle,2)+100 &&...
                isempty(intersect(battlePos(jbattle,:),oppPos1(:,1:2),'rows'))==0;  % 依次判断是否点击了士兵可攻击范围内的某个格子且该格子内有敌兵
        end
        % 移动
        if sum(judgemove)>0 && moveType==1
            if rifle.posStore1(xrifle,3)==0 && rifle.posStore1(xrifle,4)==0
                [xRifleMove,~]=find(judgemove==1);
                gonnaMove=whitePos(xRifleMove,:);  % 指定步兵要移动到的位置
                set(Drawrifle(xrifle,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % 刷新步兵的位置
                set(Drawblack.rifle(xrifle,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
                set(Drawgreen.rifle(xrifle,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodRifle1(xrifle,1),5]);
                delete(Drawwhite);  % 移动后范围取消
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                rifle.posStore1(xrifle,1:2)=gonnaMove;  % 更新该步兵的位置为移动后的位置
                black.rifleposStore1(xrifle,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
                green.rifleposStore1(xrifle,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
                rifle.posStore1(xrifle,3)=1;  % 1代表该步兵本回合已移动过，不能再移动
                % 将更新后的数据传输给玩家2
                fwrite(t_server,[-4,xrifle,gonnaMove(1),gonnaMove(2)],'double');  % 步兵移动
            end
            set(gcf,'WindowButtonDownFcn',@clicktown1);
        elseif sum(judgemove)>0 && moveType==2
            if rider.posStore1(xrider,3)==0 && rider.posStore1(xrider,4)==0
                [xRiderMove,~]=find(judgemove==1);
                gonnaMove=whitePos(xRiderMove,:);  % 指定骑兵要移动到的位置
                set(Drawrider(xrider,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % 刷新骑兵的位置
                set(Drawblack.rider(xrider,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
                set(Drawgreen.rider(xrider,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodRider1(xrider,1),5]);
                delete(Drawwhite);  % 移动后范围取消
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                rider.posStore1(xrider,1:2)=gonnaMove;  % 更新该骑兵的位置为移动后的位置
                black.riderposStore1(xrider,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
                green.riderposStore1(xrider,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
                rider.posStore1(xrider,3)=1;  % 1代表该骑兵本回合已移动过，不能再移动
                % 将更新后的数据传输给玩家2
                fwrite(t_server,[-5,xrider,gonnaMove(1),gonnaMove(2)],'double');  % 写入数字数据
            end
            set(gcf,'WindowButtonDownFcn',@clicktown1);
        elseif sum(judgemove)>0 && moveType==3
            if archer.posStore1(xarcher,3)==0 && archer.posStore1(xarcher,4)==0
                [xArcherMove,~]=find(judgemove==1);
                gonnaMove=whitePos(xArcherMove,:);  % 指定弓箭兵要移动到的位置
                set(Drawarcher(xarcher,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % 刷新弓箭兵的位置
                set(Drawblack.archer(xarcher,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
                set(Drawgreen.archer(xarcher,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodArcher1(xarcher,1),5]);
                delete(Drawwhite);  % 移动后范围取消
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                archer.posStore1(xarcher,1:2)=gonnaMove;  % 更新该弓箭兵的位置为移动后的位置
                black.archerposStore1(xarcher,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
                green.archerposStore1(xarcher,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
                archer.posStore1(xarcher,3)=1;  % 1代表该弓箭兵本回合已移动过，不能再移动
                % 将更新后的数据传输给玩家2
                fwrite(t_server,[-6,xarcher,gonnaMove(1),gonnaMove(2)],'double');  % 写入数字数据
            end
            set(gcf,'WindowButtonDownFcn',@clicktown1);
        % 攻击
        elseif sum(judgebattle)>0 && battleType==1  % 攻击者为步兵
            if rifle.posStore1(xrifle,4)==0
            [xRifleBattle,~]=find(judgebattle==1);  % 判断是要攻击哪个方格的士兵
            gonnaAttack=battlePos(xRifleBattle,:);  % 待攻击的方格位置
            [~,ord]=intersect(underAttackPos1(:,1:2),gonnaAttack,'rows');
            attackType=underAttackPos1(ord,3);  % 被攻击士兵的种类
            if attackType==1
                harm=randi([15,20],1,1);  % 步兵对步兵的攻击范围是15-20
                harmOwn=randi([15,20],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.rifleposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方步兵的血条需要变化
                blood=bloodRifle2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                % 将更新后的数据传输给玩家2
                fwrite(t_server,[-7,xrifle,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 步->步
                harmText;
                bloodRifle2(ordg,1)=blood-harm;  % 更新受攻击敌兵的血量
                if bloodRifle2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);  % 步兵初始80血
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
                    delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
                    delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
                    rifle2.posStore2(ordg,:)=[];
                    black.rifleposStore2(ordg,:)=[];
                    green.rifleposStore2(ordg,:)=[];
                    bloodRifle2(ordg,:)=[];
                    numGen2.rifle=numGen2.rifle-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==2
                harm=randi([10,15],1,1);  % 步兵对骑兵的攻击范围是10-15
                harmOwn=randi([20,25],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.riderposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方骑兵的血条需要变化
                blood=bloodRider2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                % 将更新后的数据传输给玩家2
                fwrite(t_server,[-8,xrifle,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 步->骑
                harmText;
                bloodRider2(ordg,1)=blood-80/65*harm;
                if bloodRider2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % 骑兵初始65血
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
                    delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
                    delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
                    rider2.posStore2(ordg,:)=[];
                    black.riderposStore2(ordg,:)=[];
                    green.riderposStore2(ordg,:)=[];
                    bloodRider2(ordg,:)=[];
                    numGen2.rider=numGen2.rider-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==3
                harm=randi([15,20],1,1);  % 步兵对弓箭兵的攻击范围是15-20
                harmOwn=0;  % 自己受到的反击伤害
                [~,ordg]=intersect(green.archerposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方弓箭兵的血条需要变化
                blood=bloodArcher2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                fwrite(t_server,[-9,xrifle,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 步->弓
                harmText;
                bloodArcher2(ordg,1)=blood-80/55*harm;
                if bloodArcher2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % 弓箭兵初始55血
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
                    delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
                    delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
                    archer2.posStore2(ordg,:)=[];
                    black.archerposStore2(ordg,:)=[];
                    green.archerposStore2(ordg,:)=[];
                    bloodArcher2(ordg,:)=[];
                    numGen2.archer=numGen2.archer-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==4
                harm=randi([15,20],1,1);  % 步兵对敌塔的攻击范围是15-20
                harmOwn=0;
                blood=bloodTown2;
                delete(Drawwhite);
                delete(Drawfocus);
                delete(DrawfocusTown);
                fwrite(t_server,[-10,harm],'double');  % 步->塔
                harmTextTown1;
                bloodTown2=blood-harm;
                if bloodTown2>0
                    set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
                else
                    delete(DrawredTown2);
                end
            end
            bloodOwn=bloodRifle1(xrifle,1);  % 确定自己的血量
            if harmOwn~=0
                pause(0.2); harmTextOwn;
            end
            bloodRifle1(xrifle,1)=bloodOwn-harmOwn;  % 更新己方步兵血量
            if bloodRifle1(xrifle,1)>0  % 受反击己方步兵没有死
                set(Drawgreen.rifle(xrifle,1),'Position',[rifle.posStore1(xrifle,1)+10,rifle.posStore1(xrifle,2)+5,bloodOwn-harmOwn,5]);
                rifle.posStore1(xrifle,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
            else
                delete(Drawrifle(xrifle,1)); Drawrifle(xrifle,:)=[];
                delete(Drawblack.rifle(xrifle,1)); Drawblack.rifle(xrifle,:)=[];
                delete(Drawgreen.rifle(xrifle,1)); Drawgreen.rifle(xrifle,:)=[];
                rifle.posStore1(xrifle,:)=[];
                black.rifleposStore1(xrifle,:)=[];
                green.rifleposStore1(xrifle,:)=[];
                bloodRifle1(xrifle,:)=[];
                numGen.rifle=numGen.rifle-1;
            end
            end
            set(gcf,'WindowButtonDownFcn',@clicktown1);
        elseif sum(judgebattle)>0 && battleType==2  % 攻击者为骑兵
            riderca=0;
            if rider.posStore1(xrider,4)==0
            [xRiderBattle,~]=find(judgebattle==1);  % 判断是要攻击哪个方格的士兵
            gonnaAttack=battlePos(xRiderBattle,:);  % 待攻击的方格位置
            [~,ord]=intersect(underAttackPos1(:,1:2),gonnaAttack,'rows');
            attackType=underAttackPos1(ord,3);  % 被攻击士兵的种类
            if attackType==1
                harm=randi([20,25],1,1);  % 骑兵对步兵的攻击范围是20-25
                harmOwn=randi([10,15],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.rifleposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方步兵的血条需要变化
                blood=bloodRifle2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                fwrite(t_server,[-11,xrider,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 骑->步
                harmText;
                bloodRifle2(ordg,1)=blood-harm;
                if bloodRifle2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);  % 步兵初始80血
                    riderca=1;
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
                    delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
                    delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
                    rifle2.posStore2(ordg,:)=[];
                    black.rifleposStore2(ordg,:)=[];
                    green.rifleposStore2(ordg,:)=[];
                    bloodRifle2(ordg,:)=[];
                    numGen2.rifle=numGen2.rifle-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==2
                harm=randi([15,20],1,1);  % 骑兵对骑兵的攻击范围是15-20
                harmOwn=randi([15,20],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.riderposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方骑兵的血条需要变化
                blood=bloodRider2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                fwrite(t_server,[-12,xrider,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 骑->骑
                harmText;
                bloodRider2(ordg,1)=blood-80/65*harm;
                if bloodRider2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % 骑兵初始65血
                    riderca=1;
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
                    delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
                    delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
                    rider2.posStore2(ordg,:)=[];
                    black.riderposStore2(ordg,:)=[];
                    green.riderposStore2(ordg,:)=[];
                    bloodRider2(ordg,:)=[];
                    numGen2.rider=numGen2.rider-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==3
                harm=randi([20,25],1,1);  % 骑兵对弓箭兵的攻击范围是20-25
                harmOwn=0;  % 自己受到的反击伤害
                [~,ordg]=intersect(green.archerposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方弓箭兵的血条需要变化
                blood=bloodArcher2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                fwrite(t_server,[-13,xrider,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 骑->弓
                harmText;
                bloodArcher2(ordg,1)=blood-80/55*harm;
                if bloodArcher2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % 弓箭兵初始55血
                    riderca=1;
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
                    delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
                    delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
                    archer2.posStore2(ordg,:)=[];
                    black.archerposStore2(ordg,:)=[];
                    green.archerposStore2(ordg,:)=[];
                    bloodArcher2(ordg,:)=[];
                    numGen2.archer=numGen2.archer-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==4
                harm=randi([10,15],1,1);  % 骑兵对敌塔的攻击范围是10-15
                harmOwn=0;
                blood=bloodTown2;
                delete(Drawwhite);
                delete(Drawfocus);
                delete(DrawfocusTown);
                fwrite(t_server,[-14,harm],'double');  % 骑->塔
                harmTextTown1;
                bloodTown2=blood-harm;
                riderca=1;
                if bloodTown2>0
                    set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
                else
                    delete(DrawredTown2);
                end
            end
            bloodOwn=bloodRider1(xrider,1);  % 确定自己的血量
            if harmOwn~=0
                pause(0.2); harmTextOwn;
            end
            bloodRider1(xrider,1)=bloodOwn-80/65*harmOwn;  % 更新己方骑兵血量
            if bloodRider1(xrider,1)>0  % 受反击己方骑兵没有死
                set(Drawgreen.rider(xrider,1),'Position',[rider.posStore1(xrider,1)+10,rider.posStore1(xrider,2)+5,bloodOwn-80/65*harmOwn,5]);
%                 rider.posStore1(xrider,3)=1;  % 攻击后无论是否消灭敌军，都不能再移动
                if riderca==1
                    rider.posStore1(xrider,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
                end
            else
                delete(Drawrider(xrider,1)); Drawrider(xrider,:)=[];
                delete(Drawblack.rider(xrider,1)); Drawblack.rider(xrider,:)=[];
                delete(Drawgreen.rider(xrider,1)); Drawgreen.rider(xrider,:)=[];
                rider.posStore1(xrider,:)=[];
                black.riderposStore1(xrider,:)=[];
                green.riderposStore1(xrider,:)=[];
                bloodRider1(xrider,:)=[];
                numGen.rider=numGen.rider-1;
            end
            end
            set(gcf,'WindowButtonDownFcn',@clicktown1);
        elseif sum(judgebattle)>0 && battleType==3  % 攻击者为弓箭兵
            if archer.posStore1(xarcher,4)==0
            [xArcherBattle,~]=find(judgebattle==1);  % 判断是要攻击哪个方格的士兵
            gonnaAttack=battlePos(xArcherBattle,:);  % 待攻击的方格位置
            [~,ord]=intersect(underAttackPos1(:,1:2),gonnaAttack,'rows');
            attackType=underAttackPos1(ord,3);  % 被攻击士兵的种类
            if attackType==1
                harm=randi([10,15],1,1);  % 弓箭兵对步兵的攻击范围是10-15
                harmOwn=0;  % 自己受到的反击伤害
                [~,ordg]=intersect(green.rifleposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方步兵的血条需要变化
                blood=bloodRifle2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                fwrite(t_server,[-15,xarcher,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 弓->步
                harmText;
                bloodRifle2(ordg,1)=blood-harm;  % 更新受攻击敌兵的血量
                if bloodRifle2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);  % 步兵初始80血
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
                    delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
                    delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
                    rifle2.posStore2(ordg,:)=[];
                    black.rifleposStore2(ordg,:)=[];
                    green.rifleposStore2(ordg,:)=[];
                    bloodRifle2(ordg,:)=[];
                    numGen2.rifle=numGen2.rifle-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==2
                harm=randi([25,30],1,1);  % 弓箭兵对骑兵的攻击范围是25-30
                harmOwn=0;  % 自己受到的反击伤害
                [~,ordg]=intersect(green.riderposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方骑兵的血条需要变化
                blood=bloodRider2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                fwrite(t_server,[-16,xarcher,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 弓->骑
                harmText;
                bloodRider2(ordg,1)=blood-80/65*harm;
                if bloodRider2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % 骑兵初始65血
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
                    delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
                    delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
                    rider2.posStore2(ordg,:)=[];
                    black.riderposStore2(ordg,:)=[];
                    green.riderposStore2(ordg,:)=[];
                    bloodRider2(ordg,:)=[];
                    numGen2.rider=numGen2.rider-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==3
                harm=randi([10,15],1,1);  % 弓箭兵对弓箭兵的攻击范围是10-15
                harmOwn=randi([10,15],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.archerposStore2(:,1:2),[gonnaAttack(1)+10,gonnaAttack(2)+5],'rows');  % 确定是第几个敌方弓箭兵的血条需要变化
                blood=bloodArcher2(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite);
                delete(Drawfocus);
                if showFocusTown1==1
                    delete(DrawfocusTown);
                    showFocusTown1=0;
                end
                fwrite(t_server,[-17,xarcher,gonnaAttack(1),gonnaAttack(2),harmOwn,ordg,harm],'double');  % 弓->弓
                harmText;
                bloodArcher2(ordg,1)=blood-80/55*harm;
                if bloodArcher2(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % 弓箭兵初始55血
                else
                    harmOwn=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
                    delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
                    delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
                    archer2.posStore2(ordg,:)=[];
                    black.archerposStore2(ordg,:)=[];
                    green.archerposStore2(ordg,:)=[];
                    bloodArcher2(ordg,:)=[];
                    numGen2.archer=numGen2.archer-1;
                    delete(textresource1);
                    resource1=resource1+10;
                    resourceText1;
                end
            elseif attackType==4
                harm=randi([10,15],1,1);  % 弓箭兵对敌塔的攻击范围是10-15
                harmOwn=0;
                blood=bloodTown2;
                delete(Drawwhite);
                delete(Drawfocus);
                delete(DrawfocusTown);
                fwrite(t_server,[-18,harm],'double');  % 弓->塔
                harmTextTown1;
                bloodTown2=blood-harm;
                if bloodTown2>0
                    set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
                else
                    delete(DrawredTown2);
                end
            end
            bloodOwn=bloodArcher1(xarcher,1);  % 确定自己的血量
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
                archer.posStore1(xarcher,:)=[];
                black.archerposStore1(xarcher,:)=[];
                green.archerposStore1(xarcher,:)=[];
                bloodArcher1(xarcher,:)=[];
                numGen.archer=numGen.archer-1;
            end
            end
            set(gcf,'WindowButtonDownFcn',@clicktown1);
        else
            delete(Drawwhite);
            delete(Drawfocus);
            if showFocusTown1==1
                delete(DrawfocusTown);
            end
            showFocusTown1=0;
            set(gcf,'WindowButtonDownFcn',@clicktown1);
        end
end
set(gcf,'KeyPressFcn',@key1);
if bloodTown2<=0
    buttonEnd=questdlg('玩家一获胜！','游戏结束','重新开始','返回主页','重新开始');
    if strcmp(buttonEnd,'重新开始')
        clf;
        chessWarRestart1;
    else
        gui2;
    end
end
end