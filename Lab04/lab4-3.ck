SndBuf kick => Gain master => dac;
SndBuf snare => master;
SndBuf hihat => master;
SawOsc s => master;

"C:/Users/hyunjung/Desktop/audio/kick_01.wav" => kick.read;
"C:/Users/hyunjung/Desktop/audio/snare_01.wav" => snare.read;
"C:/Users/hyunjung/Desktop/audio/hihat_01.wav" => hihat.read;

0.3 => hihat.gain;

0.2::second => dur tempo;

[1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0] @=> int kick_hits[];
[0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1] @=> int snare_hits[];

while(true){
    0 => int beat;
    while(beat < kick_hits.cap()){
        Math.random2(0, 1) => int hihat_ran;
        Math.random2(0, 2) => int saw_ran;
        
        if(kick_hits[beat])
            0 => kick.pos;
        
        if(snare_hits[beat])
            0 => snare.pos;
        
        if(hihat_ran)
            0 => hihat.pos;
        
        if(saw_ran){
            Std.mtof(Math.random2(60, 72)) => s.freq;
            0.5 => s.gain;
        }

        tempo => now;
        beat++;
    }
}