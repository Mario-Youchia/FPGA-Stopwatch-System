# FPGA Stopwatch System

FPGA Stopwatch System is a SystemVerilog project for a four-digit stopwatch implemented for an FPGA workflow. The design supports up/down counting behavior, BCD-style digit handling, seven-segment display output, and module-level simulation using ModelSim command scripts.

## Main Features

* SystemVerilog implementation of a stopwatch system
* Up/down counter logic
* Separate counter behavior for 0-5 and 0-9 digit ranges
* Binary-to-BCD helper module
* Four-digit seven-segment display multiplexing
* Clock divider logic
* Quartus project configuration
* ModelSim simulation scripts for key modules

## Main Source Files

* `quartus_project/Stopwatch.sv` - integrated FPGA-facing SystemVerilog source used by the Quartus project.
* `source_modules/Stopwatch/Stopwatch.sv` - modular stopwatch logic for simulation/source review.
* `source_modules/Stopwatch/Counters/Counter5.sv` - counter module for 0-5 digit behavior.
* `source_modules/Stopwatch/Counters/Counter9.sv` - counter module for 0-9 digit behavior.
* `source_modules/Stopwatch/disp_hex_mux.sv` - four-digit seven-segment display multiplexing logic.
* `source_modules/Stopwatch/clkdiv.sv` - clock divider logic.
* `source_modules/BCD/BinBCD.sv` - binary-to-BCD helper module.

## Simulation Scripts

The `.do` files under `modelsim_scripts/` are ModelSim command scripts for common module simulations:

* `BCD.do`
* `Counter5.do`
* `Counter9.do`
* `Stopwatch.do`
* `clkdiv.do`

## Quartus Project

To inspect or rebuild the FPGA-facing project, open:

```text
quartus_project/Stopwatch.qpf
```

The Quartus configuration files are kept together with the integrated top-level SystemVerilog source.

## How to Use

1. Open the Quartus project file:

```text
quartus_project/Stopwatch.qpf
```

2. Review or compile the integrated source:

```text
quartus_project/Stopwatch.sv
```

3. Use the ModelSim `.do` scripts to simulate individual modules or the stopwatch design.

## Limitations

This is a course-level FPGA/SystemVerilog implementation. It is best presented as a digital-design project focused on counters, BCD conversion, display multiplexing, and FPGA workflow rather than as a commercial hardware product.
