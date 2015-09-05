import sqlite3
import xml.etree.ElementTree as ET

conn =  sqlite3.connect('indvl_user')
c = conn.cursor()

tree = ET.parse('IA_Indvl_Feeds1.xml')
root = tree.getroot()

#print root.tag

#for indvl in root[0][0]:
	#print indvl.attrib

info = root.findall('./indvls/indvl/Info')

for item in info:
	print item

#for info in root.iter('info'):
	#print info.attrib