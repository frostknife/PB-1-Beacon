'beacon-trigger.bas 07JAN2023
'Communications Security Research Organization
'08M2
'https://github.com/frostknife/PB-1-Beacon
'For RF source and propagation experiments
'Designed for Baofeng UV-5R, will likely work for other devices
main:
	if pinC.4 = 1 then 'wait for button press, activate beacon
		gosub beaconOn 
	else
		goto main
		endif 
beaconOn: 'close PTT with optocoupler, input tone
	do
	high C.1 'connects to optocoupler, PTT close, transmit carrier
	pause 10 'transmit carrier
	sound C.2, (113,250,116,250,116,250,113,250) 'output beacon audio for 2x2 sec, connects to audio isolation transfomer
	pause 10 'transmit carrier
	low C.1 'PTT open,
	if pinC.3 = 1 then 'escape the loop!
		gosub main
		endif
	pause 10
	loop
