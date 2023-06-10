namespace First {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    
    @EntryPoint()
    operation randomizer() : Result{
    //initilize qubits
    use q1 = Qubit();
    use q2 = Qubit();

    //set qubits into superposition
    H(q1);
    H(q2);

    //entangle both qubits
    CNOT(q1, q2);

    //measurement of result (only one measurement is needed because the othe qubit will always have the opposit spin)
    let result = M(q1);
    if result == One { X(q1); }

    //release qubits to be able to reuse them (not the case in this example)
    Reset(q1);
    Reset(q2);

    //Return the result of the measurement.
    return result;
    }
}
