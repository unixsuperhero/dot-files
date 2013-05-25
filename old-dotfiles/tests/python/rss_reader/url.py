import urllib2
import MySQLdb
from xml.dom import minidom

#request = urllib2.Request("http://www.redgage.com/blog/rss")
request = urllib2.Request("http://static.demonoid.com/rss/9.117.xml")
opener  = urllib2.build_opener()
output  = opener.open(request).read()
feed    = minidom.parseString(output)

item = feed.getElementsByTagName("item")

for line in item:
	title = link = ""
	for node in line.childNodes:
		if node.nodeType == 1:
			if node.tagName == "title":
				title = node.firstChild.data
			if node.tagName == "category":
				print node.firstChild.data
	quit()

	#print title
