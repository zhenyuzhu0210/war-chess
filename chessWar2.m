function chessWar2(~,~)
% cd E:\少行中\matlab游戏\战棋;
clear global rifle rider archer rifle2 rider2 archer2 bkg town1 town2 tech turn white black green...
    focus numGen numGen2 moveType moveType2 bloodRifle1 bloodRifle2 bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodInit...
    DrawblackTown1 DrawblackTown2 DrawredTown1 DrawredTown2 bloodTown1 bloodTown2 opptownPos1 opptownPos2 showFocusTown1 showFocusTown2...
    resource1 resource2
global rifle rider archer rifle2 rider2 archer2 bkg town1 town2 tech turn white black green...
    focus numGen numGen2 moveType moveType2 bloodRifle1 bloodRifle2 bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodInit...
    DrawblackTown1 DrawblackTown2 DrawredTown1 DrawredTown2 bloodTown1 bloodTown2 opptownPos1 opptownPos2 showFocusTown1 showFocusTown2...
    resource1 resource2
clf;
%% 背景图
bkg.CData=imread('草地.jpg');
bkg.CData=bkg.CData(1:1000,1:1000,:);
bkg.CData(:,:,1)=flipud(bkg.CData(:,:,1));
bkg.CData(:,:,2)=flipud(bkg.CData(:,:,2));
bkg.CData(:,:,3)=flipud(bkg.CData(:,:,3));
bkg.Size=size(bkg.CData);

%% 元素
white.CData=imread('白色.jpg');
white.CData=imresize(white.CData,[100,100]);
white.Size=size(white.CData);
white.AlpData=0.3;
white.AlpData=repmat(white.AlpData,100,100);

[focus.CData,~,focus.AlpData]=imread('瞄准敌人.png');
% 对图像重新着色
x1=focus.CData(:,:,1); x1(x1~=0)=220; focus.CData(:,:,1)=x1;
x2=focus.CData(:,:,2); x2(x2~=0)=0; focus.CData(:,:,2)=x2;
x3=focus.CData(:,:,3); x3(x3~=0)=0; focus.CData(:,:,3)=x3;
focus.AlpData=flipud(focus.AlpData);
for i=1:3
    focus.CData(:,:,i)=flipud(focus.CData(:,:,i));
end
focus.CData=imresize(focus.CData,[60,60]);
focus.AlpData=imresize(focus.AlpData,[60,60]);
focus.Size=size(focus.CData);

% 血条，背景黑色
black.riflePos1=[210,705]; black.riflePos2=[710,205];
black.riderPos1=[210,805]; black.riderPos2=[810,205];
black.archerPos1=[110,705]; black.archerPos2=[710,105];
black.rifleposStore1=[0,0]; black.rifleposStore2=[0,0];
black.rifleposStore1(1,:)=[]; black.rifleposStore2(1,:)=[];
black.riderposStore1=[0,0]; black.riderposStore2=[0,0];
black.riderposStore1(1,:)=[]; black.riderposStore2(1,:)=[];
black.archerposStore1=[0,0]; black.archerposStore2=[0,0];
black.archerposStore1(1,:)=[]; black.archerposStore2(1,:)=[];

% 血条，绿色
green.riflePos1=[210,705]; green.riflePos2=[710,205];
green.riderPos1=[210,805]; green.riderPos2=[810,205];
green.archerPos1=[110,705]; green.archerPos2=[710,105];
green.rifleposStore1=[0,0]; green.rifleposStore2=[0,0];
green.rifleposStore1(1,:)=[]; green.rifleposStore2(1,:)=[];
green.riderposStore1=[0,0]; green.riderposStore2=[0,0];
green.riderposStore1(1,:)=[]; green.riderposStore2(1,:)=[];
green.archerposStore1=[0,0]; green.archerposStore2=[0,0];
green.archerposStore1(1,:)=[]; green.archerposStore2(1,:)=[];

[block.CData,~,block.AlpData]=imread('障碍.png');  % AlphaData表示透明度
block.AlpData=flipud(block.AlpData);
for i=1:3
    block.CData(:,:,i)=flipud(block.CData(:,:,i));
end
block.CData=imresize(block.CData,[100,100]);
block.AlpData=imresize(block.AlpData,[100,100]);
block.Size=size(block.CData);
block.Pos=[200,700];  % 图片左下角所在位置

