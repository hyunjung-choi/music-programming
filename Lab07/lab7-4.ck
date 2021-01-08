Moog mog => dac;
200.0 => mog.freq;

0.5 => mog.filterQ; // 0.1 1.0
0.3 => mog.filterSweepRate; // 0.01 1.0
15.0 => mog.vibratoFreq; // 1.0 20.0
0.03 => mog.vibratoGain; // 0.01 ...

1 => mog.noteOn;
second => now;
1 => mog.noteOff;
0.125::second => now;

/*
while (true) {
    Math.random2f(0.1,1.0) => mog.filterQ; // 0.1 1.0
    Math.random2f(0.01,1.0) => mog.filterSweepRate; // 0.01 1.0
    1 => mog.noteOn;
    if (Math.random2(0,10) == 0) {
        Math.random2f(1.0,20.0) => mog.vibratoFreq; // 1.0 20.0
        0.5 => mog.vibratoGain; // 0.01 0.5
        second => now;
    }
    else {
        0.01 => mog.vibratoGain;
        0.0125::second => now;
    }
    1 => mog.noteOff;
    0.125::second => now;
}
*/