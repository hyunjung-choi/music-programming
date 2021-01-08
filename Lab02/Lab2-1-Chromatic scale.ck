/* Lab#2 1. Chromatic scale */
SqrOsc scale => dac;

// note length
0.3::second => dur quarter_note;
quarter_note * (5.0/6) => dur qn; // quarter note sound (1/4)*(5/6)
quarter_note / 6 => dur qn_rest; // quarter note no sound (1/4)*(1/6)
qn * 2 => dur hn; // half note sound 
qn_rest * 2 => dur hn_rest; // half note no sound

// volume
0.5 => float on;
0.0 => float off;

// play
/* Up */
for (48 => int i; i <= 60; i++) {
    Std.mtof(i) => scale.freq;
    if (i == 60){
        on => scale.gain;
        hn => now;
        off => scale.gain;
        hn_rest => now;
    }

    else{
        on => scale.gain;
        qn => now;
        off => scale.gain;
        qn_rest => now;
    }
}

/* Down */
for (60 => int i; i >= 48; i--) {
    Std.mtof(i) => scale.freq;
    if (i == 48){
        on => scale.gain;
        hn => now;
        off => scale.gain;
        hn_rest => now;
    }
    
    else{
        on => scale.gain;
        qn => now;
        off => scale.gain;
        qn_rest => now;
    }
}