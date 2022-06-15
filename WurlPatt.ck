// easy convenience for working with patterns
// fills the space when needed during improv, if needed
// this logic can be applied to any UGen with .noteOn / .noteOff

public class WurlPatt extends Wurley
{
    
    fun void patterns(float pches[],float durs[],float gap, int loop)
    {
        0 => int r; 
        
        if (loop == 0)
            70000 + loop => loop;
        // 0 for loop makes infinite
        while (r < loop)
        {
            1 => this.noteOn;
            pches[r % pches.cap()] => this.freq;
            
            durs[r % durs.cap()]::second => now;
            
            0 => this.noteOff;
            
            gap::second => now;
            
            r++;
          
    
        }
    }
    
    fun void patterns(int pches[],float durs[],float gap, int loop)
    {
        0 => int r; 
        
        if (loop == 0)
            70000 + loop => loop;
        
        while (r < loop)
        {
            1 => this.noteOn;
            Std.mtof(pches[r % pches.cap()]) => this.freq;
            
            durs[r % durs.cap()]::second => now;
            
            0 => this.noteOff;
            
            gap::second => now;
            
            r++;
            
            
        }
    }
}
  