 Wrow=length(sample);
 Wcolumn=length(test);
 w=max([1 abs(Wrow-Wcolumn)]);
 WTable= zeros(Wrow+1 , Wcolumn+1);
 for i= 1 : Wrow+1
     for j= 1 : Wcolumn+1
        WTable(i,j) = inf; 
     end
 end
 WTable(1,1)=0;
 for i= 2 : Wrow+1
     for j= max([2 i-w]) : min([Wcolumn+1 i+w])
        WTable(i,j) = 0; 
     end
 end
 
 for i= 2: Wrow+1
    for j= max([2 i-w]) : min([Wcolumn+1 i+w]) 
      WTable(i,j) = abs(sample(i-1) - test(j-1)) +  min([WTable(i-1,j-1) WTable(i,j-1) WTable(i-1,j)]);
    end 
 end
 
 WEuclidean_Distance=WTable(Wrow+1 , Wcolumn+1);