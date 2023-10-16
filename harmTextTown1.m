function harmTextTown1(~,~)
global harm
textharm=text('string',['-',num2str(harm)],'position',[880,160],...
    'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
for i=1:50
    set(textharm,'position',[880,160+i]);
    pause(0.015);
end
delete(textharm);
end