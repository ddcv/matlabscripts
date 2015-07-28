%% Best Subsets - Leaps and Bounds
% Daniel Calderon, September 2012
%
%
%
%

function Bhat = subsets(X,y)

T = ones(size(X,1),1);
Bhat = (T'*T)\ (T' * y);
rss = (y-T*Bhat)'*(y-T*Bhat);

ii = 1:size(X,2);
for j = 1:size(X,2)-1
    best_rss = -1;
    best_rss_index =0;
    %List all possible set of j covariates
    v = nchoosek(ii,j);
    for i=1:length(v);
    %Create matrix with the selected covariates
        T = ones(size(X,1),1);
        %list variables in the set
        for k = 1:j
            %add column to the matrix
            T = [T X(:,v(i,k))];
        end
        %evaluate Bhat
        Bhat = (T'*T)\(T' * y);
        %evaluate RSS and update if values<RSS_best
        rss = (y-T*Bhat)' * (y-T*Bhat);
        if (best_rss ==-1)
            best_rss = rss;
            best_rss_index = i;
        else
            if (rss < best_rss)
                best_rss = rss;
                best_rss_index = i;
            end
        end
    end

end
%v = nchoosek(ii,size(X,2)-1);
%for k = 1:(size(X,2)-1)
%    T = [ones(size(X,1),1) X(:,v(best_rss_index,k))];
%end
%Bhat = (T'*T)\(T'*y);
end