function identity(~,~)
clear global t_server t_client
global t_server t_client
button=questdlg('��ѡ���������','���','����','����','����');
if strcmp(button,'����')  % ���һ�����֣���һ���������ж�
    txtouts=ip;
    answers=cell2mat(txtouts(1));
    ports=str2num(cell2mat(txtouts(2)));
    t_server=tcpip(answers,ports,'NetworkRole','server','Timeout',40);
    t_server.InputBuffersize=100000;
    fopen(t_server);  % �򿪷�������ֱ������һ��TCP���Ӳŷ���
    chessWar1;
%     fclose(t_server);
elseif strcmp(button,'����')  % ��Ҷ������֣��ɶ����������ж�
    txtoutc=ip;
    answerc=cell2mat(txtoutc(1));
    portc=str2num(cell2mat(txtoutc(2)));
    t_client=tcpip(answerc,portc,'NetworkRole','client');  % server��IP��ַ
    t_client.OutputBuffersize=100000;
    fopen(t_client);  % ��һ���������������ӣ�ֱ��������ɷ��أ����򱨴�
    chessWar2;
%     fclose(t_client);
end
end