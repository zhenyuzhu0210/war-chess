function harmTextTown2(~,~)
global harm2
textharm=text('string',['-',num2str(harm2)],'position',[80,960],...
    'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
for i=1:50
    set(textharm,'position',[80,960+i]);
    pause(0.015);
end
delete(textharm);
end