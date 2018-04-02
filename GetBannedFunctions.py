import urllib2
from bs4 import BeautifulSoup
import ssl
import re

ssl._create_default_https_context = ssl._create_unverified_context

url = "https://msdn.microsoft.com/en-us/library/bb288454.aspx"

connection = urllib2.urlopen(url)

htmlText = connection.read();

parsedText = BeautifulSoup(htmlText, "html5lib")

bannedFunctions = parsedText.findAll("td", {"data-th" : "Banned Functions"} )

for s in bannedFunctions:
	text = s.text.replace("Recommended: ", "").replace("\n", "").split(',')
	for function in text:
		print function.replace(" ", "")

connection.close()