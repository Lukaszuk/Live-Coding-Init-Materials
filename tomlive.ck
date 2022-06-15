// example of logic for working with drum samps 

// replace SF's as needed 
public class TomTom extends Chubgraph 
{
    me.sourceDir() + "/HiTom 707.wav" => string filename; 
    me.sourceDir() + "/LowTom 808 1.wav" => string filename2;
    me.sourceDir() + "/HiTom 909X.wav" => string filename3;
    
    Gain main => outlet;   
    
    SndBuf2 buf;
    
    SndBuf2 buf2;
    
    SndBuf2 buf3;
    
    filename => buf.read;
    filename2 => buf2.read;
    filename3 => buf3.read;
    
    //buf => main;
    
    
    fun void inst(int drumtype)
    {
        if (drumtype == 707)
        {buf => main;
        buf2 !=> main;
        buf3 !=> main;}
        
        if (drumtype == 808)
        { buf2 => main;
        buf !=> main;
        buf3 !=> main;}
        
        if (drumtype == 909)
        { buf3 => main;
        buf2 !=> main;
        buf !=> main;}
        
    }
    
    
    fun void rate(float tomit, int loop)
    {
        0 => int d;  
        // time loop
        
        int q;
        int x;
        
        if (loop == 0)
            1000000 => q;
        else
            loop => q;
        
        while (x < q)
        { 
            0 => buf.pos => buf2.pos => buf3.pos;
            0.85 => buf.gain => buf2.gain => buf3.gain;
            1.0 => buf.rate => buf2.rate => buf3.rate;
            if ( d % 4 == 0)
                0.85 => main.gain;
            else
                0.5 => main.gain;
            
            tomit::second => now;
            d++;
            x++;
        }
        
    }
    fun void rate(float tempo, dur beats[],int loop)
    {
        0 => int d;  
        // time loop
        
        int q;
        int x;
        
        if (loop == 0)
            1000000 => q;
        else
            loop => q;
        
        0 => int y;
        
        while (x < q)
        { 
            if (y > beats.cap()-1)
                0 => y;
            
            0 => buf.pos => buf2.pos => buf3.pos;
            0.85 => buf.gain => buf2.gain => buf3.gain;
            1.0 => buf.rate => buf2.rate => buf3.rate;
            if ( d % 4 == 0)
                0.85 => main.gain;
            else
                0.5 => main.gain;
            
            tempo * beats[y] => now;
            d++;
            y++;
            x++;
        }
        
        
    }
    
    fun void rate(float tempo, float beats[],int loop)
    {
        0 => float timey;
        0 => int d;  
        // time loop
        int q;
        int x;
        
        if (loop == 0)
            1000000 => q;
        else
            loop => q;
        
        0 => int y;
        
        while (x < q)
        { 
            if (y > beats.cap()-1)
                0 => y;
            
            0 => buf.pos => buf2.pos => buf3.pos;
            0.85 => buf.gain => buf2.gain => buf3.gain;
            1.0 => buf.rate => buf2.rate => buf3.rate;
            if ( d % 4 == 0)
                0.85 => main.gain;
            else
                0.5 => main.gain;
            
            tempo * beats[y] => timey;
            timey ::second => now;
            d++;
            y++;
            x++;
        }
        
        
    }}
