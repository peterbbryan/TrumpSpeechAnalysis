#!/usr/bin/python

import markovify

# src: https://github.com/jsvine/markovify
with open("trump_speeches.txt") as f:
	text = f.read()

text_model = markovify.Text(text)
for i in range(20):
	print(text_model.make_sentence())