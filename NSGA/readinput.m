function [no_gen,pop_size,pcross,pmut,no,selc,weight,alpha,beta]=readinput

selc=0;
%no_gen=input('No. of generations: ');
no_gen=100;
%pop_size=input('Population size (Even no.): ');
pop_size=100;
%pcross=input('Crossover probability: ');
pcross=0.7;
%pmut=input('Mutation probability: ');
pmut=0.2;
%no=input('No. of objectives (1/2): ');
%if no==1
    %selc=input('Enter 1 for Jm or 2 for XB: ');
    %end
no=2;
%weight=input('Fuzzy exponent m:(>1): ');
weight=2;

%alpha=input('Membership threshold (alpha) (between 0 and 1): ');
alpha=0.5;
beta=0.5;
%beta=input('Majority voting threshold (beta) (between 0 and 1): ');