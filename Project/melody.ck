MidiOut mout;

// MIDI Port (Window > Device Browser > MIDI > Output)
2 => int port;

// try to open that port, fail gracefully
if( !mout.open(port) )
{
    <<< "Error: MIDI port did not open on port: ", port >>>;
    me.exit();
}

// Make a MIDI msg holder for sending
MidiMsg msg;

// utility function to send MIDI out notes
fun void MIDInote(int onoff, int note, int velocity)
{
    if (onoff == 0) 128 => msg.data1;
    else 144 => msg.data1;
    note => msg.data2;
    velocity => msg.data3;
    mout.send(msg);
}

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
whole,

qn, en, en, en, en, en, en,
en, en, qn, qn, en, en,
qn, en, en, en, en, en, en,
qn, qn, en, en, en, en
]
@=> dur melodyDur[];

// Piccolo
for (0 => int i; i < melody.cap(); i++){
    MIDInote(1, melody[i], 100);
    melodyDur[i] - tail => now;
    MIDInote(0, melody[i], 100);
    tail => now;
}
