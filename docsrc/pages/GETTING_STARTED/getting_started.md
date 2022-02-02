# Getting Started

This quick start guide will take you through two "*Hello World*" examples. The first one 
demonstrates the generation of a static bitstream for a single FPGA and its deployment in 
the **cloudFPGA** (cF) infrastructure. The second exhibits the creation of a cluster of FPGAs operated 
with **Partial Reconfiguration** (PR) of the application roles. 

Both examples can be cloned, synthesized, placed and routed on your local computer. 
However, you will need to connect to our cloudFPGA infrastructure via a VPN client if you want to 
test your generated bitstreams on a standalone network-attached FPGA. 

:Info: To get access to the cF infrastructure, you must request a cloudFPGA account by registering 
[here](https://github.com/cloudFPGA/Doc/tree/master/imgs/COMING_SOON.md).   

## How to Monolithic

If you are new to cloudFPGA, we recommend  you start with the deployment of a single FPGA and you 
get yourself a first experience with the network attachment paradigm.  
 
This can be achieved with the project [cFp_HelloKale](https://github.com/cloudFPGA/cFp_HelloKale) 
which demonstrates the generation of a static bitstream for a cloudFPGA instance and its 
deployment in the cF infrastructure.

### Overview

The project builds on the shell [Kale](https://github.com/cloudFPGA/cFDK/blob/main/DOC/Kale.md) 
which is a shell with minimalist support for accessing the hardware components of the FPGA 
instance, and a role that implements a set of TCP and UDP loopback mechanisms for echoing the 
incoming traffic and forwarding it back to its emitter. 

This setup corresponds to an FPGA server implementing a unique UDP and TCP echo service. 
The FPGA accepts connections on port `8803` and echoes every incoming lines back to the client 
(using the carriage-return/line-feed sequence as line separator). The resulting traffic scenario 
is shown in the following figure.

![Setup-of-the cFp_HelloKale project](imgs/Fig-HelloKale-Setup.png)        

### Selecting The Design Development Flow

When you create or clone a cloudFPGA design you can opt to design on your local machine or design 
on a virtual machine hosted in our data center infrastructure 
([as mentioned here](https://cloudfpga.github.io/Doc/pages/OVERVIEW/overview.html#cloudfpga-development-flow)).

:Info: This getting started procedure will exemplify the generation of a cloudFPGA bitstream on your local computer. It is therefore assumed that you have the *Xilinx Vivado* tools installed and the corresponding licenses for you to use. However, note that the following quick start is only compatible with the *Vivado* versions **2017.4** to **2020.1** (included).

### Quick Trial

This quickstart demonstrates the essentials steps to build, deploy and test a monolithic  
*Hello World* example. The idea is to walk the user through these steps without going into details 
and explanations, but focusing on the workflow. For more information and a detailed step-by-step 
tutorial, please visit the project  [cFp_HelloKale](https://github.com/cloudFPGA/cFp_HelloKale).

```
    $ SANDBOX=`pwd`     # (a short for your working directory)
```

Step-1: Clone, setup and generate bitstream
```
    $ cd ${SANDBOX}
    
    $ git clone --recursive https://github.com/cloudFPGA/cFp_HelloKale.git
    $ cd cFp_HelloKale
    $ source env/setenv.sh
    $ make monolithic
    <cloudFPGA> ################################################################################
    <cloudFPGA> ##  DONE WITH BITSTREAM GENERATION RUN 
    <cloudFPGA> ################################################################################
```
:Info: It takes ~90 minutes to generate the bitstream.

Step-2: Setup a cloudFPGA Support Package (cFSP) for this project
```
    $ cd ${SANDBOX}
    
    $ git clone https://github.com/cloudFPGA/cFSP.git
    $ cd cFSP
    $ which python3     # (we recommend python 3.6 or higher) 
    /usr/bin/python3
    
    $ virtualenv -p /usr/bin/python3 cfenv
    $ source cfenv/bin/activate
    $ pip install -r requirements.txt
``` 

Step-3: Add your cloudFPGA credentials
```
    $ cd ${SANDBOX}/cFSP
    
    $ ./cfsp user load --username=<YOUR_USERNAME> --password=<YOUR_PASSWORD> --project=<YOUR_PROJECTNAME>
```
:Info: The cloudFPGA credentials consist of `<YOUR_USERNAME>`, `<YOUR_PASSWORD>` and `<YOUR_PROJECTNAME>`. These were provided to you when you registered. 

Step-4: Upload the generated bitstream
```
    $ cd ${SANDBOX}/cFSP
    
    $ ./cfsp image post --image_file=${SANDBOX}/cFp_HelloKale/dcps/4_topFMKU60_impl_default_monolithic.bit
``` 
:Attention: Please write down the image `id` returned by the server for use in the next step (e.g. '74462cd5-20e3-4228-a47d-258b7e5e583a').

Step-5: Request a cloudFPGA instance
```
    $ cd ${SANDBOX}/cFSP
           
    $ ./cfsp instance post --image_id=<id>  # (e.g. ./cfsp instance post --image_id=74462cd5-20e3-4228-a47d-258b7e5e583a)
```
:Attention: Please write down the `role_ip` (e.g. '10.12.200.8') and the `instance_id` (e.g. '28') returned by the server for later use.

Step-6: Connect with cloudFPGA instance over TCP and UDP  
```
    $ ping -c 4 <role_ip>       # (check if your cF instance is reachable on the network)
    
    $ which nc                  # (check if 'netcat' is installed)
    nc is /bin/nc
    
    $ nc <role_ip> 8803         # (e.g. nc 10.12.200.8 8803)
    Hello Kale
    Hello Kale
    $ Ctrl-C
```
:Info: The above netcat (a.k.a 'nc') command establishes a TCP connection between your computer and the cloudFPGA instance on the port number 8803, and lets you enter arbitrary text on the console. After you hit `Enter`, the text is echoed back by the cloudFPGA instance and is displayed in the same console. You can repeat this several times or end the connection with `Ctrl-C`.
```   
    $ nc <role_ip> -u 8803      # (e.g. nc 10.12.200.8 -u 8803)
    Hello world
    Hello world
    $ Ctrl-C
```
:Info: The above netcat command establishes a UDP connection between your computer and the cloudFPGA instance on the port number 8803. Enter arbitrary text on the console and close the connection with `Ctrl-C`.

Step-7: Clean-up by deleting the instance and the image (optional).
```
    $ cd ${SANDBOX}/cFSP
    
    $ ./cfsp instance delete <instance_id>  # (e.g. ./cfsp instance delete 28)
    
    $ ./cfsp image delete <id>              # (e.g. ./cfsp image delete 74462cd5-20e3-4228-a47d-258b7e5e583a)
```

## How to Partial Reconfiguration

For the second *Hello-world* example, we suggest you to experiment with the deployment of a cluster 
of FPGAs.

This can be achieved with the project [cFp_HelloThemisto](https://github.com/cloudFPGA/cFp_HelloThemisto) 
which demonstrates the generation of a set of partial bitstreams intended for a cluster of 
FPGAs. This cluster is then deployed and its FPGAs are reconfigured via the TCP/IP network of the 
data center.

### Overview

The project builds on the shell [Themisto](https://github.com/cloudFPGA/cFDK/blob/main/DOC/Themisto.md) 
which is a shell with enhanced routing support and a set of roles that implement TCP and a UDP 
forwarding services to the next node in the cluster. 

The setup of this FPGA cluster can be thought as a micro-service architecture in which a few 
loosely coupled FPGAs operate together to achieve a common application goal. In this case, the 
first FPGA of the cluster accepts connections on port `2718` and forwards every incoming lines to 
the next FPGA in the chain. This goes on for every other FPGA in the chain until the last one 
passes the received line back to the host client. The resulting traffic scenario is shown in the 
following figure.

The resulting traffic scenario for a cluster of two FPGAs and one CPU is shown in the following 
figure.

![Setup-of-the cFp_HelloThemisto project](imgs/Fig-HelloThemisto-Setup.png)

### Selecting The Design Development Flow

This second quickstart example let you generate the FPGA bitstreams of the cluster on your 
computer again, but this time you won't be able to access the cluster without connecting to the 
cloudFPGA infrastructure via VPN. To get such an access granted, you need to request a cloudFPGA 
account [here](https://github.com/cloudFPGA/Doc/tree/master/imgs/COMING_SOON.md).  

:Info: It is also assumed that you have the *Xilinx Vivado* tools installed and the corresponding licenses for you to use. However, note that the following quick start is only compatible with the *Vivado* versions **2019.2** to **2020.1** (included).

### Quick Trial

Similar to the monolithic example, this second quickstart demonstrates the essentials steps to build, 
deploy and test a cluster of FPGAs without going into details and explanations. For more information 
and a detailed step-by-step tutorial, please visit the project 
[cFp_HelloThemisto](https://github.com/cloudFPGA/cFp_HelloThemisto).
```
    $ SANDBOX=`pwd`         # (a short for your working directory)
```

Step-1: Clone and setup your environment
```
    $ cd ${SANDBOX}
    
    $ git clone --recursive https://github.com/cloudFPGA/cFp_HelloThemisto.git
    $ cd ${SANDBOX}/cFp_HelloThemisto
    $ source env/setenv.sh
``` 

Step-2: Setup a cloudFPGA Support Package (cFSP) for this project
```
    $ cd ${SANDBOX}
    
    $ git clone https://github.com/cloudFPGA/cFSP.git
    $ cd ${SANDBOX}/cFSP
    $ which python3     # (we recommend python 3.6 or higher) 
    /usr/bin/python3
    
    $ virtualenv -p /usr/bin/python3 cfenv
    $ source cfenv/bin/activate
    $ pip install -r requirements.txt
``` 

Step-3: Add your cloudFPGA credentials
```
    $ cd ${SANDBOX}/cFSP
    $ ./cfsp user load --username=<YOUR_USERNAME> --password=<YOUR_PASSWORD> --project=<YOUR_PROJECTNAME>
    
    $ cd ${SANDBOX}/cFp_HelloThemisto
    $ cp ${SANDBOX}/cFSP/user.json ./user.json
```
:Info: The cloudFPGA credentials consist of `<YOUR_USERNAME>`, `<YOUR_PASSWORD>` and `<YOUR_PROJECTNAME>`. These were provided to you when you registered. 

Step-4: Retrieve latest static Shell and generate partial bitstreams for the cluster
```
    $ cd ${SANDBOX}/cFp_HelloThemisto
    
    $ ./sra update-shell
    $ ./sra config use-role "msg-ring-app"          # (activate 1st role)
    $ ./sra build pr                                # (takes ~40 minutes)
    <cloudFPGA> ################################################################################
    <cloudFPGA> ##  DONE WITH BITSTREAM GENERATION RUN 
    <cloudFPGA> ################################################################################
    
    $ ./sra config use-role "invertcase-ring-app"   # (activate 2nd role)
    $ ./sra build pr                                # (takes ~40 minutes)
    <cloudFPGA> ################################################################################
    <cloudFPGA> ##  DONE WITH BITSTREAM GENERATION RUN 
    <cloudFPGA> ################################################################################                                
```

Step-5: Upload the generated bitstreams  
```
    $ cd ${SANDBOX}/cFp_HelloThemisto

    $ ./${SANDBOX}/cfsp image post-app-logic --image_file=${SANDBOX}/cFp_HelloThemisto/dcps/4_topFMKU60_impl_msg-ring-app_pblock_ROLE_partial.bin
    $ ./${SANDBOX}/cfsp image post-app-logic --image_file=${SANDBOX}/cFp_HelloThemisto/dcps/4_topFMKU60_impl_invercase-ring-app_pblock_ROLE_partial.bin
``` 
:Attention: Please write down the two image `id` returned by the server for use in the next step (e.g. '7891e291-8847-4302-9b07-248c4feefd69' and 'f23b8025-7beb-4662-8d73-30563593ffbe).

Step-6: Request a cloudFPGA cluster

:Note: To be able to create a cluster and one or more virtual machines (VM) in the cF infrastructure, 
you must own a cloudFPGA account. See registration details [here](https://github.com/cloudFPGA/Doc/tree/master/imgs/COMING_SOON.md).  
```
    $ cd ${SANDBOX}/cFp_HelloThemisto
  
    $ ./${SANDBOX}/cfsp cluster post --image_id=<IMAGE_ID_1> --image_id=<IMAGE_ID_2> --node_ip=<YOUR_VM_IP>  

        # (e.g. ./${SANDBOX}/cfsp cluster post --image_id=7891e291-8847-4302-9b07-248c4feefd69 
        #                                      --image_id=f23b8025-7beb-4662-8d73-30563593ffbe --node_ip=<YOUR_cF_VM_IP> )
``` 
:Attention: Please write down the two `role_ip` (e.g. '10.12.200.73' and '10.12.200.74') and the `cluster_id` (e.g. '244') returned by the server for later use.

Step-7: Connect with the VM of the cF cluster, ping and test the cluster

Open a 1st terminal and type in the following commands:
```
    $ ssh <YOUR_USERNAME>@<YOUR_cF_VM_IP>
    $ ping -c 4 <role_ip_1>    # (e.g. ping -c 4 10.12.200.73)
    $ nc   <role_ip_1> 2718    # (e.g. nc        10.12.200.73 2718)
    Hello Themisto
    How are you?
    $ Ctrl-C
```

Open a 2nd terminal and type in the following commands:
```    
    $ ssh <YOUR_USERNAME>@<YOUR_cF_VM_IP>
    $ ping -c 4 <role_ip_2>    # (e.g. ping -c 4 10.12.200.74)
    $ nc -l 2718
    Hello Themisto
    How are you?
    $ Ctrl-C
 ```
:Info: The 1st netcat command establishes a TCP connection between your cloudFPGA VM and the 1st FPGA of the cluster, while the 2nd netcat opens a connection between the 2nd FPGA of the cluster and the cloudFPGA VM. This lets you enter arbitrary text on the 1st terminal and it will be echoed back by the cloudFPGA cluster in the 2nd terminal after you hit `Enter`. You can repeat this several times or end the two connections with `Ctrl-C` in each terminal.

Step-7: Clean-up by deleting the cluster and the image (optional).
```
    $ cd ${SANDBOX}/cFp_HelloThemisto
    
    $ ./${SANDBOX}/cfsp cluster delete <cluster_id>  # (e.g. ./${SANDBOX}/cfsp cluster delete 244)
    $ ./${SANDBOX}/cfsp image delete <id_1>          # (e.g. ./${SANDBOX}/cfsp image delete 7891e291-8847-4302-9b07-248c4feefd69)
    $ ./${SANDBOX}/cfsp image delete <id_2>          # (e.g. ./${SANDBOX}/cfsp image delete f23b8025-7beb-4662-8d73-30563593ffbe)
```

