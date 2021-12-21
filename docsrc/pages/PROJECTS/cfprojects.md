# Project repository

## About cF Projects

In cloudFPGA, a user application is referred to as a **ROLE**. To be functional in a cF system, 
this ROLE must be integrated with a specific **SHELL**. 
 
The integration of a ROLE along with its associated SHELL into a top-level design (TOP) 
is what constitutes a **cloudFPGA project** which is typically stored as a `cFp` repository of the 
cloudFPGA organization.   

:Info: By convention, we recommend naming a project repository after the project itself while prefixing it with the string "*cFp_*" (e.g. [cFp_Zoo](https://github.com/cloudFPGA/cFp_Zoo)). 
 
## Getting started with a cF project 

If you are new to cloudFPGA, we recommend that you clone or copy an existing `cFp` project
(e.g. [cFp_HelloThemisto](https://github.com/cloudFPGA/cFp_HelloThemisto)) and that you 
start experimenting by modifying or removing its *ROLE*. 

The typical structure of a cF project is a follows:
```
$ tree <cFp_ProjectName>
    cFDK/ (the cloudFPGA development kit as a submodule)
    TOP/  (the toplevel that integrates a SHELL and a ROLE) 
    └──tcl/ (don't touch, is copied from cFDK) 
    └──xdc/ (user added constraints; you add your debug nets here)
    └──hdl/ (HDL version of the toplevel)
       └──top.vhdl
       └── a.s.o. (if custom hdl files for TOP)
    ROLE/ (the user application(s))
    └── role1 (or not, depends on PR, etc.)
    └── role2 (or not, depends on cluster)
    └── a.s.o.
    dcps/ (contains the dcps and bitfiles)
    xpr/ (contains the Vivado project)
    ip/ (contains the IP cores (generated during build))
    Makefile
    env/
    └── setenv.sh (sets the envrionments)
    <possible_addons/>
```





## How to cFCreate

To facilitate the creation of a new project from scratch or to manage and update an existing one, 
we provide you with the **cFCreate** framework. 

To use this framework, you need to clone the [cFCreate](https://github.com/cloudFPGA/cFCreate) 
repository into **\<your-path\>** and setup a virtual environment for it.
```
$ cd <your-path>
$ git clone git@github.com:cloudFPGA/cFCreate.git
$ cd cFCreate/
$ which python3.8
/usr/bin/python3.8
$ virtualenv -p /usr/bin/python3.8 cfenv
$ source cfenv/bin/activate
$ pip install -r requirements.txt
```

From now on, you can create a new empty `cFp` by entering the following command: 
 ```
$ cd <your-path>
$ ./cFCreate new --cfdk-version=latest --git-init <path-to-the-new-project-folder>
```

For more information and more advanced options, please consult the documentation of the 
[cFCreate](https://github.com/cloudFPGA/cFCreate) repository.
   

## How to create a project in the cF organization 

If you want to create a repository in the cF organization, please contact us 
[here](https://github.com/cloudFPGA/Doc/blob/master/imgs/COMING_SOON.md) and we will 
create one for your project to live in *github.com/cloudFPGA*.  
