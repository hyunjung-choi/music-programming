Gain master[3];
master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

SndBuf kick => master[0];
SndBuf snare => master[1];
SndBuf hihat => master[2];

"C:/Users/hyunjung/Desktop/audio/kick_01.wav" => kick.read;
"C:/Users/hyunjung/Desktop/audio/snare_01.wav" => snare.read;
"C:/Users/hyunjung/Desktop/audio/hihat_01.wav" => hihat.read;

0.15 :: second => dur tempo;

while(true){
    for(0 => int beat; beat < 16; beat++){
        if(beat == 0 || beat == 4 || beat == 8 || beat == 12)
            0 => kick.pos;
            
        if(beat == 4 || beat == 10 || beat == 13 || beat == 14)
            0 => snare.pos;
        
        if(beat == 2 || beat == 5 || beat == 6)
            0 => hihat.pos;
        
        tempo => now;
    }
    
}