[rock.CData,~,rock.AlpData]=imread('石头.png');
rock.AlpData=flipud(rock.AlpData);
for i=1:3
    rock.CData(:,:,i)=flipud(rock.CData(:,:,i));
end
rock.CData=imresize(rock.CData,[100,140]);
rock.AlpData=imresize(rock.AlpData,[100,140]);
rock.Size=size(rock.CData);
rock.Pos=[90,500];

[gold.CData,~,gold.AlpData]=imread('钻石红.png');
gold.AlpData=flipud(gold.AlpData);
for i=1:3
    gold.CData(:,:,i)=flipud(gold.CData(:,:,i));
end
gold.CData=imresize(gold.CData,[25,25]);
gold.AlpData=imresize(gold.AlpData,[25,25]);
gold.Size=size(gold.CData);
gold.Pos=[5,960];
gold.Pos2=[970,160];

[town1.CData,~,town1.AlpData]=imread('主塔.png');
% town1.CData=town1.CData(42:181,170:279,:);
% town1.AlpData=town1.AlpData(42:181,170:279);
town1.AlpData=fliplr(town1.AlpData);  % 左右翻转
for i=1:3
    town1.CData(:,:,i)=fliplr(town1.CData(:,:,i));
end
town1.AlpData=flipud(town1.AlpData);
for i=1:3
    town1.CData(:,:,i)=flipud(town1.CData(:,:,i));
end
town1.CData=imresize(town1.CData,[200,200]);
town1.AlpData=imresize(town1.AlpData,[200,200]);
town1.Size=size(town1.CData);
town1.Pos=[0,800];  % 图片左下角所在位置

[town2.CData,~,town2.AlpData]=imread('主塔.png');
% town2.CData=town2.CData(42:181,170:279,:);
% town2.AlpData=town2.AlpData(42:181,170:279);
town2.AlpData=flipud(town2.AlpData);
for i=1:3
    town2.CData(:,:,i)=flipud(town2.CData(:,:,i));
end
town2.CData=imresize(town2.CData,[200,200]);
town2.AlpData=imresize(town2.AlpData,[200,200]);
town2.Size=size(town2.CData);
town2.Pos=[800,0];

[tech.CData,~,tech.AlpData]=imread('科技.png');
% tech.CData=imrotate(tech.CData,45);
% tech.AlpData=imrotate(tech.AlpData,45);
tech.AlpData=flipud(tech.AlpData);
for i=1:3
    tech.CData(:,:,i)=flipud(tech.CData(:,:,i));
end
tech.CData=imresize(tech.CData,[150,200]);
tech.AlpData=imresize(tech.AlpData,[150,200]);
tech.Size=size(tech.CData);
tech.Pos=[700,400];  % 图片左下角所在位置

[rifle.CData,~,rifle.AlpData]=imread('步兵.png');
rifle.AlpData=flipud(rifle.AlpData);
for i=1:3
    rifle.CData(:,:,i)=flipud(rifle.CData(:,:,i));
end
rifle.CData=imresize(rifle.CData,[90,90]);
rifle.AlpData=imresize(rifle.AlpData,[90,90]);
rifle.Size=size(rifle.CData);
rifle.Pos1=[200,700];  % 初始化左上角步兵位置
rifle.posStore1=[0,0,0,0];
rifle.posStore1(1,:)=[];  % 为了让该矩阵是一个四列的空矩阵，前两列存储地图上存在的步兵位置，第三列记录该士兵是否是本回合新招募的或者本回合已经移动过，第四列记录该士兵本回合是否已攻击
rifle.posInit1=[0,0];  % 用来储存每回合招募的步兵位置
rifle.posInit1(1,:)=[];

[rifle2.CData,~,rifle2.AlpData]=imread('步兵.png');
rifle2.AlpData=fliplr(rifle2.AlpData);  % 左右翻转
for i=1:3
    rifle2.CData(:,:,i)=fliplr(rifle2.CData(:,:,i));
end
rifle2.AlpData=flipud(rifle2.AlpData);
for i=1:3
    rifle2.CData(:,:,i)=flipud(rifle2.CData(:,:,i));
