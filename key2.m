function key2(~,event)  % ���庯��key������event�ǰ�������
global rifle2 rider2 archer2 resource2 textresource2 t_client rec_player2 Drawwhite2 Drawfocus2
switch event.Key  % ����������ת��
    case 'space'
        buttonPass=questdlg('�Ƿ�����غϣ�','�����غ�','��','��','Ͷ��','��');
        if strcmp(buttonPass,'��')
            fwrite(t_client,-19,'double');  % �����ı����ݣ���ʾ���1�ĻغϽ�����
            % ������Ϣ
            rifle2.posInit2=[0,0];  % ��������ÿ�غ���ļ�Ĳ���λ��
            rifle2.posInit2(1,:)=[];  % ���2�غϽ���ʱ���øľ���Ϊ�ռ�
            rider2.posInit2=[0,0];  % ��������ÿ�غ���ļ�����λ��
            rider2.posInit2(1,:)=[];  % ���2�غϽ���ʱ���øľ���Ϊ�ռ�
            archer2.posInit2=[0,0];  % ��������ÿ�غ���ļ�Ĺ�����λ��
            archer2.posInit2(1,:)=[];  % ���2�غϽ���ʱ���øľ���Ϊ�ռ�
            rifle2.posStore2(:,3)=zeros(size(rifle2.posStore2,1),1);  % ������������Ԫ�ػָ�Ϊ0
            rider2.posStore2(:,3)=zeros(size(rider2.posStore2,1),1);  % ������������Ԫ�ػָ�Ϊ0
            archer2.posStore2(:,3)=zeros(size(archer2.posStore2,1),1);  % ������������Ԫ�ػָ�Ϊ0
            rifle2.posStore2(:,4)=zeros(size(rifle2.posStore2,1),1);  % ������������Ԫ�ػָ�Ϊ0
            rider2.posStore2(:,4)=zeros(size(rider2.posStore2,1),1);  % ������������Ԫ�ػָ�Ϊ0
            archer2.posStore2(:,4)=zeros(size(archer2.posStore2,1),1);  % ������������Ԫ�ػָ�Ϊ0
            resource2=resource2+5;
            delete(textresource2);
            resourceText2;
            if ishghandle(Drawwhite2)==1
                delete(Drawwhite2);
            end
            if ishghandle(Drawfocus2)==1
                delete(Drawfocus2);
            end
            set(gcf,'WindowButtonDownFcn',@blank);  % ��������
            set(gcf,'KeyPressFcn',@blankkey);  % ��ⰴ��
            % ������ʱ��
            periodTime=0.01;
            rec_player2=timer('Period',periodTime,...  % ��ʱ����ʹ�ã�GUI��ʵʱˢ��ʱʹ�õľ���timer��ʱ��
                'ExecutionMode','fixedRate','Timerfcn',@oppoMove2);
            start(rec_player2);
        elseif strcmp(buttonPass,'Ͷ��')
            fwrite(t_client,-20,'double');  % ��ʾ���2Ͷ��
            buttonEnd=questdlg('���һ��ʤ��','��Ϸ����','���¿�ʼ','������ҳ','���¿�ʼ');
            if strcmp(buttonEnd,'���¿�ʼ')
                clf;
                chessWarRestart2;
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