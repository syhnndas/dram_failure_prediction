% matrix_2
% 假设YPred是模型的预测结果，YValidation是验证集的真实标签
% YPred和YValidation需要根据你的实际情况提供
close all; clear;
confusion_matrix = [171,36;49,70];
% 获取类别数量
num_classes = size(confusion_matrix, 1);
 
% 检查混淆矩阵中是否有空白地方（0）
for i = 1:num_classes
    for j = 1:num_classes
        if isnan(confusion_matrix(i, j))
            confusion_matrix(i, j) = 0;
        end
    end
end
 
% 类别名称
class_names = {'Normal', 'Pre-Failure'};
 
% 绘制混淆矩阵,并设置颜色属性
figure;
chart = heatmap(confusion_matrix);
 
% 设置行和列的标签
chart.YDisplayLabels = class_names;
chart.XDisplayLabels = class_names;
 
% 颜色设置
colormap("sky");  % 颜色设置
 
% 字体设置
chart.FontName = 'Times New Roman';  % 将字体设置为Arial Black
chart.FontSize = 20;
ylabel("Predict label");
xlabel("True label");
% 颜色柱反向显示
% colormap(flipud(sky));
 