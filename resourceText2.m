function resourceText2(~,~)
global resource2 textresource2
if resource2<0
    resource2=0;
end
textresource2=text('string',num2str(resource2),'position',[945,172.5],...
    'FontSize',9,'FontName','Times New Roman','FontWeight','Bold','Color',[1,0.27059,0]);
end