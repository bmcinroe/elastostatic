dimx = 20;
dimy = 20;
dx = 1;
mu = 1;
lam = 1;
e = 0.01;

ux = zeros(dimx,dimy);
uy = zeros(dimx,dimy);

for i = 1:1000
    [fx, fy] = compute_ffield(ux, uy, dx, mu, lam);
    
    %apply virtual displacements
    ux = ux + e*fx;
    uy = uy + e*fy;
    f_sqsum = fx.*fx + fx.*fx;
    xint = zeros(1,dimx);
    for j = 1:dimx
    xint(j) = (0.5*(f_sqsum(j,1)+f_sqsum(j,dimy)) + sum(f_sqsum(j, 2:dimy-1)))*dx;
    end

    yxint = (0.5*(xint(1)+xint(dimx)) + sum(xint(2:dimy-1)))*dx;
    chi = sqrt(yxint/((dimx*dx)*(dimy*dx)));
end

uy_q = zeros(dimx,dimy);
ux_q = zeros(dimx,dimy);
for i = 1:dimy
    uy_q(i,:) = uy(dimy+1-i,:);
    ux_q(i,:) = -ux(dimy+1-i,:);
end

figure
hold on;
m = [[1 1 1 20]; [1 1 20 1]; [20 20 1 20]; [20 20 20 1]];
x=[m(:,1) m(:,3)];
y=[m(:,2) m(:,4)];
plot(x',y', 'k');
axis([1 20 1 20])
axis square;

quiver(ux_q,uy_q, 'r')

posx = zeros(dimx,dimy);
posy = zeros(dimx,dimy);
for i = 1:dimx
    for j = 1:dimy
        posx(i,j) = j*dx;
        posy(i,j) = i*dx;
    end
end

posx_ux = posx + ux_q;
posy_uy = posy + uy_q;


%plot(posx_ux, posy_uy, 'k.');

style = 'k--'

plot(posx_ux(1,:), posy_uy(1,:), style);
plot(posx_ux(dimx,:), posy_uy(dimx,:), style);
plot(posx_ux(:,dimy), posy_uy(:,dimy), style);
plot(posx_ux(:,1), posy_uy(:,1), style);

disp(chi);

    




    
    
        
            
