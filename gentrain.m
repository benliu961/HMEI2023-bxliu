function gentrain(indices)
% GENTRAIN(indices)
%
% INPUT:
%
% indices    A running number
%
% Generate a training data set for the convolutional neural network to predict the three parameters
%
% Written by Benjamin Liu

% Run something with all defaults

[Hx,th0,params]=simulosl;
xver=1;

% Change something
% th0(1)=1.5e6;
% th0(2)=1.5;
% th0(3)=30000;

% th0(1)=0.5e6;
% th0(2)=2.0;
% th0(3)=5000;

% th0(1)=rand()*3e6 + 1e6;
% th0(2)=rand()*3;
% th0(3)=round(exp(rand()*3+8));

% dth=1e5;
th0(1)=1;
for n=1:5
    th0(2)=n*0.5+0.25;
    for m=1:5
        th0(3)=(0.5*m+0.25)*10000;
        for index=indices
            % th0(1)=rand()*3e6 + 1e6;
            % th0(2)=rand()*3;
            % th0(3)=round(exp(rand()*3+8));
            % a = round(rand()*100+32);
            % b = round(rand()*100+32);
            % params.NyNx=[a b];
            i = (n-1)*(25) + (m-1)*5 + index + 125;
            try
                [Hx,th0,params]=simulosl(th0,params);
                % Generic name
                fname=sprintf('gentrain_%.3i',i);
                oldFolder = cd('image_5by400');
                if xver==1
                    % Make a quick plot
                    imagesc(v2s(Hx,params)); axis equal; colormap gray;
                    title(sprintf('%g %g %g\n%g %g %g %g',...
                        th0(1),th0(2),th0(3),...
                        params.dydx(1),params.dydx(2),...
                    params.NyNx(1),params.NyNx(2)));
                    set(gca, 'visible', 'off');
                    set(gca, 'xtick', []);
                    print('-dpng', fname);
                end
                cd(oldFolder)
                cd('value_5by400')
                % Write these fake data to a file
                save(fname,'Hx','th0','params')
                cd(oldFolder)
            catch
                fprintf('skipped %d\n', index)
            end
        end
    end
end



