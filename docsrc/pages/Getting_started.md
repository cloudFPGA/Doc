# Getting Started

## Quick Start Guide
This quick start guide will take you through simple "_Hello World_" applications to get you started.

If you are new to _cloudFPGA_, we recommend you start with [*STEP-1-FIXME*](). otherwise, advanced 
and [*privileged user*](OVERVIEW/Overview.md#user-privilege-layers) may start from [*STEP-2-FIXME*]().

### STEP-1: On-Premise Development

This section only covers the development and the build of your application on a local computer. 
You can visualize the _on-premise_ development flow graphically [here](TODO), on the leftmost side
of the picture. After you generated you bitstream, refer to section [STEP-?](TODO) for deploying 
and executing it the Cloud. 

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

   
    


### STEP-2 / In the Cloud Development 

####  Prerequisites 

