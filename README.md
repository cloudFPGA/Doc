# cloudFPGA-doc
Documentation and tutorials for cloudFPGA project (this page).

In this page you can find information of hoe to contribute to the documentation of cloudFPGA.

https://pages.github.ibm.com/cloudFPGA/Doc/

Spinx setup
-----------
To generate the spinx based python documentations, you have to setup:
```bash
$ which python3.6
$ virtualenv sphinx -p /usr/bin/python3.6
$ . sphinx/bin/activate
$ pip install -r ./docsrc/requirements.txt
```

Rebuild Documentation
----------------------

```bash
$ . sphinx/bin/activate
$ cd docsrc
$ make clean
$ make github
$ git commit -a -m"rebuild docs"
```
