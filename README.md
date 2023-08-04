# RTL to GDS Implementation of 16:1 Serializer in 7nm FinFET Technology
This project showcases the design and implementation of a 16:1 on-chip digital serializer using advanced 7nm FinFET 
technology. The serializer is essential for high-performance System-on-Chip (SoC) designs, enabling efficient and reliable data 
transmission. By leveraging OpenROAD, an automated and open-source RTL to GDS design tool, the serializer achieves 
optimized physical-level performance. Results include a power dissipation of 7.9 mW, a high-speed data transmission rate of 6.8 
Gbps, and occupying only 14% of the chip area. This demonstrates the efficacy of OpenROAD and 7nm FinFET technology, 
providing unmatched performance and integration in on-chip digital serializer designs. 

## Design process
- [RTL Design and Simulation](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#rtl-design-and-simulation)
- [RTL Synthesis](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/results/1_synth.v)
- [Floorplanning](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#floorplanning)
- [Placement](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#placement)
- [Clock Tree Synthesis (CTS)](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#clock-tree-synthesis-cts)
- [Routing](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#routing)
- [Final GDS Layout](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#final-gds-layout)
## Results and Analysis
- [Power Analysis](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#power-analysis)
- [Placement Density Distribution](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#placement-density-distribution)
- [Routing Congestion Analysis](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/README.md#routing-congestion-analysis)


## RTL Design and Simulation
### Logic Design
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/logic_dia%20(1).jpg"
width="550"
height="400">

### Simulation

<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/Waveform1.png">

## RTL Synthesis
- Synthesized verilog file: [1_synth.v](https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/results/1_synth.v)

## Floorplanning
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/floorplan.png"
    width="500"
    height="450">

## Placement
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/placement.png"
    width="500"
    height="450">

## Clock Tree Synthesis (CTS)
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/final_clocks.png"
    width="500"
    height="450">

## Routing
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/route.png"
    width="500"
    height="450">

## Final GDS Layout
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/final_gds.png"
    width="500"
    height="450">

## Results and Analysis
### Power Analysis

<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/power_result.png"
    width="500"
    height="150">

<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/power_dens.png"
    width="500"
    height="450">

### Placement Density Distribution
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/place_dens.png"
    width="500"
    height="450">

### Routing Congestion Analysis
<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/src/img/route_dens.png"
    width="500"
    height="450">
