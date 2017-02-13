#!/usr/bin/python
from pattern.en import parsetree, sentiment
import matplotlib.pyplot as plt
import sys
import nltk
from textstat.textstat import textstat
from nltk.tokenize import sent_tokenize
reload(sys)

sys.setdefaultencoding("utf-8")

with open('speeches_obama.txt', 'r') as obama_speech:
	content = obama_speech.read()
	print "Obama\n"
	print "Flesch reading ease (see table): " + str(textstat.flesch_reading_ease(content))
	print "SMOG index (years of education needed to understand a piece of writing): " + str(textstat.smog_index(content))
	print "Grade level based on the Flesch-Kincaid Grade Formula: " + str(textstat.flesch_kincaid_grade(content)) 
	print "Grade level based on the Coleman-Liau Index: " + str(textstat.coleman_liau_index(content))
	print "Grade level based on automated Readability Index: " + str(textstat.automated_readability_index(content))
	print "Grade level based on the Gunning Fog: " + str(textstat.gunning_fog(content))
	print "\n"
	print "Average grade level based on preceding tests (and some other stats included by the authors): " + textstat.text_standard(content)	

	
with open('speeches_trump.txt', 'r') as trump_speech:
	content = trump_speech.read()
	print "Trump\n"
	print "Flesch reading ease (see table): " + str(textstat.flesch_reading_ease(content))
	print "SMOG index (years of education needed to understand a piece of writing): " + str(textstat.smog_index(content))
	print "Grade level based on the Flesch-Kincaid Grade Formula: " + str(textstat.flesch_kincaid_grade(content)) 
	print "Grade level based on the Coleman-Liau Index: " + str(textstat.coleman_liau_index(content))
	print "Grade level based on automated Readability Index: " + str(textstat.automated_readability_index(content))
	print "Grade level based on the Gunning Fog: " + str(textstat.gunning_fog(content))
	print "\n"
	print "Average grade level based on preceding tests (and some other stats included by the authors): " + textstat.text_standard(content)	
	