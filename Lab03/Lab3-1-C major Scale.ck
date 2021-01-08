SinOsc s => dac;

// volume
0.6 => float on;
0.0 => float off;

// note length
0.5::second => dur beat; // quarter (1/4) note duration
beat / 5 => dur rest; // duration of no sound after each note
beat - rest => dur qn; // quarter (1/4) note sound

// MIDI notes
[60, 62, 64, 65, 67, 69, 71, 72, 
     71, 69, 67, 65, 64, 62, 60] @=> int scaleNotes[];

// play
for (0 => int i; i < scaleNotes.cap(); i++) {
    Std.mtof(scaleNotes[i]) => s.freq;
    on => s.gain;
    qn => now;
    off => s.gain;
    rest => now;
}