public class BPM{
    
    static dur wholeNote, halfNote;
    static dur quarterNote, eighthNote, sixteenthNote, thirtysecondNote;
    static dur sixthNote, thirdNote;
    fun void tempo(float beat) {
        60.0/(beat) => float SPB;
        SPB :: second => quarterNote;
        quarterNote * 2.0 => halfNote;
        halfNote * 2.0 => wholeNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        sixteenthNote*0.5 => thirtysecondNote;
        wholeNote / 3.0 => thirdNote;
        wholeNote / 6.0 => sixthNote;
    }
}
