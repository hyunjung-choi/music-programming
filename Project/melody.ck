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
-1, 70, 72, 74, 70, -1, 72,

-1,
-1, 77, 76, 77, 76, 74, 76,
-1,
-1, 70, 67, 70, 72, 74, 72,

72, 72, 64, 65,
-1, 77, 76, 77, 76, 74, 76,
64, -1, 62, 58,
-1, 70, 67, 70, 72, 74, 72,

76, 76, 76, 76, 77, -1, 79,
-1, 79, 77, -1, 76, -1, 77,
74, 74, 74, 74, 76, -1, 77,
-1,

76, 76, 76, 76, 77, -1, 79,
-1, 79, 77, -1, 76, -1, 77,
74, 74, 74, 74, 76, -1, 70,
-1, 70, 72, 74, 70, -1, 72,

-1,
-1, 77, 76, 77, 76, 74, 76,
-1,
-1, 70, 67, 70, 72, 74, 72,

72, 72, 64, 65,
-1, 77, 76, 77, 76, 74, 76,
64, -1, 62, 58,
-1, 70, 67, 70, 72, 74, 72,

76, 76, 76, 76, 77, -1, 79,
-1, 79, 76, -1, 84, -1, 84,
82, 82, 82, 82, 84, -1, 79,
-1,

82, 81, 79, 81, 79, -1, 79,
-1, 79, 77, 76, 77, 76, 74, 76,
70, 70, 70, 70, 72, -1, 70,
-1, 70, 72, 74, 70, 79,

79, 81, 81, -1, 82,
81, 81, 82, -1, 84,
82, 82, 84, -1, 86,
84, 84, 86, -1, 88,

89, 89, 89, 89, 91, -1, 93,
-1, 93, 91, 89, -1, 91,
87, 87, 87, 87, 89, -1, 91,
-1, 

89, 89, 89, 89, 91, -1, 93,
-1, 93, 91, 89, -1, 91,
87, 87, 87, 87, 89, -1, 84,
-1, 86, 87, 87, -1, 89
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
en, en, qn, en, en, en, en,

whole,
qn, en, en, en, en, en, en,
whole,
qn, en, en, en, en, en, en,

hn, en, qn, en,
qn, en, en, en, en, en, en,
hn, en, qn, en,
qn, en, en, en, en, en, en,

qn, en, en, en, en, en, en,
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en,
whole,

qn, en, en, en, en, en, en,
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en,
en, en, qn, en, en, en, en,

whole,
qn, en, en, en, en, en, en,
whole,
qn, en, en, en, en, en, en,

hn, en, qn, en,
qn, en, en, en, en, en, en,
hn, en, qn, en,
qn, en, en, en, en, en, en,

qn, en, en, en, en, en, en,
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en,
whole,

qn, en, en, en, en, en, en,
en, en, en, en, en, en, en, en,
qn, en, en, en, en, en, en,
en, en, qn, en, qn, en,

qn, en, en, en, dqn,
en, qn, en, en, dqn,
en, qn, en, en, dqn,
en, qn, en, en, dqn,

qn, en, en, en, en, en, en,
en, en, qn, qn, en, en,
qn, en, en, en, en, en, en,
//en, en, qn, qn, qn,
whole,

qn, en, en, en, en, en, en,
en, en, qn, qn, en, en,
qn, en, en, en, en, en, en,
qn, qn, en, en, en, en
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
-1, 70, 72, 74, -1,

60, 67, 67, 64, 65,
-1,
64, 64, 62, 64,
-1, 65, 64, -1, 69, -1, 67,

67, 67, -1, -1,
-1,
60, -1, 62, 58,
-1,

72, 72, 69, 67, 69, -1, 72, 
-1, 72, 69, 67, 67, -1, 69,
70, 70, 67, -1, 67, -1, 70,
-1, 70, -1, 72,

72, 72, 69, 67, 69, -1, 72, 
-1, 72, 69, 67, 67, -1, 69,
70, 70, 67, 64, 67, -1, 70,
-1, 70, 72, 74, -1,

60, 67, 67, 64, 65,
-1,
64, 64, 62, 64,
-1, 65, 64, -1, 69, -1, 67,

67, 67, -1, -1,
-1,
60, -1, 62, 58,
-1,

72, 72, 69, 67, 69, -1, 72, 
-1, 72, 69, 67, -1, -1, -1,
70, 70, 74, -1, 74, -1, 70,
-1, 70, -1, 72,

72, 72, 69, 69, 69, -1, 72,
-1, 72, 69, 67, 67, -1, -1, -1,
62, 62, 62, -1, 67, -1, 65,
-1, 65, 67, 69, -1, 76,

76, -1, -1, -1,
-1, -1, -1,

65, 69,
65, 69, -1,
63, 65,
//-1, 63, 65,
-1, 88, 89, 91, -1,

65, 69,
65, 69, -1,
63, 65,
-1, 63, 65
]
@=> int harmony[];

[
qn, en, en, en, en, en, en, 
en, en, en, en, qn, en, en, 
qn, en, en, en, en, en, en, 
qn, qn, en, dqn,

qn, en, en, en, en, en, en, 
en, en, en, en, qn, en, en, 
qn, en, en, en, en, en, en, 
en, en, qn, qn, qn,

qn, qn, en, qn, en,
whole,
hn, en, qn, en,
qn, en, en, en, en, en, en,

hn, en, qn, en, 
whole,
hn, en, qn, en,
whole,

qn, en, en, en, en, en, en, 
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en, 
qn, qn, en, dqn,

qn, en, en, en, en, en, en, 
en, en, en, en, qn, en, en, 
qn, en, en, en, en, en, en, 
en, en, qn, qn, qn,

qn, qn, en, qn, en,
whole,
hn, en, qn, en,
qn, en, en, en, en, en, en,

hn, en, qn, en, 
whole,
hn, en, qn, en,
whole,

qn, en, en, en, en, en, en,
en, en, en, en, qn, en, en,
qn, en, en, en, en, en, en,
qn, qn, en, dqn,

qn, en, en, en, en, en, en,
en, en, en, en, en, en, en, en,
qn, en, en, en, en, en, en,
en, en, qn, en, qn, en,

qn, qn, qn, qn,
whole, whole, whole,

hn, hn,
dqn, en, hn,
hn, hn,
//en, dqn, hn,
en, en, qn, qn, qn,

hn, hn,
dqn, en, hn,
hn, hn,
en, dqn, hn
]
@=> dur harmonyDur[];

//Wurley
PercFlut b => dac;
PercFlut f => dac;


Player p;

spork ~ p.play(b, melody, melodyDur, "melody");
spork ~ p.play(f, harmony, harmonyDur, "");

whole * 4 * 13 => now;
