z = 0:0.01:5;
I = besseli(0,z);
plot(z,I)
axis([0 5 0 8])
grid on
title('Modified Bessel Functions of the First Kind, 0th order','interpreter','latex')
xlabel('x','interpreter','latex')
ylabel('$I_n(x)$','interpreter','latex')