function harmText(~,~)
global harm gonnaAttack
set(gcf,'WindowButtonDownFcn',@blank);  % 检测鼠标点击，在播放攻击动画时无法进行其他操作
set(gcf,'KeyPressFcn',@blankkey);  % 检测按键，在播放攻击动画时无法进行其他操作
textharm=text('string',['-',num2str(harm)],'position',[gonnaAttack(1)+30,gonnaAttack(2)+70],...
    'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
for i=1:50
    set(textharm,'position',[gonnaAttack(1)+30,gonnaAttack(2)+70+i]);
    pause(0.015);
end
delete(textharm);
end