// OSC Env - convenient class for improvising across different
// oscillator times. Makes working with arrays of oscillators and envelopes
// less time consuming during improv. with code

public class OscEnv extends Chubgraph 
{
    SinOsc sine; TriOsc tri; SawOsc saw; PulseOsc pulse; 
    
    sine => ADSR env => Gain gainy => outlet;
    
    fun void freq (float hz)
    {
        hz => sine.freq => tri.freq => saw.freq => pulse.freq;
    }
    
    fun void mul (float lvl)
    {
        gainy.gain;    }
    
    fun void width (float wid)
    {
        wid => tri.width => saw.width => pulse.width;
    }
    
    fun void sync (int syn)
    {
        syn => sine.sync => tri.sync => saw.sync => pulse.sync;
    }
    fun void phase (float ph)
    {
        ph => sine.phase => tri.phase => saw.phase => pulse.phase;
    }
    
    
    fun void oscil(string type)
    {
        if (type == "sine")
            {sine => env;
            tri !=> env;
            saw !=> env;
            pulse !=> env;}
            
        else if (type == "tri")
            {tri => env;
            sine !=> env;
            saw !=> env;
            pulse !=> env;}
       
       else if (type == "saw")
            {saw => env;
            tri !=> env;
            sine !=> env;
            pulse !=> env;}
            
       else if (type == "pulse")
            {pulse => env;
            tri !=> env;
            saw !=> env;
            sine !=> env;}
        }
        
      fun void times (float a, float d, float s, float r)
      {
          env.set(a::second, d::second, s, r::second);
      }
      
      fun void trig (int trigger)
      {
          if (trigger == 1)
              env.keyOn(1);
          else if (trigger == 0)
              env.keyOff(1);
      }
        
}
            
            
          
       