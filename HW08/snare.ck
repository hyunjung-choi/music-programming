class TheEvent extends Event{
    dur tempo;
    float velocity;
}

fun void play(SndBuf snd, TheEvent e, float vol, string s){
    e => now;
    vol => snd.gain;
}

TheEvent e;
BPM tempo;
0.3 => float vol;

SndBuf snd => dac;
me.dir(-1)+"/audio/snare_01.wav" => snd.read;
snd.samples() => snd.pos;
vol => snd.gain;
spork ~ play(snd, e, vol, "snare_01");

while(true){
    tempo.quarterNote => e.tempo;
    e.tempo => dur quarter;

    e.signal();
    
    quarter => now;
    0 => snd.pos;
    2.0 * quarter => now;
    
    0 => snd.pos;
    quarter / 4.0 => now;
    
    0 => snd.pos;
    3.0*quarter/4.0 => now;
}