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




    information_source INFO: For on-premise development, 
    you will need to have Xilinx tools and licenses available for you to use

    Start a Build Instance first to start your development.

        bulb TIP: This instance does not have to be an F1 instance. You only require an F1 instance to run your AFI's(Amazon FPGA Image) once you have gone through your design build and AFI creation steps.

        information_source INFO: If you need to follow GUI Development flows, please checkout our Developer Resources where we provide Step-By-Step guides to setting up a GUI Desktop.

    Clone the FPGA Developer Kit on your instance. git clone https://github.com/aws/aws-fpga.git

    Follow the quickstarts from the next section.

Quickstarts

Before you create your own AWS FPGA design, we recommend that you go through one of the 
step-by-step Quickstart guides:
Description 	Quickstart 	Next Steps
Software Defined Accelerator Development using Xilinx Vitis 	Vitis hello_world Quickstart 	60+ Vitis examples, Vitis Library Examples
Software Defined Accelerator Development using Xilinx SDAccel 	SDAccel hello_world Quickstart 	60+ SDAccel examples
Custom Hardware Development(HDK) 	HDK hello_world Quickstart 	CL to Shell and DRAM connectivity example, Virtual Ethernet Application using the Streaming Data Engine
IP Integrator/High Level Design(HLx) 	IPI hello_world Quickstart 	IPI GUI Examples

information_source INFO: For more in-depth applications and examples of using High level synthesis, Vitis Libraries, App Notes and Workshops, please refer to our Example List
How Tos
How To 	Description
Migrate Alveo U200 designs to F1 	This application note shows the ease of migrating an Alveo U200 design to F1.
Documentation Overview

Documentation is located throughout this developer kit and the table below consolidates a list of key documents to help developers find information:
Topic 	Document Name 	Description
AWS setup 	Setup AWS CLI and S3 Bucket 	Setup instructions for preparing for AFI creation
Developer Kit 	RELEASE NOTES, Errata 	Release notes and Errata for all developer kit features, excluding the shell
Developer Kit 	Errata 	Errata for all developer kit features, excluding the shell
F1 Shell 	AWS Shell RELEASE NOTES 	Release notes for F1 shell
F1 Shell 	AWS Shell ERRATA 	Errata for F1 shell
F1 Shell 	AWS Shell Interface Specification 	Shell-CL interface specification for HDK developers building AFI
F1 Shell - Timeout and AXI Protocol Protection 	How to detect a shell timeout 	The shell will terminate transactions after a time period or on an illegal transaction. This describes how to detect and gather data to help debug CL issues caused by timeouts.
Vitis 	Debug Vitis Kernel 	Instructions on debugging Vitis Kernel
Vitis 	Create Runtime AMI 	Instructions on creating a runtime AMI when using Xilinx Vitis
Vitis 	XRT Instructions 	Instructions on building, installing XRT with MPD daemon considerations for F1
SDAccel 	Debug RTL Kernel 	Instructions on debugging RTL Kernel with SDAccel
SDAccel 	Create Runtime AMI 	Instructions on creating a runtime AMI when using Xilinx SDAccel
HDK - Host Application 	Programmer View 	Host application to CL interface specification
HDK - CL Debug 	Debug using Virtual JTAG 	Debugging CL using Virtual JTAG (Chipscope)
HDK - Simulation 	Simulating CL Designs 	Shell-CL simulation specification
HDK - Driver 	README 	Describes the DMA driver (XDMA) used by HDK examples and includes a link to an installation guide
AFI 	AFI Management SDK 	CLI documentation for managing AFI on the F1 instance
AFI - EC2 CLI 	copy_fpga_image, delete_fpga_image, describe_fpga_images, fpga_image_attributes 	CLI documentation for administering AFIs
AFI - Creation Error Codes 	create_fpga_image_error_codes 	CLI documentation for managing AFIs
AFI - Power 	FPGA Power, recovering from clock gating 	Helps developers with understanding FPGA power usage, preventing power violations on the F1 instance and recovering from a clock gated slot.
On-premise Development 	Tools, Licenses required for on-premise development 	Guidance for developer wanting to develop AFIs from on-premises instead of using the FPGA Developer AMI
Frequently asked questions 	FAQ 	Q/A are added based on developer feedback and common AWS forum questions
Developer Support

    The Amazon FPGA Development User Forum is the first place to go to post questions, learn from other users and read announcements.
        We recommend joining the AWS forums to engage with the FPGA developer community, AWS and Xilinx engineers to get help.

    You could also file a Github Issue for support. We prefer the forums as this helps the entire community learn from issues, feedback and answers.
        Click the "Watch" button in GitHub upper right corner to get regular updates.

About

Official repository of the AWS EC2 FPGA Hardware and Software Development Kit
Resources
Readme
License
View license
Code of conduct
Code of conduct
Stars
1.2k stars
Watchers
269 watching
Forks
440 forks
Releases 46
Release v1.4.22 Latest
on Oct 8
+ 45 releases
Packages
No packages published
Contributors 47

    @kristopk
    @deeppat
    @AWSGH
    @AWSwinefred
    @AWSNB
    @AWSaalluri
    @AWScccabra
    @AWShimasajj
    @AWScpettey
    @AWSkhanasif
    @AWSrobertmj

+ 36 contributors
Languages

VHDL 84.6%
SystemVerilog 5.9%
V 5.0%
Verilog 3.9%
C 0.2%
Tcl 0.2%
Other 0.2%





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

