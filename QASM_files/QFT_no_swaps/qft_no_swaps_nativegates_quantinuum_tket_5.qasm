// Benchmark was created by MQT Bench on 2024-06-04
//
//
// TKET version: 1.17.0
// Used Gate Set: ['rzz', 'rz', 'ry', 'rx', 'measure', 'barrier']

OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];
creg meas[5];
rz(0.9687500000000009*pi) q[0];
rz(3.6875*pi) q[1];
rz(2.125*pi) q[2];
rx(0.5*pi) q[3];
rx(0.4375000000000009*pi) q[4];
rx(0.5*pi) q[0];
rx(2.5*pi) q[1];
rx(3.5*pi) q[2];
rz(1.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rzz(0.25*pi) q[4],q[3];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(3.168673296693451*pi) q[3];
rz(0.5*pi) q[4];
rx(3.273391828105971*pi) q[3];
rx(0.5*pi) q[4];
rz(0.6163390026235748*pi) q[3];
rz(0.5*pi) q[4];
rzz(0.12500000000000033*pi) q[4],q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rz(0.5*pi) q[2];
rz(1.0*pi) q[4];
rx(0.5*pi) q[2];
rz(0.5*pi) q[4];
rz(0.5*pi) q[2];
rx(0.5*pi) q[4];
rzz(0.25*pi) q[3],q[2];
rz(0.5*pi) q[4];
rzz(0.06250000000000015*pi) q[4],q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[1];
rz(1.6959132760153035*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(1.0*pi) q[1];
rx(3.6666666666666665*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[1];
rz(3.695913276015304*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rzz(0.03124999999999989*pi) q[4],q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[0];
rzz(0.12500000000000033*pi) q[3],q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(3.0*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[3];
rz(3.5*pi) q[4];
rx(1.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[3];
rz(0.53125*pi) q[4];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[3];
rz(0.5*pi) q[0];
rzz(0.25*pi) q[2],q[1];
rzz(0.06249999999999989*pi) q[3],q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[0];
rx(1.25*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(3.5*pi) q[3];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(1.5*pi) q[3];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5625*pi) q[3];
rzz(0.12499999999999989*pi) q[2],q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[0];
rz(0.5*pi) q[2];
rx(0.5*pi) q[0];
rx(0.5*pi) q[2];
rz(0.5*pi) q[0];
rz(0.5*pi) q[2];
rz(0.5*pi) q[0];
rz(3.5*pi) q[2];
rx(0.5*pi) q[0];
rx(1.5*pi) q[2];
rz(0.5*pi) q[0];
rz(0.625*pi) q[2];
rzz(0.25*pi) q[1],q[0];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(1.0*pi) q[0];
rz(3.5*pi) q[1];
rx(1.5*pi) q[0];
rx(3.5*pi) q[1];
rz(1.25*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];