


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  create input file.
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-03-12[Mar-Fri]17-44PM 

bash:

r1tmp='/tmp/USER_temprunner.file'
cat << 'HEREDOC' > $r1tmp
346
123
345
bbb
HEREDOC
#
cat $r1tmp


ref.

filetarg='config/initializers/rails_admin.rb'
ruby $r1tmp $filetarg > $filetarg.tmp
cp $filetarg.tmp $filetarg; rm $filetarg.tmp



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  repl
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-04-17[Apr-Sat]10-17AM 

create input file, see top, then..


pytmp="/tmp/${USER}_temprunner.py"
echo $pytmp
cat << 'HEREDOC' > $pytmp
filetarg='/tmp/USER_temprunner.file'
import re
f = open(filetarg, "r")
for st in f:
    y = re.sub('34', 'ABC', st).rstrip()
    print y
HEREDOC
python $pytmp  




albe@vamp398:~$ python $pytmp
ABC6
123
ABC5
bbb


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  full py - insert before or after
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-04-17[Apr-Sat]09-59AM 


#  create input file, see top, then..



pytmp="/tmp/${USER}_temprunner.py"
echo $pytmp
cat << 'HEREDOC' > $pytmp
import re
r1tmp = '/tmp/USER_temprunner.file'
f = open(r1tmp, "r")
multstr= """after1
  after2
"""
for st in f:
#st = "hellobar"
    m = re.search(r"345",st)
    if m:
        # what is this?  m.group(0)
        print 'before'
        print st,
        print multstr,
    else:
      # add comma to print without newline.
      print st,
HEREDOC
python $pytmp  



albe@vamp398:~$ python $pytmp
346
123
before
345
after1
  after2
bbb



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  if line contains, replace.  (can comment it out)
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-04-17[Apr-Sat]09-59AM 


#  create input file, see top, then..



pytmp="/tmp/${USER}_temprunner.py"
echo $pytmp
cat << 'HEREDOC' > $pytmp
import re
r1tmp = '/tmp/USER_temprunner.file'
f = open(r1tmp, "r")
for st in f:
    m = re.search(r"345",st)
    if m:
        print '# '+st,
    else:
      # add comma to print without newline.
      print st,
HEREDOC
python $pytmp  





albe@vamp398:~$ python $pytmp
346
123
# 345
bbb






=================================================
=================================================










separator.










=================================================
=================================================






notes below..






#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-04-17[Apr-Sat]10-36AM 



    
_____________


python

r1tmp = '/tmp/USER_temprunner.file'
import re
f = open("/tmp/USER_temprunner.file", "r")
for x in f:
  y = re.sub('34|bbb|ccc', 'ABC', x).rstrip()
  print(y)
  # add comma to print without newline.
  # print(y),
# f.close()




fh = open('my_text_file.txt')
for line in fh:
    # in python 2
    # print line
    # in python 3
    print(line)
fh.close()

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-04-17[Apr-Sat]09-48AM 


https://stackoverflow.com/questions/9012008/pythons-re-return-true-if-string-contains-regex-pattern

>>> st = "hello"
>>> m = re.search(r"ba[r|z|d]",st)
>>> if m:
...     m.group(0)
... else:
...   print "no match"
...
no match



pytmp="/tmp/${USER}_temprunner.py"
echo $pytmp
cat << 'HEREDOC' > $pytmp
import re
st = "hellobar"
m = re.search(r"ba[r|z|d]",st)
if m:
    m.group(0)
    y = re.sub('bar', 'ABC', st).rstrip()
    print y
else:
  print "no match"
HEREDOC
python $pytmp




#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-03-12[Mar-Fri]19-25PM 

class.

https://stackoverflow.com/questions/53283718/reading-a-file-line-by-line-in-python

_____________


list

https://stackoverflow.com/questions/3277503/how-to-read-a-file-line-by-line-into-a-list

no. need re sub in list...

import re
r1tmp = '/tmp/USER_temprunner.file'
with open(r1tmp) as f:
    lines = [line.rstrip() for line in f]
    print (lines)
    y= re.sub('345', 'ABC', lines)
    print y 


r1tmp = '/tmp/USER_temprunner.file'
filename=r1tmp
with open(filename) as f:
    content = f.readlines()
    # you may also want to remove whitespace characters like `\n` at the end of each line
    content = [x.strip() for x in content] 
    print content



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-03-12[Mar-Fri]19-25PM 