end
rifle2.CData=imresize(rifle2.CData,[90,90]);
rifle2.AlpData=imresize(rifle2.AlpData,[90,90]);
rifle2.Size=size(rifle2.CData);
rifle2.Pos2=[700,200];  % 初始化右下角步兵位置
rifle2.posStore2=[0,0,0,0];
rifle2.posStore2(1,:)=[];
rifle2.posInit2=[0,0];
rifle2.posInit2(1,:)=[];

[rider.CData,~,rider.AlpData]=imread('骑兵.png');
rider.AlpData=flipud(rider.AlpData);
for i=1:3
    rider.CData(:,:,i)=flipud(rider.CData(:,:,i));
end
rider.CData=imresize(rider.CData,[110,95]);
rider.AlpData=imresize(rider.AlpData,[110,95]);
rider.Size=size(rider.CData);
rider.Pos1=[200,800];  % 初始化左上角骑兵位置
rider.posStore1=[0,0,0,0];
rider.posStore1(1,:)=[];  % 为了让该矩阵是一个三列的空矩阵，前两列存储地图上存在的骑兵位置，第三列记录该骑兵是否是本回合新招募的或者本回合已经移动过
rider.posInit1=[0,0];  % 用来储存每回合招募的骑兵位置
rider.posInit1(1,:)=[];

[rider2.CData,~,rider2.AlpData]=imread('骑兵.png');
rider2.AlpData=fliplr(rider2.AlpData);  % 左右翻转
for i=1:3
    rider2.CData(:,:,i)=fliplr(rider2.CData(:,:,i));
end
rider2.AlpData=flipud(rider2.AlpData);
for i=1:3
    rider2.CData(:,:,i)=flipud(rider2.CData(:,:,i));
end
rider2.CData=imresize(rider2.CData,[110,95]);
rider2.AlpData=imresize(rider2.AlpData,[110,95]);
rider2.Size=size(rider2.CData);
rider2.Pos2=[800,200];  % 初始化右下角骑兵位置
rider2.posStore2=[0,0,0,0];
rider2.posStore2(1,:)=[];
rider2.posInit2=[0,0];
rider2.posInit2(1,:)=[];

[archer.CData,~,archer.AlpData]=imread('弓箭兵.png');
archer.AlpData=flipud(archer.AlpData);
for i=1:3
    archer.CData(:,:,i)=flipud(archer.CData(:,:,i));
end
archer.CData=imresize(archer.CData,[95,95]);
archer.AlpData=imresize(archer.AlpData,[95,95]);
archer.Size=size(archer.CData);
archer.Pos1=[100,700];  % 初始化左上角弓箭兵位置
archer.posStore1=[0,0,0,0];
archer.posStore1(1,:)=[];  % 为了让该矩阵是一个三列的空矩阵，前两列存储地图上存在的弓箭兵位置，第三列记录该弓箭兵是否是本回合新招募的或者本回合已经移动过
archer.posInit1=[0,0];  % 用来储存每回合招募的弓箭兵位置
archer.posInit1(1,:)=[];

[archer2.CData,~,archer2.AlpData]=imread('弓箭兵.png');
archer2.AlpData=fliplr(archer2.AlpData);  % 左右翻转
for i=1:3
    archer2.CData(:,:,i)=fliplr(archer2.CData(:,:,i));
end
archer2.AlpData=flipud(archer2.AlpData);
for i=1:3
    archer2.CData(:,:,i)=flipud(archer2.CData(:,:,i));
end
archer2.CData=imresize(archer2.CData,[95,95]);
archer2.AlpData=imresize(archer2.AlpData,[95,95]);
archer2.Size=size(archer2.CData);
archer2.Pos2=[700,100];  % 初始化右下角弓箭兵位置
archer2.posStore2=[0,0,0,0];
archer2.posStore2(1,:)=[];
archer2.posInit2=[0,0];
archer2.posInit2(1,:)=[];

%% 组件，用来识别和执行规则
numGen.rifle=0;  % numGen.rifle用来记录这是场上的第几个步兵
numGen.rider=0; % numGen.rider用来记录这是场上的第几个骑兵
numGen.archer=0; % numGen.rider用来记录这是场上的第几个弓箭兵
numGen2.rifle=0;
numGen2.rider=0;
numGen2.archer=0;
moveType=1;  % 记录兵种类型，1表示步兵，2表示骑兵，3表示弓箭兵
moveType2=1;
bloodRifle1=[]; bloodRider1=[]; bloodArcher1=[];
bloodRifle2=[]; bloodRider2=[]; bloodArcher2=[];
bloodInit=80;
bloodTown1=160; bloodTown2=160;
opptownPos1=[800,0,4;800,100,4;900,0,4;900,100,4];  % 敌塔2位置
opptownPos2=[0,800,4;100,800,4;0,900,4;100,900,4];  % 敌塔1位置
showFocusTown1=0; showFocusTown2=0;
resource1=50; resource2=50;  % 初始资源

