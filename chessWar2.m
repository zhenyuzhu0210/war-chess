function chessWar2(~,~)
% cd E:\������\matlab��Ϸ\ս��;
clear global rifle rider archer rifle2 rider2 archer2 bkg town1 town2 tech turn white black green...
    focus numGen numGen2 moveType moveType2 bloodRifle1 bloodRifle2 bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodInit...
    DrawblackTown1 DrawblackTown2 DrawredTown1 DrawredTown2 bloodTown1 bloodTown2 opptownPos1 opptownPos2 showFocusTown1 showFocusTown2...
    resource1 resource2
global rifle rider archer rifle2 rider2 archer2 bkg town1 town2 tech turn white black green...
    focus numGen numGen2 moveType moveType2 bloodRifle1 bloodRifle2 bloodRider1 bloodRider2 bloodArcher1 bloodArcher2 bloodInit...
    DrawblackTown1 DrawblackTown2 DrawredTown1 DrawredTown2 bloodTown1 bloodTown2 opptownPos1 opptownPos2 showFocusTown1 showFocusTown2...
    resource1 resource2
clf;
%% ����ͼ
bkg.CData=imread('�ݵ�.jpg');
bkg.CData=bkg.CData(1:1000,1:1000,:);
bkg.CData(:,:,1)=flipud(bkg.CData(:,:,1));
bkg.CData(:,:,2)=flipud(bkg.CData(:,:,2));
bkg.CData(:,:,3)=flipud(bkg.CData(:,:,3));
bkg.Size=size(bkg.CData);

%% Ԫ��
white.CData=imread('��ɫ.jpg');
white.CData=imresize(white.CData,[100,100]);
white.Size=size(white.CData);
white.AlpData=0.3;
white.AlpData=repmat(white.AlpData,100,100);

[focus.CData,~,focus.AlpData]=imread('��׼����.png');
% ��ͼ��������ɫ
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

% Ѫ����������ɫ
black.riflePos1=[210,705]; black.riflePos2=[710,205];
black.riderPos1=[210,805]; black.riderPos2=[810,205];
black.archerPos1=[110,705]; black.archerPos2=[710,105];
black.rifleposStore1=[0,0]; black.rifleposStore2=[0,0];
black.rifleposStore1(1,:)=[]; black.rifleposStore2(1,:)=[];
black.riderposStore1=[0,0]; black.riderposStore2=[0,0];
black.riderposStore1(1,:)=[]; black.riderposStore2(1,:)=[];
black.archerposStore1=[0,0]; black.archerposStore2=[0,0];
black.archerposStore1(1,:)=[]; black.archerposStore2(1,:)=[];

% Ѫ������ɫ
green.riflePos1=[210,705]; green.riflePos2=[710,205];
green.riderPos1=[210,805]; green.riderPos2=[810,205];
green.archerPos1=[110,705]; green.archerPos2=[710,105];
green.rifleposStore1=[0,0]; green.rifleposStore2=[0,0];
green.rifleposStore1(1,:)=[]; green.rifleposStore2(1,:)=[];
green.riderposStore1=[0,0]; green.riderposStore2=[0,0];
green.riderposStore1(1,:)=[]; green.riderposStore2(1,:)=[];
green.archerposStore1=[0,0]; green.archerposStore2=[0,0];
green.archerposStore1(1,:)=[]; green.archerposStore2(1,:)=[];

[block.CData,~,block.AlpData]=imread('�ϰ�.png');  % AlphaData��ʾ͸����
block.AlpData=flipud(block.AlpData);
for i=1:3
    block.CData(:,:,i)=flipud(block.CData(:,:,i));
end
block.CData=imresize(block.CData,[100,100]);
block.AlpData=imresize(block.AlpData,[100,100]);
block.Size=size(block.CData);
block.Pos=[200,700];  % ͼƬ���½�����λ��

[rock.CData,~,rock.AlpData]=imread('ʯͷ.png');
rock.AlpData=flipud(rock.AlpData);
for i=1:3
    rock.CData(:,:,i)=flipud(rock.CData(:,:,i));
end
rock.CData=imresize(rock.CData,[100,140]);
rock.AlpData=imresize(rock.AlpData,[100,140]);
rock.Size=size(rock.CData);
rock.Pos=[90,500];

[gold.CData,~,gold.AlpData]=imread('��ʯ��.png');
gold.AlpData=flipud(gold.AlpData);
for i=1:3
    gold.CData(:,:,i)=flipud(gold.CData(:,:,i));
