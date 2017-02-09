#!/usr/bin/python
from pattern.en import parsetree, sentiment
import matplotlib.pyplot as plt
import sys
import nltk
from nltk.tokenize import sent_tokenize
reload(sys)

sys.setdefaultencoding("utf-8")

with open('speeches_obama.txt', 'r') as obama_speech:
	content = obama_speech.read()
	sentences = sent_tokenize(content)
	sentiments_obama = [sentiment(s) for s in sentences]
	
with open('speeches_trump.txt', 'r') as trump_speech:
	content = trump_speech.read()
	sentences = sent_tokenize(content)
	sentiments_trump = [sentiment(s) for s in sentences]

obama_polarity = [polarity for (polarity, subjectivity) in sentiments_obama]
plt.hist(obama_polarity)

plt.title("Obama polarity analysis")
plt.xlabel("Polarity")
plt.ylabel("Number of sentences")

plt.show()

trump_polarity = [polarity for (polarity, subjectivity) in sentiments_trump]
plt.hist(trump_polarity)

plt.title("Trump polarity analysis")
plt.xlabel("Polarity")
plt.ylabel("Number of sentences")

plt.show()

obama_subjectivity = [subjectivity for (polarity, subjectivity) in sentiments_obama]
plt.hist(obama_subjectivity)

plt.title("Obama subjectivity analysis")
plt.xlabel("Subjectivity")
plt.ylabel("Number of sentences")

plt.show()

trump_subjectivity = [subjectivity for (polarity, subjectivity) in sentiments_trump]
plt.hist(trump_subjectivity)

plt.title("Trump subjectivity analysis")
plt.xlabel("Subjectivity")
plt.ylabel("Number of sentences")

plt.show()


# polarity and subjectivity
# with open('speeches_trump.txt','r') as trump_speech:
# polarity (positive negative) and subjectivity (objective subjective).

