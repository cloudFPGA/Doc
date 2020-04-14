
import pathlib
import markdown
import re
from re import search
import os
import shutil

repo_organization_url = "https://github.ibm.com/cloudFPGA/"

def getlinks(string):
    """return a list with markdown links"""
    html = markdown.markdown(string, output_format='html')
    links = list(set(re.findall(r'href=[\'"]?([^\'" >]+)', html)))
    links = list(filter(lambda l: l[0] != "{", links))
    return links

for md_file in pathlib.Path('./').glob('**/*.md'):
    full_md_file = str(pathlib.Path().absolute()) + '/' + str(md_file)
    print("#################\n"+full_md_file+"\n----------------")

    head, tail = os.path.split(str(md_file))
    #print("head is : " + head)
    #print("tail is : " + tail)
    repo = head.split('/')[0]
    #print("repo is : " + repo)
    subdir = "/".join(head.strip("/").split('/')[1:])
    #print("subdir is : " + subdir)
    replace_str = repo_organization_url + repo + "/blob/master/" + subdir + "/"
    #print("replace_str is : " + replace_str)

    f1 = open(full_md_file, 'r')
    f2 = open(full_md_file+"_new", 'w')

    replaced = 0
    for s in f1:
        new_s = s
        if search("]\(", s):
            #print("this is a link")
            mylinks = s
            substring = ".md"
            #  print("The s is:"+s)
            if search(substring, mylinks):
                #print("before:"+mylinks)
                mylinks2 = mylinks.replace("](", "]("+replace_str)
                replaced = replaced + 1
                #print("after:"+mylinks2)
            else:
                mylinks2 = mylinks
                #print("NONOOOO avoiding "+str(mylinks))
            new_s = s.replace(str(mylinks), str(mylinks2))
        #else:
            #print("this is NOT a link")
        #print(new_s, end = '')
        f2.write(new_s)
    print("INFO: Replaced links:" + str(replaced))
    print("#################")
    f1.close()
    f2.close()

    shutil.copyfile(full_md_file, full_md_file+"_backup")
    shutil.move(full_md_file+"_new", full_md_file)

    exit(0)
