function oppoMove1(~,~)
global t_server textresource2 resource2 numGen numGen2 bloodInit Drawrifle Drawrifle2 Drawrider Drawrider2 Drawarcher Drawarcher2...
    Drawblack Drawblack2 Drawgreen Drawgreen2 DrawredTown1 rifle rifle2 rider rider2 archer archer2 black bloodRifle1 bloodRifle2...
    bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodTown1 green battleType2 rec_player1 harm2 harmOwn2 gonnaAttack2...
    xrifle2 xrider2 xarcher2
if t_server.BytesAvailable>0  % ��ʾ���յ����1���������ָ�����
    dataRec=fread(t_server,t_server.BytesAvailable/8,'double');
    if dataRec(1)==-1  % ���յ����2��ļ������ָ��
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
    elseif dataRec(1)==-2  % ���յ����2��ļ�����ָ��
        delete(textresource2);
        resource2=resource2-25;
        resourceText2;
        numGen2.rider=numGen2.rider+1;  % numGen.rider������¼���ǳ�����ĵĵڼ������
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
    elseif dataRec(1)==-3  % ���յ����2��ļ��������ָ��
        delete(textresource2);
        resource2=resource2-25;
        resourceText2;
        numGen2.archer=numGen2.archer+1;  % numGen2.archer������¼���ǳ�����ĵĵڼ���������
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
    elseif dataRec(1)==-4  % ���յ����2�����ƶ���ָ��
        xrifle2=dataRec(2);
        gonnaMove2=[dataRec(3),dataRec(4)];
        set(Drawrifle2(xrifle2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % ˢ�²�����λ��
        set(Drawblack2.rifle(xrifle2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
        set(Drawgreen2.rifle(xrifle2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodRifle2(xrifle2,1),5]);
        rifle2.posStore2(xrifle2,1:2)=gonnaMove2;  % ���¸ò�����λ��Ϊ�ƶ����λ��
        black.rifleposStore2(xrifle2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
        green.rifleposStore2(xrifle2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
    elseif dataRec(1)==-5  % ���յ����2����ƶ���ָ��
        xrider2=dataRec(2);
        gonnaMove2=[dataRec(3),dataRec(4)];
        set(Drawrider2(xrider2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % ˢ�������λ��
        set(Drawblack2.rider(xrider2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
        set(Drawgreen2.rider(xrider2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodRider2(xrider2,1),5]);
        rider2.posStore2(xrider2,1:2)=gonnaMove2;  % ���¸������λ��Ϊ�ƶ����λ��
        black.riderposStore2(xrider2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
        green.riderposStore2(xrider2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
    elseif dataRec(1)==-6  % ���յ����2�������ƶ���ָ��
        xarcher2=dataRec(2);
        gonnaMove2=[dataRec(3),dataRec(4)];
        set(Drawarcher2(xarcher2,1),'XData',gonnaMove2(1),'YData',gonnaMove2(2));  % ˢ�¹�������λ��
        set(Drawblack2.archer(xarcher2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodInit,5]);
        set(Drawgreen2.archer(xarcher2,1),'Position',[gonnaMove2(1)+10,gonnaMove2(2)+5,bloodArcher2(xarcher2,1),5]);
        archer2.posStore2(xarcher2,1:2)=gonnaMove2;  % ���¸ù�������λ��Ϊ�ƶ����λ��
        black.archerposStore2(xarcher2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
        green.archerposStore2(xarcher2,1:2)=[gonnaMove2(1)+10,gonnaMove2(2)+5];
    elseif dataRec(1)==-7  % ���յ����2��������������ָ��
        battleType2=1;  % �ǲ������𹥻�
        xrifle2=dataRec(2);  % ���2�ĵڼ�����������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1���������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ�������������
        harm2=dataRec(7);  % ���2���������1������ɵ��˺�
        harmOwn2=dataRec(5);  % ���2�����ܵ��ķ����˺�
        blood=bloodRifle1(ordg,1);  % ȷ���ܵ����������1��������ʼѪ��
        bloodRifle1(ordg,1)=blood-harm2;  % �����ܵ����������1������Ѫ��
        harmText2;
        % �����ܵ����������1������Ϣ
        if bloodRifle1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % ������ʼ80Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
            delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
            delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
            rifle.posStore1(ordg,:)=[]; black.rifleposStore1(ordg,:)=[]; green.rifleposStore1(ordg,:)=[]; bloodRifle1(ordg,:)=[];
            numGen.rifle=numGen.rifle-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2������Ϣ
        bloodOwn=bloodRifle2(xrifle2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRifle2(xrifle2,1)=bloodOwn-harmOwn2;  % �������2����Ѫ��
        if bloodRifle2(xrifle2,1)>0  % �ܷ�����������û����
            set(Drawgreen2.rifle(xrifle2,1),'Position',[rifle2.posStore2(xrifle2,1)+10,rifle2.posStore2(xrifle2,2)+5,bloodOwn-harmOwn2,5]);
        else
            delete(Drawrifle2(xrifle2,1)); Drawrifle2(xrifle2,:)=[];
            delete(Drawblack2.rifle(xrifle2,1)); Drawblack2.rifle(xrifle2,:)=[];
            delete(Drawgreen2.rifle(xrifle2,1)); Drawgreen2.rifle(xrifle2,:)=[];
            rifle2.posStore2(xrifle2,:)=[]; black.rifleposStore2(xrifle2,:)=[]; green.rifleposStore2(xrifle2,:)=[]; bloodRifle2(xrifle2,:)=[];
            numGen2.rifle=numGen2.rifle-1;
        end
    elseif dataRec(1)==-8  % ���յ����2�������������ָ��
        battleType2=1;  % �ǲ������𹥻�
        xrifle2=dataRec(2);  % ���2�ĵڼ�����������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1��������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ������������
        harm2=dataRec(7);  % ���2���������1�����ɵ��˺�
        harmOwn2=dataRec(5);  % ���2�����ܵ��ķ����˺�
        blood=bloodRider1(ordg,1);  % ȷ���ܵ����������1�������ʼѪ��
        bloodRider1(ordg,1)=blood-80/65*harm2;  % �����ܵ����������1������Ѫ��
        harmText2;
        % �����ܵ����������1�����Ϣ
        if bloodRider1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % �����ʼ65Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
            delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
            delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
            rider.posStore1(ordg,:)=[]; black.riderposStore1(ordg,:)=[]; green.riderposStore1(ordg,:)=[]; bloodRider1(ordg,:)=[];
            numGen.rider=numGen.rider-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2������Ϣ
        bloodOwn=bloodRifle2(xrifle2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRifle2(xrifle2,1)=bloodOwn-harmOwn2;  % �������2����Ѫ��
        if bloodRifle2(xrifle2,1)>0  % �ܷ�����������û����
            set(Drawgreen2.rifle(xrifle2,1),'Position',[rifle2.posStore2(xrifle2,1)+10,rifle2.posStore2(xrifle2,2)+5,bloodOwn-harmOwn2,5]);
        else
            delete(Drawrifle2(xrifle2,1)); Drawrifle2(xrifle2,:)=[];
            delete(Drawblack2.rifle(xrifle2,1)); Drawblack2.rifle(xrifle2,:)=[];
            delete(Drawgreen2.rifle(xrifle2,1)); Drawgreen2.rifle(xrifle2,:)=[];
            rifle2.posStore2(xrifle2,:)=[]; black.rifleposStore2(xrifle2,:)=[]; green.rifleposStore2(xrifle2,:)=[]; bloodRifle2(xrifle2,:)=[];
            numGen2.rifle=numGen2.rifle-1;
        end
    elseif dataRec(1)==-9  % ���յ����2����������������ָ��
        battleType2=1;  % �ǲ������𹥻�
        xrifle2=dataRec(2);  % ���2�ĵڼ�����������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1�����������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ���������������
        harm2=dataRec(7);  % ���2���������1��������ɵ��˺�
        harmOwn2=dataRec(5);  % ���2�����ܵ��ķ����˺�
        blood=bloodArcher1(ordg,1);  % ȷ���ܵ����������1����������ʼѪ��
        bloodArcher1(ordg,1)=blood-80/55*harm2;  % �����ܵ����������1��������Ѫ��
        harmText2;
        % �����ܵ����������1��������Ϣ
        if bloodArcher1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % ��������ʼ55Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
            delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
            delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
            archer.posStore1(ordg,:)=[]; black.archerposStore1(ordg,:)=[]; green.archerposStore1(ordg,:)=[]; bloodArcher1(ordg,:)=[];
            numGen.archer=numGen.archer-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2������Ϣ
        bloodOwn=bloodRifle2(xrifle2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRifle2(xrifle2,1)=bloodOwn-harmOwn2;  % �������2����Ѫ��
        if bloodRifle2(xrifle2,1)>0  % �ܷ�����������û����
            set(Drawgreen2.rifle(xrifle2,1),'Position',[rifle2.posStore2(xrifle2,1)+10,rifle2.posStore2(xrifle2,2)+5,bloodOwn-harmOwn2,5]);
        else
            delete(Drawrifle2(xrifle2,1)); Drawrifle2(xrifle2,:)=[];
            delete(Drawblack2.rifle(xrifle2,1)); Drawblack2.rifle(xrifle2,:)=[];
            delete(Drawgreen2.rifle(xrifle2,1)); Drawgreen2.rifle(xrifle2,:)=[];
            rifle2.posStore2(xrifle2,:)=[]; black.rifleposStore2(xrifle2,:)=[]; green.rifleposStore2(xrifle2,:)=[]; bloodRifle2(xrifle2,:)=[];
            numGen2.rifle=numGen2.rifle-1;
        end
    elseif dataRec(1)==-10  % ���յ����2��������������ָ��
        harm2=dataRec(2);  % ���2���������1������ɵ��˺�
        blood=bloodTown1;
        bloodTown1=blood-harm2;
        harmTextTown2;
        % �����ܵ����������1������Ϣ
        if bloodTown1>0
            set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
        else
            delete(DrawredTown1);
        end
    elseif dataRec(1)==-11  % ���յ����2�������������ָ��
        battleType2=2;  % ��������𹥻�
        xrider2=dataRec(2);  % ���2�ĵڼ����������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1���������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ�������������
        harm2=dataRec(7);  % ���2��������1������ɵ��˺�
        harmOwn2=dataRec(5);  % ���2����ܵ��ķ����˺�
        blood=bloodRifle1(ordg,1);  % ȷ���ܵ����������1��������ʼѪ��
        bloodRifle1(ordg,1)=blood-harm2;  % �����ܵ����������1������Ѫ��
        harmText2;
        % �����ܵ����������1������Ϣ
        if bloodRifle1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % ������ʼ80Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
            delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
            delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
            rifle.posStore1(ordg,:)=[]; black.rifleposStore1(ordg,:)=[]; green.rifleposStore1(ordg,:)=[]; bloodRifle1(ordg,:)=[];
            numGen.rifle=numGen.rifle-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2�����Ϣ
        bloodOwn=bloodRider2(xrider2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRider2(xrider2,1)=bloodOwn-80/65*harmOwn2;  % �������2���Ѫ��
        if bloodRider2(xrider2,1)>0  % �ܷ����������û����
            set(Drawgreen2.rider(xrider2,1),'Position',[rider2.posStore2(xrider2,1)+10,rider2.posStore2(xrider2,2)+5,bloodOwn-80/65*harmOwn2,5]);
        else
            delete(Drawrider2(xrider2,1)); Drawrider2(xrider2,:)=[];
            delete(Drawblack2.rider(xrider2,1)); Drawblack2.rider(xrider2,:)=[];
            delete(Drawgreen2.rider(xrider2,1)); Drawgreen2.rider(xrider2,:)=[];
            rider2.posStore2(xrider2,:)=[]; black.riderposStore2(xrider2,:)=[]; green.riderposStore2(xrider2,:)=[]; bloodRider2(xrider2,:)=[];
            numGen2.rider=numGen2.rider-1;
        end
    elseif dataRec(1)==-12  % ���յ����2������������ָ��
        battleType2=2;  % ��������𹥻�
        xrider2=dataRec(2);  % ���2�ĵڼ����������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1��������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ������������
        harm2=dataRec(7);  % ���2��������1�����ɵ��˺�
        harmOwn2=dataRec(5);  % ���2����ܵ��ķ����˺�
        blood=bloodRider1(ordg,1);  % ȷ���ܵ����������1�������ʼѪ��
        bloodRider1(ordg,1)=blood-80/65*harm2;  % �����ܵ����������1�����Ѫ��
        harmText2;
        % �����ܵ����������1�����Ϣ
        if bloodRider1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % �����ʼ65Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
            delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
            delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
            rider.posStore1(ordg,:)=[]; black.riderposStore1(ordg,:)=[]; green.riderposStore1(ordg,:)=[]; bloodRider1(ordg,:)=[];
            numGen.rider=numGen.rider-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2�����Ϣ
        bloodOwn=bloodRider2(xrider2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRider2(xrider2,1)=bloodOwn-80/65*harmOwn2;  % �������2���Ѫ��
        if bloodRider2(xrider2,1)>0  % �ܷ����������û����
            set(Drawgreen2.rider(xrider2,1),'Position',[rider2.posStore2(xrider2,1)+10,rider2.posStore2(xrider2,2)+5,bloodOwn-80/65*harmOwn2,5]);
        else
            delete(Drawrider2(xrider2,1)); Drawrider2(xrider2,:)=[];
            delete(Drawblack2.rider(xrider2,1)); Drawblack2.rider(xrider2,:)=[];
            delete(Drawgreen2.rider(xrider2,1)); Drawgreen2.rider(xrider2,:)=[];
            rider2.posStore2(xrider2,:)=[]; black.riderposStore2(xrider2,:)=[]; green.riderposStore2(xrider2,:)=[]; bloodRider2(xrider2,:)=[];
            numGen2.rider=numGen2.rider-1;
        end
    elseif dataRec(1)==-13  % ���յ����2���������������ָ��
        battleType2=2;  % ��������𹥻�
        xrider2=dataRec(2);  % ���2�ĵڼ����������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1�����������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ���������������
        harm2=dataRec(7);  % ���2��������1��������ɵ��˺�
        harmOwn2=dataRec(5);  % ���2����ܵ��ķ����˺�
        blood=bloodArcher1(ordg,1);  % ȷ���ܵ����������1����������ʼѪ��
        bloodArcher1(ordg,1)=blood-80/55*harm2;  % �����ܵ����������1��������Ѫ��
        harmText2;
        % �����ܵ����������1��������Ϣ
        if bloodArcher1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % ��������ʼ55Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
            delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
            delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
            archer.posStore1(ordg,:)=[]; black.archerposStore1(ordg,:)=[]; green.archerposStore1(ordg,:)=[]; bloodArcher1(ordg,:)=[];
            numGen.archer=numGen.archer-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2�����Ϣ
        bloodOwn=bloodRider2(xrider2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodRider2(xrider2,1)=bloodOwn-80/65*harmOwn2;  % �������2���Ѫ��
        if bloodRider2(xrider2,1)>0  % �ܷ����������û����
            set(Drawgreen2.rider(xrider2,1),'Position',[rider2.posStore2(xrider2,1)+10,rider2.posStore2(xrider2,2)+5,bloodOwn-80/65*harmOwn2,5]);
        else
            delete(Drawrider2(xrider2,1)); Drawrider2(xrider2,:)=[];
            delete(Drawblack2.rider(xrider2,1)); Drawblack2.rider(xrider2,:)=[];
            delete(Drawgreen2.rider(xrider2,1)); Drawgreen2.rider(xrider2,:)=[];
            rider2.posStore2(xrider2,:)=[]; black.riderposStore2(xrider2,:)=[]; green.riderposStore2(xrider2,:)=[]; bloodRider2(xrider2,:)=[];
            numGen2.rider=numGen2.rider-1;
        end
    elseif dataRec(1)==-14  % ���յ����2�������������ָ��
        harm2=dataRec(2);  % ���2��������1������ɵ��˺�
        blood=bloodTown1;
        bloodTown1=blood-harm2;
        harmTextTown2;
        % �����ܵ����������1������Ϣ
        if bloodTown1>0
            set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
        else
            delete(DrawredTown1);
        end
    elseif dataRec(1)==-15  % ���յ����2����������������ָ��
        battleType2=3;  % �ǹ��������𹥻�
        xarcher2=dataRec(2);  % ���2�ĵڼ�������������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1���������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ�������������
        harm2=dataRec(7);  % ���2�����������1������ɵ��˺�
        harmOwn2=dataRec(5);  % ���2�������ܵ��ķ����˺�
        blood=bloodRifle1(ordg,1);  % ȷ���ܵ����������1��������ʼѪ��
        bloodRifle1(ordg,1)=blood-harm2;  % �����ܵ����������1������Ѫ��
        harmText2;
        % �����ܵ����������1������Ϣ
        if bloodRifle1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.rifle(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-harm2,5]);  % ������ʼ80Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrifle(ordg,1)); Drawrifle(ordg,:)=[];
            delete(Drawblack.rifle(ordg,1)); Drawblack.rifle(ordg,:)=[];
            delete(Drawgreen.rifle(ordg,1)); Drawgreen.rifle(ordg,:)=[];
            rifle.posStore1(ordg,:)=[]; black.rifleposStore1(ordg,:)=[]; green.rifleposStore1(ordg,:)=[]; bloodRifle1(ordg,:)=[];
            numGen.rifle=numGen.rifle-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2��������Ϣ
        bloodOwn=bloodArcher2(xarcher2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodArcher2(xarcher2,1)=bloodOwn-80/55*harmOwn2;  % ���¼���������Ѫ��
        if bloodArcher2(xarcher2,1)>0  % �ܷ�������������û����
            set(Drawgreen2.archer(xarcher2,1),'Position',[archer2.posStore2(xarcher2,1)+10,archer2.posStore2(xarcher2,2)+5,bloodOwn-80/55*harmOwn2,5]);
            archer2.posStore2(xarcher2,4)=1;  % �������ʿ�����غ��޷��ٹ������ƶ�
        else
            delete(Drawarcher2(xarcher2,1)); Drawarcher2(xarcher2,:)=[];
            delete(Drawblack2.archer(xarcher2,1)); Drawblack2.archer(xarcher2,:)=[];
            delete(Drawgreen2.archer(xarcher2,1)); Drawgreen2.archer(xarcher2,:)=[];
            archer2.posStore2(xarcher2,:)=[]; black.archerposStore2(xarcher2,:)=[]; green.archerposStore2(xarcher2,:)=[]; bloodArcher2(xarcher2,:)=[];
            numGen2.archer=numGen2.archer-1;
        end
    elseif dataRec(1)==-16  % ���յ����2���������������ָ��
        battleType2=3;  % �ǹ��������𹥻�
        xarcher2=dataRec(2);  % ���2�ĵڼ�������������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1��������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ������������
        harm2=dataRec(7);  % ���2�����������1�����ɵ��˺�
        harmOwn2=dataRec(5);  % ���2�������ܵ��ķ����˺�
        blood=bloodRider1(ordg,1);  % ȷ���ܵ����������1�������ʼѪ��
        bloodRider1(ordg,1)=blood-80/65*harm2;  % �����ܵ����������1�����Ѫ��
        harmText2;
        % �����ܵ����������1�����Ϣ
        if bloodRider1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.rider(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/65*harm2,5]);  % �����ʼ65Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrider(ordg,1)); Drawrider(ordg,:)=[];
            delete(Drawblack.rider(ordg,1)); Drawblack.rider(ordg,:)=[];
            delete(Drawgreen.rider(ordg,1)); Drawgreen.rider(ordg,:)=[];
            rider.posStore1(ordg,:)=[]; black.riderposStore1(ordg,:)=[]; green.riderposStore1(ordg,:)=[]; bloodRider1(ordg,:)=[];
            numGen.rider=numGen.rider-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2��������Ϣ
        bloodOwn=bloodArcher2(xarcher2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodArcher2(xarcher2,1)=bloodOwn-80/55*harmOwn2;  % ���¼���������Ѫ��
        if bloodArcher2(xarcher2,1)>0  % �ܷ�������������û����
            set(Drawgreen2.archer(xarcher2,1),'Position',[archer2.posStore2(xarcher2,1)+10,archer2.posStore2(xarcher2,2)+5,bloodOwn-80/55*harmOwn2,5]);
            archer2.posStore2(xarcher2,4)=1;  % �������ʿ�����غ��޷��ٹ������ƶ�
        else
            delete(Drawarcher2(xarcher2,1)); Drawarcher2(xarcher2,:)=[];
            delete(Drawblack2.archer(xarcher2,1)); Drawblack2.archer(xarcher2,:)=[];
            delete(Drawgreen2.archer(xarcher2,1)); Drawgreen2.archer(xarcher2,:)=[];
            archer2.posStore2(xarcher2,:)=[]; black.archerposStore2(xarcher2,:)=[]; green.archerposStore2(xarcher2,:)=[]; bloodArcher2(xarcher2,:)=[];
            numGen2.archer=numGen2.archer-1;
        end
    elseif dataRec(1)==-17  % ���յ����2������������������ָ��
        battleType2=3;  % �ǹ��������𹥻�
        xarcher2=dataRec(2);  % ���2�ĵڼ�������������
        gonnaAttack2=[dataRec(3),dataRec(4)];  % ���1�����������������ĸ���
        ordg=dataRec(6);  % ���1�ĵڼ���������������
        harm2=dataRec(7);  % ���2�����������1��������ɵ��˺�
        harmOwn2=dataRec(5);  % ���2�������ܵ��ķ����˺�
        blood=bloodArcher1(ordg,1);  % ȷ���ܵ����������1����������ʼѪ��
        bloodArcher1(ordg,1)=blood-80/55*harm2;  % �����ܵ����������1��������Ѫ��
        harmText2;
        % �����ܵ����������1��������Ϣ
        if bloodArcher1(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen.archer(ordg,1),'Position',[gonnaAttack2(1)+10,gonnaAttack2(2)+5,blood-80/55*harm2,5]);  % ��������ʼ55Ѫ
        else
            harmOwn2=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawarcher(ordg,1)); Drawarcher(ordg,:)=[];
            delete(Drawblack.archer(ordg,1)); Drawblack.archer(ordg,:)=[];
            delete(Drawgreen.archer(ordg,1)); Drawgreen.archer(ordg,:)=[];
            archer.posStore1(ordg,:)=[]; black.archerposStore1(ordg,:)=[]; green.archerposStore1(ordg,:)=[]; bloodArcher1(ordg,:)=[];
            numGen.archer=numGen.archer-1;
            delete(textresource2);
            resource2=resource2+10; resourceText2;
        end
        % ���·��𹥻������2��������Ϣ
        bloodOwn=bloodArcher2(xarcher2,1);  % ȷ���Լ���Ѫ��
        if harmOwn2~=0
            pause(0.2); harmTextOwn2;
        end
        bloodArcher2(xarcher2,1)=bloodOwn-80/55*harmOwn2;  % ���¼���������Ѫ��
        if bloodArcher2(xarcher2,1)>0  % �ܷ�������������û����
            set(Drawgreen2.archer(xarcher2,1),'Position',[archer2.posStore2(xarcher2,1)+10,archer2.posStore2(xarcher2,2)+5,bloodOwn-80/55*harmOwn2,5]);
            archer2.posStore2(xarcher2,4)=1;  % �������ʿ�����غ��޷��ٹ������ƶ�
        else
            delete(Drawarcher2(xarcher2,1)); Drawarcher2(xarcher2,:)=[];
            delete(Drawblack2.archer(xarcher2,1)); Drawblack2.archer(xarcher2,:)=[];
            delete(Drawgreen2.archer(xarcher2,1)); Drawgreen2.archer(xarcher2,:)=[];
            archer2.posStore2(xarcher2,:)=[]; black.archerposStore2(xarcher2,:)=[]; green.archerposStore2(xarcher2,:)=[]; bloodArcher2(xarcher2,:)=[];
            numGen2.archer=numGen2.archer-1;
        end
    elseif dataRec(1)==-18  % ���յ����2����������������ָ��
        harm2=dataRec(2);  % ���2�����������1������ɵ��˺�
        blood=bloodTown1;
        bloodTown1=blood-harm2;
        harmTextTown2;
        % �����ܵ����������1������Ϣ
        if bloodTown1>0
            set(DrawredTown1,'Position',[20,803,blood-harm2,3.5]);
        else
            delete(DrawredTown1);
        end
    elseif dataRec(1)==-19  % ���յ����2�غϽ�����ָ��
        resource2=resource2+5;
        delete(textresource2);
        resourceText2;
        delete(rec_player1);
        questdlg('��Ļغ�','�غ�','ȷ��','ȷ��');
        set(gcf,'WindowButtonDownFcn',@clicktown1);  % ��������
    elseif dataRec(1)==-20  % ���ܵ����2Ͷ����ָ��
        buttonEnd=questdlg('���һ��ʤ��','��Ϸ����','���¿�ʼ','������ҳ','���¿�ʼ');
        if strcmp(buttonEnd,'���¿�ʼ')
            clf;
            chessWarRestart1;
        else
            delete(rec_player1);
            gui2;
        end
    end
end
if bloodTown1<=0
    buttonEnd=questdlg('��Ҷ���ʤ��','��Ϸ����','���¿�ʼ','������ҳ','���¿�ʼ');
    if strcmp(buttonEnd,'���¿�ʼ')
        clf;
        chessWarRestart1;
    else
        delete(rec_player1);
        gui2;
    end
end
end