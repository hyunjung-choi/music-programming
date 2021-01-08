Bowed m => dac;

[60, 62, 64, 65, 67, 69, 71, 72, 71, 69, 67, 65, 64, 62, 60] 
@=> int scale[];


for(0 => int i; i < scale.cap(); i++){
    scale[i] => Std.mtof => m.freq;
    0.2 => m.bowPressure;
    0.9 => m.bowPosition;
    0.01 => m.vibratoGain;
    0.9 => m.volume;
    1 => m.noteOn;
    0.3::second => now;
    1 => m.noteOff;
    0.1::second => now;
}
