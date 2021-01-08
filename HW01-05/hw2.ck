TriOsc love => Pan2 p => dac;
SinOsc s => dac;

// note length
0.5::second => dur beat;
beat * (5.0/6.0) => dur qn; // quarter note sound (1/4)*(5/6)
beat / 6 => dur qn_rest; // quarter note no sound (1/4)*(1/6)
qn / 2 => dur hqn; // half quarter note sound (1/8)*(5/6)
qn_rest / 2 => dur hqn_rest; // half quarter note no sound (1/8)*(5/6)

// volume
0.3 => float on;
0.0 => float off;
off => s.gain;

0 => int count;
60 => int start_note;
int note;
Math.srandom(33);

/* PLAY */
while(count < 8){
    Math.random2f(-1.0, 1.0) => p.pan;
    Math.random2(start_note - 12, start_note + 12) => note;
    
    if(count == 3 || count == 7){
        Std.mtof(63) => love.freq;
        on => love.gain;
        hqn * 0.5 => now;
        off => love.gain;
        hqn_rest * 0.5 => now;
        
        Std.mtof(60) => love.freq;
        on => love.gain;
        qn => now;
        off => love.gain;
        qn_rest => now;
        
        beat * 0.25 => now;
        
        Std.mtof(60) => love.freq;
        on => love.gain;
        hqn => now;
        off => love.gain;
        hqn_rest => now;
        
        Std.mtof(63) => love.freq;
        on => love.gain;
        hqn * 0.5 => now;
        off => love.gain;
        hqn_rest * 0.5 => now;
        
        Std.mtof(59) => love.freq;
        on => love.gain;
        qn => now;
        off => love.gain;
        qn_rest => now;
        
        beat * 0.25 => now;
        
        Std.mtof(60) => love.freq;
        on => love.gain;
        hqn => now;
        off => love.gain;
        hqn_rest => now;
        
        Std.mtof(63) => love.freq;
        on => love.gain;
        hqn * 0.5 => now;
        off => love.gain;
        hqn_rest * 0.5 => now;
        
        Std.mtof(60) => love.freq;
        on => love.gain;
        hqn * (3.0 / 2) => now;
        off => love.gain;
        hqn_rest * (3.0 / 2) => now;
        
        beat * 3 => now;
        1 +=> count;
        continue;
    }
    
    Std.mtof(55) => love.freq;
    on => love.gain;
    qn => now;
    off => love.gain;
    qn_rest => now;
    
    Std.mtof(67) => love.freq;
    Std.mtof(note) => s.freq;
    on => love.gain;
    on => s.gain;
    qn => now;
    off => love.gain;
    off => s.gain;
    qn_rest => now;
    
    Std.mtof(65) => love.freq;
    Std.mtof(note - 7) => s.freq;
    on => love.gain;
    on => s.gain;
    qn => now;
    off => love.gain;
    off => s.gain;
    qn_rest => now;
    
    Std.mtof(63) => love.freq;
    Std.mtof(note -2) => s.freq;
    on => love.gain;
    on => s.gain;
    hqn => now;
    off => love.gain;
    off => s.gain;
    hqn_rest => now;
    
    Std.mtof(65) => love.freq;
    Std.mtof(note -2) => s.freq;
    on => love.gain;
    on => s.gain;
    hqn => now;
    off => love.gain;
    off => s.gain;
    hqn_rest => now;
    
    if(count % 2 == 0){
        Std.mtof(67) => love.freq;
        Std.mtof(58) => s.freq;
        on => love.gain;
        on => s.gain;
        hqn => now;
        off => love.gain;
        off => s.gain;
        hqn_rest => now;
        
        Std.mtof(65) => love.freq;
        on => love.gain;
        hqn => now;
        off => love.gain;
        hqn_rest => now;
        
        Std.mtof(63) => love.freq;
        on => love.gain;
        hqn => now;
        off => love.gain;
        hqn_rest => now;
        
        Std.mtof(63) => love.freq;
        on => love.gain;
        qn => now;
        off => love.gain;
        qn_rest => now;
        
        Std.mtof(60) => love.freq;
        on => love.gain;
        qn => now;
        off => love.gain;
        qn_rest => now;
        
        beat / 2 => now;
    }
    else{
        Std.mtof(67) => love.freq;
        Std.mtof(58) => s.freq;
        on => love.gain;
        on => s.gain;
        hqn => now;
        off => love.gain;
        off => s.gain;
        hqn_rest => now;
        
        Std.mtof(65) => love.freq;
        on => love.gain;
        hqn => now;
        off => love.gain;
        hqn_rest => now;
        
        Std.mtof(63) => love.freq;
        on => love.gain;
        hqn => now;
        off => love.gain;
        hqn_rest => now;
        
        Std.mtof(68) => love.freq;
        on => love.gain;
        hqn * (3.0 / 2) => now;
        off => love.gain;
        hqn_rest * (3.0 / 2) => now;
        
        Std.mtof(67) => love.freq;
        on => love.gain;
        hqn * (3.0 / 2) => now;
        off => love.gain;
        hqn_rest * (3.0 / 2) => now;
        
        Std.mtof(65) => love.freq;
        on => love.gain;
        hqn => now;
        off => love.gain;
        hqn_rest => now;
        
        Std.mtof(63) => love.freq;
        on => love.gain;
        hqn => now;
        off => love.gain;
        hqn_rest => now;
        
    }
    1 +=> count;
}