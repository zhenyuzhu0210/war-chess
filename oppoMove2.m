function oppoMove2(~,~)
global t_client textresource1 resource1 numGen numGen2 bloodInit Drawrifle Drawrifle2 Drawrider Drawrider2 Drawarcher Drawarcher2...
    Drawblack Drawblack2 Drawgreen Drawgreen2 DrawredTown2 rifle rifle2 rider rider2 archer archer2 black bloodRifle1 bloodRifle2...
    bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodTown2 green battleType rec_player2 harm harmOwn gonnaAttack...
    xrifle xrider xarcher
if t_client.BytesAvailable>0  % ��ʾ���յ����1���������ָ�����
    dataRec=fread(t_client,t_client.BytesAvailable/8,'double');
    if dataRec(1)==-1  % ���յ����1��ļ������ָ��
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
    elseif dataRec(1)==-2  % ���յ����1��ļ�����ָ��
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
    elseif dataRec(1)==-3  % ���յ����1��ļ��������ָ��
        delete(textresource1);
        resource1=resource1-25;
        resourceText1;
        numGen.archer=numGen.archer+1;  % numGen.archer������¼���ǳ�����ĵĵڼ���������
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
    elseif dataRec(1)==-4  % ���յ����1�����ƶ���ָ��
        xrifle=dataRec(2);
        gonnaMove=[dataRec(3),dataRec(4)];
        set(Drawrifle(xrifle,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % ˢ�²�����λ��
        set(Drawblack.rifle(xrifle,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
        set(Drawgreen.rifle(xrifle,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodRifle1(xrifle,1),5]);
        rifle.posStore1(xrifle,1:2)=gonnaMove;  % ���¸ò�����λ��Ϊ�ƶ����λ��
        black.rifleposStore1(xrifle,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
        green.rifleposStore1(xrifle,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
    elseif dataRec(1)==-5  % ���յ����1����ƶ���ָ��
        xrider=dataRec(2);
        gonnaMove=[dataRec(3),dataRec(4)];
        set(Drawrider(xrider,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % ˢ�������λ��
        set(Drawblack.rider(xrider,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
        set(Drawgreen.rider(xrider,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodRider1(xrider,1),5]);
        rider.posStore1(xrider,1:2)=gonnaMove;  % ���¸������λ��Ϊ�ƶ����λ��
        black.riderposStore1(xrider,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
        green.riderposStore1(xrider,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
    elseif dataRec(1)==-6  % ���յ����1�������ƶ���ָ��
        xarcher=dataRec(2);
        gonnaMove=[dataRec(3),dataRec(4)];
        set(Drawarcher(xarcher,1),'XData',gonnaMove(1),'YData',gonnaMove(2));  % ˢ�¹�������λ��
        set(Drawblack.archer(xarcher,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodInit,5]);
        set(Drawgreen.archer(xarcher,1),'Position',[gonnaMove(1)+10,gonnaMove(2)+5,bloodArcher1(xarcher,1),5]);
        archer.posStore1(xarcher,1:2)=gonnaMove;  % ���¸ù�������λ��Ϊ�ƶ����λ��
        black.archerposStore1(xarcher,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
        green.archerposStore1(xarcher,1:2)=[gonnaMove(1)+10,gonnaMove(2)+5];
    elseif dataRec(1)==-7  % ���յ����1��������������ָ��
        battleType=1;  % �ǲ������𹥻�
        xrifle=dataRec(2);  % ���1�ĵڼ�����������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2���������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ�������������
        harm=dataRec(7);  % ���1���������2������ɵ��˺�
        harmOwn=dataRec(5);  % ���1�����ܵ��ķ����˺�
        blood=bloodRifle2(ordg,1);  % ȷ���ܵ����������2��������ʼѪ��
        bloodRifle2(ordg,1)=blood-harm;  % �����ܵ����������2������Ѫ��
        harmText;
        % �����ܵ����������2������Ϣ
        if bloodRifle2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
            delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
            delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
            rifle2.posStore2(ordg,:)=[]; black.rifleposStore2(ordg,:)=[]; green.rifleposStore2(ordg,:)=[]; bloodRifle2(ordg,:)=[];
            numGen2.rifle=numGen2.rifle-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1������Ϣ
        bloodOwn=bloodRifle1(xrifle,1);  % ���1�����ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRifle1(xrifle,1)=bloodOwn-harmOwn;  % �������1����Ѫ��
        if bloodRifle1(xrifle,1)>0  % �ܷ�����������û����
            set(Drawgreen.rifle(xrifle,1),'Position',[rifle.posStore1(xrifle,1)+10,rifle.posStore1(xrifle,2)+5,bloodOwn-harmOwn,5]);
        else
            delete(Drawrifle(xrifle,1)); Drawrifle(xrifle,:)=[];
            delete(Drawblack.rifle(xrifle,1)); Drawblack.rifle(xrifle,:)=[];
            delete(Drawgreen.rifle(xrifle,1)); Drawgreen.rifle(xrifle,:)=[];
            rifle.posStore1(xrifle,:)=[]; black.rifleposStore1(xrifle,:)=[]; green.rifleposStore1(xrifle,:)=[]; bloodRifle1(xrifle,:)=[];
            numGen.rifle=numGen.rifle-1;
        end
    elseif dataRec(1)==-8  % ���յ����1�������������ָ��
        battleType=1;  % �ǲ������𹥻�
        xrifle=dataRec(2);  % ���1�ĵڼ�����������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2��������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ������������
        harm=dataRec(7);  % ���1���������2�����ɵ��˺�
        harmOwn=dataRec(5);  % ���1�����ܵ��ķ����˺�
        blood=bloodRider2(ordg,1);  % ȷ���ܵ����������2�������ʼѪ��
        bloodRider2(ordg,1)=blood-80/65*harm;  % �����ܵ����������2�����Ѫ��
        harmText;
        % �����ܵ����������2�����Ϣ
        if bloodRider2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % �����ʼ65Ѫ
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
            delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
            delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
            rider2.posStore2(ordg,:)=[]; black.riderposStore2(ordg,:)=[]; green.riderposStore2(ordg,:)=[]; bloodRider2(ordg,:)=[];
            numGen2.rider=numGen2.rider-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1������Ϣ
        bloodOwn=bloodRifle1(xrifle,1);  % ���1�����ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRifle1(xrifle,1)=bloodOwn-harmOwn;  % �������1����Ѫ��
        if bloodRifle1(xrifle,1)>0  % �ܷ�����������û����
            set(Drawgreen.rifle(xrifle,1),'Position',[rifle.posStore1(xrifle,1)+10,rifle.posStore1(xrifle,2)+5,bloodOwn-harmOwn,5]);
        else
            delete(Drawrifle(xrifle,1)); Drawrifle(xrifle,:)=[];
            delete(Drawblack.rifle(xrifle,1)); Drawblack.rifle(xrifle,:)=[];
            delete(Drawgreen.rifle(xrifle,1)); Drawgreen.rifle(xrifle,:)=[];
            rifle.posStore1(xrifle,:)=[]; black.rifleposStore1(xrifle,:)=[]; green.rifleposStore1(xrifle,:)=[]; bloodRifle1(xrifle,:)=[];
            numGen.rifle=numGen.rifle-1;
        end
    elseif dataRec(1)==-9  % ���յ����1����������������ָ��
        battleType=1;  % �ǲ������𹥻�
        xrifle=dataRec(2);  % ���1�ĵڼ�����������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2���������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ���������������
        harm=dataRec(7);  % ���1���������2��������ɵ��˺�
        harmOwn=dataRec(5);  % ���1�����ܵ��ķ����˺�
        blood=bloodArcher2(ordg,1);  % ȷ���ܵ����������2����������ʼѪ��
        bloodArcher2(ordg,1)=blood-80/55*harm;  % �����ܵ����������2��������Ѫ��
        harmText;
        % �����ܵ����������2��������Ϣ
        if bloodArcher2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % ��������ʼ55Ѫ
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
            delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
            delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
            archer2.posStore2(ordg,:)=[]; black.archerposStore2(ordg,:)=[]; green.archerposStore2(ordg,:)=[]; bloodArcher2(ordg,:)=[];
            numGen2.archer=numGen2.archer-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1������Ϣ
        bloodOwn=bloodRifle1(xrifle,1);  % ���1�����ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRifle1(xrifle,1)=bloodOwn-harmOwn;  % �������1����Ѫ��
        if bloodRifle1(xrifle,1)>0  % �ܷ�����������û����
            set(Drawgreen.rifle(xrifle,1),'Position',[rifle.posStore1(xrifle,1)+10,rifle.posStore1(xrifle,2)+5,bloodOwn-harmOwn,5]);
        else
            delete(Drawrifle(xrifle,1)); Drawrifle(xrifle,:)=[];
            delete(Drawblack.rifle(xrifle,1)); Drawblack.rifle(xrifle,:)=[];
            delete(Drawgreen.rifle(xrifle,1)); Drawgreen.rifle(xrifle,:)=[];
            rifle.posStore1(xrifle,:)=[]; black.rifleposStore1(xrifle,:)=[]; green.rifleposStore1(xrifle,:)=[]; bloodRifle1(xrifle,:)=[];
            numGen.rifle=numGen.rifle-1;
        end
    elseif dataRec(1)==-10  % ���յ����1��������������ָ��
        harm=dataRec(2);  % ���1���������2������ɵ��˺�
        blood=bloodTown2;
        bloodTown2=blood-harm;
        harmTextTown1;
        % �����ܵ����������2������Ϣ
        if bloodTown2>0
            set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
        else
            delete(DrawredTown2);
        end
    elseif dataRec(1)==-11  % ���յ����1�������������ָ��
        battleType=2;  % ��������𹥻�
        xrider=dataRec(2);  % ���1�ĵڼ����������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2���������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ�������������
        harm=dataRec(7);  % ���1��������2������ɵ��˺�
        harmOwn=dataRec(5);  % ���1����ܵ��ķ����˺�
        blood=bloodRifle2(ordg,1);  % ȷ���ܵ����������2��������ʼѪ��
        bloodRifle2(ordg,1)=blood-harm;  % �����ܵ����������2������Ѫ��
        harmText;
        % �����ܵ����������2������Ϣ
        if bloodRifle2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
            delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
            delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
            rifle2.posStore2(ordg,:)=[]; black.rifleposStore2(ordg,:)=[]; green.rifleposStore2(ordg,:)=[]; bloodRifle2(ordg,:)=[];
            numGen2.rifle=numGen2.rifle-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1�����Ϣ
        bloodOwn=bloodRider1(xrider,1);  % ���1����ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRider1(xrider,1)=bloodOwn-80/65*harmOwn;  % �������1���Ѫ��
        if bloodRider1(xrider,1)>0  % �ܷ����������û����
            set(Drawgreen.rider(xrider,1),'Position',[rider.posStore1(xrider,1)+10,rider.posStore1(xrider,2)+5,bloodOwn-80/65*harmOwn,5]);
        else
            delete(Drawrider(xrider,1)); Drawrider(xrider,:)=[];
            delete(Drawblack.rider(xrider,1)); Drawblack.rider(xrider,:)=[];
            delete(Drawgreen.rider(xrider,1)); Drawgreen.rider(xrider,:)=[];
            rider.posStore1(xrider,:)=[]; black.riderposStore1(xrider,:)=[]; green.riderposStore1(xrider,:)=[]; bloodRider1(xrider,:)=[];
            numGen.rider=numGen.rider-1;
        end
    elseif dataRec(1)==-12  % ���յ����1������������ָ��
        battleType=2;  % ��������𹥻�
        xrider=dataRec(2);  % ���1�ĵڼ����������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2��������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ������������
        harm=dataRec(7);  % ���1��������2�����ɵ��˺�
        harmOwn=dataRec(5);  % ���1����ܵ��ķ����˺�
        blood=bloodRider2(ordg,1);  % ȷ���ܵ����������2�������ʼѪ��
        bloodRider2(ordg,1)=blood-80/65*harm;  % �����ܵ����������2�����Ѫ��
        harmText;
        % �����ܵ����������2�����Ϣ
        if bloodRider2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % �����ʼ65Ѫ
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
            delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
            delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
            rider2.posStore2(ordg,:)=[]; black.riderposStore2(ordg,:)=[]; green.riderposStore2(ordg,:)=[]; bloodRider2(ordg,:)=[];
            numGen2.rider=numGen2.rider-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1�����Ϣ
        bloodOwn=bloodRider1(xrider,1);  % ���1����ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRider1(xrider,1)=bloodOwn-80/65*harmOwn;  % �������1���Ѫ��
        if bloodRider1(xrider,1)>0  % �ܷ����������û����
            set(Drawgreen.rider(xrider,1),'Position',[rider.posStore1(xrider,1)+10,rider.posStore1(xrider,2)+5,bloodOwn-80/65*harmOwn,5]);
        else
            delete(Drawrider(xrider,1)); Drawrider(xrider,:)=[];
            delete(Drawblack.rider(xrider,1)); Drawblack.rider(xrider,:)=[];
            delete(Drawgreen.rider(xrider,1)); Drawgreen.rider(xrider,:)=[];
            rider.posStore1(xrider,:)=[]; black.riderposStore1(xrider,:)=[]; green.riderposStore1(xrider,:)=[]; bloodRider1(xrider,:)=[];
            numGen.rider=numGen.rider-1;
        end
    elseif dataRec(1)==-13  % ���յ����1���������������ָ��
        battleType=2;  % ��������𹥻�
        xrider=dataRec(2);  % ���1�ĵڼ����������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2���������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ���������������
        harm=dataRec(7);  % ���1��������2��������ɵ��˺�
        harmOwn=dataRec(5);  % ���1����ܵ��ķ����˺�
        blood=bloodArcher2(ordg,1);  % ȷ���ܵ����������2����������ʼѪ��
        bloodArcher2(ordg,1)=blood-80/55*harm;  % �����ܵ����������2��������Ѫ��
        harmText;
        % �����ܵ����������2��������Ϣ
        if bloodArcher2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % ��������ʼ55Ѫ
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
            delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
            delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
            archer2.posStore2(ordg,:)=[]; black.archerposStore2(ordg,:)=[]; green.archerposStore2(ordg,:)=[]; bloodArcher2(ordg,:)=[];
            numGen2.archer=numGen2.archer-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1�����Ϣ
        bloodOwn=bloodRider1(xrider,1);  % ���1����ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodRider1(xrider,1)=bloodOwn-80/65*harmOwn;  % �������1���Ѫ��
        if bloodRider1(xrider,1)>0  % �ܷ����������û����
            set(Drawgreen.rider(xrider,1),'Position',[rider.posStore1(xrider,1)+10,rider.posStore1(xrider,2)+5,bloodOwn-80/65*harmOwn,5]);
        else
            delete(Drawrider(xrider,1)); Drawrider(xrider,:)=[];
            delete(Drawblack.rider(xrider,1)); Drawblack.rider(xrider,:)=[];
            delete(Drawgreen.rider(xrider,1)); Drawgreen.rider(xrider,:)=[];
            rider.posStore1(xrider,:)=[]; black.riderposStore1(xrider,:)=[]; green.riderposStore1(xrider,:)=[]; bloodRider1(xrider,:)=[];
            numGen.rider=numGen.rider-1;
        end
    elseif dataRec(1)==-14  % ���յ����1�������������ָ��
        harm=dataRec(2);  % ���1��������2������ɵ��˺�
        blood=bloodTown2;
        bloodTown2=blood-harm;
        harmTextTown1;
        % �����ܵ����������2������Ϣ
        if bloodTown2>0
            set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
        else
            delete(DrawredTown2);
        end
    elseif dataRec(1)==-15  % ���յ����1����������������ָ��
        battleType=3;  % �ǹ��������𹥻�
        xarcher=dataRec(2);  % ���1�ĵڼ�������������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2���������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ�������������
        harm=dataRec(7);  % ���1�����������2������ɵ��˺�
        harmOwn=dataRec(5);  % ���1�������ܵ��ķ����˺�
        blood=bloodRifle2(ordg,1);  % ȷ���ܵ����������2��������ʼѪ��
        bloodRifle2(ordg,1)=blood-harm;  % �����ܵ����������2������Ѫ��
        harmText;
        % �����ܵ����������2������Ϣ
        if bloodRifle2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.rifle(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-harm,5]);
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrifle2(ordg,1)); Drawrifle2(ordg,:)=[];
            delete(Drawblack2.rifle(ordg,1)); Drawblack2.rifle(ordg,:)=[];
            delete(Drawgreen2.rifle(ordg,1)); Drawgreen2.rifle(ordg,:)=[];
            rifle2.posStore2(ordg,:)=[]; black.rifleposStore2(ordg,:)=[]; green.rifleposStore2(ordg,:)=[]; bloodRifle2(ordg,:)=[];
            numGen2.rifle=numGen2.rifle-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1��������Ϣ
        bloodOwn=bloodArcher1(xarcher,1);  % ���1�������ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodArcher1(xarcher,1)=bloodOwn-80/55*harmOwn;  % ���¼���������Ѫ��
        if bloodArcher1(xarcher,1)>0  % �ܷ�������������û����
            set(Drawgreen.archer(xarcher,1),'Position',[archer.posStore1(xarcher,1)+10,archer.posStore1(xarcher,2)+5,bloodOwn-80/55*harmOwn,5]);
            archer.posStore1(xarcher,4)=1;  % �������ʿ�����غ��޷��ٹ������ƶ�
        else
            delete(Drawarcher(xarcher,1)); Drawarcher(xarcher,:)=[];
            delete(Drawblack.archer(xarcher,1)); Drawblack.archer(xarcher,:)=[];
            delete(Drawgreen.archer(xarcher,1)); Drawgreen.archer(xarcher,:)=[];
            archer.posStore1(xarcher,:)=[]; black.archerposStore1(xarcher,:)=[]; green.archerposStore1(xarcher,:)=[]; bloodArcher1(xarcher,:)=[];
            numGen.archer=numGen.archer-1;
        end
    elseif dataRec(1)==-16  % ���յ����1���������������ָ��
        battleType=3;  % �ǹ��������𹥻�
        xarcher=dataRec(2);  % ���1�ĵڼ�������������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2��������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ������������
        harm=dataRec(7);  % ���1�����������2�����ɵ��˺�
        harmOwn=dataRec(5);  % ���1�������ܵ��ķ����˺�
        blood=bloodRider2(ordg,1);  % ȷ���ܵ����������2�������ʼѪ��
        bloodRider2(ordg,1)=blood-80/65*harm;  % �����ܵ����������2�����Ѫ��
        harmText;
        % �����ܵ����������2�����Ϣ
        if bloodRider2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.rider(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/65*harm,5]);  % �����ʼ65Ѫ
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawrider2(ordg,1)); Drawrider2(ordg,:)=[];
            delete(Drawblack2.rider(ordg,1)); Drawblack2.rider(ordg,:)=[];
            delete(Drawgreen2.rider(ordg,1)); Drawgreen2.rider(ordg,:)=[];
            rider2.posStore2(ordg,:)=[]; black.riderposStore2(ordg,:)=[]; green.riderposStore2(ordg,:)=[]; bloodRider2(ordg,:)=[];
            numGen2.rider=numGen2.rider-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1��������Ϣ
        bloodOwn=bloodArcher1(xarcher,1);  % ���1�������ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodArcher1(xarcher,1)=bloodOwn-80/55*harmOwn;  % ���¼���������Ѫ��
        if bloodArcher1(xarcher,1)>0  % �ܷ�������������û����
            set(Drawgreen.archer(xarcher,1),'Position',[archer.posStore1(xarcher,1)+10,archer.posStore1(xarcher,2)+5,bloodOwn-80/55*harmOwn,5]);
            archer.posStore1(xarcher,4)=1;  % �������ʿ�����غ��޷��ٹ������ƶ�
        else
            delete(Drawarcher(xarcher,1)); Drawarcher(xarcher,:)=[];
            delete(Drawblack.archer(xarcher,1)); Drawblack.archer(xarcher,:)=[];
            delete(Drawgreen.archer(xarcher,1)); Drawgreen.archer(xarcher,:)=[];
            archer.posStore1(xarcher,:)=[]; black.archerposStore1(xarcher,:)=[]; green.archerposStore1(xarcher,:)=[]; bloodArcher1(xarcher,:)=[];
            numGen.archer=numGen.archer-1;
        end
    elseif dataRec(1)==-17  % ���յ����1������������������ָ��
        battleType=3;  % �ǹ��������𹥻�
        xarcher=dataRec(2);  % ���1�ĵڼ�������������
        gonnaAttack=[dataRec(3),dataRec(4)];  % ���2���������������ĸ���
        ordg=dataRec(6);  % ���2�ĵڼ���������������
        harm=dataRec(7);  % ���1�����������2��������ɵ��˺�
        harmOwn=dataRec(5);  % ���1�������ܵ��ķ����˺�
        blood=bloodArcher2(ordg,1);  % ȷ���ܵ����������2����������ʼѪ��
        bloodArcher2(ordg,1)=blood-80/55*harm;  % �����ܵ����������2��������Ѫ��
        harmText;
        % �����ܵ����������2��������Ϣ
        if bloodArcher2(ordg,1)>0  % �ܹ����б�û����
            set(Drawgreen2.archer(ordg,1),'Position',[gonnaAttack(1)+10,gonnaAttack(2)+5,blood-80/55*harm,5]);  % ��������ʼ55Ѫ
        else
            harmOwn=0;  % �б���ɱ���򼺷�����ʿ������Ѫ
            delete(Drawarcher2(ordg,1)); Drawarcher2(ordg,:)=[];
            delete(Drawblack2.archer(ordg,1)); Drawblack2.archer(ordg,:)=[];
            delete(Drawgreen2.archer(ordg,1)); Drawgreen2.archer(ordg,:)=[];
            archer2.posStore2(ordg,:)=[]; black.archerposStore2(ordg,:)=[]; green.archerposStore2(ordg,:)=[]; bloodArcher2(ordg,:)=[];
            numGen2.archer=numGen2.archer-1;
            delete(textresource1);
            resource1=resource1+10; resourceText1;
        end
        % ���·��𹥻������1��������Ϣ
        bloodOwn=bloodArcher1(xarcher,1);  % ���1�������ĳ�ʼѪ��
        if harmOwn~=0
            pause(0.2); harmTextOwn;
        end
        bloodArcher1(xarcher,1)=bloodOwn-80/55*harmOwn;  % ���¼���������Ѫ��
        if bloodArcher1(xarcher,1)>0  % �ܷ�������������û����
            set(Drawgreen.archer(xarcher,1),'Position',[archer.posStore1(xarcher,1)+10,archer.posStore1(xarcher,2)+5,bloodOwn-80/55*harmOwn,5]);
            archer.posStore1(xarcher,4)=1;  % �������ʿ�����غ��޷��ٹ������ƶ�
        else
            delete(Drawarcher(xarcher,1)); Drawarcher(xarcher,:)=[];
            delete(Drawblack.archer(xarcher,1)); Drawblack.archer(xarcher,:)=[];
            delete(Drawgreen.archer(xarcher,1)); Drawgreen.archer(xarcher,:)=[];
            archer.posStore1(xarcher,:)=[]; black.archerposStore1(xarcher,:)=[]; green.archerposStore1(xarcher,:)=[]; bloodArcher1(xarcher,:)=[];
            numGen.archer=numGen.archer-1;
        end
    elseif dataRec(1)==-18  % ���յ����1����������������ָ��
        harm=dataRec(2);  % ���1�����������2������ɵ��˺�
        blood=bloodTown2;
        bloodTown2=blood-harm;
        harmTextTown1;
        % �����ܵ����������2������Ϣ
        if bloodTown2>0
            set(DrawredTown2,'Position',[820,3,blood-harm,3.5]);
        else
            delete(DrawredTown2);
        end
    elseif dataRec(1)==-19  % ���յ����1�غϽ�����ָ��
        resource1=resource1+5;
        delete(textresource1);
        resourceText1;
        delete(rec_player2);
        questdlg('��Ļغ�','�غ�','ȷ��','ȷ��');
        set(gcf,'WindowButtonDownFcn',@clicktown2);  % ��������
    elseif dataRec(1)==-20  % ���ܵ����1Ͷ����ָ��
        buttonEnd=questdlg('��Ҷ���ʤ��','��Ϸ����','���¿�ʼ','������ҳ','���¿�ʼ');
        if strcmp(buttonEnd,'���¿�ʼ')
            clf;
            chessWarRestart2;
        else
            delete(rec_player2);
            gui2;
        end
    end
end
if bloodTown2<=0
    buttonEnd=questdlg('���һ��ʤ��','��Ϸ����','���¿�ʼ','������ҳ','���¿�ʼ');
    if strcmp(buttonEnd,'���¿�ʼ')
        clf;
        chessWarRestart2;
    else
        delete(rec_player2);
        gui2;
    end
end
end