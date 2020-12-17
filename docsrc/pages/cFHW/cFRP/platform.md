# IBM cloudFPGA Research Platform
The **IBM cloudFPGA Research Platform (cFRP)** is a cF hardware system that was designed to deploy 
standalone FPGAs in DCs. As the name indicates, it as prototype platform that was developed at 
[*IBM Zurich Research Laboratory*](https://www.zurich.ibm.com/cci/cloudFPGA/) to experiment with 
network-attached FPGAs in the Cloud. 


## Hardware Overview 
The cFRP is a 2U height by 19 inches wide chassis featuring 64 
FPGA instances. The chassis is equipped with two **sleds (S0, S1)**, each sled consisting of 
32 FPGA instances connected to an Intel FM6000 switch via a carrier board. The FM6000 acts as a 
leaf switch that aggregates 32x10GbE links from the FPGAs and exposes them to a higher-level spin 
network via 8x40GbE up-links. This amounts to a bi-sectional bandwidth of 640 Gb/s per sled.

![Overview-of-the-ibm-research-platform](./imgs/cfrp.png)
 
 
## Supported Modules
The cFRP is designed to support different types of FPGA modules. 

The following MODs are currently supported:

* [**FMKU60**](./FMKU60/fmku60.md): A module equipped with a _Xilinx Kintex UltraScale XCKU060_ 
  and 2x8GB of _DDR4_ memory.
 
