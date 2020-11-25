// ID : 2017099589
// Name : Choi Hyun-Jung

class TheEvent extends Event{
    float velocity;
}

fun void play(SndBuf snd, TheEvent e, float vol){
    e => now;
    vol => snd.gain;
}

TheEvent e;
BPM tempo;

SndBuf snd => dac;
me.dir(-1)+"/audio/snare_01.wav" => snd.read;
snd.samples() => snd.pos;
0.5 => float vol;
vol => snd.gain;

spork ~ play(snd, e, vol);

while(true){
    tempo.quarterNote => dur quarter;

    e.signal();
    
    quarter => now;
    0 => snd.pos;
    2.0 * quarter => now;
    
    0 => snd.pos;
    quarter / 4.0 => now;
    
    0 => snd.pos;
    3.0*quarter/4.0 => now;
}