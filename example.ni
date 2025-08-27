"Le Roi de Fihnargaia" by Eric Forgeot (in French)

Le story genre est "Aventure". Le story creation year est 2009. Le story headline est "Une introduction à la fiction interactive". La story description est "La rencontre du héros et de la famille royale".
Release along with an interpreter.

Talking to is an action applying to one visible thing.
Understand "talk to [someone]", "talk to [something]", "speak to [someone]", "speak to [something]", "parler a/au/aux/avec/-- [someone]", "parler a/au/aux/avec/-- [something]", "questionner [someone]" or "questionner [something]" as talking to.
Understand the command "discuter" as "parler".

Check talking to:
	if the noun is not a person, say "Vous ne pouvez pas parler [au noun][_]!" instead.

Check talking to:
	if the noun is the player, say "Vous vous parlez  à vous-même pendant un moment." instead;

Report talking to:
	say "Vous n'avez rien à dire.".

Rule for clarifying the parser's choice of something (called item) while talking to:
	say "([au item])[command clarification break]".

Understand the command "read" as something new.
Understand the command "lire" as something new.
Reading is an action applying to one visible thing and requiring light.
Understand "read [something]" or "lire [something]" as reading.

Report reading:
	say "Il n'y as rien de spécial à lire ici.".

Waving hands to is an action applying to one thing. Understand "saluer [someone]" or "saluer [someone] avec la main" as waving hands to.

Report waving hands to:
	say "Vous saluez [le noun].".

Swimming is an action applying to nothing.
Understand "swim" or "nager" as swimming.
Understand the command "dive" as "swim".
Understand the command "plonger" as "nager".

Check swimming:
	say "Il n'y as pas assez d'eau pour nager ici." instead.

Une personne can be distrait. Une personne is usually not distrait.

Le Petit couloir est un endroit.

Le player est vêtu du tablier (m). La poche est une partie du tablier. La poche est un contenant. La clé est dans la poche. Understand "cle/clef" as la clé.

Part 1 - Le Hall

Le Grand Hall de Fihnargaia est un endroit. "Le Grand Hall de Fihnargaia est luxueusement meublé[if unvisited], vous ne vous lassez jamais de ce spectable grandiose. Vous semblez attendu[end if]. L'unique sortie est au sud."

Les meubles luxueux sont des choses scenery dans le Grand Hall.

Les gardes sont des hommes dans le Grand Hall.

Le trône est une chose scenery dans le Grand Hall. Understand "trone/trones" as le trône.

L' estrade (f) est une chose scenery dans le Grand Hall.

Les pierres (f) sont des choses scenery dans le Grand Hall. Understand "mur/murs" or "pierre" as les pierres.

Instead of opening les meubles, say "Vous n'êtes pas chez vous ici, et vous ne pouvez pas non plus vous permettre de faire comme chez vous devant la famille royales et ses nombreux gardes.".

Le Petit couloir est au sud du Grand Hall. Le Petit couloir est à l'extérieur du Grand Hall.
La description est "Les murs sont couverts de lampes brillant de mille feux. Au nord se trouve le grand hall où vous attend le roi, tandis que le couloir où vous vous trouvez actuellement oblique vers l'est."

Le hall_décor est une chose scenery privately-named dans le Petit couloir. Understand "grand hall" or "hall" as le hall_décor. Le printed name est "hall".

Des lampes (f) sont des appareils fixed in place switched on undescribed dans le Petit couloir.
Understand "lampe" as les lampes.

Le roi des Nains est un homme dans le Grand Hall. La description est "Le roi des nains vous regarde avec bienveillance.". L' indefinite article est "le".

La reine des Nains est une femme dans le Grand Hall. La description est "La reine fixe les pierres du mur d'en face.". L' indefinite article est "la".

Instead of talking to le roi for the first time, say "« Bienvenue à toi, Gjörfon, et merci de t'être présenté aussi promptement à ma requête. Si je t'ai fait quérir, c'est parce que je connais ton dévouement et ta fidélité en tant que cuisinier en chef de notre domaine.
Le mois dernier, tu nous avais servi un excellent hydromel lors de la fête de Räz-Trepft, et je viens d'apprendre que l'ambassadeur de la tribu des Flianglii devait venir ici à Fihnargaia en délégation spéciale, dès demain.
Pour le recevoir comme il se doit, je souhaite lui présenter cet hydromel qui représente tout notre savoir-faire artisanal. »[line break]"

Instead of doing something to les pierres when la reine n'est pas distrait and le roi n'est pas distrait, say "Il serait inconvenant de tourner ainsi votre dos aux monarques.".

