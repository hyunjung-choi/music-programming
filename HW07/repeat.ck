public class Repeat{
    
    fun int repeatition(int notes[], int i){
        if (i < notes.cap() - 1 && notes[i] == notes[i + 1])
            return 1;
        else
        return 0;
    }
}