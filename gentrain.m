function gentrain(indices)
% GENTRAIN(indices)
%
% INPUT:
%
% indices    A running number 
%
% Generate a training data set for...
%
% Written by X on Y

% Run something with all defaults
[Hx,th0,params]=simulosl;

xver=1;

% Change something
th0(1)=1.5e6;

dth=1e5;
for index=indices
 th0(1)=th0(1)+dth;
 params.NyNx=[128 128]; 
 [Hx,th0,params]=simulosl(th0,params);

 % Generic name
 fname=sprintf('gentrain_%.3i',index);

 if xver==1
  % Make a quick plot
  imagesc(v2s(Hx,params))
  title(sprintf('%g %g %g\n%g %g %g %g',...
		 th0(1),th0(2),th0(3),...
		 params.dydx(1),params.dydx(2),...
                 params.NyNx(1),params.NyNx(2)))
  pause(1)
  print('-dpdf',fname)
 end

 % Write these fake data to a file
 save(fname,'Hx','th0','params')
end


