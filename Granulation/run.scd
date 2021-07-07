
{
  arg buffer, velocity = 1, density = 1, grainsize = 0.05, pitchshift = 1,
      grainAmp = 1, bsplice = 0.005, esplice = 0.005, pan = 0, scatter = 0.5;
  var nodeProxy;
  var windowBuf, windowSig;

  windowBuf = Buffer.alloc(s, s.sampleRate * 0.2, 1);
  windowSig = Signal.hanningWindow(s.sampleRate * 0.4); // twice the size of our buffer, 'cause we only use 1/2
  windowSig = Array.fill(s.sampleRate * 0.2, {|i| windowSig[i]});
  windowBuf.loadCollection(windowSig);

  //================

  nodeProxy = NodeProxy.new(Server.default, \audio, 2);

  nodeProxy.source = {
    var bufDur, trig, env, envgen;
    var densityEnv, phasor;

    bufDur = BufDur.ir(buffer);

    phasor = Phasor.ar(rate: velocity.value/SampleRate.ir);
    phasor = phasor.linlin(0,1,0,bufDur);

    trig = Impulse.ar(density.value);

    TGrains3.ar(
      numChannels: 2, trigger: trig, bufnum: buffer, rate: pitchshift.value,
      centerPos: phasor, dur: grainsize.value, pan: pan.value, amp: grainAmp.value, 
      att: bsplice, dec: esplice, window: windowBuf.bufnum, interp: 4
    );
  };

  nodeProxy.play;

}
