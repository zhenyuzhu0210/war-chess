function key1(~,event)  % ���庯��key������event�ǰ�������
global rifle rider archer resource1 textresource1 t_server rec_player1 Drawwhite Drawfocus
switch event.Key  % ����������ת��
    case 'space'
        buttonPass=questdlg('�Ƿ�����غϣ�','�����غ�','��','��','Ͷ��','��');
        if strcmp(buttonPass,'��')
            fwrite(t_server,-19,'double');  % ��ʾ���1�ĻغϽ�����
            % ������Ϣ
            rifle.posInit1=[0,0];  % ��������ÿ�غ���ļ�Ĳ���λ��
            rifle.posInit1(1,:)=[];  % ���1�غϽ���ʱ���øľ���Ϊ�ռ�
            rider.posInit1=[0,0];  % ��������ÿ�غ���ļ�����λ��
            rider.posInit1(1,:)=[];  % ���1�غϽ���ʱ���øľ���Ϊ�ռ�
            archer.posInit1=[0,0];  % ��������ÿ�غ���ļ�Ĺ�����λ��
            archer.posInit1(1,:)=[];  % ���1�غϽ���ʱ���øľ���Ϊ�ռ�
            rifle.posStore1(:,3)=zeros(size(rifle.posStore1,1),1);  % ������������Ԫ�ػָ�Ϊ0
            rider.posStore1(:,3)=zeros(size(rider.posStore1,1),1);  % ������������Ԫ�ػָ�Ϊ0
            archer.posStore1(:,3)=zeros(size(archer.posStore1,1),1);  % ������������Ԫ�ػָ�Ϊ0
            rifle.posStore1(:,4)=zeros(size(rifle.posStore1,1),1);  % ������������Ԫ�ػָ�Ϊ0
            rider.posStore1(:,4)=zeros(size(rider.posStore1,1),1);  % ������������Ԫ�ػָ�Ϊ0
            archer.posStore1(:,4)=zeros(size(archer.posStore1,1),1);  % ������������Ԫ�ػָ�Ϊ0
            resource1=resource1+5;
            delete(textresource1);
            resourceText1;
            if ishghandle(Drawwhite)==1
                delete(Drawwhite);
            end
            if ishghandle(Drawfocus)==1
                delete(Drawfocus);
            end
            set(gcf,'WindowButtonDownFcn',@blank);  % ��������
            set(gcf,'KeyPressFcn',@blankkey);  % ��ⰴ��
            % ������ʱ��
            periodTime=0.01;
            rec_player1=timer('Period',periodTime,...  % ��ʱ����ʹ�ã�GUI��ʵʱˢ��ʱʹ�õľ���timer��ʱ��
                'ExecutionMode','fixedRate','Timerfcn',@oppoMove1);
            start(rec_player1);
        elseif strcmp(buttonPass,'Ͷ��')
            fwrite(t_server,-20,'double');  % ��ʾ���1Ͷ��
            buttonEnd=questdlg('��Ҷ���ʤ��','��Ϸ����','���¿�ʼ','������ҳ','���¿�ʼ');
            if strcmp(buttonEnd,'���¿�ʼ')
                clf;
                chessWarRestart1;
            else
                gui2;
            end
        end
    case 'backspace'
        if ishghandle(Drawwhite)==1
            delete(Drawwhite);
        end
        if ishghandle(Drawfocus)==1
            delete(Drawfocus);
        end
end
end