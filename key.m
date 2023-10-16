function key(~,event)  % 定义函数key，其中event是按键动作
global turn rifle rider archer rifle2 rider2 archer2 resource1 textresource1 resource2 textresource2 Drawwhite Drawfocus...
    Drawwhite2 Drawfocus2
switch event.Key  % 将按键动作转换
    case 'space'
        buttonPass=questdlg('是否结束回合？','结束回合','是','否','投降','是');
        if strcmp(buttonPass,'是')
            if turn==0  % 表示下一回合是玩家2（右下角）的回合
                set(gcf,'WindowButtonDownFcn',@clicktownb2);
                rifle.posInit1=[0,0];  % 用来储存每回合招募的步兵位置
                rifle.posInit1(1,:)=[];  % 玩家1回合结束时重置改矩阵为空集
                rider.posInit1=[0,0];  % 用来储存每回合招募的骑兵位置
                rider.posInit1(1,:)=[];  % 玩家1回合结束时重置改矩阵为空集
                archer.posInit1=[0,0];  % 用来储存每回合招募的弓箭兵位置
                archer.posInit1(1,:)=[];  % 玩家1回合结束时重置改矩阵为空集
                rifle.posStore1(:,3)=zeros(size(rifle.posStore1,1),1);  % 将第三列所有元素恢复为0
                rider.posStore1(:,3)=zeros(size(rider.posStore1,1),1);  % 将第三列所有元素恢复为0
                archer.posStore1(:,3)=zeros(size(archer.posStore1,1),1);  % 将第三列所有元素恢复为0
                rifle.posStore1(:,4)=zeros(size(rifle.posStore1,1),1);  % 将第四列所有元素恢复为0
                rider.posStore1(:,4)=zeros(size(rider.posStore1,1),1);  % 将第四列所有元素恢复为0
                archer.posStore1(:,4)=zeros(size(archer.posStore1,1),1);  % 将第四列所有元素恢复为0
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
            elseif turn==1 % 表示下一回合是玩家1（左上角）的回合
                set(gcf,'WindowButtonDownFcn',@clicktownb1);
                rifle2.posInit2=[0,0];  % 用来储存每回合招募的步兵位置
                rifle2.posInit2(1,:)=[];  % 玩家2回合结束时重置改矩阵为空集
                rider2.posInit2=[0,0];  % 用来储存每回合招募的骑兵位置
                rider2.posInit2(1,:)=[];  % 玩家2回合结束时重置改矩阵为空集
                archer2.posInit2=[0,0];  % 用来储存每回合招募的弓箭兵位置
                archer2.posInit2(1,:)=[];  % 玩家2回合结束时重置改矩阵为空集
                rifle2.posStore2(:,3)=zeros(size(rifle2.posStore2,1),1);  % 将第三列所有元素恢复为0
                rider2.posStore2(:,3)=zeros(size(rider2.posStore2,1),1);  % 将第三列所有元素恢复为0
                archer2.posStore2(:,3)=zeros(size(archer2.posStore2,1),1);  % 将第三列所有元素恢复为0
                rifle2.posStore2(:,4)=zeros(size(rifle2.posStore2,1),1);  % 将第四列所有元素恢复为0
                rider2.posStore2(:,4)=zeros(size(rider2.posStore2,1),1);  % 将第四列所有元素恢复为0
                archer2.posStore2(:,4)=zeros(size(archer2.posStore2,1),1);  % 将第四列所有元素恢复为0
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
        elseif strcmp(buttonPass,'投降')
            if turn==0  % 表示下一回合是玩家2（右下角）的回合
                buttonEnd=questdlg('玩家二获胜！','游戏结束','重新开始','返回主页','重新开始');
                if strcmp(buttonEnd,'重新开始')
                    clf;
                    chessWarRestart;
                else
                    gui2;
                end
            elseif turn==1  % 表示下一回合是玩家1（左上角）的回合
                buttonEnd=questdlg('玩家一获胜！','游戏结束','重新开始','返回主页','重新开始');
                if strcmp(buttonEnd,'重新开始')
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