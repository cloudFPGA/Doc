![Banner for cF](./imgs/banner.png#center)

Welcome to the _cloudFPGA_ organization. This organization hosts a set of repositories and projects related to 
 _cloudFPGA_, a disaggregated data processing proposal based on standalone and network attached FPGAs in cloud
 datacenters.
 
# Table of Contents
1. [About cloudFPGA](#about-_cloudfpga_)
2. [About this GitHub organization](#about-this-_github_-organization)
3. [Documentation](#documentation)
4. [Getting started](#getting-started)
5. [Contributing](#contributing)
6. [Contact and support](#contact-and-support)


# About _cloudFPGA_
The _cloudFPGA (cF)_ proposal is to set the FPGAs free from the traditional CPU-bus attachments and 
 to make make them plentiful in hyperscale datacenters (DC). 
* The first proposition is carried out by disaggregating the FPGAs from the server nodes and by 
  connecting the FPGAs directly to the DC network. 
  ![Network Attached FPGA](./imgs/about1.png#center)
* The second is achieved by turning the FPGAs into standalone network attached compute nodes 
  while densely packing them into DC chassis and racks.
  ![Banner for cF](./imgs/about2.png#center)
 
 
# About this _GitHub_ organization
This Github organization is a central places for hosting _cloudFPGA_ projects and repositories, 
 as well as the _cloudFPGA_ development kit required to develop and deploy hardware 
 accelerated applications on a cluster of standalone network-attached FPGAs in the Cloud.
 The following repositories can be found in the current organization:
 * `[cFDK]` is the  _cloudFPGA Development Kit (cFDK)_. It is contains a framework to help 
    implement your FPGA application on a cF platform.
 * `[cFBuild]` can be used for creating or updating a _cloudFPGA project_ (cFp) based on
    the **_cFDK_**.
 * `[cFp_<ProjectName>]` are a set of cF projects provided here as reference...    
 * `[Doc]` contains the file that you are currently reading. This repository also used to build
    the _cloudFPGA_ documentation which is provided as github pages under the [Documentation](#documentation) section.
 * `[Dox]` is a repository for generating Doxygen-related html static pages for the  **_cFDK_**. 
 
 
# Documentation
The _cloudFPFA_ documentation is provided as github pages at:
 * **https://pages.github.ibm.com/cloudFPGA/Doc/**
 
If you need to re-build and update this documentation, please checkout the file **[BuildDoc.md](./BuildDoc.md)**


# Getting started
Section [FIXME] of the **_cF_** documentation takes you through a step-by-step quick start example. Next, 
please consider cloning and going through one of the following **_cFp_Projects_**:

| cFp_Project        | Description                    
|:-------------------|:---------------------------------------------
| cFp_Echo           | An application that echos the received UDP and TCP traffic back to the initiator node.   
| cFp_Uppercase      | An application that receives a string from a user and returns it back in uppercase. 
| cFp_Triangle       | A triangle communication example between a host and 2 FPGAs. 

# Contributing

# Contact and Support


