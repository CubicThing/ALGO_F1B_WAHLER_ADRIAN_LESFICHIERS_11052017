program multiply;

VAR

    one,two : file of integer;
    i : integer;

BEGIN

    assign(one, 'one'); //Assignation des fichiers
    assign(two, 'two');
    rewrite(one);       //On réécrit one, puisqu'il doit toujours etre vide.

    for i := 1 to 10 do
        write(one,i);   //On écrit dans le fichier des chiffres de 1 a 10. Ce fichier étant typé, on ne peut y écrire directement au clavier, car cela ne créerais pas de type integer.
    
    reset(one);         //On passe one en mode lecture seule; il n'a plus besoin d'etre modifié pour le reste du programme.
    rewrite(two);       //On réécrit two pour la meme raison que one, ce qui le met en mode réécriture.
                        //On a maintenant one en mode lecture, et two en ecriture
    while not EoF(one) do //A répeter jusqu'a la fin du fichier.
    BEGIN
        read(one,i);    //On met la valeure actuelle de one dans i. Ce sera donc 1, puis 2, puis 3... Cela est possible car il est en mode lecture.
        write(two,(i*2))//On écrit le double de i dans two. Cela est possible puisqu'il est en mode écriture.
    END;
    close(one);         //On a plus besoin de one, on le ferme donc.
    reset(two);         //On passe ensuite two en mode lecture, puisqu'on doit maintenant le lire et pas le modifier.
    while not EoF(two) do
    BEGIN
        read(two,i);    //On met la valure du pointeur de two dans i
        writeln(i);     //Puis on l'affiche a l'écran.
    END;
    close(two);         //Puis on ferme two, puisqu'on en a plus besoin.
    readln();

END.
