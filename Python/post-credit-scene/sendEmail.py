#!/usr/bin/env python

import smtplib

sender = 'yudalang@liyang_lab.picb'
receivers = ['yudalang1994@gmail.com','346871663@qq.com']

message = """From: From Person <yudalang@liyang_lab.picb>
To: To Person <yudalang1994@gmail.com>
Subject: SMTP_email

I use python to send a e-mail for you !
"""

try:
   smtpObj = smtplib.SMTP('localhost')
   smtpObj.sendmail(sender, receivers, message)         
   print "Successfully sent email"
except SMTPException:
   print "Error: unable to send email"
