function key(~,event)  % ���庯��key������event�ǰ�������
global turn rifle rider archer rifle2 rider2 archer2 resource1 textresource1 resource2 textresource2 Drawwhite Drawfocus...
    Drawwhite2 Drawfocus2
switch event.Key  % ����������ת��
    case 'space'
        buttonPass=questdlg('�Ƿ�����غϣ�','�����غ�','��','��','Ͷ��','��');
        if strcmp(buttonPass,'��')
            if turn==0  % ��ʾ��һ�غ������2�����½ǣ��Ļغ�
                set(gcf,'WindowButtonDownFcn',@clicktownb2);
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
                turn=1;
            elseif turn==1 % ��ʾ��һ�غ������1�����Ͻǣ��Ļغ�
                set(gcf,'WindowButtonDownFcn',@clicktownb1);
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
                turn=0;
            end
        elseif strcmp(buttonPass,'Ͷ��')
            if turn==0  % ��ʾ��һ�غ������2�����½ǣ��Ļغ�
                buttonEnd=questdlg('��Ҷ���ʤ��','��Ϸ����','���¿�ʼ','������ҳ','���¿�ʼ');
                if strcmp(buttonEnd,'���¿�ʼ')
                    clf;
                    chessWarRestart;
                else
                    gui2;
                end
            elseif turn==1  % ��ʾ��һ�غ������1�����Ͻǣ��Ļغ�
                buttonEnd=questdlg('���һ��ʤ��','��Ϸ����','���¿�ʼ','������ҳ','���¿�ʼ');
                if strcmp(buttonEnd,'���¿�ʼ')
                    clf;
                    chessWarRestart;
                else
                    gui2;
                end
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