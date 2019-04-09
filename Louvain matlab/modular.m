function modularity = modular(C,A,m)
current_com = unique(C); %社区
modularity = 0; %模块度
for i = 1:length(current_com)
   member = C==current_com(i); %成员
   outer = C~=current_com(i); %非成员
   current_out = sum(sum( A(member,outer) )); %外部总边权
   current_in = sum(sum( A(member,member) ))/2; %内部总边权
   current_tot = current_in + current_out; %总边权
   modularity = modularity + ( current_in/(2*m) - current_tot/(2*m) * current_tot/(2*m) );
end
