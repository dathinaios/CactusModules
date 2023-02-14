
{
  arg buffer, velocity = 1, density = 1, grainsize = 0.05, pitchshiftMin = 1,
      pitchshiftMax = 1, grainAmpMin = 1, grainAmpMax = 1, bsplice = 0.005,
      esplice = 0.005, panMin = 0, panMax = 0;
  var nodeProxy;
  var windowBuf, windowSig;

  windowBuf = Buffer.alloc(s, s.sampleRate * 0.2, 1);
  windowSig = Signal.hanningWindow(s.sampleRate * 0.4);
  windowSig = Array.fill(s.sampleRate * 0.2, {|i| windowSig[i]});
  windowBuf.loadCollection(windowSig);

  //================

  nodeProxy = NodeProxy.new(Server.default, \audio, 2);

  nodeProxy.source = {
    var bufDur, trig, env, envgen;
    var densityEnv, phasor;
    var pitchshift, grainAmp, pan;

    bufDur = BufDur.ir(buffer);

    phasor = Phasor.ar(rate: velocity/SampleRate.ir);
    phasor = phasor.linlin(0,1,0,bufDur);

    trig = Impulse.ar(density);

    pitchshift = TRand.ar(pitchshiftMin, pitchshiftMax, trig);
    grainAmp = TRand.ar(grainAmpMin, grainAmpMax, trig);
    pan = TRand.ar(panMin, panMax, trig);

    TGrains3.ar(
      numChannels: 2, trigger: trig, bufnum: buffer, rate: pitchshift,
      centerPos: phasor, dur: grainsize, pan: pan, amp: grainAmp,
      att: bsplice, dec: esplice, window: windowBuf.bufnum, interp: 4
    );
  };

  nodeProxy.play;
}
