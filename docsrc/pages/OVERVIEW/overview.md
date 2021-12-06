
## Overview of _cloudFPGA_ 

The **cloudFPGA (cF)** proposal is to promote FPGAs to become 1st class-citizens in **datacenters
(DC)** by setting the FPGAs free from the traditional CPU-bus attachments and by making them 
plentiful in modern hyperscale DCs. 
* The first proposition is carried out by disaggregating the FPGAs from the server nodes and by 
  connecting the FPGAs directly to the DC network. As a result, FPGAs can communicate with other 
  CPUs and FPGAs in the DC network with low latency and high bandwidth .
  ![Bus-attached vs Network-attached FPGAs](imgs/about-cf-1.png)
* The second is achieved by turning the FPGAs into standalone network attached FPGAs while densely
  packing them into DC chassis and racks. From that prospect, FPGAs become autonomous and 1st class-compute
  nodes that can be reached anywhere in the DC via their IP address. 
  ![How-to-make-FPGAs-plentiful-in-DC](imgs/about-cf-2.png)
 
### cloudFPGA Service Architecture

In the cloud computing universe, a **CPU Instance** is a hardware resource (such as a server or a 
virtual machine) combined with the image of an operating system (such as _Linux_ or _Windows_). 
Next, different types of CPU instances are offered in the Cloud based on varying hardware capabilities 
such as clock frequency, #cores, memory size, computing power, etc. Finally, when deploying a workload 
on the Cloud, users select the CPU instance that best matches the requirements of their application.
 
The cloud service architecture of cloudFPGA is comparable to a cloud service hosting traditional 
servers and virtual machines when considering the following case of correlation:
* in cF, the equivalent of the CPU-based hardware resource is an _FPGA device_ and its surrounding 
  board components. We refer to such an FPGA card as an **FPGA module (MOD)**. 
* in cF, the equivalent of the OS image is a _bitstream_ that contains the custom interfaces and
  run-time logic to host and run a workload. We refer to such a design as a *Shell*. 
 
As a result, the counter part of a CPU instance is an FPGA Instance and we can draw the following 
parallels:

|                 |                             |
|-----------------|-----------------------------| 
|**CPU_Instance** |= **Hw_Resource + OS_Image** |
|**CPU_Cluster**  |= **N * CPU_Instances**      |
|**FPGA_Instance**|= **FPGA_Module + Shell**    |
|**FPGA_Cluster** |= **N * FPGA_Instances**     |

  
### cloudFPGA Development Flow

A cloudFPGA application is referred to as a **Role (ROL)** and it is typically deployed using 
**Partial Reconfiguration (PR)** over the DC network. The various design flows for developing and 
deploying _bitstreams_ of such ROL applications are presented in the figure below.  
 * the leftmost situation depicts a user working on its local **desktop** to develop his application 
   and later deploy it on a single cloudFPGA instance (represented here as a little _yellow_ square 
   box at the bottom of the figure). In this _on-premise_ scenario, the user's desktop is expected 
   to supervise the FPGA instance and to feed it with appropriate data and commands.    
 * the middle case shows a user developing on a **Virtual Machine (VM)** hosted in the Cloud and 
   later deploying the same application on multiple cF instances. Obviously, the preferred way to 
   manage these duplicated cF instances is to use that same VM or a similar one in the Cloud. 
 * the rightmost columns exemplifies a user who is deploying **multiple VMs** as well as **multiple 
   clusters of FPGAs** in the Cloud.
   
![Overview-of-the-development-flow](imgs/dev-flow.png)

### cloudFPGA Research Platform (cFRP)

The **cloudFPGA Research Platform (cFRP)** is a 2U height by 19 inches wide chassis featuring 64 
FPGA instances. The chassis is equipped with two **sleds (S0, S1)**, each sled consisting of 
32 FPGA instances connected to an Intel FM6000 switch via a carrier board. The FM6000 acts as a 
leaf switch that aggregates 32x10GbE links from the FPGAs and exposes them to a higher-level spin 
network via 8x40GbE up-links. This amounts to a bi-sectional bandwidth of 640 Gb/s per sled.

Next, a **cloudFPGA Infrastructure** consists of multiple such cFRMs assembled into numerous DC racks.
 
![Overview-of-the-research-platform](../cFHW/cFRP/imgs/cfrp1.png)
 
Note that knowledge of the cFRP is not required for developing with cloudFPGA. The only concept that 
a user must grasp, is that IP-based switching and routing among FPGAs and CPU servers provide DC-wide 
end-to-end connectivity and flexibility. 

However, the above cFRP details might be relevant to advanced users who seek ultra low-latency and 
who may want to deploy their cluster on FPGAs which are spatially close in a sled, a chassis or 
a rack.  

### cloudFPGA Development Kit (cFDK)

A cloudFPGA application builds on the design pattern referred to as **Shell Role 
Architecture (SRA)**. This design separates the platform-specific parts (i.e. _Shell_) from the 
application-specific parts (i.e. _Role_) to increase the re-usability and to isolate the two parts. 

* The **Shell (SHL)** contains all necessary I/O components, the run-time modules and the network stack 
 that hooks the FPGA to the DC network. It further abstracts all these hardware components by exposing 
 standard _AXI interfaces_ to the user. From a computer operating system perspective, the SHL can be 
 seen as the conceptual counterpart of the kernel space.

* The **Role (ROL)** is the application-specific part of the FPGA logic. It embeds the user's custom 
 application and can be assimilated to a CPU application executed in user space. 

cloudFPGA is designed to support multiple combinations of shell-role architectures on various 
[FPGA instances (MOD)](#cloudfpga-service-architecture). Once a designer has decided for a _MOD_ and
a _SHL_ to run his _ROL_, it is the purposes of the **cloudFPGA Development Kit (cFDK)** to assemble
the tuple _{MOD, SHL, ROL}_ into a so-called **cloudFPGA Project (cFp)**.     
[TEST-FMKU60](https://github.ibm.com/cloudFPGA/Doc/blob/master/docsrc/pages/cFHW/cFRP/FMKU60/fmku60.md)

The cFDK [repository](https://github.ibm.com/cloudFPGA/cFDK/) contains source 
code, documentation, simulation and all the build scripts that are necessary to create such a 
cloudFPGA project. 

#### User Privilege Layers
Depending on the commitment sought by the user, the cFDK offers two kind of development experiences 
characterized by different levels of protection.

* **common users** are unprivileged users who use the development kit to build their custom 
  hardware accelerated application, generate an FPGA bitstream and run it on a cloudFPGA instance.
* **privileged users** are granted the right to modify an existing shell or to create one with new
  features. This status must be requested and authorized by the cF team.  
 
Warning: The cFDK is only available for **Linux** operating systems.

