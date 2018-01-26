function [points,clus,n,d,k]=point
%clear all

fname=input('Which data set? ','s');

% dat=fopen('../spherical_5_2.dat','r');
dat=fopen(fname,'r');
[points,clus,n,d,k]=readfile(dat);

fclose(dat);
