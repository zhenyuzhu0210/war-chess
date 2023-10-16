function resourceText1(~,~)
global resource1 textresource1
if resource1<0
    resource1=0;
end
textresource1=text('string',num2str(resource1),'position',[35,972.5],...
    'FontSize',9,'FontName','Times New Roman','FontWeight','Bold','Color',[1,0.27059,0]);
end