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
                pt_y>rifle2.posStore2(jrifle,2) && pt_y<rifle2.posStore2(jrifle,2)+100;  % �����ж��Ƿ�����ĳ���������ڸ���
        end
        for jrider=1:mrider
            judgem.rider(jrider,1)=pt_x>rider2.posStore2(jrider,1) && pt_x<rider2.posStore2(jrider,1)+100 &&...
                pt_y>rider2.posStore2(jrider,2) && pt_y<rider2.posStore2(jrider,2)+100;  % �����ж��Ƿ�����ĳ��������ڸ���
        end
        for jarcher=1:marcher
            judgem.archer(jarcher,1)=pt_x>archer2.posStore2(jarcher,1) && pt_x<archer2.posStore2(jarcher,1)+100 &&...
                pt_y>archer2.posStore2(jarcher,2) && pt_y<archer2.posStore2(jarcher,2)+100;  % �����ж��Ƿ�����ĳ�����������ڸ���
        end
        if pt_x>town2.Pos(1) && pt_x<town2.Pos(1)+200 && pt_y>town2.Pos(2) && pt_y<town2.Pos(2)+200 &&...
                isempty(intersect(rifle2.Pos2,rifle2.posInit2,'rows'))==1 &&...
                isempty(intersect(rider2.Pos2,rider2.posInit2,'rows'))==1 &&...
                isempty(intersect(archer2.Pos2,archer2.posInit2,'rows'))==1  % ÿ�غ����ֻ����ļһ��ʿ�������۱���
            button=questdlg('��ѡ�����','��ļ','����','���','������','����');
            if strcmp(button,'����') &&...
                    resource2>=20 &&...
                    isempty(intersect(rifle2.Pos2,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,archer2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rifle2.Pos2,rider.posStore1(:,1:2),'rows'))==1  % ��������������Ѵ���ʿ���Ͳ���������������
                disp('��������*1');
                delete(textresource2);
                resource2=resource2-20;
                resourceText2;
                numGen2.rifle=numGen2.rifle+1;  % numGen2.rifle������¼���ǳ�����ĵĵڼ�������
                Drawrifle2(numGen2.rifle,1)=image([0 rifle2.Size(2)]+rifle2.Pos2(1),[0 rifle2.Size(1)]+rifle2.Pos2(2),...
                    rifle2.CData,'alphaData',rifle2.AlpData);
                Drawblack2.rifle(numGen2.rifle,1)=rectangle('Position',[black.riflePos2(1),black.riflePos2(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','k');
                Drawgreen2.rifle(numGen2.rifle,1)=rectangle('Position',[green.riflePos2(1),green.riflePos2(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','g');
                rifle2.posStore2=[rifle2.posStore2;[rifle2.Pos2,1,1]]; % ������ı���λ����ԭ�б���λ�úϲ�����һ���¾���1��ʾ����ļ�ı����غϲ����ƶ��򹥻�
                rifle2.posInit2=rifle2.Pos2;  % ��ʾ���غ�����ļ������
                black.rifleposStore2=[black.rifleposStore2;black.riflePos2];
                bloodRifle2=[bloodRifle2;80];
                green.rifleposStore2=[green.rifleposStore2;green.riflePos2];
                % �����º�����ݴ�������1
                fwrite(t_client,-1,'double');  % �����ı����ݣ�������ļ
                set(gcf,'WindowButtonDownFcn',@clicktown2);  % ���ؿ�ͷ�����¼���judgem
            elseif strcmp(button,'���') &&...
                    resource2>=25 &&...
                    isempty(intersect(rider2.Pos2,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,archer2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(rider2.Pos2,rider.posStore1(:,1:2),'rows'))==1
                disp('�������*1');
                delete(textresource2);
                resource2=resource2-25;
                resourceText2;
                numGen2.rider=numGen2.rider+1;  % numGen2.rider������¼���ǳ�����ĵĵڼ������
                Drawrider2(numGen2.rider,1)=image([0 rider2.Size(2)]+rider2.Pos2(1),[0 rider2.Size(1)]+rider2.Pos2(2),...
                    rider2.CData,'alphaData',rider2.AlpData);
                Drawblack2.rider(numGen2.rider,1)=rectangle('Position',[black.riderPos2(1),black.riderPos2(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','k');
                Drawgreen2.rider(numGen2.rider,1)=rectangle('Position',[green.riderPos2(1),green.riderPos2(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','g');
                rider2.posStore2=[rider2.posStore2;[rider2.Pos2,1,1]]; % ������ı���λ����ԭ�б���λ�úϲ�����һ���¾���1��ʾ����ļ�ı����غϲ����ƶ��򹥻�
                rider2.posInit2=rider2.Pos2;  % ��ʾ���غ�����ļ�����
                black.riderposStore2=[black.riderposStore2;black.riderPos2];
                bloodRider2=[bloodRider2;80];
                green.riderposStore2=[green.riderposStore2;green.riderPos2];
                % �����º�����ݴ�������1
                fwrite(t_client,-2,'double');  % �����ı����ݣ������ļ
                set(gcf,'WindowButtonDownFcn',@clicktown2);  % ���ؿ�ͷ�����¼���judgem
            elseif strcmp(button,'������') &&...
                    resource2>=25 &&...
                    isempty(intersect(archer2.Pos2,archer2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,rifle2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,rider2.posStore2(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,archer.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,rifle.posStore1(:,1:2),'rows'))==1 &&...
                    isempty(intersect(archer2.Pos2,rider.posStore1(:,1:2),'rows'))==1
                disp('����������*1');
                delete(textresource2);
                resource2=resource2-25;
                resourceText2;
                numGen2.archer=numGen2.archer+1;  % numGen.rider������¼���ǳ�����ĵĵڼ���������
                Drawarcher2(numGen2.archer,1)=image([0 archer2.Size(2)]+archer2.Pos2(1),[0 archer2.Size(1)]+archer2.Pos2(2),...
                    archer2.CData,'alphaData',archer2.AlpData);
                Drawblack2.archer(numGen2.archer,1)=rectangle('Position',[black.archerPos2(1),black.archerPos2(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','k');
                Drawgreen2.archer(numGen2.archer,1)=rectangle('Position',[green.archerPos2(1),green.archerPos2(2),bloodInit,5],...
                    'LineStyle','none','FaceColor','g');
                archer2.posStore2=[archer2.posStore2;[archer2.Pos2,1,1]]; % ������ı���λ����ԭ�б���λ�úϲ�����һ���¾���1��ʾ����ļ�ı����غϲ����ƶ��򹥻�
                archer2.posInit2=archer2.Pos2;  % ��ʾ���غ�����ļ��������
                black.archerposStore2=[black.archerposStore2;black.archerPos2];
                bloodArcher2=[bloodArcher2;80];
                green.archerposStore2=[green.archerposStore2;green.archerPos2];
                % �����º�����ݴ�������1
                fwrite(t_client,-3,'double');  % �����ı����ݣ���������ļ
                set(gcf,'WindowButtonDownFcn',@clicktown2);  % ���ؿ�ͷ�����¼���judgem
            end
        elseif sum(judgem.rifle)>0  % �����ĳ������
            [xrifle2,~]=find(judgem.rifle==1);
            riflePos=rifle2.posStore2(xrifle2,1:2);  % �ҵ�����Ĳ�������λ�ã�xrifle��ʾ������ǳ��ϵڼ�������
            if rifle2.posStore2(xrifle2,3)==0 && rifle2.posStore2(xrifle2,4)==0  % 0��ʾ�ò������غ�û���ƶ�����Ҳû�й�����
                % �������ƶ���Χ
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
                    if isempty(intersect(whitePos2(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % �жϲ������ƶ���Χ�����Ƿ�ͳǱ��غ�
                            isempty(intersect(whitePos2(ncheck,:),overlapPos,'rows'))==0  % �жϲ������ƶ���Χ�����Ƿ�ͱ��ʿ���غ�
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos2(deleteNum,:)=[];  % ɾȥ�ͳǱ�������ʿ���غϵ��ƶ���Χ����
                numWhite2=size(whitePos2,1);
                for nw=1:numWhite2
                    Drawwhite2(nw,1)=image([whitePos2(nw,1) whitePos2(nw,1)+white.Size(2)],...
                        [whitePos2(nw,2) whitePos2(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % ���Ƴ������Ŀ��ƶ���Χ
                end
                moveType2=1;  % ��¼���ǲ������ƶ�
            end
            if rifle2.posStore2(xrifle2,4)==0  % 0��ʾ�������غ�û�й��������ƶ�����Թ���һ��
                % �����Ĺ�����Χ
                battlePos2=[];
                battlePos2(1,:)=[riflePos(1)-100,riflePos(2)-100]; battlePos2(2,:)=[riflePos(1)-100,riflePos(2)];
                battlePos2(3,:)=[riflePos(1)-100,riflePos(2)+100]; battlePos2(4,:)=[riflePos(1)+100,riflePos(2)-100];
                battlePos2(5,:)=[riflePos(1)+100,riflePos(2)]; battlePos2(6,:)=[riflePos(1)+100,riflePos(2)+100];
                battlePos2(7,:)=[riflePos(1),riflePos(2)-100]; battlePos2(8,:)=[riflePos(1),riflePos(2)+100];
                numBattle2=size(battlePos2,1);
                oppPos2=[[rifle.posStore1(:,1:2),ones(size(rifle.posStore1,1),1)];...
                    [rider.posStore1(:,1:2),ones(size(rider.posStore1,1),1)*2];...
                    [archer.posStore1(:,1:2),ones(size(archer.posStore1,1),1)*3]];  % ���2�ĵо�λ�ã������м�¼�˱���
                g=1; underAttackPos2=[]; underAttackType=[];
                for nb=1:numBattle2
                    if isempty(intersect(battlePos2(nb,:),oppPos2(:,1:2),'rows'))==0  % ���������Χ���ео�
                        Drawfocus2(nb,1)=image([battlePos2(nb,1)+20 battlePos2(nb,1)+20+focus.Size(2)],...
                            [battlePos2(nb,2)+20 battlePos2(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos2(g,:),order]=intersect(oppPos2(:,1:2),battlePos2(nb,:),'rows');  % ������Χ�ڵĵо�λ��
                        underAttackType(g,1)=oppPos2(order,3);  % ������Χ�ڵĵо�����
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos2,opptownPos2(:,1:2),'rows'))==0  % ���������Χ���е���
                    DrawfocusTown2=image([70 70+focus.Size(2)],[870 870+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown2=1;
                    ta=intersect(opptownPos2(:,1:2),battlePos2,'rows');
                    underAttackPos2(g:g+size(ta,1)-1,:)=ta;  % ���������ڹ�����Χ�ڵ�λ��
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos2=[oppPos2;opptownPos2];
                underAttackPos2=[underAttackPos2,underAttackType];
                battleType2=1;  % ��¼���ǲ����Ĺ���
                set(gcf,'WindowButtonDownFcn',@clickmove2);
            end
        elseif sum(judgem.rider)>0  % �����ĳ�����
            [xrider2,~]=find(judgem.rider==1);
            riderPos=rider2.posStore2(xrider2,1:2);  % �ҵ�������������λ�ã�xrifle��ʾ������ǳ��ϵڼ������
            if rider2.posStore2(xrider2,3)==0 && rider2.posStore2(xrider2,4)==0  % 0��ʾ��������غ�û���ƶ�����Ҳû�й�����
                % ������ƶ���Χ
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
                    if isempty(intersect(whitePos2(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % �ж�������ƶ���Χ�����Ƿ�ͳǱ��غ�
                            isempty(intersect(whitePos2(ncheck,:),overlapPos,'rows'))==0  % �ж�������ƶ���Χ�����Ƿ�ͱ�ļ���ʿ���غ�
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos2(deleteNum,:)=[];  % ɾȥ�ͳǱ�������ʿ���غϵ��ƶ���Χ����
                numWhite2=size(whitePos2,1);
                for nw=1:numWhite2
                    Drawwhite2(nw,1)=image([whitePos2(nw,1) whitePos2(nw,1)+white.Size(2)],...
                        [whitePos2(nw,2) whitePos2(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % ���Ƴ�����Ŀ��ƶ���Χ
                end
                moveType2=2;  % ��¼����������ƶ�
            end
            if rider2.posStore2(xrider2,4)==0  % 0��ʾ������غ�û�й��������ƶ�����Թ���һ��
                % ����Ĺ�����Χ
                battlePos2=[];
                battlePos2(1,:)=[riderPos(1)-100,riderPos(2)-100]; battlePos2(2,:)=[riderPos(1)-100,riderPos(2)];
                battlePos2(3,:)=[riderPos(1)-100,riderPos(2)+100]; battlePos2(4,:)=[riderPos(1)+100,riderPos(2)-100];
                battlePos2(5,:)=[riderPos(1)+100,riderPos(2)]; battlePos2(6,:)=[riderPos(1)+100,riderPos(2)+100];
                battlePos2(7,:)=[riderPos(1),riderPos(2)-100]; battlePos2(8,:)=[riderPos(1),riderPos(2)+100];
                numBattle2=size(battlePos2,1);
                oppPos2=[[rifle.posStore1(:,1:2),ones(size(rifle.posStore1,1),1)];...
                    [rider.posStore1(:,1:2),ones(size(rider.posStore1,1),1)*2];...
                    [archer.posStore1(:,1:2),ones(size(archer.posStore1,1),1)*3]];  % ���2�ĵо�λ�ã������м�¼�˱���
                g=1; underAttackPos2=[]; underAttackType=[];
                for nb=1:numBattle2
                    if isempty(intersect(battlePos2(nb,:),oppPos2(:,1:2),'rows'))==0  % ���������Χ���ео�
                        Drawfocus2(nb,1)=image([battlePos2(nb,1)+20 battlePos2(nb,1)+20+focus.Size(2)],...
                            [battlePos2(nb,2)+20 battlePos2(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos2(g,:),order]=intersect(oppPos2(:,1:2),battlePos2(nb,:),'rows');  % ������Χ�ڵĵо�λ��
                        underAttackType(g,1)=oppPos2(order,3);  % ������Χ�ڵĵо�����
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos2,opptownPos2(:,1:2),'rows'))==0  % ���������Χ���е���
                    DrawfocusTown2=image([70 70+focus.Size(2)],[870 870+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown2=1;
                    ta=intersect(opptownPos2(:,1:2),battlePos2,'rows');
                    underAttackPos2(g:g+size(ta,1)-1,:)=ta;  % ���������ڹ�����Χ�ڵ�λ��
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos2=[oppPos2;opptownPos2];
                underAttackPos2=[underAttackPos2,underAttackType];
                battleType2=2;  % ��¼��������Ĺ���
                set(gcf,'WindowButtonDownFcn',@clickmove2);
            end
        elseif sum(judgem.archer)>0  % �����ĳ��������
            [xarcher2,~]=find(judgem.archer==1);
            archerPos=archer2.posStore2(xarcher2,1:2);  % �ҵ�����Ĺ���������λ�ã�xrifle��ʾ������ǳ��ϵڼ���������
            if archer2.posStore2(xarcher2,3)==0 && archer2.posStore2(xarcher2,4)==0  % 0��ʾ�ù��������غ�û���ƶ�����Ҳû�й�����
                % ���������ƶ���Χ
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
                    if isempty(intersect(whitePos2(ncheck,:),[town1Pos;town2Pos],'rows'))==0 ||...  % �жϹ��������ƶ���Χ�����Ƿ�ͳǱ��غ�
                            isempty(intersect(whitePos2(ncheck,:),overlapPos,'rows'))==0  % �жϹ��������ƶ���Χ�����Ƿ�ͱ�ļ���ʿ���غ�
                        deleteNum(s,1)=ncheck;
                        s=s+1;
                    end
                end
                whitePos2(deleteNum,:)=[];  % ɾȥ�ͳǱ�������ʿ���غϵ��ƶ���Χ����
                numWhite2=size(whitePos2,1);
                for nw=1:numWhite2
                    Drawwhite2(nw,1)=image([whitePos2(nw,1) whitePos2(nw,1)+white.Size(2)],...
                        [whitePos2(nw,2) whitePos2(nw,2)+white.Size(1)],...
                        white.CData,'alphaData',white.AlpData);  % ���Ƴ��������Ŀ��ƶ���Χ
                end
                moveType2=3;  % ��¼���ǹ��������ƶ�
            end
            if archer2.posStore2(xarcher2,4)==0  % 0��ʾ���������غ�û�й��������ƶ�����Թ���һ��
                % �������Ĺ�����Χ
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
                    [archer.posStore1(:,1:2),ones(size(archer.posStore1,1),1)*3]];  % ���2�ĵо�λ�ã������м�¼�˱���
                g=1; underAttackPos2=[]; underAttackType=[];
                for nb=1:numBattle2
                    if isempty(intersect(battlePos2(nb,:),oppPos2(:,1:2),'rows'))==0  % ���������Χ���ео�
                        Drawfocus2(nb,1)=image([battlePos2(nb,1)+20 battlePos2(nb,1)+20+focus.Size(2)],...
                            [battlePos2(nb,2)+20 battlePos2(nb,2)+20+focus.Size(1)],...
                            focus.CData,'alphaData',focus.AlpData);
                        [underAttackPos2(g,:),order]=intersect(oppPos2(:,1:2),battlePos2(nb,:),'rows');  % ������Χ�ڵĵо�λ��
                        underAttackType(g,1)=oppPos2(order,3);  % ������Χ�ڵĵо�����
                        g=g+1;
                    end
                end
                if isempty(intersect(battlePos2,opptownPos2(:,1:2),'rows'))==0  % ���������Χ���е���
                    DrawfocusTown2=image([70 70+focus.Size(2)],[870 870+focus.Size(1)],...
                        focus.CData,'alphaData',focus.AlpData);
                    showFocusTown2=1;
                    ta=intersect(opptownPos2(:,1:2),battlePos2,'rows');
                    underAttackPos2(g:g+size(ta,1)-1,:)=ta;  % ���������ڹ�����Χ�ڵ�λ��
                    underAttackType(g:g+size(ta,1)-1,:)=ones(size(ta,1),1)*4;
                end
                oppPos2=[oppPos2;opptownPos2];
                underAttackPos2=[underAttackPos2,underAttackType];
                battleType2=3;  % ��¼���ǹ������Ĺ���
                set(gcf,'WindowButtonDownFcn',@clickmove2);
            end
        end
end
turn=1;
set(gcf,'KeyPressFcn',@key2);
end