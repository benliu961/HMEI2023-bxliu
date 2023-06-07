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
th0(2)=1.5;
th0(3)=10000;

dth=1e5;
for index=indices
    th0(1)=th0(1)+dth;
    [Hx,th0,params]=simulosl(th0,params);
    
    % Generic name
    fname=sprintf('gentrain_%.3i',index);
    oldFolder = cd('trainingdataimages');
    if xver==1
        % Make a quick plot
        imagesc(v2s(Hx,params))
        title(sprintf('%g %g %g\n%g %g %g %g',...
            th0(1),th0(2),th0(3),...
            params.dydx(1),params.dydx(2),...
            params.NyNx(1),params.NyNx(2)))
        set(gca, 'visible', 'off')
        set(gca, 'xtick', [])
        print('-dpng',fname)
    end
    cd(oldFolder)
    cd('trainingdatavalues')
    % Write these fake data to a file
    save(fname,'Hx','th0','params')
    cd(oldFolder)
end


