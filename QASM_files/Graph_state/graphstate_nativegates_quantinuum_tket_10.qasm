// Benchmark was created by MQT Bench on 2024-03-17
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0
// Used Gate Set: ['rzz', 'rz', 'ry', 'rx', 'measure', 'barrier']

OPENQASM 2.0;
include "qelib1.inc";

qreg q[10];
creg meas[10];
rx(1.0*pi) q[0];
rz(3.0*pi) q[1];
rz(3.0*pi) q[2];
rx(1.0*pi) q[3];
rz(3.0*pi) q[4];
rz(3.0*pi) q[5];
rx(1.0*pi) q[6];
rz(3.0*pi) q[7];
rz(3.0*pi) q[8];
rz(3.0*pi) q[9];
rz(0.5*pi) q[0];
rx(1.0*pi) q[1];
rx(1.0*pi) q[2];
rz(0.5*pi) q[3];
rx(1.0*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(1.0*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rz(0.5*pi) q[9];
rzz(0.5*pi) q[0],q[1];
rzz(0.5*pi) q[3],q[4];
rzz(0.5*pi) q[6],q[7];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[6];
rz(0.5*pi) q[7];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[6];
rx(0.5*pi) q[7];
rz(0.5*pi) q[0];
rz(1.0*pi) q[1];
rz(0.5*pi) q[3];
rz(1.0*pi) q[4];
rz(0.5*pi) q[6];
rz(1.0*pi) q[7];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[6];
rz(0.5*pi) q[7];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[6];
rx(0.5*pi) q[7];
rzz(0.5*pi) q[0],q[9];
rz(0.5*pi) q[1];
rzz(0.5*pi) q[3],q[5];
rz(0.5*pi) q[4];
rz(0.5*pi) q[7];
rx(0.5*pi) q[0];
rzz(0.5*pi) q[1],q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rx(0.5*pi) q[9];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rz(0.5*pi) q[9];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rx(0.5*pi) q[9];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rz(0.5*pi) q[9];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(1.0*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rx(0.5*pi) q[9];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rz(0.5*pi) q[9];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rzz(0.5*pi) q[4],q[5];
rzz(0.5*pi) q[6],q[9];
rz(0.5*pi) q[2];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[9];
rzz(0.5*pi) q[2],q[8];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[9];
rx(0.5*pi) q[2];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rz(3.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[8];
rz(3.5*pi) q[9];
rx(0.5*pi) q[2];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rx(0.5*pi) q[8];
rx(0.5*pi) q[9];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rz(0.5*pi) q[6];
rz(0.5*pi) q[8];
rx(0.5*pi) q[2];
rx(0.5*pi) q[8];
rz(0.5*pi) q[2];
rz(0.5*pi) q[8];
rzz(0.5*pi) q[7],q[8];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[7];
rz(0.5*pi) q[8];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[7];
rz(3.5*pi) q[8];
rx(0.5*pi) q[7];
rx(0.5*pi) q[8];
rz(0.5*pi) q[7];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9];
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
