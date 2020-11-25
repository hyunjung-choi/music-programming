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
me.dir(-1)+"/audio/cowbell_01.wav" => snd.read;
snd.samples() => snd.pos;
0.3 => float vol;
vol => snd.gain;

spork ~ play(snd, e, vol);

while(true){
    tempo.eighthNote => dur eighth;

    e.signal();
    
    for(0 => int beat; beat < 8; beat++){
        if(beat == 7){
            0 => snd.pos;
        }
        eighth => now;
    }
}
