#!/usr/bin/python
# -*- coding: UTF-8 -*-
 
import sys, getopt, os
 
def main(argv):
   inputfile = ''
   outputfile = ''
   params = ''
   try:
      opts, args = getopt.getopt(argv,"hp:i:o:",["help","params","ifile=","ofile="])

   except getopt.GetoptError:
      print 'ffmpeg.py -i <inputfile> -o <outputfile> -p <params>'
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print 'ffmpeg.py -i <inputfile> -o <outputfile> -p <params>'
         sys.exit()
      elif opt in ("-p", "--params"):
         params = arg
      elif opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg

   print '输入的文件为：', inputfile
   print '输出的文件为：', outputfile
   print '参数为: ', params
   
   cmd = 'docker run --rm=true -v $PWD/input:/input -v $PWD/output:/output atoml/ffmpeg -stats -y -i /input/%s -c:v libx265 -pix_fmt yuv420p10 -t 5 -f mp4 /output/%s' % (inputfile, outputfile) 
   os.popen(cmd)
 
if __name__ == "__main__":
   main(sys.argv[1:])

