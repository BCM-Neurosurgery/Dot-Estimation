

% 40% plus   (20% before,             20% after) 
% 60% minus  (20% before, 20% middle, 20% after) 
% the code should get equal amount of each number for first and second operand.   
% global operation
% global operationLocation
% global oper1 oper2
rng(0)
maxnum=9;
trs=maxnum*20;% giant repeats. 

%%
oper = randi(maxnum,trs,1);
totalInvalid=[];
for i=1:maxnum
thisNum = find(oper==i);
if numel(thisNum)> (trs/maxnum)
validThisNum = thisNum(randperm(numel(thisNum),trs/maxnum));
invalidThisNum = setdiff(thisNum,validThisNum);
totalInvalid=union(totalInvalid,invalidThisNum);
end
end
oper(totalInvalid)=NaN;


for i=1:maxnum
thisNum = find(oper==i);

if numel(thisNum) < (trs/maxnum)
availPosition = find( isnan(oper) );

weStillNeed = (trs/maxnum) - numel(thisNum) ;

validThisNum = availPosition(randperm(numel(availPosition),weStillNeed));
oper(validThisNum)=i;

end
end
oper1 = oper;

% figure
% plot(oper1,'-o','Color','b')
% hold on;
% plot(oper2,'-o','Color','r')
% 
% figure
% histogram(oper1,'binMethod','integers')
% title('oper1')
% % 
% figure
% histogram(oper2,'binMethod','integers')
% title('oper2')
% % 
% figure
% histogram(operOper,'binMethod','integers')
% title('operOper')
