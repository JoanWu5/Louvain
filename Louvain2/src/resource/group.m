a=textread('answer.txt');
groupl=max(a)+1;
b=zeros(groupl,1);
for i=1:size(a,1)
    b(a(i)+1)=b(a(i)+1)+1;%b�洢a��ÿ��ĸ���
end
maxgroup=max(b);%a��14������
for i=1:size(b,1)
    if b(i)==maxgroup
        num=i-1;
    end
end

k=1;
%groupmen�洢����ĵ������
for i=1:size(a,1)
    if a(i)==num
        groupmem(k,1)=i-1;
        k=k+1;
    end
end

facebook=textread('facebook_combined.txt');
mm=1;
%finalΪ����groupmem��ı�
for i=2:size(facebook,1)
        for k=1:size(groupmem,1)
            if groupmem(k,1)==facebook(i,1)
                for j=k+1:size(groupmem,1)
                    if groupmem(j,1)==facebook(i,2)
                        final(mm,1)=facebook(i,1);
                        final(mm,2)=facebook(i,2);
                        mm=mm+1;
                    end
                    
                end 
            end 
        end
end

%��finalд��groupmem.txt
fid =fopen('groupmem.txt','w')
[b1 b2]=size(final);
for i=1:b1
    for j=1:b2
       fprintf(fid,'%10d',final(i,j));
    end
   fprintf(fid,'\n');
end
fclose(fid);

fid=fopen('groupname.txt','w')
[b1 b2]=size(groupmem);
for i=1:b1
    for j=1:b2
       fprintf(fid,'%10d',groupmem(i,j));
    end
   fprintf(fid,'\n');
end
fclose(fid);