function answer=ip(~,~)
% global answer
prompt = {'请输入IP地址:','请输入端口:'};  % 输入内容
dlgtitle = 'IP地址和端口';  % 窗口标题
dims = [1 50];  % 编辑字段的宽度和高度
definput = {'',''};  % 默认输入
answer=inputdlg(prompt,dlgtitle,dims,definput);  % 接受输入的内容
end