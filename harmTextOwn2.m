function harmTextOwn2(~,~)
global harmOwn2 battleType2 rifle2 xrifle2 rider2 xrider2 archer2 xarcher2
if battleType2==1
    textharmOwn=text('string',['-',num2str(harmOwn2)],'position',[rifle2.posStore2(xrifle2,1)+30,rifle2.posStore2(xrifle2,2)+70],...
        'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
    for i=1:50
        set(textharmOwn,'position',[rifle2.posStore2(xrifle2,1)+30,rifle2.posStore2(xrifle2,2)+70+i]);
        pause(0.015);
    end
    delete(textharmOwn);
elseif battleType2==2
        textharmOwn=text('string',['-',num2str(harmOwn2)],'position',[rider2.posStore2(xrider2,1)+30,rider2.posStore2(xrider2,2)+70],...
        'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
    for i=1:50
        set(textharmOwn,'position',[rider2.posStore2(xrider2,1)+30,rider2.posStore2(xrider2,2)+70+i]);
        pause(0.015);
    end
    delete(textharmOwn);
elseif battleType2==3
        textharmOwn=text('string',['-',num2str(harmOwn2)],'position',[archer2.posStore2(xarcher2,1)+30,archer2.posStore2(xarcher2,2)+70],...
        'FontSize',14,'FontName','Times New Roman','FontWeight','Bold','Color','r');
    for i=1:50
        set(textharmOwn,'position',[archer2.posStore2(xarcher2,1)+30,archer2.posStore2(xarcher2,2)+70+i]);
        pause(0.015);
    end
    delete(textharmOwn);
end
end