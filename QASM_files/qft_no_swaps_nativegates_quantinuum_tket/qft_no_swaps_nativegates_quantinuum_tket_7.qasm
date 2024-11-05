// Benchmark was created by MQT Bench on 2024-04-03
//
//
// TKET version: 1.26.0
// Used Gate Set: ['rzz', 'rz', 'ry', 'rx', 'measure', 'barrier']

OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg c[7];
creg meas[7];
rz(0.9921875000000013*pi) q[0];
rz(1.734375*pi) q[1];
rz(0.21875*pi) q[2];
rz(0.1875*pi) q[3];
rz(1.625*pi) q[4];
rz(3.5*pi) q[5];
rx(0.4843750000000011*pi) q[6];
rx(0.5*pi) q[0];
rx(1.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(3.5*pi) q[4];
rx(3.5*pi) q[5];
rz(0.5*pi) q[6];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(1.5*pi) q[0];
rx(1.5*pi) q[1];
rx(1.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rzz(0.25*pi) q[6],q[5];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(2.477867382591887*pi) q[5];
rz(0.5*pi) q[6];
rx(3.477920691217207*pi) q[5];
rx(0.5*pi) q[6];
rz(3.7492317773344572*pi) q[5];
rz(0.5*pi) q[6];
rzz(0.12500000000000036*pi) q[6],q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[4];
rx(0.5*pi) q[6];
rz(0.5*pi) q[4];
rz(3.0*pi) q[6];
rx(0.5*pi) q[4];
rx(3.5*pi) q[6];
rz(0.5*pi) q[4];
rz(0.5*pi) q[6];
rzz(0.25*pi) q[5],q[4];
rx(0.5*pi) q[6];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rzz(0.06250000000000011*pi) q[6],q[3];
rz(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[3];
rz(3.912713693872452*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[3];
rx(0.2560589377472227*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(1.0*pi) q[3];
rz(0.5613288578636249*pi) q[4];
rz(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(3.5*pi) q[3];
rz(0.5*pi) q[4];
rx(1.5*pi) q[6];
rzz(0.03125000000000012*pi) q[6],q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[6];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[6];
rx(0.5*pi) q[2];
rzz(0.12500000000000036*pi) q[5],q[3];
rx(0.5*pi) q[6];
rz(3.0*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rz(1.0*pi) q[6];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(3.0*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rz(3.0*pi) q[6];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(3.5*pi) q[6];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(1.5*pi) q[6];
rzz(0.015624999999999943*pi) q[6],q[1];
rz(0.5*pi) q[2];
rzz(0.25*pi) q[4],q[3];
rx(0.5*pi) q[1];
rzz(0.06250000000000053*pi) q[5],q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[6];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(3.0*pi) q[1];
rx(0.5*pi) q[2];
rz(3.831326703306546*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(3.0*pi) q[6];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(1.2733918281059688*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rz(0.38366099737642284*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(3.0*pi) q[6];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rz(0.5*pi) q[5];
rx(1.0*pi) q[6];
rz(0.5*pi) q[1];
rzz(0.12500000000000036*pi) q[4],q[2];
rx(1.5*pi) q[3];
rz(0.5*pi) q[6];
rzz(0.03125000000000049*pi) q[5],q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[4];
rx(1.5*pi) q[6];
rzz(0.007812500000000113*pi) q[6],q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(1.0*pi) q[2];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[6];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[4];
rz(3.0*pi) q[5];
rx(0.5*pi) q[6];
rz(3.0*pi) q[0];
rx(0.5*pi) q[1];
rx(1.5*pi) q[2];
rz(0.5*pi) q[4];
rx(3.0*pi) q[5];
rz(3.0*pi) q[6];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rzz(0.25*pi) q[3],q[2];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[0];
rzz(0.06249999999999994*pi) q[4],q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[5];
rz(3.5*pi) q[6];
rx(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[6];
rz(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rz(1.5078125*pi) q[6];
rzz(0.015624999999999781*pi) q[5],q[0];
rx(0.5*pi) q[1];
rz(3.0*pi) q[2];
rz(3.0*pi) q[3];
rx(0.5*pi) q[4];
rx(0.5*pi) q[0];
rz(3.0*pi) q[1];
rx(0.5*pi) q[2];
rx(0.5*pi) q[3];
rz(3.0*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.695913276015302*pi) q[2];
rz(0.5*pi) q[3];
rx(3.0*pi) q[4];
rz(0.5*pi) q[5];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rx(3.333333333333333*pi) q[2];
rx(0.5*pi) q[3];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[0];
rx(0.5*pi) q[1];
rz(0.30408672398469416*pi) q[2];
rz(0.5*pi) q[3];
rx(0.5*pi) q[4];
rz(3.5*pi) q[5];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
rz(0.5*pi) q[2];
rz(0.5*pi) q[4];
rx(0.5*pi) q[5];
rz(0.5*pi) q[0];
rzz(0.12500000000000003*pi) q[3],q[1];
rx(0.5*pi) q[2];
rz(0.015625*pi) q[5];
rzz(0.031249999999999997*pi) q[4],q[0];
rx(0.5*pi) q[1];
rz(0.5*pi) q[2];
rx(0.5*pi) q[3];
rx(0.5*pi) q[0];
rz(0.5*pi) q[1];
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
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
