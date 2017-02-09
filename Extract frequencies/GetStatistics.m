clear all; close all;

[~,RAW_TRUMP,~] = xlsread('trump_words');
[~,~,RAW_SUBTLEX] = xlsread('SUBTLEXusExcel2007.xlsx');

unique_tokens = unique(RAW_TRUMP');

variable_names = RAW_SUBTLEX(1,:);
freq_table = cell2table(RAW_SUBTLEX(2:end,:),'VariableNames',variable_names);

trump_frequencies = nan(1,numel(unique_tokens));
general_frequencies = nan(1,numel(unique_tokens));

freq_table.FREQcount = zscore(freq_table.FREQcount);

for word_ind = 1:numel(unique_tokens)
    word = unique_tokens(word_ind);
    trump_frequencies(1,word_ind) = sum(strcmp(word,RAW_TRUMP));
    
    row = find(strcmp(word, freq_table.Word));
    if (isempty(row))
        general_frequencies(:,word_ind) = 0;
    else
        general_frequencies(:,word_ind) = freq_table.FREQcount(row);
    end
end

trump_frequencies = zscore(trump_frequencies);

unique_tokens(general_frequencies == 0) = [];
trump_frequencies(general_frequencies == 0) = [];
general_frequencies(general_frequencies == 0) = [];

difference = trump_frequencies-general_frequencies;

[difference, order] = sort(difference);
unique_tokens = unique_tokens(order);

unique_tokens = unique_tokens(difference > 0);
difference = difference(difference > 0);
bar(log(difference+1),'FaceColor',[50 55 55]./100,'EdgeColor',[50 55 55]./100);
set(gca,'xtick',1:numel(unique_tokens));
set(gca,'xticklabel',unique_tokens);
xtickangle(45);


title('Words used more frequently by Trump than SUBTLEXus (log space)')
ylabel('Z-score frequency (log)');
xlabel('Word');



%unique_tokens = [unique_tokens(1:20) unique_tokens(end-19:end)];
%difference = [difference(1:20) difference(end-19:end)];
