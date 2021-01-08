Impulse imp => ResonZ rez => Gain input => dac;
100 => rez.Q;
100 => rez.gain;
1.0 => input.gain;

Delay del[3];

input => del[0] => dac.left;
input => del[1] => dac;
input => del[2] => dac.right;

for(0 => int i; i < 3; i++){
    del[i] => del[i];
    0.8 => del[i].gain;
    (0.2 + i * 0.01)::second => del[i].max => del[i].delay;
}

// MIDI notes
[67, 67, 69, 69, 67, 67, 64,
 67, 67, 64, 64, 62, 62,
 67, 67, 69, 69, 67, 67, 64,
 67, 64, 62, 64, 60, 60 ] @=> int melody[];

// play
for (0 => int i; i < melody.cap(); i++) {
    Std.mtof(melody[i]) => rez.freq;
    1.0 => imp.next;
    0.4::second => now;
}