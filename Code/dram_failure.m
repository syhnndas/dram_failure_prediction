%% 雷达图
recall = 79.36;
pre = 75.88;
f1 = 2*recall*pre/(pre+recall);


X=randi([2,8],[4,7])+rand([4,7]);
RC=radarChart(X,'Type','Patch');
RC=RC.draw();
RC.legend();
 
colorList=[78 101 155;
          138 140 191;
          184 168 207;
          231 188 198;
          253 207 158;
          239 164 132;
          182 118 108]./255;
for n=1:RC.ClassNum
    RC.setPatchN(n,'FaceColor',colorList(n,:),'EdgeColor',colorList(n,:))
end


% X = [74.03,72.33,75.21,73.74;
%     78.66,77.19,76.13,76.66;
%     83.33,77.25,76.61,76.93;
%     82.10,79.36,75.88,77.58];
figure;
X = [
71.23	75.43	68.59	71.85 ;
79.65	76.43	70.32	73.25;
69.87	66.78	72.12	69.35 ;
70.33	69.18	75.64	72.27 ;
82.30 	77.23	76.22	76.72 ;
81.60 	79.73	74.88	77.23 ;]

RC=radarChart(X);
RC.PropName={'Accuracy','Recall','Precision','F1-score'};
RC.ClassName={'DF','DF+SHAP','AF','AF+SHAP','DF+AF','DF+AF+SHAP'};
RC.RLim=[66,83];
RC.RTick=[66:4:83];

RC=RC.draw();
RC.legend();

%% tsne图
% --在t_SNEmain里
%% RF、XGBoost、KAN
clear; clc;
recall = 77.84;
pre = 79.92;
f1 = 2*recall*pre/(pre+recall);

% acc recall pre f1
rf = [82.17,74.85,78.55,76.65];
xgboost = [79.91,77.84,79.92,78.86];
kan = [81.60,79.73,74.88,77.23];

figure;
b = bar([rf; xgboost; kan]);
xticklabels(["RF","XGBoost","KAN"]);
ylim([70,86]); ylabel('Value(%)');

text(b(1).XEndPoints,b(1).YEndPoints,string(b(1).YData),'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
text(b(2).XEndPoints,b(2).YEndPoints,string(b(2).YData),'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
text(b(3).XEndPoints,b(3).YEndPoints,string(b(3).YData),'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
text(b(4).XEndPoints,b(4).YEndPoints,string(b(4).YData),'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
legend(["Accuracy","Recall","Precision","F1-score"]);
box off;


