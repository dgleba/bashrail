

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-03-12[Mar-Fri]17-44PM 

bash:

r1tmp='/tmp/USER_temprunner.file'
cat << 'HEREDOC' > $r1tmp
346
123
345

HEREDOC
#
cat $r1tmp


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
    y= re.sub('34', 'ABC', lines)
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



