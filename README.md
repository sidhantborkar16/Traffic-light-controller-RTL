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

## Project Status

🚧 This project is currently under development.

Current Progress:
- [x] Requirement Analysis
- [x] Input/Output Definition
- [x] State Definition
- [x] State Encoding
- [x] FSM Design
- [ ] RTL Implementation
- [ ] Testbench Development
- [ ] Functional Simulation
- [ ] Documentation
- [ ] Future Enhancements

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