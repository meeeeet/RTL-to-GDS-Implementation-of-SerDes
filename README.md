# RTL to GDS Implementation of 32-bit SerDes in 7nm FinFET Technology
This project presents the design and implementation of a 32-bit SerDes (Serializer/Deserializer) using the [OpenROAD flow](https://github.com/The-OpenROAD-Project) and a [ASAP7](https://asap.asu.edu/) PDK, a 7nm FinFET technology. The aim is to utilize the open-source OpenROAD tools and an advanced 7nm process to reduce power and area of the SerDes while achieving a high data transmission speed. The circuit is described in RTL using Verilog and synthesized to a netlist with the 7nm standard cell library. Physical design and placement and routing are performed using the OpenROAD flow to generate the full layout. The use of 7nm FinFET enables reduction in transistor geometry for higher density and lower power. A transmission speed of 10Gbps is achieved demonstrating the performance enabled by the 7nm process. The OpenROAD flow provides a fully open-source RTL to GDSII design flow using state-of-the-art EDA techniques. The generated layout demonstrates a complete RTL to GDS implementation of a high-speed 32-bit SerDes circuit enabled by the OpenROAD flow and 7nm FinFET process. This project provides valuable experience in open-source EDA flows and design techniques for nanometer scale VLSI.


## Overview of SerDes
- SerDes (Serializer/Deserializer) converts data between serial and parallel interfaces
- Serialization takes parallel data and transmits sequentially on a fast serial link
- Deserialization receives the serial stream and converts back to parallel
- High-speed serial links essential for chip-to-chip communication
- Multi-gigabit SerDes enables interconnects like PCIe, USB, SATA
- Fast serialization and deserialization done with dedicated mixed-signal circuits

<img src="https://www.design-reuse.com/news_img/20050602_genesys2.gif">


## RTL Simulation
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/img/rtl_waveform.png">

## Final Layout

### Layout of Serializer
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/img/ser_final.png" 
    width=500 height=500>

### Layout of Deserializer
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/img/des_final.png" 
    width=500 height=500>



## Power and Performance
### Serializer
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/img/ser_analysis.png">

### Deserializer
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/img/des_analysis.png">
