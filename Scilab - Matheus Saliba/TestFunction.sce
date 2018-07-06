
n = 20;
tempos(8) = 0;
//1. Fibonacci (use n>=20)
function [s]=fib(y)  
 s1=1;   
 s2=1;   
  s=zeros(1,y);   
  s(1)=s1;   
  s(2)=s2;   
  for i=3:y   
   s(i)=s(i-1)+s(i-2) ;  
  end   
 endfunction
tic();
fib(n);
tempo = toc();
disp("Fibonacci: ");
disp(tempo);
tempos(1) = tempo;

t = 1000;
//2. Parse Int (use t>=1000)
function n = parseintperf(t)
  for i = 1:t

    s = dec2hex(i); //Converte decimal para hexadecimal
    m = hex2dec(s); //Converte hexadecimal para decimal
  end
end

tic();
parseintperf(t);
tempo = toc();
disp("Parse Int: ");
disp(tempo);
tempos(2) = tempo;



function a = qsort_kernel(a, lo, hi) //Funo agregada do quicksort
  i = lo;
  j = hi;
  while i < hi
    pivot = a(floor((lo+hi)/2));   //floor significa funcao piso
    while i <= j
      while a(i) < pivot, i = i + 1; end
      while a(j) > pivot, j = j - 1; end
      if i <= j
        t = a(i);
        a(i) = a(j);
        a(j) = t;
        i = i + 1;
        j = j - 1;
      end
    end
    if lo < j; a=qsort_kernel(a, lo, j); end
    lo = i;
    j = hi;
  end
end


//3. Quicksort (use n>=5000)
function b = qsort(a) //Funo agregada do quicksort
  b = qsort_kernel(a, 1, length(a));
end

tic();
qsort(rand(1, 5000));
tempo = toc();
disp("Quicksort: ");
disp(tempo);
tempos(3) = tempo;

function v = sortperf(n) //Funo principal de chamada do quicksort
  v = rand(n,1);  //Gera uma matriz nx1 de numeros aleatrios entre 0 e 1
  v = qsort(v);
end

z = 100;
//4. Mandelbrot
function n = mandel(z) //Funo agregada do mandelperf
  n = 0;
  c = z;
  for n=0:79
    if abs(z)>2 //Se z=a+bi ento abs(z)=sqrt(a^2+b^2)
      return
    end
    z = z^2+c;
  end
  n = 80;
end

tic();
mandelperf(z);
tempo = toc();
disp("Mandelbrot: ");
disp(tempo);
tempos(4) = tempo;

function M = mandelperf(ignore) //Funo principal
  M = zeros(length(-2.0:.1:0.5), length(-1:.1:1)); 
  count = 1;
  for r = -2:0.1:0.5 
    for i = -1:.1:1
      M(count) = mandel(complex(r,i)); //complex(a,b)=a+bi
      count = count + 1;
    end
  end
end

ignore = 1000;
//5. Gerao de \pi
function sum = pisum(ignore) //Forma no vetorizada
  sum = 0.0;
  for j=1:500
    sum = 0.0;
    for k=1:10000
      sum = sum + 1.0/(k*k);
    end
  end
end

tic();
pisum(ignore);
tempo = toc();
disp("Soma PI: ");
disp(tempo);
tempos(5) = tempo;


function s = pisumvec(ignore) //Forma vetorizada 
  a = [1:10000]
  for j=1:500
    s = sum( 1./(a.^2));
  end
end

t = 1000;
//6. Estatstica em matriz aleatria (use t>=1000)
function randmatstat(t)
  n = 5;
  v = zeros(t); //Gera uma matriz txt de zeros
  w = zeros(t);
  for i = 1:t
    a = rand(n,n); //Matriz nxn de n aleatrios com distribuio normal
    b = rand(n,n);
    c = rand(n,n);
    d = rand(n,n);
    P = [a b c d];
    Q = [a b; c d];
    v(i) = trace((P'*P)^4); //trace=Trao de matriz e P'=transposta de A
    w(i) = trace((Q'*Q)^4);
  end
  stdev(v)/mean(v);  //desvio e mdia so calculados por coluna da matriz.
  stdev(w)/mean(w);
end

tic();
randmatstat(t);
tempo = toc();
disp("Estatstica em matriz aleatoria: ");
disp(tempo);
tempos(6) = tempo;

//7. Relao sucessiva
// Faa um teste para 
A=[4 -2 1 3 0;-1 10 0 8 1;-1 1 15 2 4;0 1 10 5 1; 2 -3 1 2 20];
b=[15;56;74;57;107];w=1.6;Toler=1e-5;IterMax=500;
function [Iter,x,NormaRel]=SOR(A,b,w,Toler,IterMax) 
  n=size(A,2);
  for i=1:n
    r=1/A(i,i);
    for j=1:n
      if (i~=j), A(i,j)=A(i,j)*r;
      end
    end
    b(i)=b(i)*r; x(i)=b(i);
  end
  Iter=0; NormaRel=1000;
  while (NormaRel > Toler && Iter < IterMax)
    Iter=Iter+1;       
    for i=1:n
      soma=0;
      for j=1:n
        if (i~=j), soma=soma+A(i,j)*x(j); end
      end
      v(i)=x(i); x(i)=w*(b(i)-soma)+(1-w)*x(i);
    end
    NormaNum=0; NormaDen=0;
    for i=1:n
      t=abs(x(i)-v(i));
      if (t>NormaNum), NormaNum=t; end
      if abs(x(i))>NormaDen, NormaDen=abs(x(i)); end
    end
    NormaRel=NormaNum/NormaDen; //Iter,x,NormaRel;
  end
  if NormaRel <= Toler
    CondErro =0;
  else
    CondErro=1;
  end
end

tic();
[Iter,x,NormaRel]=SOR(A,b,w,Toler,IterMax) ;
tempo = toc();
disp("Relacao sucessiva: ");
disp(tempo);
tempos(7) = tempo;


//8. Mtodo de Newton
//Faa um teste com 
x0=4;Toler=1.0000e-05;IterMax=100;
function [f]=f(x)
f=x^4+2*x^3-13*x^2-14*x+24;
end
//
function [f]=df(x)
f=4*x^3+6*x^2-26*x-14;
end

function [Raiz,Iter,CondErro]=Newton(x0,Toler,IterMax) 
//Saida: Raiz  a raiz da funcao; 
//       Iter  a quantidade de itearacoes feitas; 
//       CondErro=0 se a raiz foi encontrada e 
//       CondErro=1 se nao for encontrada
  Fx=f(x0); DFx=df(x0);x=x0;Iter=0; //f=funo e df=derivada de f                      
  DeltaX=1000;
  DF=1;
  while ( (abs(DeltaX)>Toler || abs(Fx)>Toler) && (DF~=0) && (Iter <IterMax) )
    DeltaX=-Fx/DFx;x=x+DeltaX;Fx=f(x);DFx=df(x);Iter=Iter+1;
  end
  Raiz=x;
  if abs(DeltaX)<=Toler && abs(Fx)<=Toler
    CondErro=0;
  else
    CondErro=1;
  end
end

tic();
[Raiz,Iter,CondErro]=Newton(x0,Toler,IterMax) ;
tempo = toc();
disp("Newton: ");
disp(tempo);
tempos(8) = tempo;

disp(tempos);
