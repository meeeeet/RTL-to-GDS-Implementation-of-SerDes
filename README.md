# RTL-to-GDS Implementation of 8-bit SerDes with 8b/10b Encoding Using OpenROAD
This project presents the design and implementation of a high-speed 8-bit Serializer and Deserializer (SerDes) utilizing RTL-to-GDS flow with OpenROAD. The SerDes is designed with 8b/10b encoding capability for robust data transmission. The RTL design is synthesized and optimized for the [ASAP7](https://asap.asu.edu/) PDK, a 7nm FinFET-based process. The implemented SerDes achieves a high data rate of 17.37 Gbps for serialization. At the deserialization stage, an 8b/10b decoder is employed to recover the original 8-bit data at the output, ensuring reliable data retrieval. This project demonstrates a successful integration of advanced RTL design techniques with cutting-edge PDK technology to realize a high-performance SerDes solution.

## Workings
1. The 8-bit latch temporarily stores incoming parallel data, ensuring it aligns with the SerDes clock before further processing.

2. The 8b/10b encoder transforms 8-bit parallel data into 10-bit symbols for transmission, maintaining signal balance and reliability by controlling transitions and ensuring DC balance.([Specs](http://www.latticesemi.com/products/designsoftwareandip/intellectualproperty/referencedesigns/referencedesigns01/8b10bencoderdecoder))

3. In transmission, the Parallel-In Serial-Out (PISO) shift register converts parallel data to serial format for efficient transmission, while the Serial-In Parallel-Out (SIPO) shift register reverses this process during reception, reconstructing the original parallel data stream.

4. At the receiving end, the 8b/10b decoder decodes the received 10-bit symbols back into their original 8-bit data, facilitating error detection and ensuring accurate communication by reversing the encoding process.

<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/img/serdes_blk.png">

## OpenROAD tutorial
### Prerequisites
Before getting started, ensure you have the following prerequisites installed on your system:
- [OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/OpenROAD)

### Configuration

### Results

#### Static Timing Analysis

##### Synopsys Design Constraint(SDC) file:

```
set sdc_version 2.0
set_units -time ps -resistance kOhm -capacitance pF -voltage V -current mA

set clk_name clk
set clk_port_name clk
set clk_period 100
set clk_io_pct 0.2

set clk_port [get_ports $clk_port_name]

create_clock -name $clk_name -period $clk_period $clk_port

set non_clock_inputs [lsearch -inline -all -not -exact [all_inputs] $clk_port]

```
##### Maximum timing analysis (Setup time violation)
```
Startpoint: _261_ (falling edge-triggered flip-flop clocked by clk')
Endpoint: _260_ (falling edge-triggered flip-flop clocked by clk')
Path Group: clk
Path Type: max

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk' (fall edge)
  32.95   32.95   clock network delay (propagated)
   0.00   32.95 v _261_/CLK (DFFLQNx2_ASAP7_75t_SL)
  28.83   61.77 ^ _261_/QN (DFFLQNx2_ASAP7_75t_SL)
   3.62   65.39 v _173_/Y (NAND2x1_ASAP7_75t_SL)
  19.40   84.79 v _174_/Y (OA211x2_ASAP7_75t_SL)
   0.11   84.90 v _260_/D (DFFLQNx1_ASAP7_75t_SL)
          84.90   data arrival time

 100.00  100.00   clock clk' (fall edge)
  32.66  132.66   clock network delay (propagated)
   0.03  132.68   clock reconvergence pessimism
         132.68 v _260_/CLK (DFFLQNx1_ASAP7_75t_SL)
  -5.34  127.35   library setup time
         127.35   data required time
---------------------------------------------------------
         127.35   data required time
         -84.90   data arrival time
---------------------------------------------------------
          42.45   slack (MET)
```

##### Minimum timing analysis (Hold time violation)
```
Startpoint: _272_ (falling edge-triggered flip-flop clocked by clk')
Endpoint: _272_ (falling edge-triggered flip-flop clocked by clk')
Path Group: clk
Path Type: min

  Delay    Time   Description
---------------------------------------------------------
   0.00    0.00   clock clk' (fall edge)
  33.17   33.17   clock network delay (propagated)
   0.00   33.17 v _272_/CLK (DFFLQNx1_ASAP7_75t_SL)
  26.58   59.75 v _272_/QN (DFFLQNx1_ASAP7_75t_SL)
   9.87   69.62 v _151_/Y (OA21x2_ASAP7_75t_SL)
   4.68   74.30 ^ _152_/Y (NOR2x1_ASAP7_75t_SL)
   0.09   74.40 ^ _272_/D (DFFLQNx1_ASAP7_75t_SL)
          74.40   data arrival time

   0.00    0.00   clock clk' (fall edge)
  33.19   33.19   clock network delay (propagated)
  -0.03   33.17   clock reconvergence pessimism
          33.17 v _272_/CLK (DFFLQNx1_ASAP7_75t_SL)
   7.74   40.90   library hold time
          40.90   data required time
---------------------------------------------------------
          40.90   data required time
         -74.40   data arrival time
---------------------------------------------------------
          33.49   slack (MET)
```
##### Maximum operating frequency
```
clk period_min = 57.55 ps 
fmax = 17375.04 MHz (17.37 GHz)
```

#### Power analysis
```
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             3.85e-04   1.12e-05   4.05e-07   3.97e-04  48.3%
Combinational          2.27e-04   1.97e-04   1.00e-06   4.25e-04  51.7%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  6.12e-04   2.08e-04   1.41e-06   8.21e-04 100.0%
                          74.5%      25.3%       0.2%
```

<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/img/heatmap_power.png">

#### Final layout (GDSII file)

<img src="https://github.com/meeeeet/RTL-to-GDS-Implementation-of-16-1-Serializer/blob/main/img/final_gds.png">