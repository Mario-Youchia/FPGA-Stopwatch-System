# FPGA Stopwatch System

FPGA Stopwatch System is a SystemVerilog digital-design project for a four-digit stopwatch implemented through an FPGA-oriented workflow. The design combines cascaded digit counters, BCD-style digit handling, seven-segment display multiplexing, Quartus project configuration, and ModelSim simulation scripts.

## Preview

![Full stopwatch simulation](public/images/projects/fpga-stopwatch-system/fpga-stopwatch-full-simulation.png)

The full stopwatch waveform shows the clock, reset, counting mode, four cascaded digit outputs, and rollover-related internal clock signals.

![Cascade rollover simulation](public/images/projects/fpga-stopwatch-system/fpga-stopwatch-cascade-rollover-simulation.png)

The cascade rollover view focuses on the moment where `Q1` rolls over and advances `Q2`, which is the key timing behavior of the stopwatch counter chain.

![Counter9 simulation](public/images/projects/fpga-stopwatch-system/fpga-stopwatch-counter9-simulation.png)

The Counter9 waveform follows the course testbench behavior: reset starts high, then the counter increments through the 0-9 digit range and rolls over.

![Counter5 simulation](public/images/projects/fpga-stopwatch-system/fpga-stopwatch-counter5-simulation.png)

The Counter5 waveform verifies the 0-5 digit range used for the limited digit positions in the stopwatch.

![Display multiplexer simulation](public/images/projects/fpga-stopwatch-system/fpga-stopwatch-display-mux-simulation.png)

The display multiplexer waveform shows the digit-select state, selected hex input, active `an` output, and seven-segment `sseg` pattern.

![BCD simulation](public/images/projects/fpga-stopwatch-system/fpga-stopwatch-bcd-simulation.png)

The BCD waveform follows the original BCD testbench input sequence and shows the corresponding ones/tens outputs.

## Main Features

* SystemVerilog implementation of an FPGA stopwatch
* Cascaded 0-9 and 0-5 digit counters
* Counter rollover propagation between digit positions
* Binary-to-BCD helper module
* Four-digit seven-segment display multiplexing
* Quartus project configuration
* ModelSim `.do` scripts for simulation
* Module-level testbenches for the BCD, counter, and stopwatch logic

## Technical Overview

The integrated Quartus-facing source is:

```text
quartus_project/Stopwatch.sv
```

The modular source files are under:

```text
source_modules/
```

The stopwatch connects four digit counters in sequence. The first and third digits use `Counter9`, while the second and fourth digits use `Counter5`. Each counter's rollover behavior provides the timing event for the next digit, allowing the displayed stopwatch value to advance across multiple digit positions.

The display logic uses `clkdiv` and `disp_hex_mux`. The clock divider produces slower timing behavior, while the display multiplexer selects one of four digit values and maps the selected value to the `sseg` seven-segment output pattern. The project also includes `BinBCD`, which converts a 4-bit binary value into ones and tens digits.

## How to Run / Review

1. Open the Quartus project:

```text
quartus_project/Stopwatch.qpf
```

2. Review the integrated top-level source:

```text
quartus_project/Stopwatch.sv
```

3. Review the modular implementation under:

```text
source_modules/Stopwatch/
source_modules/BCD/
```

4. Use the `.do` scripts under `modelsim_scripts/` to simulate the BCD module, counter modules, clock divider, and stopwatch module.

## Limitations

This is a course-level FPGA/SystemVerilog implementation. It is best presented as a digital-design project focused on counters, BCD conversion, display multiplexing, source organization, and FPGA workflow rather than as a fully polished commercial hardware product.
