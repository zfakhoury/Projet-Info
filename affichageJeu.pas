unit affichageJeu;

interface

uses crt, typeDonnees;

procedure afficherMot(valide: Boolean; mot: TMot);
procedure afficherPendu(tentatives: Integer);

implementation

procedure afficherMot(valide: Boolean; mot: TMot);
    var i: Integer;

    begin
        for i := 1 to mot.longueurMot do
            if mot.cache[i] = true then
                write('_ ')
            else
                write(UpCase(mot.chaine[i]), ' ');
    end;

procedure afficherPendu(tentatives: Integer);
    begin
        writeln('  _______');
        writeln('  |     |');

        case tentatives of
            0: 
            begin
                writeln('  |');
                writeln('  |');
                writeln('  |');
            end;

            1: 
            begin
                writeln('  |     O ');
                writeln('  |');
                writeln('  |');
            end;

            2: 
            begin
                writeln('  |     O ');
                writeln('  |     | ');
                writeln('  |');
            end;

            3: 
            begin
                writeln('  |     O ');
                writeln('  |    /| ');
                writeln('  |');
            end;

            4: 
            begin
                writeln('  |     O ');
                writeln('  |    /|\');
                writeln('  |');
            end;

            5: 
            begin
                writeln('  |     O ');
                writeln('  |    /|\');
                writeln('  |    /  ');
            end;

            6: 
            begin
                writeln('  |     O ');
                writeln('  |    /|\');
                writeln('  |    / \');
            end;
        end;

        writeln('  |');
        writeln('__|__');
    end;
    
end.
