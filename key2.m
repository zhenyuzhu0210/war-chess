function key2(~,event)  % 定义函数key，其中event是按键动作
global rifle2 rider2 archer2 resource2 textresource2 t_client rec_player2 Drawwhite2 Drawfocus2
switch event.Key  % 将按键动作转换
    case 'space'
        buttonPass=questdlg('是否结束回合？','结束回合','是','否','投降','是');
        if strcmp(buttonPass,'是')
            fwrite(t_client,-19,'double');  % 发送文本数据，表示玩家1的回合结束了
            % 更新信息
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
            set(gcf,'WindowButtonDownFcn',@blank);  % 检测鼠标点击
            set(gcf,'KeyPressFcn',@blankkey);  % 检测按键
            % 启动计时器
            periodTime=0.01;
            rec_player2=timer('Period',periodTime,...  % 定时器的使用，GUI上实时刷新时使用的就是timer定时器
                'ExecutionMode','fixedRate','Timerfcn',@oppoMove2);
            start(rec_player2);
        elseif strcmp(buttonPass,'投降')
            fwrite(t_client,-20,'double');  % 表示玩家2投降
            buttonEnd=questdlg('玩家一获胜！','游戏结束','重新开始','返回主页','重新开始');
            if strcmp(buttonEnd,'重新开始')
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