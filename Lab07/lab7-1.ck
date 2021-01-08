BlowHole bh => dac;
BlowBotl bb => dac;
Saxofony sf => dac;

[60, 62, 64, 65, 67, 69, 71, 72, 71, 69, 67, 65, 64, 62, 60] 
@=> int scale[];

for(0 => int i; i < scale.cap(); i++){
    Std.mtof(scale[i]) => bh.freq;
    //i * 0.65 => inst.reed; 
    //0.9 => inst.pressure;
    1.0 => bh.noteOn;
    0.3::second => now;
    1.0 => bh.noteOff;
    0.1::second => now;  
}

for(0 => int i; i < scale.cap(); i++){
    Std.mtof(scale[i]) => bb.freq;
    1.0 => bb.startBlowing;
    0.3::second => now;
    1.0 => bb.stopBlowing;
    0.1::second => now;  
}

for(0 => int i; i < scale.cap(); i++){
    Std.mtof(scale[i]) => sf.freq;
    0.7 => sf.blowPosition;
    1.0 => sf.startBlowing;
    0.3::second => now;
    1.0 => sf.stopBlowing;
    0.1::second => now;  
}

