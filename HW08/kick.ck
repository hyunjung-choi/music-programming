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
me.dir(-1)+"/audio/kick_04.wav" => snd.read;
snd.samples() => snd.pos;
1 => float vol;
vol => snd.gain;

spork ~ play(snd, e, vol);

while(true){
    tempo.quarterNote => dur quarter;

    e.signal();
    
    for(0 => int beat; beat < 4; beat++){
        0 => snd.pos;
        quarter => now;
    }
}