end
gold.CData=imresize(gold.CData,[25,25]);
gold.AlpData=imresize(gold.AlpData,[25,25]);
gold.Size=size(gold.CData);
gold.Pos=[5,960];
gold.Pos2=[970,160];

[town1.CData,~,town1.AlpData]=imread('����.png');
% town1.CData=town1.CData(42:181,170:279,:);
% town1.AlpData=town1.AlpData(42:181,170:279);
town1.AlpData=fliplr(town1.AlpData);  % ���ҷ�ת
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
town1.Pos=[0,800];  % ͼƬ���½�����λ��

[town2.CData,~,town2.AlpData]=imread('����.png');
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

[tech.CData,~,tech.AlpData]=imread('�Ƽ�.png');
% tech.CData=imrotate(tech.CData,45);
% tech.AlpData=imrotate(tech.AlpData,45);
tech.AlpData=flipud(tech.AlpData);
for i=1:3
    tech.CData(:,:,i)=flipud(tech.CData(:,:,i));
end
tech.CData=imresize(tech.CData,[150,200]);
tech.AlpData=imresize(tech.AlpData,[150,200]);
tech.Size=size(tech.CData);
tech.Pos=[700,400];  % ͼƬ���½�����λ��

[rifle.CData,~,rifle.AlpData]=imread('����.png');
rifle.AlpData=flipud(rifle.AlpData);
for i=1:3
    rifle.CData(:,:,i)=flipud(rifle.CData(:,:,i));
end
rifle.CData=imresize(rifle.CData,[90,90]);
rifle.AlpData=imresize(rifle.AlpData,[90,90]);
rifle.Size=size(rifle.CData);
rifle.Pos1=[200,700];  % ��ʼ�����Ͻǲ���λ��
rifle.posStore1=[0,0,0,0];
rifle.posStore1(1,:)=[];  % Ϊ���øþ�����һ�����еĿվ���ǰ���д洢��ͼ�ϴ��ڵĲ���λ�ã������м�¼��ʿ���Ƿ��Ǳ��غ�����ļ�Ļ��߱��غ��Ѿ��ƶ����������м�¼��ʿ�����غ��Ƿ��ѹ���
rifle.posInit1=[0,0];  % ��������ÿ�غ���ļ�Ĳ���λ��
rifle.posInit1(1,:)=[];

[rifle2.CData,~,rifle2.AlpData]=imread('����.png');
rifle2.AlpData=fliplr(rifle2.AlpData);  % ���ҷ�ת
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
rifle2.Pos2=[700,200];  % ��ʼ�����½ǲ���λ��
rifle2.posStore2=[0,0,0,0];
rifle2.posStore2(1,:)=[];
rifle2.posInit2=[0,0];
rifle2.posInit2(1,:)=[];

[rider.CData,~,rider.AlpData]=imread('���.png');
rider.AlpData=flipud(rider.AlpData);
for i=1:3
    rider.CData(:,:,i)=flipud(rider.CData(:,:,i));
end
rider.CData=imresize(rider.CData,[110,95]);
rider.AlpData=imresize(rider.AlpData,[110,95]);
rider.Size=size(rider.CData);
rider.Pos1=[200,800];  % ��ʼ�����Ͻ����λ��
rider.posStore1=[0,0,0,0];
rider.posStore1(1,:)=[];  % Ϊ���øþ�����һ�����еĿվ���ǰ���д洢��ͼ�ϴ��ڵ����λ�ã������м�¼������Ƿ��Ǳ��غ�����ļ�Ļ��߱��غ��Ѿ��ƶ���
rider.posInit1=[0,0];  % ��������ÿ�غ���ļ�����λ��
rider.posInit1(1,:)=[];

[rider2.CData,~,rider2.AlpData]=imread('���.png');
rider2.AlpData=fliplr(rider2.AlpData);  % ���ҷ�ת
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
rider2.Pos2=[800,200];  % ��ʼ�����½����λ��
rider2.posStore2=[0,0,0,0];
rider2.posStore2(1,:)=[];
rider2.posInit2=[0,0];
rider2.posInit2(1,:)=[];

[archer.CData,~,archer.AlpData]=imread('������.png');
archer.AlpData=flipud(archer.AlpData);
for i=1:3
    archer.CData(:,:,i)=flipud(archer.CData(:,:,i));
