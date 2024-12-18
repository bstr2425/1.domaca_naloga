format long
filename = 'naloga1_1.txt'; 
t = readmatrix(filename, 'NumHeaderLines', 2);





odpdat = fopen('naloga1_2.txt', 'r');
prva_vrstica= fgetl(odpdat);
razdeljena= strsplit(prva_vrstica, ':');
st_podatkov= str2double(strtrim(razdeljena{2}));
P = zeros(st_podatkov, 1);

for i = 1:st_podatkov
    P(i) = fscanf(odpdat, '%f', 1);
end

figure
plot(t, P)
xlabel('t[s]')
ylabel('P[W]')
title('P(t)')


funkcija_moci= @(x) spline(t, P, x)

function integral = trapezna_metoda(funkcija_moci, a, b, n)
     sprememba_x= (b - a) / n;
     prva_zadnja= (funkcija_moci(a)- funkcija_moci(b))/2;

for i = 1:n-1
    x = a + i * sprememba_x;
    prva_zadnja = prva_zadnja + funkcija_moci(x);
end

     moj_integral = sprememba_x * prva_zadnja

end


a = t(1);
b = t(end);
n=100;
fprintf('Približen rezultat integrala z mojo definirano metodo je: %f\n')
trapezna_metoda(funkcija_moci, a,b,n)
fprintf('Vrednoat integrala z vgrajeno trapezno metodo pa je: %f\n')
funkcija_trapz= trapz(t, P)



%fprintf('Približen rezultat integrala z mojo definirano metodo je: %f\n',moj)

