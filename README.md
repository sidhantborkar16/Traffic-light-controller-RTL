# Traffic Light Controller (RTL)

A Verilog-based RTL implementation of a Traffic Light Controller using a Moore Finite State Machine (FSM). This project is being developed in a structured, phase-by-phase approach, covering the complete RTL design flow from requirement analysis to verification.

## Project Overview

The Traffic Light Controller manages two intersecting roads:

- North–South (NS)
- East–West (EW)

The controller ensures safe traffic movement by controlling the red, yellow, and green lights for each direction while following a predefined timing sequence.

The design also supports:
- Emergency vehicle priority
- Pedestrian crossing requests
- Synchronous reset
- Timer-based state transitions

## Features

- Moore FSM architecture
- 8-state traffic light sequence
- Parameterized state encoding
- Timer-controlled state transitions
- Emergency override support
- Pedestrian request handling
- Modular RTL design
- Verilog HDL implementation

## Developement Flow 

🚧 This project is currently under development.

|  Phase | Module / Task                        | Concepts Covered                             | Status |
| :----: | ------------------------------------ | -------------------------------------------- | :----: |
|  **1** | Project Requirement Analysis         | Understanding Specifications                 |    DONE   |
|  **2** | Traffic Signal Timing Analysis       | Real-world Traffic Logic                     |    DONE   |
|  **3** | FSM Fundamentals                     | Moore vs Mealy FSM                           |    DONE   |
|  **4** | Define Inputs, Outputs & Constraints | System Specification                         |    DONE   |
|  **5** | State Identification                 | State Decomposition                          |    DONE   |
|  **6** | State Encoding                       | Binary Encoding, Parameters                  |    DONE   |
|  **7** | **State Diagram Design**             | FSM Visualization                            |    DONE   |
|  **8** | **State Transition Table**           | Present State → Next State                   |    DONE   |
|  **9** | **Output Truth Table**               | State → Traffic Light Mapping                |    DONE   |
| **10** | Overall RTL Architecture             | Block Diagram & Data Flow                    |    DONE   |
| **11** | Timer Module Design                  | Counter Design                               |    DONE   |
| **12** | Timer Testbench                      | Independent Verification                     |    DONE   |
| **13** | State Register Design                | Sequential Logic, D Flip-Flops               |    DONE   |
| **14** | State Register Testbench             | State Storage Verification                   |    DONE   |
| **15** | Next-State Logic                     | Combinational FSM Logic                      |    ⬜   |
| **16** | Output Logic                         | Moore Output Decoder                         |    ⬜   |
| **17** | Emergency Priority Logic             | Priority Decision Logic                      |    ⬜   |
| **18** | Pedestrian Request Logic             | Request Handling                             |    ⬜   |
| **19** | Top Module Integration               | RTL Integration                              |    ⬜   |
| **20** | Complete Testbench                   | Functional Verification                      |    ⬜   |
| **21** | Waveform Analysis                    | GTKWave Debugging                            |    ⬜   |
| **22** | Corner Case Testing                  | Reset, Multiple Requests, Timing             |    ⬜   |
| **23** | Documentation                        | State Diagram, Timing Diagram, Block Diagram |    ⬜   |
| **24** | GitHub Repository                    | README, Project Structure                    |    ⬜   |
| **25** | LinkedIn Project Post                | Portfolio Showcase                           |    ⬜   |

## Directory Structure

```text
traffic-light-controller-rtl/
│
├── docs/          # Project documentation
├── rtl/           # Verilog RTL source files
├── tb/            # Testbench
├── sim/           # Simulation outputs
├── images/        # Figures and diagrams (to be added)
├── README.md
└── LICENSE
```

## Planned FSM States

| State | Description |
|--------|-------------|
| S0 | North-South Green |
| S1 | North-South Green + Pedestrian |
| S2 | North-South Yellow |
| S3 | North-South Yellow + Pedestrian |
| S4 | East-West Green |
| S5 | East-West Green + Pedestrian |
| S6 | East-West Yellow |
| S7 | East-West Yellow + Pedestrian |

## Inputs

| Signal | Description |
|--------|-------------|
| clk | System clock |
| reset | Synchronous reset |
| emergency_NS | Emergency request for North-South |
| emergency_EW | Emergency request for East-West |
| pedestrian_request | Pedestrian crossing request |
| time_done | Indicates completion of the current state's timer |

## Outputs

| Signal | Description |
|--------|-------------|
| NS_red | North-South Red Light |
| NS_yellow | North-South Yellow Light |
| NS_green | North-South Green Light |
| EW_red | East-West Red Light |
| EW_yellow | East-West Yellow Light |
| EW_green | East-West Green Light |

## Design Methodology

The project follows a structured RTL design methodology:

1. Requirement Analysis
2. Functional Specification
3. Input/Output Definition
4. State Identification
5. State Encoding
6. FSM Design
7. RTL Coding
8. Testbench Development
9. Functional Verification
10. Documentation

## Tools

- Verilog HDL
- ModelSim / QuestaSim (planned)
- GTKWave (planned)
- Git & GitHub

## Future Work

- Complete RTL implementation
- Develop self-checking testbench
- Generate simulation waveforms
- Add timing diagrams
- Add synthesis support
- FPGA implementation (optional)

## License

This project is intended for learning and educational purposes.