end
archer.CData=imresize(archer.CData,[95,95]);
archer.AlpData=imresize(archer.AlpData,[95,95]);
archer.Size=size(archer.CData);
archer.Pos1=[100,700];  % ��ʼ�����Ͻǹ�����λ��
archer.posStore1=[0,0,0,0];
archer.posStore1(1,:)=[];  % Ϊ���øþ�����һ�����еĿվ���ǰ���д洢��ͼ�ϴ��ڵĹ�����λ�ã������м�¼�ù������Ƿ��Ǳ��غ�����ļ�Ļ��߱��غ��Ѿ��ƶ���
archer.posInit1=[0,0];  % ��������ÿ�غ���ļ�Ĺ�����λ��
archer.posInit1(1,:)=[];

[archer2.CData,~,archer2.AlpData]=imread('������.png');
archer2.AlpData=fliplr(archer2.AlpData);  % ���ҷ�ת
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
archer2.Pos2=[700,100];  % ��ʼ�����½ǹ�����λ��
archer2.posStore2=[0,0,0,0];
archer2.posStore2(1,:)=[];
archer2.posInit2=[0,0];
archer2.posInit2(1,:)=[];

%% ���������ʶ���ִ�й���
numGen.rifle=0;  % numGen.rifle������¼���ǳ��ϵĵڼ�������
numGen.rider=0; % numGen.rider������¼���ǳ��ϵĵڼ������
numGen.archer=0; % numGen.rider������¼���ǳ��ϵĵڼ���������
numGen2.rifle=0;
numGen2.rider=0;
numGen2.archer=0;
moveType=1;  % ��¼�������ͣ�1��ʾ������2��ʾ�����3��ʾ������
moveType2=1;
bloodRifle1=[]; bloodRider1=[]; bloodArcher1=[];
bloodRifle2=[]; bloodRider2=[]; bloodArcher2=[];
bloodInit=80;
bloodTown1=160; bloodTown2=160;
opptownPos1=[800,0,4;800,100,4;900,0,4;900,100,4];  % ����2λ��
opptownPos2=[0,800,4;100,800,4;0,900,4;100,900,4];  % ����1λ��
showFocusTown1=0; showFocusTown2=0;
resource1=50; resource2=50;  % ��ʼ��Դ

%% ��ͼ
% global bkg town1 tech
% Mainfig=figure('units','pixels','position',[350 50 bkg.Size(1,[2,1])./1.65],...  % [left, bottom, width, height]
%     'Numbertitle','off','menubar','none','resize','off',...
%     'name','War');
Mainaxes=axes('position',[0 0 1 1],...  % ���������½�λ��(0,0)����Ⱥ͸߶Ⱦ�Ϊ1
    'XLim',[0 bkg.Size(2)],...  % x�᷶Χ
    'YLim',[0 bkg.Size(1)],...  % y�᷶Χ
    'XTick',0:100:1000,...  % x��̶�
    'YTick',0:100:1000,...  % y��̶�
    'NextPlot','add',...  % ������������������»�ͼ������ʾ�»�ͼ֮ǰ����ɾ�����л�ͼ���������������ԡ�
    'layer','bottom',...  % ��ͼ�ζ����·���ʾ�̶��ߺ������ߡ�
    'Visible','on',...  % ��ʾ�����������Ӽ�
    'XGrid','on',...  % ��ʾx������
    'YGrid','on');  % ��ʾy������
Drawbkg=image([0 bkg.Size(2)],[0 bkg.Size(1)],bkg.CData);  % image(x,y,C),x��y��x���y��ķ�Χ
for i=1:100:1001
   plot([0,1000],[i-1,i-1],'c:','linewidth',0.5);
   plot([i-1,i-1],[0,1000],'c:','linewidth',0.5);
end  % �������ߣ�����鿴

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

%% ����1����������
turn=1;
if turn==0
    set(gcf,'WindowButtonDownFcn',@clicktown2);  % ��������
elseif turn==1
    set(gcf,'KeyPressFcn',@blankkey);  % ��ⰴ��
    periodTime=0.01;
    rec_player2=timer('Period',periodTime,...  % ��ʱ����ʹ�ã�GUI��ʵʱˢ��ʱʹ�õľ���timer��ʱ��
        'ExecutionMode','fixedRate','Timerfcn',@oppoMove2);
    start(rec_player2);
end
end