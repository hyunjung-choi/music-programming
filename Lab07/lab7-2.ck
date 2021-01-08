Mandolin m => dac;

[60, 62, 64, 65, 67, 69, 71, 72, 71, 69, 67, 65, 64, 62, 60] 
@=> int scale[];

for(0 => int i; i < scale.cap(); i++){
    scale[i] => Std.mtof => m.freq;
    0.6 => m.bodySize;
    0.5 => m.pluckPos;
    0.4 => m.stringDamping;
    0.1 => m.stringDetune;
    1 => m.noteOn;
    0.3::second => now;
    1 => m.noteOff;
    0.1::second => now;
}
