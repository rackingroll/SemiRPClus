function [ clusterResult ] = ClusterMethod( clusterMatrix )

X = clusterMatrix;
Y = pdist(X) ;
%Y = squareform(X) ;
% hierarchical clustering
% may be we can use some other cluster measure here
Z = linkage(Y ,'complete'); %single,average,centroid,complete,median,ward

dendrogram(Z,0);

clusterResult = cluster(Z,4) ;

save link-cluster


