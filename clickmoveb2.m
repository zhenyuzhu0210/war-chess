function clickmoveb2(~,~)
global whitePos2 battlePos2 numWhite2 numBattle2 Drawrifle2 Drawrider2 Drawarcher2 Drawwhite2 Drawblack2 Drawblack Drawgreen2 Drawgreen...
    Drawfocus2 rifle2 rider2 archer2 black green xrifle2 xrider2 xarcher2 moveType2 battleType2 underAttackPos2...
    bloodRifle1 bloodRifle2 bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodInit gonnaAttack2 harm2 harmOwn2 oppPos2...
    Drawrifle Drawrider Drawarcher rifle rider archer numGen numGen2 bloodTown1 DrawredTown1 DrawfocusTown2 showFocusTown2...
    buttonEnd resource2 textresource2
switch (get(gcbf,'SelectionType'))
    case 'normal'
        ptmove=get(gca,'CurrentPoint');
        ptmove_x=round(ptmove(1));
        ptmove_y=round(ptmove(3));
        judgemove=[];
        % 是否点击了士兵可移动范围内的某个格子且士兵该回合未移动过
        if (moveType2==1 && rifle2.posStore2(xrifle2,3)==0)||(moveType2==2 && rider2.posStore2(xrider2,3)==0)||(moveType2==3 && archer2.posStore2(xarcher2,3)==0)
            for jmove=1:numWhite2
                judgemove(jmove,1)=ptmove_x>whitePos2(jmove,1) && ptmove_x<whitePos2(jmove,1)+100 &&...
                    ptmove_y>whitePos2(jmove,2) && ptmove_y<whitePos2(jmove,2)+100;  % 依次判断是否点击了士兵可移动范围内的某个格子
            end
        end
        judgebattle=[];
        for jbattle=1:numBattle2
            judgebattle(jbattle,1)=ptmove_x>battlePos2(jbattle,1) && ptmove_x<battlePos2(jbattle,1)+100 &&...
                ptmove_y>battlePos2(jbattle,2) && ptmove_y<battlePos2(jbattle,2)+100 &&...
                isempty(intersect(battlePos2(jbattle,:),oppPos2(:,1:2),'rows'))==0;  % 依次判断是否点击了士兵可攻击范围内的某个格子且该格子内有敌兵
        end
        % 移动
        if sum(judgemove)>0 &&  moveType2==1
            if rifle2.posStore2(xrifle2,3)==0 && rifle2.posStore2(xrifle2,4)==0
                [xRifleMove2,~]=find(judgemove==1);
                gonnaMove2=whitePos2(xRifleMove2,:);  % 指定步兵要移动到的位置
                set(Drawrifle2(xrifle2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % 刷新步兵的位置
                set(Drawblack2.rifle(xrifle2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
                set(Drawgreen2.rifle(xrifle2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodRifle2(xrifle2,1),5]);
                delete(Drawwhite2);  % 移动后范围取消
                delete(Drawfocus2);  % 移动后攻击范围取消
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                rifle2.posStore2(xrifle2,1:2)=gonnaMove2;  % 更新该步兵的位置为移动后的位置
                black.rifleposStore2(xrifle2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
                green.rifleposStore2(xrifle2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
                rifle2.posStore2(xrifle2,3)=1;  % 1代表该步兵本回合已移动过，不能再移动
            end
            set(gcf,'WindowButtonDownFcn',@clicktownb2);
        elseif sum(judgemove)>0 && moveType2==2
            if rider2.posStore2(xrider2,3)==0 && rider2.posStore2(xrider2,4)==0
                [xRiderMove2,~]=find(judgemove==1);
                gonnaMove2=whitePos2(xRiderMove2,:);  % 指定骑兵要移动到的位置
                set(Drawrider2(xrider2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % 刷新骑兵的位置
                set(Drawblack2.rider(xrider2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
                set(Drawgreen2.rider(xrider2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodRider2(xrider2,1),5]);
                delete(Drawwhite2);  % 移动后范围取消
                delete(Drawfocus2);  % 移动后攻击范围取消
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                rider2.posStore2(xrider2,1:2)=gonnaMove2;  % 更新该骑兵的位置为移动后的位置
                black.riderposStore2(xrider2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
                green.riderposStore2(xrider2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
                rider2.posStore2(xrider2,3)=1;  % 1代表该骑兵本回合已移动过，不能再移动
            end
            set(gcf,'WindowButtonDownFcn',@clicktownb2);
        elseif sum(judgemove)>0 && moveType2==3
            if archer2.posStore2(xarcher2,3)==0 && archer2.posStore2(xarcher2,4)==0
                [xArcherMove2,~]=find(judgemove==1);
                gonnaMove2=whitePos2(xArcherMove2,:);  % 指定弓箭兵要移动到的位置
                set(Drawarcher2(xarcher2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % 刷新弓箭兵的位置
                set(Drawblack2.archer(xarcher2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
                set(Drawgreen2.archer(xarcher2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodArcher2(xarcher2,1),5]);
                delete(Drawwhite2);  % 移动后范围取消
                delete(Drawfocus2);  % 移动后攻击范围取消
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                archer2.posStore2(xarcher2,1:2)=gonnaMove2;  % 更新该弓箭兵的位置为移动后的位置
                black.archerposStore2(xarcher2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
                green.archerposStore2(xarcher2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
                archer2.posStore2(xarcher2,3)=1;  % 1代表该弓箭兵本回合已移动过，不能再移动
            end
            set(gcf,'WindowButtonDownFcn',@clicktownb2);
        % 攻击
        elseif sum(judgebattle)>0 && battleType2==1  % 攻击者为步兵
            if rifle2.posStore2(xrifle2,4)==0
            [xRifleBattle,~]=find(judgebattle==1);  % 判断是要攻击哪个方格的士兵
            gonnaAttack2=battlePos2(xRifleBattle,:);  % 待攻击的方格位置
            [~,ord]=intersect(underAttackPos2(:,1:2),gonnaAttack2,'rows');
            attackType=underAttackPos2(ord,3);  % 被攻击士兵的种类
            if attackType==1
                harm2=randi([15,20],1,1);  % 步兵对步兵的攻击范围是15-20
                harmOwn2=randi([15,20],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.rifleposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方步兵的血条需要变化
                blood=bloodRifle1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodRifle1(ordg,1)=blood-harm2;  % 更新受攻击敌兵的血量
                if bloodRifle1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % 步兵初始80血
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
                    delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
                    delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
                    rifle.posStore1(ordg,:)=[];
                    black.rifleposStore1(ordg,:)=[];
                    green.rifleposStore1(ordg,:)=[];
                    bloodRifle1(ordg,:)=[];
                    numGen.rifle=numGen.rifle-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==2
                harm2=randi([10,15],1,1);  % 步兵对骑兵的攻击范围是10-15
                harmOwn2=randi([20,25],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.riderposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方骑兵的血条需要变化
                blood=bloodRider1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodRider1(ordg,1)=blood-80/65*harm2;
                if bloodRider1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % 骑兵初始65血
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
                    delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
                    delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
                    rider.posStore1(ordg,:)=[];
                    black.riderposStore1(ordg,:)=[];
                    green.riderposStore1(ordg,:)=[];
                    bloodRider1(ordg,:)=[];
                    numGen.rider=numGen.rider-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==3
                harm2=randi([15,20],1,1);  % 步兵对弓箭兵的攻击范围是15-20
                harmOwn2=0;  % 自己受到的反击伤害
                [~,ordg]=intersect(green.archerposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方弓箭兵的血条需要变化
                blood=bloodArcher1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodArcher1(ordg,1)=blood-80/55*harm2;
                if bloodArcher1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % 弓箭兵初始55血
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
                    delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
                    delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
                    archer.posStore1(ordg,:)=[];
                    black.archerposStore1(ordg,:)=[];
                    green.archerposStore1(ordg,:)=[];
                    bloodArcher1(ordg,:)=[];
                    numGen.archer=numGen.archer-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==4
                harm2=randi([15,20],1,1);  % 步兵对敌塔的攻击范围是15-20
                harmOwn2=0;
                blood=bloodTown1;
                delete(Drawwhite2);
                delete(Drawfocus2);
                delete(DrawfocusTown2);
                harmTextTown2;
                bloodTown1=blood-harm2;
                if bloodTown1>0
                    set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
                else
                    delete(DrawredTown1);
                end
            end
            bloodOwn=bloodRifle2(xrifle2,1);  % 确定自己的血量
            if harmOwn2~=0
                pause(0.2); harmTextOwn2;
            end
            bloodRifle2(xrifle2,1)=bloodOwn-harmOwn2;  % 更新己方步兵血量
            if bloodRifle2(xrifle2,1)>0  % 受反击己方步兵没有死
                set(Drawgreen2.rifle(xrifle2,1),'Position',[rifle2.posStore2(xrifle2,1)+10,rifle2.posStore2(xrifle2,2)+5,bloodOwn-harmOwn2,5]);
                rifle2.posStore2(xrifle2,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
            else
                delete(Drawrifle2(xrifle2,1)); Drawrifle2(xrifle2,:)=[];
                delete(Drawblack2.rifle(xrifle2,1)); Drawblack2.rifle(xrifle2,:)=[];
                delete(Drawgreen2.rifle(xrifle2,1)); Drawgreen2.rifle(xrifle2,:)=[];
                rifle2.posStore2(xrifle2,:)=[];
                black.rifleposStore2(xrifle2,:)=[];
                green.rifleposStore2(xrifle2,:)=[];
                bloodRifle2(xrifle2,:)=[];
                numGen2.rifle=numGen2.rifle-1;
            end
            end
            set(gcf,'WindowButtonDownFcn',@clicktownb2);
        elseif sum(judgebattle)>0 && battleType2==2  % 攻击者为骑兵
            riderca2=0;
            if rider2.posStore2(xrider2,4)==0
            [xRiderBattle,~]=find(judgebattle==1);  % 判断是要攻击哪个方格的士兵
            gonnaAttack2=battlePos2(xRiderBattle,:);  % 待攻击的方格位置
            [~,ord]=intersect(underAttackPos2(:,1:2),gonnaAttack2,'rows');
            attackType=underAttackPos2(ord,3);  % 被攻击士兵的种类
            if attackType==1
                harm2=randi([20,25],1,1);  % 骑兵对步兵的攻击范围是20-25
                harmOwn2=randi([10,15],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.rifleposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方步兵的血条需要变化
                blood=bloodRifle1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodRifle1(ordg,1)=blood-harm2;
                if bloodRifle1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % 步兵初始80血
                    riderca2=1;
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
                    delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
                    delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
                    rifle.posStore1(ordg,:)=[];
                    black.rifleposStore1(ordg,:)=[];
                    green.rifleposStore1(ordg,:)=[];
                    bloodRifle1(ordg,:)=[];
                    numGen.rifle=numGen.rifle-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==2
                harm2=randi([15,20],1,1);  % 骑兵对骑兵的攻击范围是15-20
                harmOwn2=randi([15,20],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.riderposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方骑兵的血条需要变化
                blood=bloodRider1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodRider1(ordg,1)=blood-80/65*harm2;
                if bloodRider1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % 骑兵初始65血
                    riderca2=1;
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
                    delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
                    delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
                    rider.posStore1(ordg,:)=[];
                    black.riderposStore1(ordg,:)=[];
                    green.riderposStore1(ordg,:)=[];
                    bloodRider1(ordg,:)=[];
                    numGen.rider=numGen.rider-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==3
                harm2=randi([20,25],1,1);  % 骑兵对弓箭兵的攻击范围是20-25
                harmOwn2=0;  % 自己受到的反击伤害
                [~,ordg]=intersect(green.archerposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方弓箭兵的血条需要变化
                blood=bloodArcher1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodArcher1(ordg,1)=blood-80/55*harm2;
                if bloodArcher1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % 弓箭兵初始55血
                    riderca2=1;
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
                    delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
                    delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
                    archer.posStore1(ordg,:)=[];
                    black.archerposStore1(ordg,:)=[];
                    green.archerposStore1(ordg,:)=[];
                    bloodArcher1(ordg,:)=[];
                    numGen.archer=numGen.archer-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==4
                harm2=randi([10,15],1,1);  % 骑兵对敌塔的攻击范围是10-15
                harmOwn2=0;
                blood=bloodTown1;
                delete(Drawwhite2);
                delete(Drawfocus2);
                delete(DrawfocusTown2);
                harmTextTown2;
                bloodTown1=blood-harm2;
                riderca2=1;
                if bloodTown1>0
                    set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
                else
                    delete(DrawredTown1);
                end
            end
            bloodOwn=bloodRider2(xrider2,1);  % 确定自己的血量
            if harmOwn2~=0
                pause(0.2); harmTextOwn2;
            end
            bloodRider2(xrider2,1)=bloodOwn-80/65*harmOwn2;  % 更新己方骑兵血量
            if bloodRider2(xrider2,1)>0  % 受反击己方骑兵没有死
                set(Drawgreen2.rider(xrider2,1),'Position',[rider2.posStore2(xrider2,1)+10,rider2.posStore2(xrider2,2)+5,bloodOwn-80/65*harmOwn2,5]);
%                 rider2.posStore2(xrider2,3)=1;  % 攻击后无论是否消灭敌军，都不能再移动
                if riderca2==1
                    rider2.posStore2(xrider2,4)=1;  % 攻击后该士兵本回合无法再攻击或移动
                end
            else
                delete(Drawrider2(xrider2,1)); Drawrider2(xrider2,:)=[];
                delete(Drawblack2.rider(xrider2,1)); Drawblack2.rider(xrider2,:)=[];
                delete(Drawgreen2.rider(xrider2,1)); Drawgreen2.rider(xrider2,:)=[];
                rider2.posStore2(xrider2,:)=[];
                black.riderposStore2(xrider2,:)=[];
                green.riderposStore2(xrider2,:)=[];
                bloodRider2(xrider2,:)=[];
                numGen2.rider=numGen2.rider-1;
            end
            end
            set(gcf,'WindowButtonDownFcn',@clicktownb2);
        elseif sum(judgebattle)>0 && battleType2==3  % 攻击者为弓箭兵
            if archer2.posStore2(xarcher2,4)==0
            [xArcherBattle,~]=find(judgebattle==1);  % 判断是要攻击哪个方格的士兵
            gonnaAttack2=battlePos2(xArcherBattle,:);  % 待攻击的方格位置
            [~,ord]=intersect(underAttackPos2(:,1:2),gonnaAttack2,'rows');
            attackType=underAttackPos2(ord,3);  % 被攻击士兵的种类
            if attackType==1
                harm2=randi([10,15],1,1);  % 弓箭兵对步兵的攻击范围是10-15
                harmOwn2=0;  % 自己受到的反击伤害
                [~,ordg]=intersect(green.rifleposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方步兵的血条需要变化
                blood=bloodRifle1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodRifle1(ordg,1)=blood-harm2;  % 更新受攻击敌兵的血量
                if bloodRifle1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % 步兵初始80血
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
                    delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
                    delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
                    rifle.posStore1(ordg,:)=[];
                    black.rifleposStore1(ordg,:)=[];
                    green.rifleposStore1(ordg,:)=[];
                    bloodRifle1(ordg,:)=[];
                    numGen.rifle=numGen.rifle-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==2
                harm2=randi([25,30],1,1);  % 弓箭兵对骑兵的攻击范围是25-30
                harmOwn2=0;  % 自己受到的反击伤害
                [~,ordg]=intersect(green.riderposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方骑兵的血条需要变化
                blood=bloodRider1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodRider1(ordg,1)=blood-80/65*harm2;
                if bloodRider1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % 骑兵初始65血
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
                    delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
                    delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
                    rider.posStore1(ordg,:)=[];
                    black.riderposStore1(ordg,:)=[];
                    green.riderposStore1(ordg,:)=[];
                    bloodRider1(ordg,:)=[];
                    numGen.rider=numGen.rider-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==3
                harm2=randi([10,15],1,1);  % 弓箭兵对弓箭兵的攻击范围是10-15
                harmOwn2=randi([10,15],1,1);  % 自己受到的反击伤害
                [~,ordg]=intersect(green.archerposStore1(:,1:2),[gonnaAttack2(1)+10,gonnaAttack2(2)+5],'rows');  % 确定是第几个敌方弓箭兵的血条需要变化
                blood=bloodArcher1(ordg,1);  % 确定该敌兵的血量
                delete(Drawwhite2);
                delete(Drawfocus2);
                if showFocusTown2==1
                    delete(DrawfocusTown2);
                    showFocusTown2=0;
                end
                harmText2;
                bloodArcher1(ordg,1)=blood-80/55*harm2;
                if bloodArcher1(ordg,1)>0  % 受攻击敌兵没有死
                    set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % 弓箭兵初始55血
                else
                    harmOwn2=0;  % 敌兵被杀死则己方攻击士兵不扣血
                    delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
                    delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
                    delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
                    archer.posStore1(ordg,:)=[];
                    black.archerposStore1(ordg,:)=[];
                    green.archerposStore1(ordg,:)=[];
                    bloodArcher1(ordg,:)=[];
                    numGen.archer=numGen.archer-1;
                    delete(textresource2);
                    resource2=resource2+10;
                    resourceText2;
                end
            elseif attackType==4
                harm2=randi([10,15],1,1);  % 弓箭兵对敌塔的攻击范围是10-15
                harmOwn2=0;
                blood=bloodTown1;
                delete(Drawwhite2);
                delete(Drawfocus2);
                delete(DrawfocusTown2);
                harmTextTown2;
                bloodTown1=blood-harm2;
                if bloodTown1>0
                    set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
                else
                    delete(DrawredTown1);
                end
            end
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
                archer2.posStore2(xarcher2,:)=[];
                black.archerposStore2(xarcher2,:)=[];
                green.archerposStore2(xarcher2,:)=[];
                bloodArcher2(xarcher2,:)=[];
                numGen2.archer=numGen2.archer-1;
            end
            end
            set(gcf,'WindowButtonDownFcn',@clicktownb2);
        else
            delete(Drawwhite2);
            delete(Drawfocus2);
            if showFocusTown2==1
                delete(DrawfocusTown2);
            end
            showFocusTown2=0;
            set(gcf,'WindowButtonDownFcn',@clicktownb2);
        end
end
set(gcf,'KeyPressFcn',@key);
if bloodTown1<=0
    buttonEnd=questdlg('玩家二获胜！','游戏结束','重新开始','返回主页','重新开始');
    if strcmp(buttonEnd,'重新开始')
        clf;
        chessWarRestart;
    else
        gui2;
    end
end
end