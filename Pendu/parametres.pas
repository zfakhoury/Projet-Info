unit Parametres;

interface

uses typeDonnees, crt, sysUtils, animation;

procedure parametresJeu(theme: TTheme); // Affiche la vue principale des paramètres
procedure afficherScore(nomFichier: String); // Affiche le score à partir d'un fichier texte
procedure choisirTheme(var theme: TTheme); // Choisir le thème visuel entre clair, sombre et contraste élevé

implementation

procedure afficherScore(nomFichier: String);
    var f: TextFile;
    var ligne: String;
    var key: Char;
    var i: Integer;

    begin
        while True do
            begin
                ClrScr;
                writeln('> Appuyer sur ESC pour quitter.');
                writeln('');
                
                if not fileExists(nomFichier) then
                    animate('Pas de score disponible...', 50, False)
                else 
                    begin
                        assign(f, nomFichier);
                        reset(f);

                        while not EOF(f) do
                            begin
                                readln(f, ligne);
                                writeln(ligne);
                            end;

                        close(f);
                    end;

                key := ReadKey;
        
                case key of
                    ESC:
                        begin
                            ClrScr;
                            animate('🚪 Exiting...', 50, False);
                            for i := 1 to 2 do
                                begin
                                    delay(500);
                                    ClrScr;
                                    write('🚪 Exitin');
                                    animate('g...', 100, False);
                                end;
                            delay(750);
                            break;
                        end;
                end;

            end;
    end;


procedure choisirTheme(var theme: TTheme);
    var input: Integer;

    begin
        repeat
            ClrScr;
            animate('✨ THÈME', 50, True);
            writeln('');

            write('1. Clair');
            if theme = light then
                write(' ✅');
                
            write('  2. Sombre');
            if theme = dark then
                write(' ✅');

            write('  3. Contraste élevé');
            if theme = high_contrast then
                write(' ✅ ');

            writeln('');
            writeln('');

            write('>>> ');
            read(input);

            if ((input >= 1) and (input <= 3)) = false then
                begin
                    ClrScr;
                    animate('❌ Saisie incorrecte...', 50, False);
                    delay(750);
                end;
        until (input >= 1) and (input <= 3);

        if input = 1 then
            begin
                theme := light;
                TextBackground(white);
                TextColor(black);
                ClrScr;
                animate('✅ Mode clair', 50, False);
                delay(750);
            end
        else if input = 2 then
            begin
                theme := dark;
                TextBackground(black);
                TextColor(lightgray);
                ClrScr;
                animate('✅ Mode sombre', 50, False);
                delay(750);
            end
        else if input = 3 then
            begin
                theme := high_contrast;
                TextBackground(yellow);
                TextColor(blue);
                ClrScr;
                animate('✅ Mode contraste élvé', 50, False);
                delay(750);
            end;
    end;


procedure parametresJeu(theme: TTheme);
    var input: Integer;

    begin
        repeat
            ClrScr;

            animate('🕹️ PARAMÈTRES', 50, True);
            writeln('');
            writeln('1. Afficher les scores');
            writeln('2. Choisir le thème');
            writeln('3. Retour');
            writeln('');
            write('>>> ');
            read(input);

            ClrScr;

            if input = 1 then
                afficherScore('resultats.txt')
            else if input = 2 then
                choisirTheme(theme)
            else if input <> 3 then
                begin
                    animate('❌ Saisie incorrecte...', 50, False);
                    delay(750);
                end;

        until input = 3;
    end;


end.
