// Benchmark was created by MQT Bench on 2024-04-03
//
//
// TKET version: 1.26.0
// Used Gate Set: ['rzz', 'rz', 'ry', 'rx', 'measure', 'barrier']

OPENQASM 2.0;
include "qelib1.inc";

qreg q[11];
creg c[11];
creg meas[11];
rz(1.74951171875*pi) q[0];
rz(3.7490234375*pi) q[1];
rz(1.748046875*pi) q[2];
rz(0.24609375*pi) q[3];
rz(0.2421875*pi) q[4];
rz(0.234375*pi) q[5];
rz(2.21875*pi) q[6];
rz(0.1875*pi) q[7];
rz(1.625*pi) q[8];
rz(3.5*pi) q[9];
rx(0.49902343750000067*pi) q[10];
rx(0.5*pi) q[0];
rx(1.5*pi) q[1];
rx(1.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(3.5*pi) q[8];
rx(3.5*pi) q[9];
rz(0.5*pi) q[10];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(1.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(1.5*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rzz(0.25*pi) q[10],q[9];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(1.9972378987993404*pi) q[9];
rz(0.5*pi) q[10];
rx(0.25000599203725166*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5019530882338958*pi) q[9];
rz(0.5*pi) q[10];
rzz(0.12500000000000036*pi) q[10],q[8];
rz(0.5*pi) q[9];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[8];
rx(0.5*pi) q[10];
rz(0.5*pi) q[8];
rz(3.0*pi) q[10];
rx(0.5*pi) q[8];
rx(1.0*pi) q[10];
rz(0.5*pi) q[8];
rz(0.5*pi) q[10];
rzz(0.25*pi) q[9],q[8];
rx(0.5*pi) q[10];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[10];
rzz(0.06250000000000011*pi) q[10],q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[7];
rz(1.994476005553723*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[7];
rx(0.2500239672467217*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(1.0*pi) q[7];
rz(0.5039059558960843*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(3.5*pi) q[7];
rz(0.5*pi) q[8];
rx(1.5*pi) q[10];
rzz(0.03125000000000012*pi) q[10],q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[10];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[10];
rx(0.5*pi) q[6];
rzz(0.12500000000000036*pi) q[9],q[7];
rx(0.5*pi) q[10];
rz(3.0*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[9];
rz(1.0*pi) q[10];
rx(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(1.0*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rzz(0.015625000000000087*pi) q[10],q[5];
rz(0.5*pi) q[7];
rx(0.5*pi) q[9];
rx(0.5*pi) q[5];
rzz(0.25*pi) q[8],q[7];
rz(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[5];
rzz(0.06250000000000011*pi) q[9],q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[10];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(1.5*pi) q[5];
rx(0.5*pi) q[6];
rz(1.9889536739965958*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(1.0*pi) q[6];
rx(0.2500958545553517*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rzz(0.00781250000000009*pi) q[10],q[4];
rx(3.5*pi) q[6];
rz(0.5078101479654681*pi) q[7];
rz(0.5*pi) q[8];
rx(1.5*pi) q[9];
rx(0.5*pi) q[4];
rzz(0.03125000000000012*pi) q[9],q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[10];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rzz(0.12500000000000036*pi) q[8],q[6];
rx(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[4];
rz(3.0*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[8];
rz(1.0*pi) q[9];
rx(1.5*pi) q[10];
rzz(0.003906250000000566*pi) q[10],q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[8];
rz(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[3];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(3.0*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(3.5*pi) q[8];
rz(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(3.0*pi) q[3];
rzz(0.015625000000000087*pi) q[9],q[4];
rz(0.5*pi) q[6];
rz(0.5*pi) q[8];
rz(3.0*pi) q[10];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rzz(0.25*pi) q[7],q[6];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(1.0*pi) q[10];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rzz(0.06250000000000011*pi) q[8],q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[9];
rx(3.5*pi) q[10];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(1.5*pi) q[4];
rz(0.5*pi) q[5];
rz(3.9779206271203744*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rx(0.5*pi) q[5];
rx(0.2503831876464327*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rzz(0.0019531250000001717*pi) q[10],q[2];
rzz(0.00781250000000009*pi) q[9],q[3];
rz(1.0*pi) q[5];
rz(0.5156062091678554*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(3.5*pi) q[5];
rz(0.5*pi) q[6];
rx(1.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rzz(0.03125000000000012*pi) q[8],q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(1.0*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(1.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rzz(0.12500000000000036*pi) q[7],q[5];
rx(0.5*pi) q[8];
rx(1.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(3.0*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[7];
rz(1.0*pi) q[8];
rz(0.5*pi) q[10];
rzz(0.0009765624999997782*pi) q[10],q[1];
rx(1.5*pi) q[2];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[1];
rzz(0.003906250000000566*pi) q[9],q[2];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[10];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(3.0*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(1.0*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(3.0*pi) q[1];
rx(0.5*pi) q[2];
rzz(0.015625000000000087*pi) q[8],q[3];
rz(0.5*pi) q[5];
rz(0.5*pi) q[7];
rx(0.5*pi) q[9];
rz(1.0*pi) q[10];
rx(2.5*pi) q[1];
rz(3.0*pi) q[2];
rx(0.5*pi) q[3];
rzz(0.25*pi) q[6],q[5];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(3.0*pi) q[9];
rz(0.5*pi) q[10];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[10];
rx(1.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rzz(0.06250000000000011*pi) q[7],q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[10];
rzz(0.0004882812499998891*pi) q[10],q[0];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(1.5*pi) q[9];
rx(0.5*pi) q[0];
rzz(0.0019531250000002936*pi) q[9],q[1];
rz(0.5*pi) q[2];
rx(1.5*pi) q[3];
rz(0.5*pi) q[4];
rz(2.477867382591887*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[10];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[4];
rx(3.477920691217207*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[10];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rzz(0.00781250000000009*pi) q[8],q[2];
rz(1.0*pi) q[4];
rz(3.7492317773344572*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(3.5*pi) q[4];
rz(0.5*pi) q[5];
rx(1.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(3.5*pi) q[10];
rx(0.5*pi) q[0];
rz(3.0*pi) q[1];
rz(0.5*pi) q[2];
rzz(0.03125000000000012*pi) q[7],q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[8];
rz(3.0*pi) q[9];
rx(0.5*pi) q[10];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.00048828125*pi) q[10];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rzz(0.12500000000000036*pi) q[6],q[4];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(3.0*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[6];
rz(1.0*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rzz(0.0009765624999997782*pi) q[9],q[0];
rzz(0.003906250000000012*pi) q[8],q[1];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(3.0*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(3.5*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(1.0*pi) q[0];
rz(3.0*pi) q[1];
rzz(0.015625000000000087*pi) q[7],q[2];
rz(0.5*pi) q[4];
rz(0.5*pi) q[6];
rz(3.0*pi) q[8];
rz(3.5*pi) q[9];
rx(0.5*pi) q[0];
rx(2.5*pi) q[1];
rx(0.5*pi) q[2];
rzz(0.25*pi) q[5],q[4];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(3.0*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5009765625000002*pi) q[9];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rzz(0.06250000000000011*pi) q[6],q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(1.0*pi) q[7];
rz(0.5*pi) q[8];
rzz(0.0019531250000001106*pi) q[8],q[0];
rx(1.5*pi) q[2];
rz(0.5*pi) q[3];
rz(3.912713693872452*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(2.5*pi) q[7];
rx(0.5*pi) q[0];
rx(0.5*pi) q[3];
rx(0.2560589377472227*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[0];
rz(1.0*pi) q[3];
rz(0.5613288578636249*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[0];
rx(3.5*pi) q[3];
rz(0.5*pi) q[4];
rx(1.5*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(3.5*pi) q[0];
rzz(0.007812500000000317*pi) q[7],q[1];
rzz(0.03125000000000012*pi) q[6],q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(3.5*pi) q[8];
rx(1.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(1.5*pi) q[8];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.001953125*pi) q[8];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rzz(0.12500000000000036*pi) q[5],q[3];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[1];
rz(3.0*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rz(1.0*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(2.5*pi) q[7];
rzz(0.0039062499999998885*pi) q[7],q[0];
rz(0.5*pi) q[1];
rz(3.0*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rz(3.0*pi) q[6];
rx(0.5*pi) q[0];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(3.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[0];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(1.0*pi) q[0];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(1.75*pi) q[0];
rz(0.5*pi) q[2];
rzz(0.25*pi) q[4],q[3];
rz(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[0];
rzz(0.015624999999999957*pi) q[6],q[1];
rzz(0.06250000000000053*pi) q[5],q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(3.5*pi) q[7];
rx(1.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(1.5*pi) q[7];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.00390625*pi) q[7];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(3.831326703306546*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(1.2733918281059688*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(3.0*pi) q[6];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.38366099737642284*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(3.0*pi) q[6];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rzz(0.03125000000000049*pi) q[5],q[1];
rzz(0.12500000000000036*pi) q[4],q[2];
rx(1.5*pi) q[3];
rx(1.5*pi) q[6];
rzz(0.007812500000000113*pi) q[6],q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(1.0*pi) q[2];
rz(0.5*pi) q[4];
rz(3.0*pi) q[5];
rx(0.5*pi) q[6];
rz(3.0*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[4];
rx(3.0*pi) q[5];
rz(3.0*pi) q[6];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(1.5*pi) q[2];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[0];
rzz(0.06249999999999994*pi) q[4],q[1];
rzz(0.25*pi) q[3],q[2];
rx(0.5*pi) q[5];
rz(3.5*pi) q[6];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(1.5078125*pi) q[6];
rzz(0.015624999999999781*pi) q[5],q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[0];
rz(3.0*pi) q[1];
rz(3.0*pi) q[2];
rz(3.0*pi) q[3];
rz(3.0*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(3.0*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.695913276015302*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(3.333333333333333*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(3.5*pi) q[5];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.30408672398469416*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[0];
rzz(0.12500000000000003*pi) q[3],q[1];
rz(0.5*pi) q[2];
rz(0.015625*pi) q[5];
rzz(0.031249999999999997*pi) q[4],q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[0];
rz(3.0*pi) q[1];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[0];
rx(1.0*pi) q[1];
rx(0.5*pi) q[3];
rz(3.5*pi) q[4];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(1.53125*pi) q[4];
rzz(0.06250000000000011*pi) q[3],q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[0];
rzz(0.25*pi) q[2],q[1];
rx(0.5*pi) q[3];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(3.5*pi) q[3];
rx(0.5*pi) q[0];
rx(0.75*pi) q[1];
rz(1.0*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(1.5*pi) q[2];
rz(1.5625*pi) q[3];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rzz(0.12499999999999999*pi) q[2],q[0];
rx(0.5*pi) q[0];
rx(0.5*pi) q[2];
rz(0.5*pi) q[0];
rz(0.5*pi) q[2];
rx(0.5*pi) q[0];
rx(0.5*pi) q[2];
rz(0.5*pi) q[0];
rz(3.5*pi) q[2];
rx(0.5*pi) q[0];
rx(0.5*pi) q[2];
rz(0.5*pi) q[0];
rz(1.625*pi) q[2];
rzz(0.25*pi) q[1],q[0];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(3.5*pi) q[1];
rx(0.5*pi) q[1];
rz(3.25*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
