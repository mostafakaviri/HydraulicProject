clc, clear, close all

pumps = [27.6 32 38 50 57 70 80 102 112 126 145 162 171 200 233 261 310 375 469 600 852 950]
motors = [45 180 160 32]
cyl_c = [4.91 8.04]
cyl_h = [12.56 19.63 31.16]

f_c = 22.66e3
f_h = 5e3

powers = []

for p = 1 : 1 : length(pumps)
    for c = 1 : 1 : length(cyl_h)
        choice(1) = p ;
        choice(2) = c;
        a = cyl_h(c);
        p_c = f_h/(a*10^-4);
        p_c = p_c / 100000;
        q = pumps(p);
        p_a = p_c + (q/53)^2;
        p_p = p_a + (q/40)^2;
        power = p_p * q/600;
        v = q/a;
        v = v*60*1e-3
        
        if power < 350 && ((1<v)&&(v<7))
            i = length(powers) + 1
            powers(i,1) = power;
            powers(i,2) = choice(1);
            powers(i,3) = choice(2);
        end
    end
end

new_choice = []


for p = 1 : 1 : length(pumps)
    for m = 1 : 1 : length(motors)
        choice_2(1) = p ;
        choice_2(2) = m;

        n_m = 100
        q = n_m * motors(m)
        q = q*1e-3
        
        if q < pumps(p)
            i = length(new_choice) + 1
            new_choice(i,1) = q;
            new_choice(i,2) = choice_2(1);
            new_choice(i,3) = choice_2(2);
        end
    end
end

powers
new_choice