# Counter Verification Suite (UVM) 🔢🛡️

An advanced hardware verification environment built using **SystemVerilog** and the **Universal Verification Methodology (UVM)** to rigorously test and validate a digital counter design module (`counter.v`).

---

## 📁 Repository Structure

The testbench structure conforms strictly to modern UVM standard design guidelines:

```text
├── counter.v            # Design Under Test (DUT) written in Verilog
├── tb_top.sv            # Top-level testbench module (instantiates DUT and Interface)
├── counter_if.sv        # SystemVerilog Interface mapping signals to the DUT
├── counter_pkg.sv       # Package compiling all verification components
├── counter_item.sv      # UVM Sequence Item (defines transactions/constraints)
├── counter_sequence.sv  # UVM Sequences (generates stimulus patterns)
├── counter_driver.sv    # UVM Driver (drives transactions onto the interface pinout)
├── counter_monitor.sv   # UVM Monitor (samples interface signals for scoreboarding)
├── counter_agent.sv     # UVM Agent (encapsulates sequencer, driver, and monitor)
├── counter_env.sv       # UVM Environment (instantiates agents and scoreboards)
├── counter_test.sv      # UVM Test component (configures environment and starts sequences)
└── compile_counter.do   # ModelSim/QuestaSim automation macro script
```

---

## ✨ Features

* **Strict UVM Architecture Compliance:** Well-separated verification layers facilitating component reusability and scalability.
* **Constrained-Random Stimulus:** Driven by transaction-level dynamic sequence items (`counter_item.sv`) to uncover complex boundary conditions.
* **Non-Intrusive Monitoring:** Interface-based signal tapping (`counter_if.sv`) captures runtime states without altering internal DUT circuitry.
* **One-Click Simulation Ready:** Includes a specialized Tcl macro simulation script (`compile_counter.do`) to streamline environment setup, logic compilation, and test execution.

---

## 🛠️ Tooling & Requirements

To compile and execute this verification suite, you need an EDA simulator supporting SystemVerilog and UVM library natively:
* **Siemens EDA / Mentor Graphics:** QuestaSim / ModelSim
* **Synopsys:** VCS
* **Cadence:** Xcelium / Incisive

---

## 🚀 Getting Started

### 1. Installation
Clone the verification workspace repository onto your local system:
```bash
git clone https://github.com
cd counter_verification
```

### 2. Running Simulation (ModelSim / QuestaSim)
Launch your simulator environment terminal window within the project root directory and run the provided macro batch macro script:

```bash
vsim -c -do compile_counter.do
```

*Alternatively, if you are running using a graphic user interface (GUI) inside the workspace console:*
```tcl
do compile_counter.do
```

### 3. Understanding the Verification Flow
1. **`tb_top`** boots up the simulation, instantiates the hardware clock, generates a system reset, and maps the `counter_if` signals to the input/output ports of `counter.v`.
2. The virtual interface configuration object is registered globally across the `uvm_config_db`.
3. **`counter_test`** triggers the custom UVM build/run phase hooks, constructing the `counter_env` and spawning automated transactional packet flows over the sequencer infrastructure.

---

## 🤝 Contributing

Contributions to scale verification coverage, insert self-checking scoreboards, or build functional coverage groups are welcome.
1. Fork the Repository
2. Create your Feature Branch (`git checkout -b feature/AmazingCoverage`)
3. Commit your Extensions (`git commit -m 'Add Functional Coverage metrics'`)
4. Push to the Branch (`git push origin feature/AmazingCoverage`)
5. Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more details.
