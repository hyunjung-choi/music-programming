0.2::second => dur en; // eighth notes (1/8)
en * 2 => dur qn; // quarter notes (1/4)
qn * 2 => dur hn; // half notes (1/2)
en * 3 => dur dqn; // dotted quarter notes(3/8)
en * 8 => dur whole;
en / 5.0 => dur tail;

[
76, 76, 76, 76, 77, -1, 79,
-1, 79, 77, -1, 76, -1, 77,
74, 74, 74, 74, 76, -1, 77,
-1,
76, 76, 76, 76, 77, -1, 79,
-1, 79, 77, -1, 76, -1, 77,
74, 74, 74, 74, 76, -1, 70,
-1, 70, 72, 74, 70, -1, 72
]
@=> int melody[];

[
qn, en, en, en, en, en, en,
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en,
whole,
qn, en, en, en, en, en, en,
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en,
en, en, qn, en, en, en, en
]
@=> dur melodyDur[];

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

//Blowhole
Clarinet b => dac;
PercFlut f => dac;

Player p;

spork ~ p.play(b, melody, melodyDur, "melody");
spork ~ p.play(f, intro, introDur, "");

whole * 8 + qn => now;
