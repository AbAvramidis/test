#!/usr/bin/python

import threading

def printit():
  threading.Timer(8.0, printit).start()
  print "Hello, World!"

printit()
