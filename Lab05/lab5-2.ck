TriOsc t => dac;

playNote(t, 60, 0.5::second, 0.6, 0.1::second);
playNote(t, 60, 0.5::second, 0.6, 0.1::second);
playNote(t, 64, 0.5::second, 0.6, 0.1::second);
playNote(t, 67, 0.5::second, 0.6, 0.1::second);
playNote(t, 60, 0.5::second, 0.6, 0.1::second);

fun void playNote(Osc osc, int note, dur duration, float gain, dur tail) {
    note => Std.mtof => osc.freq; // set frequency of osc
    gain => osc.gain; // set gain of osc 
    duration - tail => now;// play duration -tail
    0 => osc.gain; //turn off the volume
    tail => now; // play tail
}
