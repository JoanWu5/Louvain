function modularity = modular(C,A,m)
current_com = unique(C); %����
modularity = 0; %ģ���
for i = 1:length(current_com)
   member = C==current_com(i); %��Ա
   outer = C~=current_com(i); %�ǳ�Ա
   current_out = sum(sum( A(member,outer) )); %�ⲿ�ܱ�Ȩ
   current_in = sum(sum( A(member,member) ))/2; %�ڲ��ܱ�Ȩ
   current_tot = current_in + current_out; %�ܱ�Ȩ
   modularity = modularity + ( current_in/(2*m) - current_tot/(2*m) * current_tot/(2*m) );
end
