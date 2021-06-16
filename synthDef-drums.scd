s.boot;

s.meter;
s.plotTree;

s.reboot;
s.quit;

// Kick Drum

Env([0,1,0],[1,1],[1,-1]).plot;

(
SynthDef.new(\kickd, {
	arg freqA=150, freqB=50, freqC=10, freqDur1=0.01, freqDur2=0.2, freqC1=1, freqC2=(-1),
	atk=0.01, rel=1, c1=1, c2=(-12), amp=0.8, pan=0, out=0;
	var sig, env, freqSweep;
	freqSweep = Env([freqA, freqB, freqC], [freqDur1, freqDur2], [freqC1, freqC2]).ar;
	env = Env([0,1,0], [atk, rel], [c1, c2]).kr(2);
	sig = SinOsc.ar(freqSweep, pi/2);
	sig = sig * env;
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
)



// Not working yet

(
SynthDef.new(\snare, {
	arg freq=1, amp=1, atk=0.01, rel=1, c1=1, c2=(-1),
	buf=0, rate=1, spos=0, pan=0, out=0;
	var sig, env;
	env = Env([0,1,0], [atk, rel], [c1, c2]).kr(2);
	sig = SinOsc.kr(freq);
	sig = PlayBuf.ar(2, buf, rate, startPos: spos);
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out, sig);
}).add;
)
