function harmTextOwn(~,~)
global harmOwn battleType rifle xrifle rider xrider archer xarcher
if battleType==1
    textharmOwn=text('string',['-',num2str(harmOwn)],'position',[rifle.posStore1(xrifle,1)+30,rifle.posStore1(xrifle,2)+70],...
        'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
    for i=1:50
        set(textharmOwn,'position',[rifle.posStore1(xrifle,1)+30,rifle.posStore1(xrifle,2)+70+i]);
        pause(0.015);
    end
    delete(textharmOwn);
elseif battleType==2
        textharmOwn=text('string',['-',num2str(harmOwn)],'position',[rider.posStore1(xrider,1)+30,rider.posStore1(xrider,2)+70],...
        'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
    for i=1:50
        set(textharmOwn,'position',[rider.posStore1(xrider,1)+30,rider.posStore1(xrider,2)+70+i]);
        pause(0.015);
    end
    delete(textharmOwn);
elseif battleType==3
        textharmOwn=text('string',['-',num2str(harmOwn)],'position',[archer.posStore1(xarcher,1)+30,archer.posStore1(xarcher,2)+70],...
        'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
    for i=1:50
        set(textharmOwn,'position',[archer.posStore1(xarcher,1)+30,archer.posStore1(xarcher,2)+70+i]);
        pause(0.015);
    end
    delete(textharmOwn);
end
end