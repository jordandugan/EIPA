nx = 50;
ny = 50;

G = sparse(nx*ny);
for i = 1:nx
    for j = 1:ny
        n = j +(i-1)*ny;
        if i == 1 || i == nx || j == 1 || j == ny
            G(n,n) = 1;
        elseif i >10 && i <20 && j>10 && j<20
         nxm = j + (i-2)*ny;
            nxp = j + i*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j+1 + (i-1)*ny;
            
            G(n,n) = -2;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1; 
       
        else
            nxm = j + (i-2)*ny;
            nxp = j + i*ny;
            nym = j-1 + (i-1)*ny;
            nyp = j+1 + (i-1)*ny;
            
            G(n,n) = -4;
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1; 
        
        end
    end
end

figure(1)
spy(G)

[E,D] = eigs(G,9,'SM');

eigenvalues = diag(D);
figure(2)
plot(eigenvalues,'o')

eigenfunction = zeros(nx,ny,9);
for i = 1:nx
    for j = 1:ny
        n = j +(i-1)*ny;
        eigenfunction(i,j,:) = E(n,:);
    end
end

for i = 1:9
    figure(i+2)
    surf(eigenfunction(:,:,i))
end