Instead of throwing le tablier at la reine des Nains, say "De rage mais sans raison apparente, vous jetez votre tablier à la figure de la Reine. Son époux, malgré sa bonhommie légendaire, s'en offusque, et il vous fait jeter dans les cachots sombres de Fihnargaia.[line break]Six mois plus tard, vous revoilà devant lui.".

Instead of kissing la reine, say "Sans raison apparente, vous vous jetez comme un malotru au cou de la Reine et l'embrassez sur la bouche. Le roi, malgré sa bonhommie légendaire, s'en offusque, et il vous fait jeter dans les cachots sombres de Fihnargaia.[line break]Six mois plus tard, vous revoilà devant lui.".

Instead of waving hands to la reine, say "Vous saluez la Reine mais, sans le faire exprès, votre geste est pris pour un bras d'honneur. Le roi, malgré sa bonhommie légendaire, s'en offusque, et il vous fait jeter dans les cachots sombres de Fihnargaia.[line break]Six mois plus tard, vous revoilà devant lui.".

Instead of giving tablier to la reine, say "Vous détachez votre tablier pour le présenter à la reine mais, maladroit comme vous l'êtes, vous détachez en même temps votre pantalon, qui tombe à vos pieds. La reine n'a pas l'air intéressée. Le roi, malgré sa bonhommie légendaire, s'en offusque (ou est vaguement jaloux), et il vous fait jeter dans les cachots sombres de Fihnargaia.[line break]Six mois plus tard, vous revoilà devant lui.".

Instead of showing le tablier to la reine, try giving le tablier to la reine.

Instead of attacking la reine, say "Vous montez sur l'estrade où se trouve le couple royal, mettez votre poing comme un marteau et l'abattez de toutes vos forces sur la tête de la reine. Malgré sa bonhommie légendaire, son époux s'en offusque (ou est vaguement jaloux), et il vous fait jeter dans les cachots sombres de Fihnargaia.[line break]Six mois plus tard, vous revoilà devant lui.".

Instead of giving or showing la chope to la reine when hydromel est dans la chope:
	say "Vous tendez la chope à la royale souveraine, qui boit l'hydromel d'une seule traite. Elle se lève, titubante, et tombe ivre morte. Malgré sa bonhommie légendaire, son époux s'en offusque, et il vous fait jeter dans les cachots sombres de Fihnargaia.[line break]Six mois plus tard, vous revoilà devant lui.".

Before giving hydromel to la reine:
	try giving la chope to la reine;
	stop the action.

Before showing hydromel to la reine:
	try giving la chope to la reine;
	stop the action.

Instead of giving or showing la chope to le roi when l' hydromel est dans la chope:
	say "Vous tendez la chope à votre souverain, qui la porte a ses lèvres, et boit une longue rasade d'hydromel d'un air satisfait. Puis il passe la chope à son épouse pour qu'elle goûte également.";
	now le roi des nains est distrait;
	now la reine des nains est distrait;
	say "[line break]Le couple royal est très satisfait, la prochaine fête sera une réussite, à n'en pas douter[_]!";
	end the story finally saying "Vous avez gagné";

Before giving l' hydromel to le roi:
	try giving la chope to le roi des Nains;
	stop the action.

Before showing l' hydromel to le roi:
	try giving la chope to le roi;
	stop the action.

Part 2 - La cuisine

Les Cuisines (f) sont à l'est du Petit couloir. La description est "Votre univers est continuellement empli de vapeurs et d'effluves agréables, et une dizaines de commis s'activent aux fourneaux ou derrière de succulentes pâtisseries.".

Les commis sont des hommes dans les cuisines.
Les fourneaux sont scenery dans les cuisines.

Les pâtisseries sont des choses edible dans les cuisines. Understand "patisserie/patisseries" as les pâtisseries.

Instead of smelling les pâtisseries, say "Une bonne odeur appétissante[unicode 8230]".

Le grimoire est dans les cuisines. La description est "Ce sont des recettes de cuisine.".

Instead of consulting le grimoire about "hydromel", say "Pour préparer de l'hydromel, il faut mettre ensemble de l'eau, du miel et des levures, et faire ensuite le rituel de Târ Ru Thrin, qui consiste à monter sur le tonneau et à dire les phrases consacrées (seul un maître cuisinier peut le faire).".

Instead of consulting le grimoire about "l' hydromel", try consulting le grimoire about "hydromel".

Instead of reading le grimoire, say "Vous pouvez consulter le grimoire à propos du sujet qui vous intéresse, mais c'est sans doute le thème de l'hydromel qui vous préoccupe le plus en ce moment...".

Le tonneau est un contenant dans les cuisines. La description est "Un gros tonneau grand deux fois comme vous, qui vous sert à brasser de la bière ou de l'hydromel. Il y a un petit robinet à son extrémité.".

