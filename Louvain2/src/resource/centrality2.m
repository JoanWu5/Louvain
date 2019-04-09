clear all
clc
data=textread('groupmem.txt');
name=textread('groupname.txt');
for i=1:size(data,1)
    data(i,1)=data(i,1)+1;
    data(i,2)=data(i,2)+1;
end

EdgeTable=table(data(1:end,:),'VariableNames',{'EndNodes'});
G = graph(EdgeTable);
H=G;
j=1;
k=1;
for i=1:max(name)+1
        if (name(j)+1)==i
            j=j+1;
        else
           deletenum(k)=i;
           k=k+1;
        end
end
H=rmnode(G,deletenum);
%degree centrality
degree=centrality(H,'degree');
H.Nodes.Degree=degree;
for i=1:size(degree,1)
    if degree(i)==max(degree)
        degreemax=name(i)+1;
    end
end
figure(1);
p=plot(H);
p.NodeCData=degree;
colormap jet
colorbar
title('Degree Centrality Scores')

%closeness centrality
closeness=centrality(H,'closeness');
H.Nodes.Closeness=closeness;
for i=1:size(closeness,1)
    if closeness(i)==max(closeness)
        closenessmax=name(i)+1;
    end
end
figure(2);
p=plot(H);
p.NodeCData = closeness;
colormap jet
colorbar
title('Closeness Centrality Scores')

%betweenness centrality
betweenness=centrality(H,'betweenness');
H.Nodes.Betweenness=betweenness;
for i=1:size(betweenness,1)
    if betweenness(i)==max(betweenness)
        betweennessmax=name(i)+1;
    end
end
figure(3);
p=plot(H);
n = numnodes(H);
p.NodeCData = 2*betweenness./((n-2)*(n-1));
colormap jet
colorbar
title('Betweenness Centrality Scores')

%eigenvector centrality
eigenvector=centrality(H,'eigenvector');
H.Nodes.Eigenvector=eigenvector;
for i=1:size(eigenvector,1)
    if eigenvector(i)==max(eigenvector)
        eigenvectormax=name(i)+1;
    end
end
figure(4);
p=plot(H);
p.NodeCData = eigenvector ;
colormap jet
colorbar
title('Eigenvector  Centrality Scores')

%PageRank
pg_ranks = centrality(H,'pagerank');
H.Nodes.PageRank = pg_ranks;
for i=1:size(pg_ranks,1)
    if pg_ranks(i)==max(pg_ranks)
        pgranksmax=name(i)+1;
    end
end
figure(5);
p=plot(H);
p.NodeCData = pg_ranks ;
colormap jet
colorbar
title('PageRank Scores')
