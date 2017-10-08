#coding=utf-8
import sys
reload(sys)
sys.setdefaultencoding( "utf-8" )

'''
import urllib2;
res = urllib2.urlopen('http://blog.leanote.com/qq-alan');
ret = res.read();
print ret;
'''

'''
import re

m = re.findall("abc", "aaaaabcccabcc")
print m
m = re.findall("\d", "abc1ab2c")
print m
m = re.findall("\d\d\d\d", "123abc1234abc")
print m
m = re.findall(r"<div>(.*)</div>", "<div>hello</div>")
print m
m = re.findall(r"<div>(.*)</div>", "<div>hello</div><div>world</div>")
print m
m = re.findall(r"<div>(.*?)</div>", "<div>hello</div><div>world</div>")
print m
'''

'''
#coding: UTF-8
import urllib2
import re
response = urllib2.urlopen('http://blog.leanote.com/qq-alan');
html = response.read();

m = re.findall(r'<div class="title">.*?title="全文">(.*?)</a>', html, re.S);

for t in m:
print t
'''

import re
import requests
from HTMLParser import HTMLParser
import time
import urllib2

def crawl_joke_list(page=1):
    url = "http://www.qiushibaike.com/8hr/page/" + str(page)
    request = urllib2.Request(url)
    request.add_header('User-Agent', 'fake-client')
    response = urllib2.urlopen(request)
    text = response.read().decode("utf-8")
    pattern = re.compile("<div class=\"article block untagged mb15.*?<div class=\"content\">.*?</div>", re.S)
    html_parser = HTMLParser()
    body = html_parser.unescape(text).replace("<br/>", "\n")
    m = pattern.findall(body)
    user_pattern = re.compile("<div class=\"author clearfix\">.*?<h2>(.*?)</h2>", re.S)
    content_pattern = re.compile("<div class=\"content\">(.*?)</div>", re.S)
    for joke in m:
	user = user_pattern.findall(joke)
	output = []
	if len(user) > 0:
	    output.append(user[0])
	    content = content_pattern.findall(joke)
	if len(content) > 0:
	    output.append(content[0].replace("\n", ""))
	    print "\t".join(output)
	    time.sleep(1)

if __name__ == '__main__':
    for i in range(1, 2):
	crawl_joke_list(i)
