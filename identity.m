function identity(~,~)
clear global t_server t_client
global t_server t_client
button=questdlg('请选择您的身份','身份','主机','加入','主机');
if strcmp(button,'主机')  % 玩家一，先手，由一函数控制行动
    txtouts=ip;
    answers=cell2mat(txtouts(1));
    ports=str2num(cell2mat(txtouts(2)));
    t_server=tcpip(answers,ports,'NetworkRole','server','Timeout',40);
    t_server.InputBuffersize=100000;
    fopen(t_server);  % 打开服务器，直到建立一个TCP连接才返回
    chessWar1;
%     fclose(t_server);
elseif strcmp(button,'加入')  % 玩家二，后手，由二函数控制行动
    txtoutc=ip;
    answerc=cell2mat(txtoutc(1));
    portc=str2num(cell2mat(txtoutc(2)));
    t_client=tcpip(answerc,portc,'NetworkRole','client');  % server的IP地址
    t_client.OutputBuffersize=100000;
    fopen(t_client);  % 与一个服务器建立连接，直到建立完成返回，否则报错
    chessWar2;
%     fclose(t_client);
end
end