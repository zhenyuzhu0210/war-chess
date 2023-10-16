function clicktown2(~,~)
clear global Drawwhite2 Drawfocus2
global town2 rifle rider archer rifle2 rider2 archer2 turn white black green focus whitePos2 numWhite2 battlePos2 numBattle2...
    Drawrifle2 Drawrider2 Drawarcher2 Drawwhite2 Drawblack2 Drawgreen2 Drawfocus2 xrifle2 xrider2 xarcher2 numGen2 moveType2 battleType2...
    underAttackPos2 bloodRifle2 bloodRider2 bloodArcher2 bloodInit oppPos2 DrawfocusTown2 opptownPos2 showFocusTown2...
    resource2 textresource2 t_client
switch (get(gcbf,'SelectionType'))
    case 'normal'
        pt=get(gca,'CurrentPoint');
        pt_x=round(pt(1));
        pt_y=round(pt(3));
        mrifle=size(rifle2.posStore2,1);
        mrider=size(rider2.posStore2,1);
        marcher=size(archer2.posStore2,1);
        judgem.rifle=[]; judgem.rider=[]; judgem.archer=[];
        for jrifle=1:mrifle
            judgem.rifle(jrifle,1)=pt_x>rifle2.posStore2(jrifle,1) && pt_x<rifle2.posStore2(jrifle,1)+100 &&...
                pt_y>rifle2.posStore2(jrifle,2) && pt_y<rifle2.posStore2(jrifle,2)+100;  % 依次判断是否点击了某个步兵所在格子
        end
        for jrider=1:mrider
            judgem.rider(jrider,1)=pt_x>rider2.posStore2(jrider,1) && pt_x<rider2.posStore2(jrider,1)+100 &&...
                pt_y>rider2.posStore2(jrider,2) && pt_y<rider2.posStore2(jrider,2)+100;  % 依次判断是否点击了某个骑兵所在格子
        end
        for jarcher=1:marcher
            judgem.archer(jarcher,1)=pt_x>archer2.posStore2(jarcher,1) && pt_x<archer2.posStore2(jarcher,1)+100 &&...
                pt_y>archer2.posStore2(jarcher,2) && pt_y<archer2.posStore2(jarcher,2)+100;  % 依次判断是否点击了某个弓箭兵所在格子
        end
        if pt_x>town2.Pos(1) && pt_x<town2.Pos(1)+200 && pt_y>town2.Pos(2) && pt_y<town2.Pos(2)+200 &&...
                isempty(intersect(rifle2.Pos2,rifle2.posInit2,'rows'))==1 &&...
                isempty(intersect(rider2.Pos2,rider2.posInit2,'rows'))==1 &&...
                isempty(intersect(archer2.Pos2,archer2.posInit2,'rows'))==1  % 每回合最多只能招募一个士兵，不论兵种
            button=questdlg('请选择兵种','招募','步兵','骑兵','弓箭兵','步兵');
            if strcmp(button,'步兵') &&...
                    resource2>=20 &&...
                    isempty(intersect(rifle2.Pos2,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,archer2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,rider.posStore1(:,1:2),'rows'))==1  % 步兵出生点如果已存在士兵就不能再新增步兵了
                disp('生产步兵*1');
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
                % 将更新后的数据传输给玩家1
                fwrite(t_client,-1,'double');  % 发送文本数据，步兵招募
                set(gcf,'WindowButtonDownFcn',@clicktown2);  % 返回开头，重新计算judgem
            elseif strcmp(button,'骑兵') &&...
                    resource2>=25 &&...
                    isempty(intersect(rider2.Pos2,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,archer2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,rider.posStore1(:,1:2),'rows'))==1
                disp('生产骑兵*1');
                delete(textresource2);
                resource2=resource2-25;
                resourceText2;
                numGen2.rider=numGen2.rider+1;  % numGen2.rider用来记录这是场上造的的第几个骑兵
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
                % 将更新后的数据传输给玩家1
                fwrite(t_client,-2,'double');  % 发送文本数据，骑兵招募
                set(gcf,'WindowButtonDownFcn',@clicktown2);  % 返回开头，重新计算judgem
            elseif strcmp(button,'弓箭兵') &&...
                    resource2>=25 &&...
                    isempty(intersect(archer2.Pos2,archer2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,rider.posStore1(:,1:2),'rows'))==1
                disp('生产弓箭兵*1');
                delete(textresource2);
                resource2=resource2-25;
                resourceText2;
                numGen2.archer=numGen2.archer+1;  % numGen.rider用来记录这是场上造的的第几个弓箭兵
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
                % 将更新后的数据传输给玩家1
                fwrite(t_client,-3,'double');  % 发送文本数据，弓箭兵招募
                set(gcf,'WindowButtonDownFcn',@clicktown2);  % 返回开头，重新计算judgem
            end
        elseif sum(judgem.rifle)>0  % 点击了某个步兵
            [xrifle2,~]=find(judgem.rifle==1);
            riflePos=rifle2.posStore2(xrifle2,1:2);  % 找到点击的步兵所在位置，xrifle表示点击的是场上第几个步兵
            if rifle2.posStore2(xrifle2,3)==0 && rifle2.posStore2(xrifle2,4)==0  % 0表示该步兵当回合没有移动过，也没有攻击过
                % 步兵的移动范围
                whitePos2=[];
                whitePos2(1,:)=[riflePos(1)-100,riflePos(2)-100]; whitePos2(2,:)=[riflePos(1)-100,riflePos(2)];
                whitePos2(3,:)=[riflePos(1)-100,riflePos(2)+100]; whitePos2(4,:)=[riflePos(1)+100,riflePos(2)-100];
                whitePos2(5,:)=[riflePos(1)+100,riflePos(2)]; whitePos2(6,:)=[riflePos(1)+100,riflePos(2)+100];
                whitePos2(7,:)=[riflePos(1),riflePos(2)-100]; whitePos2(8,:)=[riflePos(1),riflePos(2)+100];
                numWhite2=size(whitePos2,1);
                town1Pos=[0,800;0,900;100,800;100,900]; town2Pos=[800,0;900,0;800,100;900,100];
                deleteNum=[];
                overlapPos=[rifle2.posStore2(:,1:2);rider2.posStore2(:,1:2);archer2.posStore2(:,1:2);...
                    rifle.posStore1(:,1:2);rider.posStore1(:,1:2);archer.posStore1(:,1:2)];
                overlapPos(xrifle2,:)=[];
                s=1;
                for ncheck=1:numWhite2
                    if isempty(intersect(whitePos2(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % 判断步兵的移动范围方格是否和城堡重合
                            isempty(intersect(whitePos2(ncheck,:),overlapPos,'rows'))==0  % 判断步兵的移动范围方格是否和别的士兵重合
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos2(deleteNum,:)=[];  % 删去和城堡或其他士兵重合的移动范围方格
                numWhite2=size(whitePos2,1);
                for nw=1:numWhite2
                    Drawwhite2(nw,1)=image([whitePos2(nw,1) whitePos2(nw,1)+white.Size(2)],...
                        [whitePos2(nw,2) whitePos2(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % 绘制出步兵的可移动范围
                end
                moveType2=1;  % 记录这是步兵的移动
            end
            if rifle2.posStore2(xrifle2,4)==0  % 0表示步兵本回合没有攻击过，移动后可以攻击一次
                % 步兵的攻击范围
                battlePos2=[];
                battlePos2(1,:)=[riflePos(1)-100,riflePos(2)-100]; battlePos2(2,:)=[riflePos(1)-100,riflePos(2)];
                battlePos2(3,:)=[riflePos(1)-100,riflePos(2)+100]; battlePos2(4,:)=[riflePos(1)+100,riflePos(2)-100];
                battlePos2(5,:)=[riflePos(1)+100,riflePos(2)]; battlePos2(6,:)=[riflePos(1)+100,riflePos(2)+100];
                battlePos2(7,:)=[riflePos(1),riflePos(2)-100]; battlePos2(8,:)=[riflePos(1),riflePos(2)+100];
                numBattle2=size(battlePos2,1);
                oppPos2=[[rifle.posStore1(:,1:2),ones(size(rifle.posStore1,1),1)];...
                    [rider.posStore1(:,1:2),ones(size(rider.posStore1,1),1)*2];...
                    [archer.posStore1(:,1:2),ones(size(archer.posStore1,1),1)*3]];  % 玩家2的敌军位置，第三列记录了兵种
                g=1; underAttackPos2=[]; underAttackType=[];
                for nb=1:numBattle2
                    if isempty(intersect(battlePos2(nb,:),oppPos2(:,1:2),'rows'))==0  % 如果攻击范围内有敌军
                        Drawfocus2(nb,1)=image([battlePos2(nb,1)+20 battlePos2(nb,1)+20+focus.Size(2)],...
                            [battlePos2(nb,2)+20 battlePos2(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos2(g,:),order]=intersect(oppPos2(:,1:2),battlePos2(nb,:),'rows');  % 攻击范围内的敌军位置
                        underAttackType(g,1)=oppPos2(order,3);  % 攻击范围内的敌军兵种
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos2,opptownPos2(:,1:2),'rows'))==0  % 如果攻击范围内有敌塔
                    DrawfocusTown2=image([70 70+focus.Size(2)],[870 870+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown2=1;
                    ta=intersect(opptownPos2(:,1:2),battlePos2,'rows');
                    underAttackPos2(g:g+size(ta,1)-1,:)=ta;  % 加上主塔在攻击范围内的位置
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos2=[oppPos2;opptownPos2];
                underAttackPos2=[underAttackPos2,underAttackType];
                battleType2=1;  % 记录这是步兵的攻击
                set(gcf,'WindowButtonDownFcn',@clickmove2);
            end
        elseif sum(judgem.rider)>0  % 点击了某个骑兵
            [xrider2,~]=find(judgem.rider==1);
            riderPos=rider2.posStore2(xrider2,1:2);  % 找到点击的骑兵所在位置，xrifle表示点击的是场上第几个骑兵
            if rider2.posStore2(xrider2,3)==0 && rider2.posStore2(xrider2,4)==0  % 0表示该骑兵当回合没有移动过，也没有攻击过
                % 骑兵的移动范围
                whitePos2=[];
                whitePos2(1,:)=[riderPos(1)-100,riderPos(2)-100]; whitePos2(2,:)=[riderPos(1)-100,riderPos(2)];
                whitePos2(3,:)=[riderPos(1)-100,riderPos(2)+100]; whitePos2(4,:)=[riderPos(1)+100,riderPos(2)-100];
                whitePos2(5,:)=[riderPos(1)+100,riderPos(2)]; whitePos2(6,:)=[riderPos(1)+100,riderPos(2)+100];
                whitePos2(7,:)=[riderPos(1),riderPos(2)-100]; whitePos2(8,:)=[riderPos(1),riderPos(2)+100];
                whitePos2(9,:)=[riderPos(1)-200,riderPos(2)-200]; whitePos2(10,:)=[riderPos(1)-200,riderPos(2)-100];
                whitePos2(11,:)=[riderPos(1)-200,riderPos(2)]; whitePos2(12,:)=[riderPos(1)-200,riderPos(2)+100];
                whitePos2(13,:)=[riderPos(1)-200,riderPos(2)+200]; whitePos2(14,:)=[riderPos(1)-100,riderPos(2)+200];
                whitePos2(15,:)=[riderPos(1),riderPos(2)+200]; whitePos2(16,:)=[riderPos(1)+100,riderPos(2)+200];
                whitePos2(17,:)=[riderPos(1)+200,riderPos(2)+200]; whitePos2(18,:)=[riderPos(1)-100,riderPos(2)-200];
                whitePos2(19,:)=[riderPos(1),riderPos(2)-200]; whitePos2(20,:)=[riderPos(1)+100,riderPos(2)-200];
                whitePos2(21,:)=[riderPos(1)+200,riderPos(2)-200]; whitePos2(22,:)=[riderPos(1)+200,riderPos(2)-100];
                whitePos2(23,:)=[riderPos(1)+200,riderPos(2)]; whitePos2(24,:)=[riderPos(1)+200,riderPos(2)+100];
                numWhite2=size(whitePos2,1);
                town1Pos=[0,800;0,900;100,800;100,900]; town2Pos=[800,0;900,0;800,100;900,100];
                deleteNum=[];
                overlapPos=[rider2.posStore2(:,1:2);rifle2.posStore2(:,1:2);archer2.posStore2(:,1:2);...
                    rifle.posStore1(:,1:2);rider.posStore1(:,1:2);archer.posStore1(:,1:2)];
                overlapPos(xrider2,:)=[];
                s=1;
                for ncheck=1:numWhite2
                    if isempty(intersect(whitePos2(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % 判断骑兵的移动范围方格是否和城堡重合
                            isempty(intersect(whitePos2(ncheck,:),overlapPos,'rows'))==0  % 判断骑兵的移动范围方格是否和别的己方士兵重合
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos2(deleteNum,:)=[];  % 删去和城堡或其他士兵重合的移动范围方格
                numWhite2=size(whitePos2,1);
                for nw=1:numWhite2
                    Drawwhite2(nw,1)=image([whitePos2(nw,1) whitePos2(nw,1)+white.Size(2)],...
                        [whitePos2(nw,2) whitePos2(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % 绘制出骑兵的可移动范围
                end
                moveType2=2;  % 记录这是骑兵的移动
            end
            if rider2.posStore2(xrider2,4)==0  % 0表示骑兵本回合没有攻击过，移动后可以攻击一次
                % 骑兵的攻击范围
                battlePos2=[];
                battlePos2(1,:)=[riderPos(1)-100,riderPos(2)-100]; battlePos2(2,:)=[riderPos(1)-100,riderPos(2)];
                battlePos2(3,:)=[riderPos(1)-100,riderPos(2)+100]; battlePos2(4,:)=[riderPos(1)+100,riderPos(2)-100];
                battlePos2(5,:)=[riderPos(1)+100,riderPos(2)]; battlePos2(6,:)=[riderPos(1)+100,riderPos(2)+100];
                battlePos2(7,:)=[riderPos(1),riderPos(2)-100]; battlePos2(8,:)=[riderPos(1),riderPos(2)+100];
                numBattle2=size(battlePos2,1);
                oppPos2=[[rifle.posStore1(:,1:2),ones(size(rifle.posStore1,1),1)];...
                    [rider.posStore1(:,1:2),ones(size(rider.posStore1,1),1)*2];...
                    [archer.posStore1(:,1:2),ones(size(archer.posStore1,1),1)*3]];  % 玩家2的敌军位置，第三列记录了兵种
                g=1; underAttackPos2=[]; underAttackType=[];
                for nb=1:numBattle2
                    if isempty(intersect(battlePos2(nb,:),oppPos2(:,1:2),'rows'))==0  % 如果攻击范围内有敌军
                        Drawfocus2(nb,1)=image([battlePos2(nb,1)+20 battlePos2(nb,1)+20+focus.Size(2)],...
                            [battlePos2(nb,2)+20 battlePos2(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos2(g,:),order]=intersect(oppPos2(:,1:2),battlePos2(nb,:),'rows');  % 攻击范围内的敌军位置
                        underAttackType(g,1)=oppPos2(order,3);  % 攻击范围内的敌军兵种
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos2,opptownPos2(:,1:2),'rows'))==0  % 如果攻击范围内有敌塔
                    DrawfocusTown2=image([70 70+focus.Size(2)],[870 870+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown2=1;
                    ta=intersect(opptownPos2(:,1:2),battlePos2,'rows');
                    underAttackPos2(g:g+size(ta,1)-1,:)=ta;  % 加上主塔在攻击范围内的位置
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos2=[oppPos2;opptownPos2];
                underAttackPos2=[underAttackPos2,underAttackType];
                battleType2=2;  % 记录这是骑兵的攻击
                set(gcf,'WindowButtonDownFcn',@clickmove2);
            end
        elseif sum(judgem.archer)>0  % 点击了某个弓箭兵
            [xarcher2,~]=find(judgem.archer==1);
            archerPos=archer2.posStore2(xarcher2,1:2);  % 找到点击的弓箭兵所在位置，xrifle表示点击的是场上第几个弓箭兵
            if archer2.posStore2(xarcher2,3)==0 && archer2.posStore2(xarcher2,4)==0  % 0表示该弓箭兵当回合没有移动过，也没有攻击过
                % 弓箭兵的移动范围
                whitePos2=[];
                whitePos2(1,:)=[archerPos(1)-100,archerPos(2)-100]; whitePos2(2,:)=[archerPos(1)-100,archerPos(2)];
                whitePos2(3,:)=[archerPos(1)-100,archerPos(2)+100]; whitePos2(4,:)=[archerPos(1)+100,archerPos(2)-100];
                whitePos2(5,:)=[archerPos(1)+100,archerPos(2)]; whitePos2(6,:)=[archerPos(1)+100,archerPos(2)+100];
                whitePos2(7,:)=[archerPos(1),archerPos(2)-100]; whitePos2(8,:)=[archerPos(1),archerPos(2)+100];
                numWhite2=size(whitePos2,1);
                town1Pos=[0,800;0,900;100,800;100,900]; town2Pos=[800,0;900,0;800,100;900,100];
                deleteNum=[];
                overlapPos=[archer2.posStore2(:,1:2);rider2.posStore2(:,1:2);rifle2.posStore2(:,1:2);...
                    rifle.posStore1(:,1:2);rider.posStore1(:,1:2);archer.posStore1(:,1:2)];
                overlapPos(xarcher2,:)=[];
                s=1;
                for ncheck=1:numWhite2
                    if isempty(intersect(whitePos2(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % 判断弓箭兵的移动范围方格是否和城堡重合
                            isempty(intersect(whitePos2(ncheck,:),overlapPos,'rows'))==0  % 判断弓箭兵的移动范围方格是否和别的己方士兵重合
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos2(deleteNum,:)=[];  % 删去和城堡或其他士兵重合的移动范围方格
                numWhite2=size(whitePos2,1);
                for nw=1:numWhite2
                    Drawwhite2(nw,1)=image([whitePos2(nw,1) whitePos2(nw,1)+white.Size(2)],...
                        [whitePos2(nw,2) whitePos2(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % 绘制出弓箭兵的可移动范围
                end
                moveType2=3;  % 记录这是弓箭兵的移动
            end
            if archer2.posStore2(xarcher2,4)==0  % 0表示弓箭兵本回合没有攻击过，移动后可以攻击一次
                % 弓箭兵的攻击范围
                battlePos2=[];
                battlePos2(1,:)=[archerPos(1)-200,archerPos(2)-200]; battlePos2(2,:)=[archerPos(1)-200,archerPos(2)-100];
                battlePos2(3,:)=[archerPos(1)-200,archerPos(2)]; battlePos2(4,:)=[archerPos(1)-200,archerPos(2)+100];
                battlePos2(5,:)=[archerPos(1)-200,archerPos(2)+200]; battlePos2(6,:)=[archerPos(1)-100,archerPos(2)-200];
                battlePos2(7,:)=[archerPos(1)-100,archerPos(2)+200]; battlePos2(8,:)=[archerPos(1),archerPos(2)-200];
                battlePos2(9,:)=[archerPos(1),archerPos(2)+200]; battlePos2(10,:)=[archerPos(1)+100,archerPos(2)-200];
                battlePos2(11,:)=[archerPos(1)+100,archerPos(2)+200]; battlePos2(12,:)=[archerPos(1)+200,archerPos(2)-200];
                battlePos2(13,:)=[archerPos(1)+200,archerPos(2)-100]; battlePos2(14,:)=[archerPos(1)+200,archerPos(2)];
                battlePos2(15,:)=[archerPos(1)+200,archerPos(2)+100]; battlePos2(16,:)=[archerPos(1)+200,archerPos(2)+200];
                numBattle2=size(battlePos2,1);
                oppPos2=[[rifle.posStore1(:,1:2),ones(size(rifle.posStore1,1),1)];...
                    [rider.posStore1(:,1:2),ones(size(rider.posStore1,1),1)*2];...
                    [archer.posStore1(:,1:2),ones(size(archer.posStore1,1),1)*3]];  % 玩家2的敌军位置，第三列记录了兵种
                g=1; underAttackPos2=[]; underAttackType=[];
                for nb=1:numBattle2
                    if isempty(intersect(battlePos2(nb,:),oppPos2(:,1:2),'rows'))==0  % 如果攻击范围内有敌军
                        Drawfocus2(nb,1)=image([battlePos2(nb,1)+20 battlePos2(nb,1)+20+focus.Size(2)],...
                            [battlePos2(nb,2)+20 battlePos2(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos2(g,:),order]=intersect(oppPos2(:,1:2),battlePos2(nb,:),'rows');  % 攻击范围内的敌军位置
                        underAttackType(g,1)=oppPos2(order,3);  % 攻击范围内的敌军兵种
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos2,opptownPos2(:,1:2),'rows'))==0  % 如果攻击范围内有敌塔
                    DrawfocusTown2=image([70 70+focus.Size(2)],[870 870+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown2=1;
                    ta=intersect(opptownPos2(:,1:2),battlePos2,'rows');
                    underAttackPos2(g:g+size(ta,1)-1,:)=ta;  % 加上主塔在攻击范围内的位置
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos2=[oppPos2;opptownPos2];
                underAttackPos2=[underAttackPos2,underAttackType];
                battleType2=3;  % 记录这是弓箭兵的攻击
                set(gcf,'WindowButtonDownFcn',@clickmove2);
            end
        end
end
turn=1;
set(gcf,'KeyPressFcn',@key2);
end