![Banner for cF](./imgs/banner.png)

Welcome to **_cloudFPGA_**. This organization hosts a set of repositories and projects related to the **_cloudFPGA 
 Research Platform_**, a disaggregated data processing platform based on standalone and network attached FPGAs in
 the Cloud.
 
 
# Table of Contents
1. [About cloudFPGA](#about-_cloudfpga_)
2. [About this GitHub Organization](#about-this-_github_-organization)
3. [Documentation](#documentation)
4. [Getting Started](#getting-started)
5. [Contributing](#contributing)
6. [Contact and Support](#contact-and-support)


# About _cloudFPGA_
The _cloudFPGA (cF)_ proposal is to promote FPGAs to become 1st class-citizens in datacenters (DC)
 by setting the FPGAs free from the traditional CPU-bus attachments and by making them plentiful in
 modern hyperscale DCs. 
* The first proposition is carried out by disaggregating the FPGAs from the server nodes and by 
  connecting the FPGAs directly to the DC network. As a result, FPGAs can communicate with other 
  CPUs and FPGAs in the DC network with low latency and high bandwidth .
  ![Bus-attached vs Network-attached FPGAs](./imgs/about-cf-1.png)
* The second is achieved by turning the FPGAs into standalone network attached FPGAs while densely
  packing them into DC chassis and racks. From that prospect, FPGAs become autonomous and 1st class-compute
  nodes that can be reached anywhere in the DC via their IP address. 
  ![How-to-make-FPGAs-plentiful-in-DC](./imgs/about-cf-2.png)
 
For users to experiment, design and build hardware accelerated applications with _cloudFPGA_, we 
 provide a **_cloudFPGA Development Kit (cFDK)_** and we grant free access to instances of our 
 **_cloudFPGA Research Platform (cFRP)_** in the Cloud.

## Overview of the Development Flow

A **_cloudFPGA_** application is referred to as a **_Role_** and is typically deployed using _Partial 
 Reconfiguration_ over the DC network. The various design flows for developing and deploying the _partial 
 bitstream_ of such an application are presented in the figure below.  
 * the leftmost situation depicts a user working on its local **_desktop_** to develop his application and later 
   deploy it on a single _cloudFPGA_ instance. In this scenario, the user's desktop is expected to supervise
   the FPGA accelerator and to feed it with appropriate data and commands.    
 * the middle case shows a user developing on a **_Virtual Machine (VM)_** hosted in the Cloud and later 
   deploying the same application on multiple _cF_ instances. Obviously, the preferred way to manage these 
   duplicated _cF_ instances is to use the same or similar _VM_. 
 * the rightmost columns exemplifies a user who is deploying multiple VMs as well as multiple clusters of
   FPGAs in the Cloud.


    [TODO - Add a picture that supports the text of the development flow section]

            Warning: The **_cFDK_** is only available for Linux operating systems.


 
# About this _GitHub_ Organization
This Github organization is a central places for hosting _cloudFPGA_ projects and repositories, 
 as well as the _cloudFPGA_ development kit required to build and deploy hardware 
 accelerated applications on a cluster of standalone network-attached FPGAs in the Cloud.
 The following repositories can be found in the current organization:
 * `[cFDK]` is the  _cloudFPGA Development Kit (cFDK)_. It is contains a framework to help 
    implement your FPGA application on a **_cF_** platform.
 * `[cFBuild]` can be used for creating or updating a _cloudFPGA project_ (cFp) based on
    the **_cFDK_**.
 * `[cFp_<ProjectName>]` are a set of cF projects provided here as reference [TODO].    
 * `[Doc]` contains the file that you are reading. This repository is also used to build
    the _cloudFPGA_ documentation which is provided as github pages under the [Documentation](#documentation) section.
 * `[Dox]` is a repository for generating Doxygen-related html static pages for the  **_cFDK_**. 
 
 
# Documentation
The _cloudFPFA_ documentation is provided as github pages at:
 * **https://pages.github.ibm.com/cloudFPGA/Doc/**
 
If you need to re-build and update this documentation, please checkout the file **[BuildDoc.md](./BuildDoc.md)**


# Getting Started
Section [FIXME] of the **_cF_** documentation takes you through a step-by-step quick start example. Next, 
please consider cloning and going through one of the following **_cFp_Projects_**:

| cFp_Project        | Description                    
|:-------------------|:---------------------------------------------
| cFp_Echo           | An application that echos the received UDP and TCP traffic back to the initiator node.   
| cFp_Uppercase      | An application that receives a string from a user and returns it back in uppercase. 
| cFp_Triangle       | A triangle communication example between a host and 2 FPGAs. 

# Contributing

# Contact and Support


