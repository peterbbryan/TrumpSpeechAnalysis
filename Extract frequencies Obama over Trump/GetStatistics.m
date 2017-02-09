clear all; close all;

[~,RAW_OBAMA,~] = xlsread('obama_words');
[~,RAW_TRUMP,~] = xlsread('trump_words');

unique_tokens_obama = unique(RAW_OBAMA');
obama_frequencies = nan(size(unique_tokens_obama));

for word_ind = 1:numel(unique_tokens_obama)
    word = unique_tokens_obama(word_ind);
    obama_frequencies(1,word_ind) = sum(strcmp(word,RAW_OBAMA));
end

unique_tokens_trump = unique(RAW_TRUMP');
trump_frequencies = nan(size(unique_tokens_trump));

for word_ind = 1:numel(unique_tokens_trump)
    word = unique_tokens_trump(word_ind);
    trump_frequencies(1,word_ind) = sum(strcmp(word,RAW_TRUMP));
end

trump_frequencies = zscore(trump_frequencies);
obama_frequencies = zscore(obama_frequencies);

temp_frequencies = nan(size(unique_tokens_obama));
unique_tokens = unique_tokens_obama;
for word_ind = 1:numel(unique_tokens)
    word = unique_tokens{word_ind};
    
    row = find(strcmp(word, unique_tokens_trump));
    
    if (isempty(row))
        temp_frequencies(:,word_ind) = 0;
    else
        temp_frequencies(:,word_ind) = trump_frequencies(row);
    end
end

trump_frequencies = temp_frequencies;

unique_tokens(trump_frequencies == 0) = [];
obama_frequencies(trump_frequencies == 0) = [];
trump_frequencies(trump_frequencies == 0) = [];

difference = obama_frequencies-trump_frequencies;

[difference, order] = sort(difference);
unique_tokens = unique_tokens(order);

unique_tokens = unique_tokens(difference > 0);
difference = difference(difference > 0);

difference = log(difference+1);

unique_tokens = unique_tokens(end-99:end);
difference = difference(end-99:end);

bar(difference,'FaceColor',[50 55 55]./100,'EdgeColor',[50 55 55]./100);
set(gca,'xtick',1:numel(unique_tokens));

set(gca,'xticklabel',unique_tokens);
xtickangle(45);
xlim([1 100]);
title('Words used more frequently by Obama than Trump (log space, top 100)')
ylabel('Z-score frequency (log)');
xlabel('Word');

