/* 
	int(6*uniform(0)+1) random entre 0-6
	
	select(x);
		when(1) y=4;
		when(2) z=1;
		...	
	end bb;
*/

/*quest1*/
%window fen
#8 'nombre de simulation: ' x 9 attr=underline
#10 'appuyer sur entree...';
%macro inter;
	%display fen;
%mend inter;	
Data Simulation;
	%inter;
	res=&x;
	put res=;
	Do i=1 to res;	
		E1=int(6*ranuni(0)+1);
		E2=int(6*ranuni(0)+1);
		x=min(E1,E2);		
		output;
	end;
run;
proc gchart data=Simulation;
	title "Simulation de la loi de X sous forme d'histogramme horizontal";
	hbar x/space=0 midpoints=1 2 3 4 5 6;
run;
/*quest3*/
%window fen
#8 'nombre de simulation: ' x 9 attr=underline
#10 'appuyer sur entree...';
%macro inter;
	%display fen;
%mend inter;	
Data Simulation;
	%inter;
	res=&x;
	put res=;
	Do i=1 to res;	
		E1=int(6*ranuni(0)+1);
		E2=int(6*ranuni(0)+1);
		x=min(E1,E2);		
		output;
	end;
run;
proc means data=Simulation;
run;
/*quest4*/
Data Simulation;
	res=1000;
	Do i=1 to res;
	X=0;	
		do j=1 to 100;
		E1=int(6*ranuni(0)+1);
		E2=int(6*ranuni(0)+1);
		X=X+min(E1,E2);
		end;
	 output;
	end;
run;
proc gchart data=Simulation;
	title"Histogramme des sommes simulées";
	vbar X/space=0;
run;
proc Univariate normaltest data=Simulation;
 Var X;
run;
Symbol i=rl ci=blue value=dot cv=red h=0.1cm;
proc gplot data=Simulation;
	title "Une représentation graphique de régressions linéaires courantes des 1000 valeurs X";
	plot x*i ;
run;
Symbol1 i=join ci=blue value=dot cv=red h=0.2cm;
proc gplot data=simulation;
	title "Une représentation graphique des 1000 valeurs X";
	plot x*i/ cvref=blue lvref=20 frame;
run;
proc print data=Simulation;
run;
/*quest6*/
%window fen
#8 'nombre de simulation: ' x 9 attr=underline
#9 'la valeur du parametre d : ' d 9 attr=underline
#11 'appuyer sur entree...';
%macro inter;
	%display fen;
%mend inter;	
Data Simulation;
	%inter;
	res=&x;
	put res=;
	para=&d;
	put para=;
	Do i=1 to res;	
		E1=int(6*ranuni(0)+1);
		E2=int(6*ranuni(0)+1);
		x=min(E1,E2);
		select(x);
			when(1) Y=10;
			when(2) Y=5;
			when(3) Y=0;
			when(4) Y=-5;
			when(5) Y=-10;
			when(6) Y=-para;
			end;;	
	 output;
	end;
run;
proc gchart data=Simulation;
	title"Distribution des Y";
	hbar y/space=0 midpoints=10 5 0 -5 -10 -80;
run;
proc means data=Simulation;
run;
proc Univariate plot data=Simulation;
 Var Y;
run;
proc sort data=simulation;
 by x;
run;
proc Univariate plot data=Simulation;
 by X;
 Var Y;
run;
/*quest7*/	
Data Simulation;
	res=1000;
	d=15;
	Do i=1 to res;	
		E1=int(6*ranuni(0)+1);
		E2=int(6*ranuni(0)+1);
		x=min(E1,E2);
		select(x);
			when(1) Y=10;
			when(2) Y=5;
			when(3) Y=0;
			when(4) Y=-5;
			when(5) Y=-10;
			when(6) Y=-d;
			end;	
	 output;
	end;
run;
proc Univariate plot data=Simulation;
 Var Y;
run;
Data Simulation;
	res=1000;
	d=200;
	Do i=1 to res;	
		E1=int(6*ranuni(0)+1);
		E2=int(6*ranuni(0)+1);
		x=min(E1,E2);
		select(x);
			when(1) Y=10;
			when(2) Y=5;
			when(3) Y=0;
			when(4) Y=-5;
			when(5) Y=-10;
			when(6) Y=-d;
			end;	
	 output;
	end;
run;
proc Univariate plot data=Simulation;
 Var Y;
run;
/*quest10*/
Data Simulation;
	res=1000;
	d=15;
	Do i=1 to res;
	Y=0;	
		do j=1 to 100;
		E1=int(6*ranuni(0)+1);
		E2=int(6*ranuni(0)+1);
		x=min(E1,E2);
		select(x);
			when(1) Y1=10;
			when(2) Y1=5;
			when(3) Y1=0;
			when(4) Y1=-5;
			when(5) Y1=-10;
			when(6) Y1=-d;
			end;
		Y=Y+Y1;
		end;
	 output;
	end;
run;
proc gchart data=Simulation;
	title"Histogramme des sommes simulées";
	vbar Y/space=0;
run;
proc Univariate normaltest data=Simulation;
 Var Y;
run;
/*QUEST12*/
%window fen
#8 'la valeur du parametre d ' dd 9 attr=underline
#9 'la valeur du parametre alfa : ' a 9 attr=underline
#10 'la valeur du rayon r : ' r 9 attr=underline
#11 'appuyer sur entree...';
%macro inter;
	%display fen;
%mend inter;
data Simulation;
	%inter;
	d=&dd;
	alfa=&a;
	ray=&r;
	t=(probit(1-alfa/2))**2;
	n=((53000+200*d+35*d**2)*t)/(1296*(ray**2));
	put n=;
run;
%window fen
#8 'la valeur du parametre d ' dd 9 attr=underline
#9 'la valeur du parametre alfa : ' a 9 attr=underline
#10 'la valeur du rayon r : ' r 9 attr=underline
#11 'appuyer sur entree...';
%macro inter;
	%display fen;
%mend inter;
Data Simulation1;
	%inter;
	d=&dd;
	alfa=&a;
	ray=&r;
	t=(probit(1-alfa/2));
	n=((53000+200*d+35*d**2)*(t)**2)/(1296*(ray**2));
	res=100;
	moy=0;
	Do i=1 to res;
		Do j=1 to n;	
		E1=int(6*ranuni(0)+1);
		E2=int(6*ranuni(0)+1);
		x=min(E1,E2);
		select(x);
			when(1) Y=10;
			when(2) Y=5;
			when(3) Y=0;
			when(4) Y=-5;
			when(5) Y=-10;
			when(6) Y=-d;
			end;
		moy=moy+Y;
		end;
	moy=moy/n;
	output;
	put moy=;
	end;
put n=;
run;
Symbol1 i=join ci=blue value=dot cv=red h=0.2cm;
proc gplot data=simulation1;
	title "Une représentation graphique des 100 valeurs Y, calculées avec des limites tracées aux valeurs u et u±r";
	plot moy*i/ vref=0.75 vref=0.25 cvref=blue lvref=20 frame;
run;
proc gchart data=simulation1;
	title "Un camembert permettant de visualiser le pourcentage des 100 valeurs qui sont effectivement dans l'intervalle prévu, et celles qui n'y sont pas.";
	pie moy/ midpoints=0 0.5 1 fill=solid;
run;
proc gchart data=simulation1;
	pie y/ midpoints=10 5 0 -5 -10 -82 fill=solid;
run;
proc print data=simulation;
run;
proc gchart data=Simulation;
	vbar Y/space=0;
run;
