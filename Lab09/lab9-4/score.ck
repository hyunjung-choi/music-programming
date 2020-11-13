BPM bpm;
bpm.tempo(300); 

bpm.sixthNote => dur sn; // sixth note (1/6)
bpm.thirdNote => dur tn; // third note (1/3)
bpm.halfNote => dur hn; // half note (1/2)
bpm.wholeNote => dur wn; // whole note (1)

[
60, 60, 60, 62, 64,
64, 62, 64, 65, 67,
72, 72, 72, 67, 67, 67, 64, 64, 64, 60, 60, 60,
67, 65, 64, 62, 60
]
@=> int melody[];

[
hn, hn, tn, sn, hn, 
tn, sn, tn, sn, wn,
sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn, sn,
tn, sn, tn, sn, wn
]
@=> dur melodyDur[];

Wurley player => dac;
Player p;
p.play(player, melody, melodyDur);