function key1(~,event)  % 定义函数key，其中event是按键动作
global rifle rider archer resource1 textresource1 t_server rec_player1 Drawwhite Drawfocus
switch event.Key  % 将按键动作转换
    case 'space'
        buttonPass=questdlg('是否结束回合？','结束回合','是','否','投降','是');
        if strcmp(buttonPass,'是')
            fwrite(t_server,-19,'double');  % 表示玩家1的回合结束了
            % 更新信息
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
            set(gcf,'WindowButtonDownFcn',@blank);  % 检测鼠标点击
            set(gcf,'KeyPressFcn',@blankkey);  % 检测按键
            % 启动计时器
            periodTime=0.01;
            rec_player1=timer('Period',periodTime,...  % 定时器的使用，GUI上实时刷新时使用的就是timer定时器
                'ExecutionMode','fixedRate','Timerfcn',@oppoMove1);
            start(rec_player1);
        elseif strcmp(buttonPass,'投降')
            fwrite(t_server,-20,'double');  % 表示玩家1投降
            buttonEnd=questdlg('玩家二获胜！','游戏结束','重新开始','返回主页','重新开始');
            if strcmp(buttonEnd,'重新开始')
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