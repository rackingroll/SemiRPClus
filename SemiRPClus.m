%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SemiRPClus
% Author: Chen Luo from Jilin University
% Paper: Semi-supervised Clustering on Heterogeneous Information Network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data Extraction From the txt Files
% Including Author, Paper, Conference, Term
[AP,CP,PP,TP] = DataExtraction () ;
[P1,P2,P3,P4,P5,P6,P7,P8,P9,P10] = GetStructureMatrix(AP,CP,PP,TP) ;

% Initialization All the data to Meta Path Form
Para = 0.2 ; % Seed Fraction is 0.2
[userGuide,groundtruth] = GetSeedMatrix(Para) ;

%Calculation of Meta Path
%RandWalk,SymRandWalk,Normalization,PathSim
PS1 = PathSim(P1) ; 
PS2 = PathSim(P2) ;
PS3 = PathSim(P3) ;
PS4 = PathSim(P4) ;
PS5 = PathSim(P5) ;
PS6 = PathSim(P6) ;
PS7 = PathSim(P7) ;
PS8 = PathSim(P8) ;
PS9 = PathSim(P9) ;
PS10 = PathSim(P10) ; 

% Training the weight of each Meta Path
[PT1,PT2,PT3,PT4,PT5,PT6,PT7,PT8,PT9,PT10,guide] = TrainingMetaPath(PS1,PS2,PS3,PS4,PS5,PS6,PS7,PS8,PS9,PS10,userGuide) ;
A = Training(PT1,PT2,PT3,PT4,PT5,PT6,PT7,PT8,PT9,PT10,guide);

% Get Similarity Matrix
resultMatrix = GetResultMatrix (A,PS1,PS2,PS3,PS4,PS5,PS6,PS7,PS8,PS9,PS10);
resultMatrix=resultMatrix-diag(diag(resultMatrix)-diag(0)) ;

% Clustering
clusterResult = ClusterMethod(resultMatrix) ;

% Evaluation
[userGuideMatrix,userGuideInf] = getUserguideMatrix(userGuide);
nmi = UserguideNMI(clusterResult',groundtruth');
ac = Accuracy(clusterResult,groundtruth)

