function answer=ip(~,~)
% global answer
prompt = {'������IP��ַ:','������˿�:'};  % ��������
dlgtitle = 'IP��ַ�Ͷ˿�';  % ���ڱ���
dims = [1 50];  % �༭�ֶεĿ�Ⱥ͸߶�
definput = {'',''};  % Ĭ������
answer=inputdlg(prompt,dlgtitle,dims,definput);  % �������������
end