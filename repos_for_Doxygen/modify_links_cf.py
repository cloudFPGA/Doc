
import pathlib
import os
import shutil
from re import search

repo_organization_url = "https://github.ibm.com/cloudFPGA/"

def replace_markdown_links(full_md_file, link_type, replace_str):
    f1 = open(full_md_file, 'r')
    f2 = open(full_md_file+"_new", 'w')

    replaced = 0
    for s in f1:
        new_s = s
        if search("]\(", s):
            #print("this is a link")
            #  print("The s is:"+s)
            if search(link_type, s):
                #print("before:"+s)
                s2 = s.replace("](", "]("+replace_str)
                s2 = s2.replace(".png", ".png?raw=true")
                s2 = s2.replace(".bmp", ".bmp?raw=true")
                replaced = replaced + 1
                #print("after:"+s2)
            else:
                s2 = s
                #print("NONOOOO avoiding "+str(s))
            new_s = s.replace(str(s), str(s2))
        f2.write(new_s)
    print("INFO: Replaced links of " + link_type + " : "+ str(replaced))
    print("#################")
    f1.close()
    f2.close()
    shutil.copyfile(full_md_file, full_md_file+"_backup")
    shutil.move(full_md_file+"_new", full_md_file)


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
    link_type = ".md"
    replace_markdown_links(full_md_file, link_type, replace_str)

    link_type = ".png"
    replace_markdown_links(full_md_file, link_type, replace_str)

    link_type = ".bmp"
    replace_markdown_links(full_md_file, link_type, replace_str)

    #exit(0)
