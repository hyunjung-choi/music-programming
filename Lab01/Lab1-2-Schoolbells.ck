SinOsc s => dac;

0.1::second => dur beat;

392.0 => float G4;
440.0 => float A4;
329.6 => float E4;
293.7 => float D4;
261.6 => float C4;

/* 1st bar */
G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

A4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

A4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

/* 2nd bar */
G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

E4 => s.freq;
1 => s.gain;
2 * beat => now;
0 => s.gain;
2 * beat => now;

/* 3rd bar */
G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

E4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

E4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

/* 4th bar */
D4 => s.freq;
1 => s.gain;
3 * beat => now;
0 => s.gain;
3 * beat => now;

0 => s.gain;
2 * beat => now;

/* 5th bar */
G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

A4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

A4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

/* 6th bar */
G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

E4 => s.freq;
1 => s.gain;
2 * beat => now;
0 => s.gain;
2 * beat => now;

/* 7th bar */
G4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

E4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

D4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

E4 => s.freq;
1 => s.gain;
beat => now;
0 => s.gain;
beat => now;

/* 8th bar */
C4 => s.freq;
1 => s.gain;
3 * beat => now;
0 => s.gain;
3 * beat => now;

0 => s.gain;
2 * beat => now;