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
                pt_y>rifle.posStore1(jrifle,2) && pt_y<rifle.posStore1(jrifle,2)+100;  % �����ж��Ƿ�����ĳ���������ڸ���
        end
        for jrider=1:mrider
            judgem.rider(jrider,1)=pt_x>rider.posStore1(jrider,1) && pt_x<rider.posStore1(jrider,1)+100 &&...
                pt_y>rider.posStore1(jrider,2) && pt_y<rider.posStore1(jrider,2)+100;  % �����ж��Ƿ�����ĳ��������ڸ���
        end
        for jarcher=1:marcher
            judgem.archer(jarcher,1)=pt_x>archer.posStore1(jarcher,1) && pt_x<archer.posStore1(jarcher,1)+100 &&...
                pt_y>archer.posStore1(jarcher,2) && pt_y<archer.posStore1(jarcher,2)+100;  % �����ж��Ƿ�����ĳ�����������ڸ���
        end
        if pt_x>town1.Pos(1) && pt_x<town1.Pos(1)+200 && pt_y>town1.Pos(2) && pt_y<town1.Pos(2)+200 &&...
                isempty(intersect(rifle.Pos1,rifle.posInit1,'rows'))==1 &&...
                isempty(intersect(rider.Pos1,rider.posInit1,'rows'))==1 &&...
                isempty(intersect(archer.Pos1,archer.posInit1,'rows'))==1  % ÿ�غ����ֻ����ļһ��ʿ�������۱���
            button=questdlg('��ѡ�����','��ļ','����','���','������','����');
            if strcmp(button,'����') &&...
                    resource1>=20 &&...
                    isempty(intersect(rifle.Pos1,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,rider.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle.Pos1,archer2.posStore2(:,1:2),'rows'))==1  % ��������������Ѵ���ʿ���Ͳ���������������
                disp('��������*1');
                delete(textresource1);
                resource1=resource1-20;
                resourceText1;
                numGen.rifle=numGen.rifle+1;  % numGen.rifle������¼���ǳ�����ĵĵڼ�������
                Drawrifle(numGen.rifle,1)=image([0 rifle.Size(2)]+rifle.Pos1(1),[0 rifle.Size(1)]+rifle.Pos1(2),...
                    rifle.CData,'alphaData',rifle.AlpData);
                Drawblack.rifle(numGen.rifle,1)=rectangle('Position',[black.riflePos1(1),black.riflePos1(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','k');
                Drawgreen.rifle(numGen.rifle,1)=rectangle('Position',[green.riflePos1(1),green.riflePos1(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','g');
                rifle.posStore1=[rifle.posStore1;[rifle.Pos1,1,1]]; % ������ı���λ����ԭ�б���λ�úϲ�����һ���¾���1��ʾ����ļ�ı����غϲ����ƶ�Ҳ���ܹ���
                rifle.posInit1=rifle.Pos1;  % ��ʾ���غ�����ļ������
                black.rifleposStore1=[black.rifleposStore1;black.riflePos1];
                bloodRifle1=[bloodRifle1;80];
                green.rifleposStore1=[green.rifleposStore1;green.riflePos1];
                set(gcf,'WindowButtonDownFcn',@clicktownb1);  % ���ؿ�ͷ�����¼���judgem
            elseif strcmp(button,'���') &&...
                    resource1>=25 &&...
                    isempty(intersect(rider.Pos1,rider.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider.Pos1,archer2.posStore2(:,1:2),'rows'))==1
                disp('�������*1');
                delete(textresource1);
                resource1=resource1-25;
                resourceText1;
                numGen.rider=numGen.rider+1;  % numGen.rider������¼���ǳ�����ĵĵڼ������
                Drawrider(numGen.rider,1)=image([0 rider.Size(2)]+rider.Pos1(1),[0 rider.Size(1)]+rider.Pos1(2),...
                    rider.CData,'alphaData',rider.AlpData);
                Drawblack.rider(numGen.rider,1)=rectangle('Position',[black.riderPos1(1),black.riderPos1(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','k');
                Drawgreen.rider(numGen.rider,1)=rectangle('Position',[green.riderPos1(1),green.riderPos1(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','g');
                rider.posStore1=[rider.posStore1;[rider.Pos1,1,1]]; % ������ı���λ����ԭ�б���λ�úϲ�����һ���¾���1��ʾ����ļ�ı����غϲ����ƶ�Ҳ���ܹ���
                rider.posInit1=rider.Pos1;  % ��ʾ���غ�����ļ�����
                black.riderposStore1=[black.riderposStore1;black.riderPos1];
                bloodRider1=[bloodRider1;80];
                green.riderposStore1=[green.riderposStore1;green.riderPos1];
                set(gcf,'WindowButtonDownFcn',@clicktownb1);  % ���ؿ�ͷ�����¼���judgem
            elseif strcmp(button,'������') &&...
                    resource1>=25 &&...
                    isempty(intersect(archer.Pos1,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,rider.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer.Pos1,archer2.posStore2(:,1:2),'rows'))==1
                disp('����������*1');
                delete(textresource1);
                resource1=resource1-25;
                resourceText1;
                numGen.archer=numGen.archer+1;  % numGen.rider������¼���ǳ�����ĵĵڼ���������
                Drawarcher(numGen.archer,1)=image([0 archer.Size(2)]+archer.Pos1(1),[0 archer.Size(1)]+archer.Pos1(2),...
                    archer.CData,'alphaData',archer.AlpData);
                Drawblack.archer(numGen.archer,1)=rectangle('Position',[black.archerPos1(1),black.archerPos1(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','k');
                Drawgreen.archer(numGen.archer,1)=rectangle('Position',[green.archerPos1(1),green.archerPos1(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','g');
                archer.posStore1=[archer.posStore1;[archer.Pos1,1,1]]; % ������ı���λ����ԭ�б���λ�úϲ�����һ���¾���1��ʾ����ļ�ı����غϲ����ƶ�Ҳ���ܹ���
                archer.posInit1=archer.Pos1;  % ��ʾ���غ�����ļ��������
                black.archerposStore1=[black.archerposStore1;black.archerPos1];
                bloodArcher1=[bloodArcher1;80];
                green.archerposStore1=[green.archerposStore1;green.archerPos1];
                set(gcf,'WindowButtonDownFcn',@clicktownb1);  % ���ؿ�ͷ�����¼���judgem
            end
        elseif sum(judgem.rifle)>0  % �����ĳ������
            [xrifle,~]=find(judgem.rifle==1);
            riflePos=rifle.posStore1(xrifle,1:2);  % �ҵ�����Ĳ�������λ�ã�xrifle��ʾ������ǳ��ϵڼ�������
            if rifle.posStore1(xrifle,3)==0 && rifle.posStore1(xrifle,4)==0  % 0��ʾ�ò������غ�û���ƶ�����Ҳû�й�����
                % �������ƶ���Χ
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
                    if isempty(intersect(whitePos(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % �жϲ������ƶ���Χ�����Ƿ�ͳǱ��غ�
                            isempty(intersect(whitePos(ncheck,:),overlapPos,'rows'))==0  % �жϲ������ƶ���Χ�����Ƿ�ͱ��ʿ���غ�
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos(deleteNum,:)=[];  % ɾȥ�ͳǱ�������ʿ���غϵ��ƶ���Χ����
                numWhite=size(whitePos,1);
                for nw=1:numWhite
                    Drawwhite(nw,1)=image([whitePos(nw,1) whitePos(nw,1)+white.Size(2)],...
                        [whitePos(nw,2) whitePos(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % ���Ƴ������Ŀ��ƶ���Χ
                end
                moveType=1;  % ��¼���ǲ������ƶ�
            end
            if rifle.posStore1(xrifle,4)==0  % 0��ʾ�������غ�û�й��������ƶ�����Թ���һ��
                % �����Ĺ�����Χ
                battlePos=[];
                battlePos(1,:)=[riflePos(1)-100,riflePos(2)-100]; battlePos(2,:)=[riflePos(1)-100,riflePos(2)];
                battlePos(3,:)=[riflePos(1)-100,riflePos(2)+100]; battlePos(4,:)=[riflePos(1)+100,riflePos(2)-100];
                battlePos(5,:)=[riflePos(1)+100,riflePos(2)]; battlePos(6,:)=[riflePos(1)+100,riflePos(2)+100];
                battlePos(7,:)=[riflePos(1),riflePos(2)-100]; battlePos(8,:)=[riflePos(1),riflePos(2)+100];
                numBattle=size(battlePos,1);
                oppPos1=[[rifle2.posStore2(:,1:2),ones(size(rifle2.posStore2,1),1)];...
                    [rider2.posStore2(:,1:2),ones(size(rider2.posStore2,1),1)*2];...
                    [archer2.posStore2(:,1:2),ones(size(archer2.posStore2,1),1)*3]];  % ���1�ĵо�λ�ã������м�¼�˱���
                g=1; underAttackPos1=[]; underAttackType=[];
                for nb=1:numBattle
                    if isempty(intersect(battlePos(nb,:),oppPos1(:,1:2),'rows'))==0  % ���������Χ���ео�
                        Drawfocus(nb,1)=image([battlePos(nb,1)+20 battlePos(nb,1)+20+focus.Size(2)],...
                            [battlePos(nb,2)+20 battlePos(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos1(g,:),order]=intersect(oppPos1(:,1:2),battlePos(nb,:),'rows');  % ������Χ�ڵĵо�λ��
                        underAttackType(g,1)=oppPos1(order,3);  % ������Χ�ڵĵо�����
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos,opptownPos1(:,1:2),'rows'))==0  % ���������Χ���е���
                    DrawfocusTown=image([870 870+focus.Size(2)],[70 70+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown1=1;
                    ta=intersect(opptownPos1(:,1:2),battlePos,'rows');
                    underAttackPos1(g:g+size(ta,1)-1,:)=ta;  % ���������ڹ�����Χ�ڵ�λ��
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos1=[oppPos1;opptownPos1];
                underAttackPos1=[underAttackPos1,underAttackType];
                battleType=1;  % ��¼���ǲ����Ĺ���
                set(gcf,'WindowButtonDownFcn',@clickmoveb1);
            end
        elseif sum(judgem.rider)>0  % �����ĳ�����
            [xrider,~]=find(judgem.rider==1);
            riderPos=rider.posStore1(xrider,1:2);  % �ҵ�������������λ�ã�xrider��ʾ������ǳ��ϵڼ������
            if rider.posStore1(xrider,3)==0 && rider.posStore1(xrider,4)==0  % 0��ʾ��������غ�û���ƶ�����Ҳû�й�����
                % ������ƶ���Χ
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
                    if isempty(intersect(whitePos(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % �ж�������ƶ���Χ�����Ƿ�ͳǱ��غ�
                            isempty(intersect(whitePos(ncheck,:),overlapPos,'rows'))==0  % �ж�������ƶ���Χ�����Ƿ�ͱ�ļ���ʿ���غ�
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos(deleteNum,:)=[];  % ɾȥ�ͳǱ�������ʿ���غϵ��ƶ���Χ����
                numWhite=size(whitePos,1);
                for nw=1:numWhite
                    Drawwhite(nw,1)=image([whitePos(nw,1) whitePos(nw,1)+white.Size(2)],...
                        [whitePos(nw,2) whitePos(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % ���Ƴ�����Ŀ��ƶ���Χ
                end
                moveType=2;  % ��¼����������ƶ�
            end
            if rider.posStore1(xrider,4)==0  % 0��ʾ������غ�û�й��������ƶ�������Թ���һ��
                % ����Ĺ�����Χ
                battlePos=[];
                battlePos(1,:)=[riderPos(1)-100,riderPos(2)-100]; battlePos(2,:)=[riderPos(1)-100,riderPos(2)];
                battlePos(3,:)=[riderPos(1)-100,riderPos(2)+100]; battlePos(4,:)=[riderPos(1)+100,riderPos(2)-100];
                battlePos(5,:)=[riderPos(1)+100,riderPos(2)]; battlePos(6,:)=[riderPos(1)+100,riderPos(2)+100];
                battlePos(7,:)=[riderPos(1),riderPos(2)-100]; battlePos(8,:)=[riderPos(1),riderPos(2)+100];
                numBattle=size(battlePos,1);
                oppPos1=[[rifle2.posStore2(:,1:2),ones(size(rifle2.posStore2,1),1)];...
                    [rider2.posStore2(:,1:2),ones(size(rider2.posStore2,1),1)*2];...
                    [archer2.posStore2(:,1:2),ones(size(archer2.posStore2,1),1)*3]];  % ���1�ĵо�λ�ã������м�¼�˱���
                g=1; underAttackPos1=[]; underAttackType=[];
                for nb=1:numBattle
                    if isempty(intersect(battlePos(nb,:),oppPos1(:,1:2),'rows'))==0  % ���������Χ���ео�
                        Drawfocus(nb,1)=image([battlePos(nb,1)+20 battlePos(nb,1)+20+focus.Size(2)],...
                            [battlePos(nb,2)+20 battlePos(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos1(g,:),order]=intersect(oppPos1(:,1:2),battlePos(nb,:),'rows');  % ������Χ�ڵĵо�λ��
                        underAttackType(g,1)=oppPos1(order,3);  % ������Χ�ڵĵо�����
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos,opptownPos1(:,1:2),'rows'))==0  % ���������Χ���е���
                    DrawfocusTown=image([870 870+focus.Size(2)],[70 70+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown1=1;
                    ta=intersect(opptownPos1(:,1:2),battlePos,'rows');
                    underAttackPos1(g:g+size(ta,1)-1,:)=ta;  % ���������ڹ�����Χ�ڵ�λ��
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos1=[oppPos1;opptownPos1];
                underAttackPos1=[underAttackPos1,underAttackType];
                battleType=2;  % ��¼��������Ĺ���
                set(gcf,'WindowButtonDownFcn',@clickmoveb1);
            end
        elseif sum(judgem.archer)>0  % �����ĳ��������
            [xarcher,~]=find(judgem.archer==1);
            archerPos=archer.posStore1(xarcher,1:2);  % �ҵ�����Ĺ���������λ�ã�xarcher��ʾ������ǳ��ϵڼ���������
            if archer.posStore1(xarcher,3)==0 && archer.posStore1(xarcher,4)==0  % 0��ʾ�ù��������غ�û���ƶ�����Ҳû�й�����
                % ���������ƶ���Χ
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
                    if isempty(intersect(whitePos(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % �жϹ��������ƶ���Χ�����Ƿ�ͳǱ��غ�
                            isempty(intersect(whitePos(ncheck,:),overlapPos,'rows'))==0  % �жϹ��������ƶ���Χ�����Ƿ�ͱ�ļ���ʿ���غ�
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos(deleteNum,:)=[];  % ɾȥ�ͳǱ�������ʿ���غϵ��ƶ���Χ����
                numWhite=size(whitePos,1);
                for nw=1:numWhite
                    Drawwhite(nw,1)=image([whitePos(nw,1) whitePos(nw,1)+white.Size(2)],...
                        [whitePos(nw,2) whitePos(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % ���Ƴ��������Ŀ��ƶ���Χ
                end
                moveType=3;  % ��¼���ǹ��������ƶ�
            end
            if archer.posStore1(xarcher,4)==0  % 0��ʾ���������غ�û�й��������ƶ�����Թ���һ��
                % �������Ĺ�����Χ
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
                    [archer2.posStore2(:,1:2),ones(size(archer2.posStore2,1),1)*3]];  % ���1�ĵо�λ�ã������м�¼�˱���
                g=1; underAttackPos1=[]; underAttackType=[];
                for nb=1:numBattle
                    if isempty(intersect(battlePos(nb,:),oppPos1(:,1:2),'rows'))==0  % ���������Χ���ео�
                        Drawfocus(nb,1)=image([battlePos(nb,1)+20 battlePos(nb,1)+20+focus.Size(2)],...
                            [battlePos(nb,2)+20 battlePos(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos1(g,:),order]=intersect(oppPos1(:,1:2),battlePos(nb,:),'rows');  % ������Χ�ڵĵо�λ��
                        underAttackType(g,1)=oppPos1(order,3);  % ������Χ�ڵĵо�����
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos,opptownPos1(:,1:2),'rows'))==0  % ���������Χ���е���
                    DrawfocusTown=image([870 870+focus.Size(2)],[70 70+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown1=1;
                    ta=intersect(opptownPos1(:,1:2),battlePos,'rows');
                    underAttackPos1(g:g+size(ta,1)-1,:)=ta;  % ���������ڹ�����Χ�ڵ�λ��
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos1=[oppPos1;opptownPos1];
                underAttackPos1=[underAttackPos1,underAttackType];
                battleType=3;  % ��¼���ǹ������Ĺ���
                set(gcf,'WindowButtonDownFcn',@clickmoveb1);
            end
        end
end
turn=0;
set(gcf,'KeyPressFcn',@key);
end