Les eaux (f) sont dans le tonneau. Les eaux sont singular-named. Understand "eau" as les eaux. Le printed name est "eau". L' indefinite article est "de l[']".

Instead of unlocking le tonneau with la clé, say "Cela aurait vraiment été une bonne idée de pouvoir empêcher quiconque de se servir dans le tonneau, car parfois on croirait que ce qu'il contient à tendance à s'évaporer, mais le tonnelier n'était pas assez habile pour y poser un verrou.".

Instead of swimming when les eaux sont dans le tonneau, say "Voilà[_]! C'est exactement à cela que sert l'eau, et à cela uniquement. Par contre, il n'y en a qu'un fond dans ce tonneau, et il servira malgré tout à brasser l'hydromel.".

After printing the name of le tonneau:
	omit contents in listing.

Le robinet est une partie du tonneau.

L' hydromel est une chose. L' indefinite article est "de l[']".

Instead of drinking l' hydromel, say "Ce n'est pas l'envie qui vous en manque, mais le roi préférerait être servi avant.".

Instead of drinking les eaux, say "Pouah[_]! Boire de l'eau devant tout ce monde, et c'est l'assurance d'être la risée de Fihnargaia en très peu de temps. Il ne sera pas dit que Drâh Bar Ruhk s'abreuve d'eau[_]!".

Instead of climbing le tonneau:
	say "Vous escaladez le grand tonneau et faites un peu le pitre dessus pour amuser vos employés, en dansant, chantant et grimaçant. Puis, la comédie terminée, vous redescendez au sol.".

Instead of climbing le tonneau when le pot de miel est dans le tonneau and le pot de levures est dans le tonneau:
	say "Vous escaladez le grand tonneau et faites un peu le pitre dessus pour amuser vos employés, en dansant, chantant et grimaçant. Puis, le rituel terminé, vous redescendez au sol. La magie a sans doute opéré, comme d'habitude.";
	remove le pot de miel from play;
	remove les eaux from play;
	remove le pot de levures from play;
	now l' hydromel est dans le tonneau.

Instead of entering le tonneau, try climbing le tonneau.

Instead of turning le robinet when l' hydromel n'est pas dans le tonneau, say "Vous vous êtes engagé à ne tourner ce robinet que quand du bon hydromel sera dedans.".

Instead of turning le robinet when l' hydromel est dans le tonneau:
	now l' hydromel est dans la chope;
	now le player porte la chope;
	say "Vous prenez une chope et la remplissez avec de l'hydromel.".

La grande armoire est un contenant closed openable locked dans les cuisines.

La clé ouvre la grande armoire.

Instead of pushing or pulling la chaise, say "Cette chaise est bien là où elle est."

Le pot de miel est dans l' armoire. Le pot de levures est dans l' armoire.

La chope est un contenant dans l' armoire.

La chaise est un support. La chaise est dans les cuisines. La chaise est enterable.

Instead of going east when la location est le Petit couloir and le Grand Hall n'est pas visited, say "Le Roi vous ayant convoqué, vous feriez bien de ne pas le faire attendre. Vous retournerez à vos cuisines ensuite.".

Instead of talking to les commis, say "Vous murmurez rapidement quelques ordres à vos commis pour arranger les derniers détails du repas en cours.".

Instead of listening to les commis, say "Ils chantonnent tout en travaillant, et parfois certains disent du mal de vous. Sans doute ne vous ont-il pas entendu arriver.".

Test me with "ouvrir lampes/fermer lampes/allumer lampes/eteindre lampes/allumer lampes/aller au nord/examiner meubles/ouvrir meubles/saluer le roi/parler au roi/regarder la reine/laisser tablier/prendre tablier/mettre tablier/jeter tablier vers le roi/embrasser le roi/donner tablier au roi/attaquer les gardes/attendre/inventaire/test mauvais/test cuisine".

Test mauvais with "embrasser la reine/jeter tablier vers la reine/saluer la reine/donner tablier à la reine/montrer tablier à la reine/attaquer la reine"

Test cuisine with "sud/est/sentir tonneau/pousser tonneau/tirer tonneau/pousser chaise/tirer chaise/tourner chaise/monter sur la chaise/descendre/tourner robinet/grimper sur tonneau/boire eau/nager/grimper sur armoire/mettre tablier dans armoire/verrouiller tonneau avec cle/verrouiller armoire avec cle/deverrouiller armoire avec cle/chanter/sentir patisseries/manger patisseries/x grimoire/lire grimoire/consulter grimoire au sujet de hydromel/ouvrir armoire/prendre miel/prendre levures/mettre miel dans tonneau/mettre levures dans tonneau/escalader tonneau/tourner robinet/ouest/nord/donner chope au Roi"