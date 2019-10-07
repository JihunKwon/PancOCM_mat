% import MRI measurement excel file and plot it


cd('C:\Users\Kwon\PycharmProjects\PancOCM_ML')
mri_stomach = xlsread('MRI_Measurement.xlsx', 4);

cd('C:\Users\Kwon\Documents\MATLAB\PCA')

%% Unnormalized
i=1;
figure
set(gcf, 'Position', [0 0 450 450], 'Color', 'w')
i=i+1;
plot(mri_stomach(1:9,1),mri_stomach(1:9,i),'DisplayName','s1 exp1','LineStyle','-','Color',[0 0 1],'Marker','o','MarkerFaceColor',[0 0 1]); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach(1:10,i),'DisplayName','s1 exp2','LineStyle','--','Color',[0 0 1],'Marker','o'); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach(1:10,i),'DisplayName','s2 exp1','LineStyle','-','Color',[1 0 0],'Marker','s','MarkerFaceColor',[1 0 0]); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach(1:10,i),'DisplayName','s2 exp2','LineStyle','--','Color',[1 0 0],'Marker','s'); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach(1:10,i),'DisplayName','s3 exp1','LineStyle','-','Color',[0 0.6 0],'Marker','^','MarkerFaceColor',[0 0.6 0]); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach(1:10,i),'DisplayName','s3 exp2','LineStyle','--','Color',[0 0.6 0],'Marker','^'); hold on;

legend({'Subject1 exp1','Subject1 exp2','Subject2 exp1','Subject2 exp2','Subject3 exp1','Subject3 exp2'} ... 
    ,'Location','northwest','FontSize',10);

xlabel('Breath holds');
ylabel('Stomach width (mm)');
ax = gca;
ax.FontSize = 10;
grid on;

export_fig mri_stomach.eps
export_fig mri_stomach.png

%% Normalized
% get average of state0
ave_0 = zeros(6,1);
mri_stomach_norm = zeros(10,6);
for i = 1:6
    ave_0(i,1) = mean(mri_stomach(1:5,i+1));
    mri_stomach_norm(:,i) = mri_stomach(1:10,i+1) / ave_0(i);
end

i=0;
figure
set(gcf, 'Position', [0 0 450 450], 'Color', 'w')
i=i+1;
plot(mri_stomach(1:9,1),mri_stomach_norm(1:9,i),'DisplayName','s1 exp1','LineStyle','-','Color',[0 0 1],'LineWidth',1.2,'Marker','o','MarkerFaceColor',[0 0 1]); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach_norm(1:10,i),'DisplayName','s1 exp2','LineStyle','--','Color',[0 0 1],'LineWidth',1.2,'Marker','o'); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach_norm(1:10,i),'DisplayName','s2 exp1','LineStyle','-','Color',[1 0 0],'LineWidth',1.2,'Marker','s','MarkerFaceColor',[1 0 0]); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach_norm(1:10,i),'DisplayName','s2 exp2','LineStyle','--','Color',[1 0 0],'LineWidth',1.2,'Marker','s'); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach_norm(1:10,i),'DisplayName','s3 exp1','LineStyle','-','Color',[0 0.6 0],'LineWidth',1.2,'Marker','^','MarkerFaceColor',[0 0.6 0]); hold on;
i=i+1;
plot(mri_stomach(1:10,1),mri_stomach_norm(1:10,i),'DisplayName','s3 exp2','LineStyle','--','Color',[0 0.6 0],'LineWidth',1.2,'Marker','^'); hold on;

legend({'Subject1 exp1','Subject1 exp2','Subject2 exp1','Subject2 exp2','Subject3 exp1','Subject3 exp2'} ... 
    ,'Location','northwest','FontSize',10);


xlabel('Breath holds');
ylabel('Relative stomach width');
ax = gca;
ax.FontSize = 10;
grid on;

box on;
export_fig mri_stomach_norm.eps
export_fig mri_stomach_norm.png