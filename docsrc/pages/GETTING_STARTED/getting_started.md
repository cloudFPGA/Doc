# Getting Started

This quick start guide will take you through two "*Hello World*" examples. The first one 
demonstrates the generation of a static bitstream for a single FPGA and its deployment in 
the cloudFPGA infrastructure. The second exhibits the creation of a cluster of FPGAs operated 
with Partial Reconfiguration (PR) of the application roles.  

 


## Selecting The Design Development Flow
When you create a cloudFPGA design you can select between 
[two development flows](https://cloudfpga.github.io/Doc/pages/OVERVIEW/overview.html#cloudfpga-development-flow)
: i) design on your local machine or ii) design on a virtual machine hosted in our data center 
infrastructure.

This getting started procedure will exemplify the generation of a cloudFPGA bitstream on your 
local computer.
❗❗❗:heavy_exclamation_mark: It is therefore assumed that you have the Xilinx Vivado tools (Vivado 
2017.4 or higher) installed and the corresponding licenses for you to use. 
  
ℹ️ 

:info:

between two developments flows: have the choice to develop it with cloudFPGA, The various design flows for developing and deploying FPGA bitstreams of such ROL applications, are presented in the figure below.
As depicted in the overview 
This 
With respect to the cloudFPGA design flows presented in section 2, 
pplications, are presented in the figure below.
[sub-section](./child.md#sub-section)








## Hello-Themisto



























If you are new to _cloudFPGA_, we recommend you start with [STEP-1](#step-1-on-premise-development). 
Otherwise, advanced and [*privileged user*](../INTRODUCTION/introduction.md#user-privilege-layers) 
may start from [STEP-2](#step-2--development-in-the-cloud).

### STEP-1: On-Premise Development

This section only covers the development and the build of your application on a local computer. 
You can visualize the _on-premise_ development flow graphically [here](../INTRODUCTION/imgs/dev-flow.png), 
on the leftmost side of the picture. After you generated you bitstream, refer to section [STEP-3](#step-3--deploy-an-application-in-the-cloud) 
for deploying and executing it the Cloud. 

#### Prerequisites

1) Install the Xilinx development tools (*Vivado 2017.4* or above).

2) Ensure that you have the Xilinx '_UltraScale_ FPGA family installed. 
    * Otherwise, install the family with the menu `Help`/`Add Designs Tools or Devices` of the 
       _Vivado GUI_. 

3) Set the _XILINXD_LICENSE_FILE_ variable with your license server(s) and source the Xilinx 
   setting script:

    ```
      # Set your license server(s) 
      export XILINXD_LICENSE_FILE=xxxxx@yyyyyy.com            

      # Execute the Vivado settings script
      export VIVADO_VERSION=<Your_Installed_Version>   # E.g. 2019.1
      export XILINX_PATH=<Your_Installation_Path>      # E.g. /opt/xilinx
      source ${XILINX_PATH}/Vivado/${VIVADO_VERSION}/settings64.sh
    ```

#### Step-by-Step
4) Change to your work directory and clone the cloudFPGA project _cFp_ThemistoEcho_      
    ```
      git clone git@github.ibm.com:cloudFPGA/cFp_EchoThemisto.git
    ```     

5) To-be-continued
| cFp_Echo           | An application that echos the received UDP and TCP traffic back to the initiator node.   

   
    


### STEP-2 / Development in the Cloud  

####  Prerequisites 



### STEP-3 / Deploy an application in the Cloud 

####  Prerequisites 


## HowTo Partial Reconfiguration


## HowTo ZYC2

