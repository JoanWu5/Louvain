clear all
clc
data=textread('facebook_combined.txt');

for i=2:size(data,1)
    data(i,1)=data(i,1)+1;
    data(i,2)=data(i,2)+1;
end

EdgeTable=table(data(2:end,:),'VariableNames',{'EndNodes'});
G = graph(EdgeTable);

%degree centrality
degree=centrality(G,'degree');
G.Nodes.Degree=degree;
for i=1:size(degree,1)
    if degree(i)==max(degree)
        degreemax=i;
    end
end
figure(1);
p=plot(G);
p.NodeCData=degree;
colormap jet
colorbar
title('Degree Centrality Scores')

%closeness centrality
closeness=centrality(G,'closeness');
G.Nodes.Closeness=closeness;
for i=1:size(closeness,1)
    if closeness(i)==max(closeness)
        closenessmax=i;
    end
end
figure(2);
p=plot(G);
p.NodeCData = closeness;
colormap jet
colorbar
title('Closeness Centrality Scores')

%betweenness centrality
betweenness=centrality(G,'betweenness');
G.Nodes.Betweenness=betweenness;
for i=1:size(betweenness,1)
    if betweenness(i)==max(betweenness)
        betweennessmax=i;
    end
end
figure(3);
p=plot(G);
n = numnodes(G);
p.NodeCData = 2*betweenness./((n-2)*(n-1));
colormap jet
colorbar
title('Betweenness Centrality Scores')

%eigenvector centrality
eigenvector=centrality(G,'eigenvector');
G.Nodes.Eigenvector=eigenvector;
for i=1:size(eigenvector,1)
    if eigenvector(i)==max(eigenvector)
        eigenvectormax=i;
    end
end
figure(4);
p=plot(G);
p.NodeCData = eigenvector ;
colormap jet
colorbar
title('Eigenvector  Centrality Scores')

%PageRank
pg_ranks = centrality(G,'pagerank');
G.Nodes.PageRank = pg_ranks;
for i=1:size(pg_ranks,1)
    if pg_ranks(i)==max(pg_ranks)
        pgranksmax=i;
    end
end
figure(5);
p=plot(G);
p.NodeCData = pg_ranks ;
colormap jet
colorbar
title('PageRank Scores')
