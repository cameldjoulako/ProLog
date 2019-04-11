/*fibo(0,1)!.
# fibo(1,1)!.
# fibo(N, R):-
# 	N1 is N-1,
# 	N2 is N-2,
# 	fibo(N1,R1),
# 	fibo(N2,R2),
# 	R is R1+R2.



# F0 = 0 f1=1
# Fn+2=Fn+1+Fn*/

fibo(N,R):-
	calfibo(N1,0,1,R).

calfibo(0,A,_,R):-R is A,!.
calfibo(N,A,B,R):-
	N1 is N-1,
	calfibo(N1,B,A+B,R).

