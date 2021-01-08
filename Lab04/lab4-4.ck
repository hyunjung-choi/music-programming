Gain master[3];
master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

SndBuf kick => master[1];
SndBuf snare => master[1];
SndBuf hihat => master[2];
SndBuf cowbell => master[0];

SndBuf claps => Pan2 clap;
clap.chan(0) => master[0];
clap.chan(1) => master[2];

"C:/Users/hyunjung/Desktop/audio/kick_01.wav" => kick.read;
"C:/Users/hyunjung/Desktop/audio/snare_01.wav" => snare.read;
"C:/Users/hyunjung/Desktop/audio/hihat_01.wav" => hihat.read;
"C:/Users/hyunjung/Desktop/audio/cowbell_01.wav" => cowbell.read;
"C:/Users/hyunjung/Desktop/audio/clap_01.wav" => claps.read;

[1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0] @=> int kick_hits[];
[0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0] @=> int snare_hits[];
[1,0,1,0, 1,0,0,1, 0,1,0,1, 0,1,1,1] @=> int cow_hits[];
[0,0,0,0, 0,0,0,0, 0,0,0,0, 1,1,1,1] @=> int claps_hits[];

0.15 :: second => dur tempo;
kick_hits.cap() => int MAX;

0 => int beat;
0 => int measure;

SqrOsc s => master[1];
0 => s.gain;

while(true){
    if(kick_hits[beat]) // 0, 4, 8, 12
        0 => kick.pos;
    
    if(snare_hits[beat] && measure % 2 == 1) // 2, 6, 10, 14
        0 => snare.pos;
    
    if(measure > 1){
        if(cow_hits[beat])
            0 => cowbell.pos;
        else{
            Math.random2f(0.0, 1.0) => hihat.gain;
            0 => hihat.pos;
        }
    }
    
    if(claps_hits[beat] && measure > 3){
        Math.random2f(-1.0, 1.0) => clap.pan;
        0 => claps.pos;
    }

    if(measure > 7 && Math.random2(0, 2) == 0){
        Std.mtof(Math.random2(60, 72)) => s.freq;
        0.5 => s.gain;
    }
    
    tempo => now;
    (beat + 1) % MAX => beat;
    if(beat == 0)
        measure++;
    0 => s.gain;
}