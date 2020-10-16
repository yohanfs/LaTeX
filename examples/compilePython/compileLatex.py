import subprocess
import os
import tempfile
import shutil

current = os.getcwd()
temp = tempfile.mkdtemp()
os.chdir(temp)

f = open('exGlossaries.tex','w')
f.write(tex)
f.close()

proc=subprocess.Popen(['pdflatex','exGlossaries.tex'])
subprocess.Popen(['pdflatex',tex])
proc.communicate()

os.rename('test.pdf',pdfname)
shutil.copy(pdfname,current)
shutil.rmtree(temp)