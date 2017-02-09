import csv
import glob
import itertools
import os
import nltk
import sys
reload(sys)

sys.setdefaultencoding("utf-8")

with open("lexicon.txt", "r") as source:
	LEXICON = frozenset(word.strip().lower() for word in source)

with open('speeches.txt', 'r') as content_file:
	content = content_file.read()
	words = nltk.word_tokenize(content)
	words = [word.lower() for word in words]
	words = [word for word in words if (word in LEXICON and not (word == 'speech'))]
		
	with open("obama_words.csv",'w') as word_file:
		for word in words:
			word_file.write(word + "\n")	
