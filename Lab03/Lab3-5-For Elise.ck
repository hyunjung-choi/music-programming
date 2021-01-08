TriOsc elise => dac;

// volume level
0.1 => float on;
0.0 => float off;

// note length
0.3::second => dur sn; // sixteenth (1/16)
0.6::second => dur en; // eighth (1/8)
 
// For Elise by Beethoven
[76, 75, 76, 75, 76, 71, 74, 72, 69] @=> int forEliseNotes1[];
[sn, sn, sn, sn, sn, sn, sn, sn, en] @=> dur forEliseDurs1[];
[60, 64, 69, 71] @=> int forEliseNotes2[];
[sn, sn, sn, en] @=> dur forEliseDurs2[];
[64, 68, 71, 72] @=> int forEliseNotes3[];
[sn, sn, sn, en] @=> dur forEliseDurs3[];
[64, 72, 71, 69] @=> int forEliseNotes4[];
[sn, sn, sn, en] @=> dur forEliseDurs4[];

0 => int count;
while(count < 4){
    for(0 => int i; i < forEliseNotes1.cap(); i++){
        Std.mtof(forEliseNotes1[i]) => elise.freq;
        on => elise.gain;
        forEliseDurs1[i] => now;
    }

    off => elise.gain;
    sn => now;

    for(0 => int i; i < forEliseNotes2.cap(); i++){
        Std.mtof(forEliseNotes2[i]) => elise.freq;
        on => elise.gain;
        forEliseDurs2[i] => now;
    }

    off => elise.gain;
    sn => now;
    
    if(count % 2 == 0){
        for(0 => int i; i < forEliseNotes3.cap(); i++){
            Std.mtof(forEliseNotes3[i]) => elise.freq;
            on => elise.gain;
            forEliseDurs3[i] => now;
        }
        
        off => elise.gain;
        sn => now;
        
        Std.mtof(64) => elise.freq;
        on => elise.gain;
        sn => now;
    }
    else{
        for(0 => int i; i < forEliseNotes4.cap(); i++){
            Std.mtof(forEliseNotes4[i]) => elise.freq;
            on => elise.gain;
            forEliseDurs4[i] => now;
        }
        
        off => elise.gain;
        en => now;
    }
    1 +=> count;
}