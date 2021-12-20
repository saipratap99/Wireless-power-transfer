
L1 = 375.48e-6;
L2 = 375.48e-6;
freq = [5000]
for f = freq
    Inverter_period = 1/f
    Inverter_phase_delay = Inverter_period/2
    C1 = 1/(4*pi*pi*f*f*L1)
    C2 = 1/(4*pi*pi*f*f*L2)
    sim('test')
end