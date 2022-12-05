function nfac = facultaet(n)

if n == round(n)  % when die Zahl ist ganzzahlig
    if n == 0
        nfac = 1;
    else
        nfac = n * facultaet(n-1);
    end
else
    disp(' Bitte geben Sie eine ganzzahliges Zahl ')
end

end