
# cloudFPGA Hardware (cFHW)

A cF system integrates several FPGAs at the scale of a [rackmount unit](https://en.wikipedia.org/wiki/Rack_unit)
(a.k.a. _chassis_, _drawer_ or _blade_) or the entire rack itself. Whatever the system size and the 
assembly means, every FPGA of a cF system must come with a network stack (e.g. _TCP/IP_) and must
be able to hook itself to a **datacenter (DC)** network (e.g. _Ethernet_). 

The **cloudFPGA Hardware (cFHW)** defines all the physical parts making up such a cF system. It 
encompasses every hardware components including semiconductor devices, circuit boards, back-planes, 
cooling, power supply, etc. 

Such a cloudFPGA Hardware is expected to support numerous FPGAs types on various FPGA cards. In cF 
terminology, an FPGA card is referred to as a **FPGA Module (MOD)**. 

The following cloudFPGA hardware platforms are currently supported:
* [IBM cloudFPGA Research Platform](./cFRP/platform.md)
* [YNI cloudFPGA System XYZ](./YOU_NAME_IT/system_xyz.md)
