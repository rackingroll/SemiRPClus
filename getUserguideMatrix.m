function [userGuideMatrix,userGuideInf] = getUserguideMatrix ( userGuide )

%you can use everything to do this
count = size(userGuide,1) ;

userGuideMatrix = zeros(count,count) ;

for i = 1:count
	for j = 1:count
		if	userGuide(i) == userGuide(j) && userGuide(j)~= 0
			userGuideMatrix(i,j) = 1 ;
		elseif	userGuide(i) ~= userGuide(j) && userGuide(j)~= 0
			userGuideMatrix(i,j) = 0 ;
		else
			userGuideMatrix(i,j) = 0.5 ;
		end
	end
end

userGuideInf = find (userGuide~=0);
end