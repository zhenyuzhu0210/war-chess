function clicktownb1(~,~)
clear global Drawwhite Drawfocus DrawfocusTown
global town1 rifle rider archer rifle2 rider2 archer2 turn white black green focus whitePos numWhite battlePos numBattle...
    Drawrifle Drawrider Drawarcher Drawwhite Drawblack Drawgreen Drawfocus xrifle xrider xarcher numGen moveType battleType...
    underAttackPos1 bloodRifle1 bloodRider1 bloodArcher1 bloodInit oppPos1 DrawfocusTown opptownPos1 showFocusTown1...
    resource1 textresource1
switch (get(gcbf,'SelectionType'))
    case 'normal'
        pt=get(gca,'CurrentPoint');
        pt_x=round(pt(1));
        pt_y=round(pt(3));
        mrifle=size(rifle.posStore1,1);
        mrider=size(rider.posStore1,1);
        marcher=size(archer.posStore1,1);
        judgem.rifle=[]; judgem.rider=[]; judgem.archer=[];
        for jrifle=1:mrifle
            judgem.rifle(jrifle,1)=pt_x>rifle.posStore1(jrifle,1) && pt_x<rifle.posStore1(jrifle,1)+100 &&...
                pt_y>rifle.posStore1(jrifle,2) && pt_y<rifle.posStore1(jrifle,2)+100;  % 依次判断是否点击了某个步兵所在格子
        end
        for jrider=1:mrider
            judgem.rider(jrider,1)=pt_x>rider.posStore1(jrider,1) && pt_x<rider.posStore1(jrider,1)+100 &&...
                pt_y>rider.posStore1(jrider,2) && pt_y<rider.posStore1(jrider,2)+100;  % 依次判断是否点击了某个骑兵所在格子
        end
        for jarcher=1:marcher
            judgem.archer(jarcher,1)=pt_x>archer.posStore1(jarcher,1) && pt_x<archer.posStore1(jarcher,1)+100 &&...
                pt_y>archer.posStore1(jarcher,2) && pt_y<archer.posStore1(jarcher,2)+100;  % 依次判断是否点击了某个弓箭兵所在格子
        end
        if pt_x>town1.Pos(1) && pt_x<town1.Pos(1)+200 && pt_y>town1.Pos(2) && pt_y<town1.Pos(2)+200 &&...
                isempty(intersect(rifle.Pos1,rifle.posInit1,'rows'))==1 &&...
                isempty(intersect(rider.Pos1,rider.posInit1,'rows'))==1 &&...
                isempty(intersect(archer.Pos1,archer.posInit1,'rows'))==1  % 每回合最多只能招募一个士兵，不论兵种
            button=questdlg('请选择兵种','招募','步兵','骑兵','弓箭兵','步兵');
            if strcmp(button,'步兵') &&...
                    resource1>=20 &&...
                    isempty(intersect(rifle.Pos1,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,rider.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,archer2.posStore2(:,1:2),'rows'))==1  % 步兵出生点如果已存在士兵就不能再新增步兵了
                disp('生产步兵*1');
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
                set(gcf,'WindowButtonDownFcn',@clicktownb1);  % 返回开头，重新计算judgem
            elseif strcmp(button,'骑兵') &&...
                    resource1>=25 &&...
                    isempty(intersect(rider.Pos1,rider.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,archer2.posStore2(:,1:2),'rows'))==1
                disp('生产骑兵*1');
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
                set(gcf,'WindowButtonDownFcn',@clicktownb1);  % 返回开头，重新计算judgem
            elseif strcmp(button,'弓箭兵') &&...
                    resource1>=25 &&...
                    isempty(intersect(archer.Pos1,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,rider.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,archer2.posStore2(:,1:2),'rows'))==1
                disp('生产弓箭兵*1');
                delete(textresource1);
                resource1=resource1-25;
                resourceText1;
                numGen.archer=numGen.archer+1;  % numGen.rider用来记录这是场上造的的第几个弓箭兵
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
                set(gcf,'WindowButtonDownFcn',@clicktownb1);  % 返回开头，重新计算judgem
            end
        elseif sum(judgem.rifle)>0  % 点击了某个步兵
            [xrifle,~]=find(judgem.rifle==1);
            riflePos=rifle.posStore1(xrifle,1:2);  % 找到点击的步兵所在位置，xrifle表示点击的是场上第几个步兵
            if rifle.posStore1(xrifle,3)==0 && rifle.posStore1(xrifle,4)==0  % 0表示该步兵当回合没有移动过，也没有攻击过
                % 步兵的移动范围
                whitePos=[];
                whitePos(1,:)=[riflePos(1)-100,riflePos(2)-100]; whitePos(2,:)=[riflePos(1)-100,riflePos(2)];
                whitePos(3,:)=[riflePos(1)-100,riflePos(2)+100]; whitePos(4,:)=[riflePos(1)+100,riflePos(2)-100];
                whitePos(5,:)=[riflePos(1)+100,riflePos(2)]; whitePos(6,:)=[riflePos(1)+100,riflePos(2)+100];
                whitePos(7,:)=[riflePos(1),riflePos(2)-100]; whitePos(8,:)=[riflePos(1),riflePos(2)+100];
                numWhite=size(whitePos,1);
                town1Pos=[0,800;0,900;100,800;100,900]; town2Pos=[800,0;900,0;800,100;900,100];
                deleteNum=[];
                overlapPos=[rifle.posStore1(:,1:2);rider.posStore1(:,1:2);archer.posStore1(:,1:2);...
                    rifle2.posStore2(:,1:2);rider2.posStore2(:,1:2);archer2.posStore2(:,1:2)];
                overlapPos(xrifle,:)=[];
                s=1;
                for ncheck=1:numWhite
                    if isempty(intersect(whitePos(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % 判断步兵的移动范围方格是否和城堡重合
                            isempty(intersect(whitePos(ncheck,:),overlapPos,'rows'))==0  % 判断步兵的移动范围方格是否和别的士兵重合
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos(deleteNum,:)=[];  % 删去和城堡或其他士兵重合的移动范围方格
                numWhite=size(whitePos,1);
                for nw=1:numWhite
                    Drawwhite(nw,1)=image([whitePos(nw,1) whitePos(nw,1)+white.Size(2)],...
                        [whitePos(nw,2) whitePos(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % 绘制出步兵的可移动范围
                end
                moveType=1;  % 记录这是步兵的移动
            end
            if rifle.posStore1(xrifle,4)==0  % 0表示步兵本回合没有攻击过，移动后可以攻击一次
                % 步兵的攻击范围
                battlePos=[];
                battlePos(1,:)=[riflePos(1)-100,riflePos(2)-100]; battlePos(2,:)=[riflePos(1)-100,riflePos(2)];
                battlePos(3,:)=[riflePos(1)-100,riflePos(2)+100]; battlePos(4,:)=[riflePos(1)+100,riflePos(2)-100];
                battlePos(5,:)=[riflePos(1)+100,riflePos(2)]; battlePos(6,:)=[riflePos(1)+100,riflePos(2)+100];
                battlePos(7,:)=[riflePos(1),riflePos(2)-100]; battlePos(8,:)=[riflePos(1),riflePos(2)+100];
                numBattle=size(battlePos,1);
                oppPos1=[[rifle2.posStore2(:,1:2),ones(size(rifle2.posStore2,1),1)];...
                    [rider2.posStore2(:,1:2),ones(size(rider2.posStore2,1),1)*2];...
                    [archer2.posStore2(:,1:2),ones(size(archer2.posStore2,1),1)*3]];  % 玩家1的敌军位置，第三列记录了兵种
                g=1; underAttackPos1=[]; underAttackType=[];
                for nb=1:numBattle
                    if isempty(intersect(battlePos(nb,:),oppPos1(:,1:2),'rows'))==0  % 如果攻击范围内有敌军
                        Drawfocus(nb,1)=image([battlePos(nb,1)+20 battlePos(nb,1)+20+focus.Size(2)],...
                            [battlePos(nb,2)+20 battlePos(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos1(g,:),order]=intersect(oppPos1(:,1:2),battlePos(nb,:),'rows');  % 攻击范围内的敌军位置
                        underAttackType(g,1)=oppPos1(order,3);  % 攻击范围内的敌军兵种
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos,opptownPos1(:,1:2),'rows'))==0  % 如果攻击范围内有敌塔
                    DrawfocusTown=image([870 870+focus.Size(2)],[70 70+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown1=1;
                    ta=intersect(opptownPos1(:,1:2),battlePos,'rows');
                    underAttackPos1(g:g+size(ta,1)-1,:)=ta;  % 加上主塔在攻击范围内的位置
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos1=[oppPos1;opptownPos1];
                underAttackPos1=[underAttackPos1,underAttackType];
                battleType=1;  % 记录这是步兵的攻击
                set(gcf,'WindowButtonDownFcn',@clickmoveb1);
            end
        elseif sum(judgem.rider)>0  % 点击了某个骑兵
            [xrider,~]=find(judgem.rider==1);
            riderPos=rider.posStore1(xrider,1:2);  % 找到点击的骑兵所在位置，xrider表示点击的是场上第几个骑兵
            if rider.posStore1(xrider,3)==0 && rider.posStore1(xrider,4)==0  % 0表示该骑兵当回合没有移动过，也没有攻击过
                % 骑兵的移动范围
                whitePos=[];
                whitePos(1,:)=[riderPos(1)-100,riderPos(2)-100]; whitePos(2,:)=[riderPos(1)-100,riderPos(2)];
                whitePos(3,:)=[riderPos(1)-100,riderPos(2)+100]; whitePos(4,:)=[riderPos(1)+100,riderPos(2)-100];
                whitePos(5,:)=[riderPos(1)+100,riderPos(2)]; whitePos(6,:)=[riderPos(1)+100,riderPos(2)+100];
                whitePos(7,:)=[riderPos(1),riderPos(2)-100]; whitePos(8,:)=[riderPos(1),riderPos(2)+100];
                whitePos(9,:)=[riderPos(1)-200,riderPos(2)-200]; whitePos(10,:)=[riderPos(1)-200,riderPos(2)-100];
                whitePos(11,:)=[riderPos(1)-200,riderPos(2)]; whitePos(12,:)=[riderPos(1)-200,riderPos(2)+100];
                whitePos(13,:)=[riderPos(1)-200,riderPos(2)+200]; whitePos(14,:)=[riderPos(1)-100,riderPos(2)+200];
                whitePos(15,:)=[riderPos(1),riderPos(2)+200]; whitePos(16,:)=[riderPos(1)+100,riderPos(2)+200];
                whitePos(17,:)=[riderPos(1)+200,riderPos(2)+200]; whitePos(18,:)=[riderPos(1)-100,riderPos(2)-200];
                whitePos(19,:)=[riderPos(1),riderPos(2)-200]; whitePos(20,:)=[riderPos(1)+100,riderPos(2)-200];
                whitePos(21,:)=[riderPos(1)+200,riderPos(2)-200]; whitePos(22,:)=[riderPos(1)+200,riderPos(2)-100];
                whitePos(23,:)=[riderPos(1)+200,riderPos(2)]; whitePos(24,:)=[riderPos(1)+200,riderPos(2)+100];
                numWhite=size(whitePos,1);
                town1Pos=[0,800;0,900;100,800;100,900]; town2Pos=[800,0;900,0;800,100;900,100];
                deleteNum=[];
                overlapPos=[rider.posStore1(:,1:2);rifle.posStore1(:,1:2);archer.posStore1(:,1:2);...
                    rifle2.posStore2(:,1:2);rider2.posStore2(:,1:2);archer2.posStore2(:,1:2)];
                overlapPos(xrider,:)=[];
                s=1;
                for ncheck=1:numWhite
                    if isempty(intersect(whitePos(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % 判断骑兵的移动范围方格是否和城堡重合
                            isempty(intersect(whitePos(ncheck,:),overlapPos,'rows'))==0  % 判断骑兵的移动范围方格是否和别的己方士兵重合
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos(deleteNum,:)=[];  % 删去和城堡或其他士兵重合的移动范围方格
                numWhite=size(whitePos,1);
                for nw=1:numWhite
                    Drawwhite(nw,1)=image([whitePos(nw,1) whitePos(nw,1)+white.Size(2)],...
                        [whitePos(nw,2) whitePos(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % 绘制出骑兵的可移动范围
                end
                moveType=2;  % 记录这是骑兵的移动
            end
            if rider.posStore1(xrider,4)==0  % 0表示骑兵本回合没有攻击过，移动过后可以攻击一次
                % 骑兵的攻击范围
                battlePos=[];
                battlePos(1,:)=[riderPos(1)-100,riderPos(2)-100]; battlePos(2,:)=[riderPos(1)-100,riderPos(2)];
                battlePos(3,:)=[riderPos(1)-100,riderPos(2)+100]; battlePos(4,:)=[riderPos(1)+100,riderPos(2)-100];
                battlePos(5,:)=[riderPos(1)+100,riderPos(2)]; battlePos(6,:)=[riderPos(1)+100,riderPos(2)+100];
                battlePos(7,:)=[riderPos(1),riderPos(2)-100]; battlePos(8,:)=[riderPos(1),riderPos(2)+100];
                numBattle=size(battlePos,1);
                oppPos1=[[rifle2.posStore2(:,1:2),ones(size(rifle2.posStore2,1),1)];...
                    [rider2.posStore2(:,1:2),ones(size(rider2.posStore2,1),1)*2];...
                    [archer2.posStore2(:,1:2),ones(size(archer2.posStore2,1),1)*3]];  % 玩家1的敌军位置，第三列记录了兵种
                g=1; underAttackPos1=[]; underAttackType=[];
                for nb=1:numBattle
                    if isempty(intersect(battlePos(nb,:),oppPos1(:,1:2),'rows'))==0  % 如果攻击范围内有敌军
                        Drawfocus(nb,1)=image([battlePos(nb,1)+20 battlePos(nb,1)+20+focus.Size(2)],...
                            [battlePos(nb,2)+20 battlePos(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos1(g,:),order]=intersect(oppPos1(:,1:2),battlePos(nb,:),'rows');  % 攻击范围内的敌军位置
                        underAttackType(g,1)=oppPos1(order,3);  % 攻击范围内的敌军兵种
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos,opptownPos1(:,1:2),'rows'))==0  % 如果攻击范围内有敌塔
                    DrawfocusTown=image([870 870+focus.Size(2)],[70 70+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown1=1;
                    ta=intersect(opptownPos1(:,1:2),battlePos,'rows');
                    underAttackPos1(g:g+size(ta,1)-1,:)=ta;  % 加上主塔在攻击范围内的位置
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos1=[oppPos1;opptownPos1];
                underAttackPos1=[underAttackPos1,underAttackType];
                battleType=2;  % 记录这是骑兵的攻击
                set(gcf,'WindowButtonDownFcn',@clickmoveb1);
            end
        elseif sum(judgem.archer)>0  % 点击了某个弓箭兵
            [xarcher,~]=find(judgem.archer==1);
            archerPos=archer.posStore1(xarcher,1:2);  % 找到点击的弓箭兵所在位置，xarcher表示点击的是场上第几个弓箭兵
            if archer.posStore1(xarcher,3)==0 && archer.posStore1(xarcher,4)==0  % 0表示该弓箭兵当回合没有移动过，也没有攻击过
                % 弓箭兵的移动范围
                whitePos=[];
                whitePos(1,:)=[archerPos(1)-100,archerPos(2)-100]; whitePos(2,:)=[archerPos(1)-100,archerPos(2)];
                whitePos(3,:)=[archerPos(1)-100,archerPos(2)+100]; whitePos(4,:)=[archerPos(1)+100,archerPos(2)-100];
                whitePos(5,:)=[archerPos(1)+100,archerPos(2)]; whitePos(6,:)=[archerPos(1)+100,archerPos(2)+100];
                whitePos(7,:)=[archerPos(1),archerPos(2)-100]; whitePos(8,:)=[archerPos(1),archerPos(2)+100];
                numWhite=size(whitePos,1);
                town1Pos=[0,800;0,900;100,800;100,900]; town2Pos=[800,0;900,0;800,100;900,100];
                deleteNum=[];
                overlapPos=[archer.posStore1(:,1:2);rider.posStore1(:,1:2);rifle.posStore1(:,1:2);...
                    rifle2.posStore2(:,1:2);rider2.posStore2(:,1:2);archer2.posStore2(:,1:2)];
                overlapPos(xarcher,:)=[];
                s=1;
                for ncheck=1:numWhite
                    if isempty(intersect(whitePos(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % 判断弓箭兵的移动范围方格是否和城堡重合
                            isempty(intersect(whitePos(ncheck,:),overlapPos,'rows'))==0  % 判断弓箭兵的移动范围方格是否和别的己方士兵重合
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos(deleteNum,:)=[];  % 删去和城堡或其他士兵重合的移动范围方格
                numWhite=size(whitePos,1);
                for nw=1:numWhite
                    Drawwhite(nw,1)=image([whitePos(nw,1) whitePos(nw,1)+white.Size(2)],...
                        [whitePos(nw,2) whitePos(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % 绘制出弓箭兵的可移动范围
                end
                moveType=3;  % 记录这是弓箭兵的移动
            end
            if archer.posStore1(xarcher,4)==0  % 0表示弓箭兵本回合没有攻击过，移动后可以攻击一次
                % 弓箭兵的攻击范围
                battlePos=[];
                battlePos(1,:)=[archerPos(1)-200,archerPos(2)-200]; battlePos(2,:)=[archerPos(1)-200,archerPos(2)-100];
                battlePos(3,:)=[archerPos(1)-200,archerPos(2)]; battlePos(4,:)=[archerPos(1)-200,archerPos(2)+100];
                battlePos(5,:)=[archerPos(1)-200,archerPos(2)+200]; battlePos(6,:)=[archerPos(1)-100,archerPos(2)-200];
                battlePos(7,:)=[archerPos(1)-100,archerPos(2)+200]; battlePos(8,:)=[archerPos(1),archerPos(2)-200];
                battlePos(9,:)=[archerPos(1),archerPos(2)+200]; battlePos(10,:)=[archerPos(1)+100,archerPos(2)-200];
                battlePos(11,:)=[archerPos(1)+100,archerPos(2)+200]; battlePos(12,:)=[archerPos(1)+200,archerPos(2)-200];
                battlePos(13,:)=[archerPos(1)+200,archerPos(2)-100]; battlePos(14,:)=[archerPos(1)+200,archerPos(2)];
                battlePos(15,:)=[archerPos(1)+200,archerPos(2)+100]; battlePos(16,:)=[archerPos(1)+200,archerPos(2)+200];
                numBattle=size(battlePos,1);
                oppPos1=[[rifle2.posStore2(:,1:2),ones(size(rifle2.posStore2,1),1)];...
                    [rider2.posStore2(:,1:2),ones(size(rider2.posStore2,1),1)*2];...
                    [archer2.posStore2(:,1:2),ones(size(archer2.posStore2,1),1)*3]];  % 玩家1的敌军位置，第三列记录了兵种
                g=1; underAttackPos1=[]; underAttackType=[];
                for nb=1:numBattle
                    if isempty(intersect(battlePos(nb,:),oppPos1(:,1:2),'rows'))==0  % 如果攻击范围内有敌军
                        Drawfocus(nb,1)=image([battlePos(nb,1)+20 battlePos(nb,1)+20+focus.Size(2)],...
                            [battlePos(nb,2)+20 battlePos(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos1(g,:),order]=intersect(oppPos1(:,1:2),battlePos(nb,:),'rows');  % 攻击范围内的敌军位置
                        underAttackType(g,1)=oppPos1(order,3);  % 攻击范围内的敌军兵种
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos,opptownPos1(:,1:2),'rows'))==0  % 如果攻击范围内有敌塔
                    DrawfocusTown=image([870 870+focus.Size(2)],[70 70+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown1=1;
                    ta=intersect(opptownPos1(:,1:2),battlePos,'rows');
                    underAttackPos1(g:g+size(ta,1)-1,:)=ta;  % 加上主塔在攻击范围内的位置
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos1=[oppPos1;opptownPos1];
                underAttackPos1=[underAttackPos1,underAttackType];
                battleType=3;  % 记录这是弓箭兵的攻击
                set(gcf,'WindowButtonDownFcn',@clickmoveb1);
            end
        end
end
turn=0;
set(gcf,'KeyPressFcn',@key);
end