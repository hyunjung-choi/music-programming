0.2::second => dur en; // eighth notes (1/8)
en * 2 => dur qn; // quarter notes (1/4)
qn * 2 => dur hn; // half notes (1/2)
en * 3 => dur dqn; // dotted quarter notes(3/8)
en * 8 => dur whole;

[
72, 72, 69, 67, 69, -1, 72, 
-1, 72, 69, 67, 67, -1, 69,
70, 70, 67, 64, 67, -1, 70, 
-1, 70, -1, 72,

72, 72, 69, 67, 69, -1, 72, 
-1, 72, 69, 67, 67, -1, 69,
70, 70, 67, 64, 67, -1, 70,
-1, 70, 72, 74, -1
]
@=> int intro[];

[
qn, en, en, en, en, en, en, 
en, en, en, en, qn, en, en, 
qn, en, en, en, en, en, en, 
qn, qn, en, dqn,

qn, en, en, en, en, en, en, 
en, en, en, en, qn, en, en, 
qn, en, en, en, en, en, en, 
en, en, qn, qn, qn
]
@=> dur introDur[];

//Rhodey f => dac;
PercFlut pf => dac;

Player p;
p.play(pf, intro, introDur, "intro");