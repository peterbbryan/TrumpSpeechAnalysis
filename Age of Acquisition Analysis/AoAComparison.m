clear all; close all;

[~,RAW_TRUMP,~] = xlsread('trump_words.xls');
[~,RAW_OBAMA,~] = xlsread('obama_words.xls');

[~,~,RAW_AoA] = xlsread('AoA_ratings_Kuperman_et_al_BRM');

AoA_table = cell2table(RAW_AoA(2:end,:),'VariableNames',RAW_AoA(1,:));

ages_trump = nan(size(RAW_TRUMP));
dunnos_trump =  nan(size(RAW_TRUMP));
for word_ind = 1:numel(RAW_TRUMP)
    word = RAW_TRUMP(word_ind);
    if (strcmp(word,AoA_table.Word) == 0)
        ages_trump(word_ind) = -1;
        dunnos_trump(word_ind) = -1;
    else
        ages_trump(word_ind) = AoA_table.RatingMean{strcmp(word,AoA_table.Word)};
        dunnos_trump(word_ind) = AoA_table.Dunno(strcmp(word,AoA_table.Word));
    end
end

ages_trump(ages_trump < 0) = [];
dunnos_trump(dunnos_trump < 0) = [];

subplot(2,1,1); hold on;
hist(ages_trump,50);
set(get(gca,'child'),'FaceColor',[50 55 55]./100,'EdgeColor',[50 55 55]./100);
xlabel('Average age of acquisition in years');
ylabel('Token count');
title('Distribution of Trump word age of acquision');
plot([mean(ages_trump) mean(ages_trump)], ylim,'Color','r');
legend(['Mean age: ' num2str(mean(ages_trump))]);

ages_obama = nan(size(RAW_OBAMA));
dunnos_obama = nan(size(RAW_OBAMA));
for word_ind = 1:numel(RAW_OBAMA)
    word = RAW_OBAMA(word_ind);
    if (strcmp(word,AoA_table.Word) == 0)
        ages_obama(word_ind) = -1;
        dunnos_obama(word_ind) = -1;
    else
        ages_obama(word_ind) = AoA_table.RatingMean{strcmp(word,AoA_table.Word)};
        dunnos_obama(word_ind) = AoA_table.Dunno(strcmp(word,AoA_table.Word));
    end
end

ages_obama(ages_obama < 0) = [];
dunnos_obama(dunnos_obama < 0) = [];

subplot(2,1,2); hold on;
hist(ages_obama,50);
set(get(gca,'child'),'FaceColor',[50 55 55]./100,'EdgeColor',[50 55 55]./100);
xlabel('Average age of acquisition in years');
ylabel('Token count');
title('Distribution of Obama word age of acquision');
plot([mean(ages_obama) mean(ages_obama)], ylim,'Color','r');
legend(['Mean age: ' num2str(mean(ages_obama))]);


figure;

subplot(2,1,1); hold on;
hist(dunnos_trump,100);
set(get(gca,'child'),'FaceColor',[50 55 55]./100,'EdgeColor',[50 55 55]./100);
title('Distribution of Trump word familiarity (respondents who knew word)');
ylabel('Token count');
xlabel('Fraction');
plot([mean(dunnos_trump) mean(dunnos_trump)], ylim,'Color','r');
legend(['Mean fraction: ' num2str(mean(dunnos_trump))]);

subplot(2,1,2); hold on;
hist(dunnos_obama,100);
set(get(gca,'child'),'FaceColor',[50 55 55]./100,'EdgeColor',[50 55 55]./100);
title('Distribution of Obama word familiarity (respondents who knew word)');
ylabel('Token count');
xlabel('Fraction');
plot([mean(dunnos_obama) mean(dunnos_obama)], ylim,'Color','r');
legend(['Mean fraction: ' num2str(mean(dunnos_obama))]);