%% 绘图
% global bkg town1 tech
% Mainfig=figure('units','pixels','position',[350 50 bkg.Size(1,[2,1])./1.65],...  % [left, bottom, width, height]
%     'Numbertitle','off','menubar','none','resize','off',...
%     'name','War');
Mainaxes=axes('position',[0 0 1 1],...  % 坐标轴左下角位于(0,0)，宽度和高度均为1
    'XLim',[0 bkg.Size(2)],...  % x轴范围
    'YLim',[0 bkg.Size(1)],...  % y轴范围
    'XTick',0:100:1000,...  % x轴刻度
    'YTick',0:100:1000,...  % y轴刻度
    'NextPlot','add',...  % 在现有坐标区上添加新绘图。在显示新绘图之前，不删除现有绘图或重置坐标区属性。
    'layer','bottom',...  % 在图形对象下方显示刻度线和网格线。
    'Visible','on',...  % 显示坐标区及其子集
    'XGrid','on',...  % 显示x轴网格
    'YGrid','on');  % 显示y轴网格
Drawbkg=image([0 bkg.Size(2)],[0 bkg.Size(1)],bkg.CData);  % image(x,y,C),x和y是x轴和y轴的范围
for i=1:100:1001
   plot([0,1000],[i-1,i-1],'c:','linewidth',0.5);
   plot([i-1,i-1],[0,1000],'c:','linewidth',0.5);
end  % 画网格线，方便查看

DrawblackTown1=rectangle('Position',[20,803,160,3.5],...
    'LineStyle','none','FaceColor','k');
DrawredTown1=rectangle('Position',[20,803,bloodTown1,3.5],...
    'LineStyle','none','FaceColor',[0.89,0.09,0.05]);
Drawtown1=image([0 town1.Size(2)]+town1.Pos(1),[0 town1.Size(1)]+town1.Pos(2),...
    town1.CData,'alphaData',town1.AlpData);

DrawblackTown2=rectangle('Position',[820,3,160,3.5],...
    'LineStyle','none','FaceColor','k');
DrawredTown2=rectangle('Position',[820,3,bloodTown2,3.5],...
    'LineStyle','none','FaceColor',[0.89,0.09,0.05]);
Drawtown2=image([0 town2.Size(2)]+town2.Pos(1),[0 town2.Size(1)]+town2.Pos(2),...
    town2.CData,'alphaData',town2.AlpData);

Drawgold=image([0 gold.Size(2)]+gold.Pos(1),[0 gold.Size(1)]+gold.Pos(2),...
    gold.CData,'alphaData',gold.AlpData);
Drawgold2=image([0 gold.Size(2)]+gold.Pos2(1),[0 gold.Size(1)]+gold.Pos2(2),...
    gold.CData,'alphaData',gold.AlpData);
resourceText1;
resourceText2;

% Drawtech=image([0 tech.Size(2)]+400,[0 tech.Size(1)]+425,...
%     tech.CData,'alphaData',tech.AlpData);
% Drawblock=image([0 block.Size(2)]+block.Pos(1),[0 block.Size(1)]+block.Pos(2),...
%     block.CData,'alphaData',block.AlpData);
% Drawrock=image([0 rock.Size(2)]+rock.Pos(1),[0 rock.Size(1)]+rock.Pos(2),...
%     rock.CData,'alphaData',rock.AlpData);

%% 操作1：生产兵种
turn=1;
if turn==0
    set(gcf,'WindowButtonDownFcn',@clicktown2);  % 检测鼠标点击
elseif turn==1
    set(gcf,'KeyPressFcn',@blankkey);  % 检测按键
    periodTime=0.01;
    rec_player2=timer('Period',periodTime,...  % 定时器的使用，GUI上实时刷新时使用的就是timer定时器
        'ExecutionMode','fixedRate','Timerfcn',@oppoMove2);
    start(rec_player2);
end
end