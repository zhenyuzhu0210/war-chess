function harmText(~,~)
global harm gonnaAttack
set(gcf,'WindowButtonDownFcn',@blank);  % �����������ڲ��Ź�������ʱ�޷�������������
set(gcf,'KeyPressFcn',@blankkey);  % ��ⰴ�����ڲ��Ź�������ʱ�޷�������������
textharm=text('string',['-',num2str(harm)],'position',[gonnaAttack(1)+30,gonnaAttack(2)+70],...
    'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
for i=1:50
    set(textharm,'position',[gonnaAttack(1)+30,gonnaAttack(2)+70+i]);
    pause(0.015);
end
delete(textharm);
end