fid  = fopen('Spar.s2p', 'r') ;
 data = cell(1e6, 9) ;                    % Prealloc.
 rCnt = 0 ;                               % Row counter.
 while not(feof(fid))
    rCnt = rCnt + 1 ;
    data{rCnt,1} = fscanf(fid, '%f', 1) ;
    data{rCnt,2} = fscanf(fid, '%f', 1) ;
    data{rCnt,3} = fscanf(fid, '%f', 1) ;
    data{rCnt,4} = fscanf(fid, '%f', 1) ;
    data{rCnt,5} = fscanf(fid, '%f', 1) ;
    data{rCnt,6} = fscanf(fid, '%f', 1) ;
    data{rCnt,7} = fscanf(fid, '%f', 1) ;
    data{rCnt,8} = fscanf(fid, '%f', 1) ;
    data{rCnt,9} = fscanf(fid, '%f', 1) ;
 end
 fclose(fid) ;
 data = data(1:rCnt,:) ;                  % Truncate.
A=cell2mat(data);
f=A(:,1);
S11=zeros(size(f))
S21=zeros(size(f))
S12=zeros(size(f))
S22=zeros(size(f))
j=sqrt(-1);
for i=1:size(f)
A(i,2)
A(i,3)

phi = deg2rad(A(i,3))
phi1 = A(i,3)*pi/180
S11(i)=A(i,2)*(cos(phi)+j*sin(phi))
A(i,4)
A(i,5)
phi= deg2rad(A(i,5))
S21(i)=A(i,4)*(cos(phi)+j*sin(phi))
A(i,6)
A(i,7)
phi= deg2rad(A(i,7))
S12(i)=A(i,6)*(cos(phi)+j*sin(phi))
A(i,8)
A(i,9)
phi= deg2rad(A(i,9))
S22(i)=A(i,8)*(cos(phi)+j*sin(phi))
end
Delta = abs(S11.*S22-S12.*S21)
K=(1-abs(S11).^2-abs(S22).^2+abs(Delta).^2)./(2*abs(S12.*S21))
plot(f,K)
legend('K')
