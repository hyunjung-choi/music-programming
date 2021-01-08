/* Lab#2 2. A Random Love Supreme */
SinOsc love => Pan2 p => dac;
TriOsc t => dac;

// note length
0.5::second => dur beat;
beat * (5.0/6.0) => dur qn; // quarter note sound (1/4)*(5/6)
beat / 6 => dur qn_rest; // quarter note no sound (1/4)*(1/6)
qn / 2 => dur hqn; // half quarter note sound (1/8)*(5/6)
qn_rest / 2 => dur hqn_rest; // half quarter note no sound (1/8)*(5/6)

// volume
0.5 => float on;
0.0 => float off;
off => t.gain;

57 => int start_note;
int note;

//paly 57 60 57 62
while(true){
    Math.random2f(-1.0, 1.0) => p.pan;
    Math.random2(start_note - 12, start_note + 12) => note;
    /* A3 57 */
    Std.mtof(note) => love.freq;
    on => love.gain;
    hqn => now;
    off => love.gain;
    hqn_rest => now;
    
    /* C4 60 */
    Std.mtof(note + 3) => love.freq;
    on => love.gain;
    qn => now;
    off => love.gain;
    qn_rest => now;
    
    /* A3 57 */
    Std.mtof(note) => love.freq;
    on => love.gain;
    hqn => now;
    off => love.gain;
    hqn_rest => now;
    
    /* D4 62 */
    Std.mtof(note + 5) => love.freq;
    on => love.gain;
    hqn => now;
    off => love.gain;
    hqn_rest => now;
    
    /* rest */
    if(Math.random2(1, 4) == 2){
        Std.mtof(note + 4) => t.freq;
        on / 4 => t.gain;
        hqn => now;
        off => t.gain;
        hqn_rest => now;
        
        Std.mtof(note + 3) => t.freq;
        on / 4 => t.gain;
        hqn => now;
        off => t.gain;
        hqn_rest => now;
        
        Std.mtof(note + 2) => t.freq;
        on / 4 => t.gain;
        hqn => now;
        off => t.gain;
        hqn_rest => now;
    }
    else
        beat * 1.5 => now;
}