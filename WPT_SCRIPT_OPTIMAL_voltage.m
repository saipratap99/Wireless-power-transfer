clear all;
clc;

L1 = 375.48e-6;
L2 = 375.48e-6;
M = 344.58e-06;
voltages = [325:25:400];
f = 10000;
Inverter_period = 1/f;
Inverter_phase_delay = Inverter_period/2;
C1 = 1/(4*pi*pi*f*f*L1);
C2 = 1/(4*pi*pi*f*f*L2);    

effi = [];
for v = voltages
    V = v;
    out = sim('WPT_19b');
    pin_index = size(out.Pin.Time,1);
    Pin = out.Pin.Data(pin_index,2);
    pout_index = size(out.Pout.Time,1);
    Pout = out.Pout.Data(pout_index,1);
    effi(length(effi) + 1) = Pout/Pin*100;
    fprintf('V: %5d, Pin: %4.2f, Pout: %4.2f, n: %4.2f\n',V,Pin,Pout,effi(length(effi)));
end


plot(voltages,effi,'b-o')
xlabel('voltage');
ylabel('efficieny');