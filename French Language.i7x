Version 12/210430 of French Language by Nathanael Marion begins here.

"To make French the language of play. (Pour définir le français comme langue dans Inform 7.)"

"taper VF pour plus d'informations"

[Pour la version 6L38 d'Inform 7.]

[Cette action liste les gens qui ont contribué à l'extension.]
Requesting the French extension credits is an action out of world applying to nothing.
Understand "version francaise" and "vf" as requesting the French extension credits.

Carry out requesting the French extension credits:
	say "La traduction française d'Inform[_]7 est maintenue par Nathanaël Marion et est basée sur le travail précédent d'Éric Forgeot et de Graham Nelson.[paragraph break]Elle inclut également du code provenant de la bibliothèque de traduction d'Inform[_]6, écrite initialement par Jean-Luc Pontico et à laquelle ont contribué entre autres Éric Forgeot, Hugo Labrande, Samuel Verschelde et Rémi Verschelde.[paragraph break]Merci à tous les contributeurs et à la communauté de Fiction-interactive.fr (http://www.fiction-interactive.fr/)[_]![paragraph break]Merci également à la communauté hispanophone (http://www.caad.es/informate/infsp/index.htm) pour l'aide qu'elle a apportée. [italic type]All hail to Sarganar and the Spanish translation team![roman type][line break]"

Volume 1 - Settings

[Des options pour configurer l'extension.]

[0 pour soixante-dix, 1 pour septante.]
Use variante soixante-dix translates as (- Constant VARIANTE_70 = 0; -).
Use variante septante translates as (- Constant VARIANTE_70 = 1; -).

[0 pour quatre-vingts, 1 pour huitante, 2 pour octante.]
Use variante quatre-vingts translates as (- Constant VARIANTE_80 = 0; -).
Use variante huitante translates as (- Constant VARIANTE_80 = 1; -).
Use variante octante translates as (- Constant VARIANTE_80 = 2; -).

[0 pour quatre-vingt-dix, 1 pour nonante.]
Use variante quatre-vingt-dix translates as (- Constant VARIANTE_90 = 0; -).
Use variante nonante translates as (- Constant VARIANTE_90 = 1; -).

[TODO: Quand on utilise ces options, les variantes ci-dessus sont définies directement en I6, alors les conditions comme "if the variante septante is active" seront toujours fausses, même en utilisant Belgian ou Swiss dialect.]
Use Belgian dialect translates as (- Constant DIALECT_BELGIUM; -).
Use Swiss dialect translates as (- Constant DIALECT_SWITZERLAND; -).

Include (-
! Des valeurs par défaut pour la Belgique.
#Ifdef DIALECT_BELGIUM;
Default VARIANTE_70 1; ! Septante.
Default VARIANTE_90 1; ! Nonante.
#Endif;

! Des valeurs par défaut pour la Suisse.
#Ifdef DIALECT_SWITZERLAND;
Default VARIANTE_70 1; ! Septante.
Default VARIANTE_80 1; ! Huitante.
Default VARIANTE_90 1; ! Nonante.
#Endif;

! Les valeurs par défaut.
Default VARIANTE_70 0; ! Soixante-dix.
Default VARIANTE_80 0; ! Quatre-vingts.
Default VARIANTE_90 0; ! Quatre-vingt-dix.
-) after "Use options" in "Output.i6t".

[A language extension is required to set the following variable correctly:]

The language of play is the French language.

[The following only needs to be done for inflected languages which distinguish
the genders -- which is why English doesn't do it.]

An object has a grammatical gender.

[Inform initialises this property sensibly. We can easily check the results:

	When play begins:
		repeat with T running through things:
			say "[T] has [grammatical gender of T]."

By default, if Inform can't see any reason to choose a particular gender,
it will use neuter. We want to change that for French, since French doesn't
have neuter nouns:]

The grammatical gender of an object is usually masculine gender.
The grammatical gender of a woman is usually feminine gender.

[Now we define any unusual tenses we want to support. Inform allows up to 7
tenses, and it requires tenses 1 to 5 to be present, past, perfect, past
perfect, and future; English stops there, but two slots are left free for
other languages to create. For French, we will use tense number 6 for the
rather literary past historic tense.]

The past historic tense is a grammatical tense.


[Il sera utile de faire la distinction entre les temps simples et composées dans les réponses.]
Definition: a grammatical tense is composé rather than simple if it is the perfect tense or it is the past perfect tense.

[It's customary to define a constant so that I6 code can conditionally compile
if we're using this extension, though nothing in the I7 compiler needs it.]

Include (-
Constant LIBRARY_FRENCH; ! For dependency checking.
-)

[Ajoute l'espace insécable à la table des Zcharacters si on compile vers la Z-machine (ce qui est possible avec $OMIT_UNUSED_ROUTINES=1).]
Include (-
#Ifdef TARGET_ZCODE;
Zcharacter table + '@{A0}';
#Endif;
-) after "Z-Machine Definitions" in "Definitions.i6t"


[Ci-dessous, le code permettant de savoir si un texte I7 commence par une voyelle (utile pour l'élision).
On utilise I6 parce qu'il s'agit d'une condition utilisée relativement régulièrement et qu'utiliser les phrases I7 pour accéder au premier caractère (ou peut-être pire utiliser une expression régulière) est beaucoup plus lent. (Vraisemblablement négligeable quand on le fait ponctuellement, mais tant qu'à faire.)]

Include (-
[ TextStartsWithAVowel txt  cp p letter result;
	if (txt == 0) return 0;
	cp = txt-->0; p == TEXT_TY_Temporarily_Transmute(txt);
	letter = BlkValueRead(txt, 0);
	! If the text is empty, letter will be 0 and the function will return false, as expected.
	if (IsAnA(letter) || IsAnE(letter) || IsAnI(letter) || IsAnO(letter) || IsAnU(letter) || letter == 'h' or 'H') {
		result = true;
	} else {
		result = false;
	}
	TEXT_TY_Untransmute(txt, p, cp);
	return result;
];
-)

To decide whether (T - a text) starts with a vowel:
	(- (TextStartsWithAVowel({-by-reference:T})) -)

Volume 2 - Language

Part 2.1 - Determiners

Chapter 2.1.1 - Articles

To say le/la/l'/les (O - object):
	say "[the O]".

To say un/une/des (O - object):
	say "[a O]".

To say Le/La/L'/Les (O - object):
	say "[The O]".

To say Un/Une/Des (O - object):
	say "[A O]".

[Permet d'afficher "des", "du" ou "de la" en fonction de l'objet]
To say du/de (O - object):
	if O is proper-named:
		if "[O]" starts with a vowel:
			say "d['][O]";
		else:
			say "de [O]";
	else if O is plural-named:
		say "des [O]";
	else if O is male:
		if "[O]" starts with a vowel:
			say "de [le O]";
		else:
			say "du [O]";
	else:
		say "de [la O]".

[Permet d'afficher "aux", "au" ou "à la" en fonction de l'objet]
To say à/au/aux (O - object):
	if O is proper-named:
		say "à [O]";
	else if O is plural-named:
		say "aux [O]";
	else if O is male:
		if "[O]" starts with a vowel:
			say "à [le O]";
		else:
			say "au [O]";
	else:
		say "à [la O]".

Include [preform](-
language French

<indefinite-article> ::=
	/b/ un |				[singular, masculine]
	/c/ une |				[singular, feminine]
	/e/ des					[plural, masculine (by default)]

<definite-article> ::=
	/b/ le/l' |				[singular, masculine]
	/c/ la/l' |				[singular, feminine]
	/e/ les					[plural, masculine (by default)]

<np-relative-phrase-implicit> ::=
	/a/ porté/portée/portés/portées |				[replacing "worn" in English]
	/b/ tenu/tenue/tenus/tenues |			["carried"]
	/d/ ici					["here"]

<implicit-player-relationship> ::=
	/a/ porté/portée/portés/portées |
	/b/ tenu/tenue/tenus/tenues

-) in the Preform grammar.

Include (-
Constant LanguageAnimateGender = male;
Constant LanguageInanimateGender = male;

Constant LanguageContractionForms = 2;
! French has two:
! 0 = starting with a consonant
! 1 = starting with a vowel or mute h

[ LanguageContraction text;
	if (IsAnA(text->0) || IsAnE(text->0) || IsAnI(text->0) || IsAnO(text->0) || IsAnU(text->0) || text->0 == 'h' or 'H') return 1;
	return 0;
];

Array LanguageArticles -->

!   Contraction form 0:     Contraction form 1:
!   Cdef   Def    Indef     Cdef   Def    Indef

	"Le "  "le "  "un "     "L'"   "l'"   "un "			! 0: masc sing
	"La "  "la "  "une "    "L'"   "l'"   "une "			! 1: fem sing
	"Les " "les " "des "    "Les " "les " "des ";		! 2: plural

			!             a           i
			!             s     p     s     p
			!             m f n m f n m f n m f n

Array LanguageGNAsToArticles --> 0 1 0 2 2 2 0 1 0 2 2 2;

-) instead of "Articles" in "Language.i6t".

[On modifie légèrement la routine I6 qui se charge d'afficher le nom d'un objet avec son déterminant. La seule chose qui change est qu'on n'affiche plus d'espace quand la propriété Inform 6 « articles » est spécifiée. Cela permet d'avoir des déterminant personnalisés collés au nom (pour les éllisions).

De manière générale, la propriété « articles » est pratique en français pour les noms avec un H aspiré, pour ceux commençant par Œ (car I6 a du mal avec celui-ci pour l'élision à cause d'une histoire de byte array qui ne peut pas prendre des valeurs plus grandes que 256) et pour les objets qui doivent avoir « l' » comme indefinite article.]

Include (-
Global short_name_case;

[ PrefaceByArticle obj acode pluralise capitalise  i artform findout artval;
	if (obj provides articles) {
		artval=(obj.&articles)-->(acode+short_name_case*LanguageCases);
		if (capitalise)
			print (Cap) artval; ! CHANGED: No space is printed.
		else
			print (string) artval; ! CHANGED: No space is printed.
		if (pluralise) return;
		print (PSN__) obj; return;
	}

	i = GetGNAOfObject(obj);
	if (pluralise) {
		if (i < 3 || (i >= 6 && i < 9)) i = i + 3;
	}
	i = LanguageGNAsToArticles-->i;

	artform = LanguageArticles
		+ 3*WORDSIZE*LanguageContractionForms*(short_name_case + i*LanguageCases);

	#Iftrue (LanguageContractionForms == 2);
	if (artform-->acode ~= artform-->(acode+3)) findout = true;
	#Endif; ! LanguageContractionForms
	#Iftrue (LanguageContractionForms == 3);
	if (artform-->acode ~= artform-->(acode+3)) findout = true;
	if (artform-->(acode+3) ~= artform-->(acode+6)) findout = true;
	#Endif; ! LanguageContractionForms
	#Iftrue (LanguageContractionForms == 4);
	if (artform-->acode ~= artform-->(acode+3)) findout = true;
	if (artform-->(acode+3) ~= artform-->(acode+6)) findout = true;
	if (artform-->(acode+6) ~= artform-->(acode+9)) findout = true;
	#Endif; ! LanguageContractionForms
	#Iftrue (LanguageContractionForms > 4);
	findout = true;
	#Endif; ! LanguageContractionForms

	#Ifdef TARGET_ZCODE;
	if (standard_interpreter ~= 0 && findout) {
		StorageForShortName-->0 = 160;
		@output_stream 3 StorageForShortName;
		if (pluralise) print (number) pluralise; else print (PSN__) obj;
		@output_stream -3;
		acode = acode + 3*LanguageContraction(StorageForShortName + 2);
	}
	#Ifnot; ! TARGET_GLULX
	if (findout) {
		if (pluralise)
			Glulx_PrintAnyToArray(StorageForShortName, 160, EnglishNumber, pluralise);
		else
			Glulx_PrintAnyToArray(StorageForShortName, 160, PSN__, obj);
		acode = acode + 3*LanguageContraction(StorageForShortName);
	}
	#Endif; ! TARGET_

	Cap (artform-->acode, ~~capitalise); ! print article
	if (pluralise) return;
	print (PSN__) obj;
];

-) instead of "Object Names II" in "Printing.i6t";

Chapter 2.1.2 - Numbers

Include [preform](-
language French

<cardinal-number-in-words> ::=
	zéro |
	un/une |
	deux |
	trois |
	quatre |
	cinq |
	six |
	sept |
	huit |
	neuf |
	dix |
	onze |
	douze

<ordinal-number-in-words> ::=
	zéroième |			[does French have such a word?]
	premier/première |
	deuxième |
	troisième |
	quatrième |
	cinquième |
	sixième |
	septième |
	huitième |
	neuvième |
	dixième |
	onzième |
	douzième

-) in the Preform grammar.

Include (-
Array LanguageNumbers table
	'un' 1 'deux' 2 'trois' 3 'quatre' 4 'cinq' 5
	'six' 6 'sept' 7 'huit' 8 'neuf' 9 'dix' 10
	'onze' 11 'douze' 12 'treize' 13 'quatorze' 14 'quinze' 15
	'seize' 16 'dix-sept' 17 'dix-huit' 18 'dix-neuf' 19 'vingt' 20
	'vingt et un' 21 'vingt-deux' 22 'vingt-trois' 23 'vingt-quatre' 24 'vingt-cinq' 25
	'vingt-six' 26 'vingt-sept' 27 'vingt-huit' 28 'vingt-neuf' 29 'trente' 30 'une' 1
;

! Inspiré du code trouvé à http://www.chambily.com/recursivite/chap_IV_13.htm (avec certaines erreurs corrigées).
! Quand forbid_s est vrai, c'est qu'on ne peut pas mettre de s à quatre-vingt ou à cent.
! Cela arrive quand on contruit le triplet des milliers : quatre-vingt mille, deux cent mille.
! TODO: Implanter la graphie rectifiée (avec traits d'union).
! TODO: Gérer les nombres ordinaux. Par exemple, « la page quatre-vingt » ne prend pas de s.
! TODO: Limiter les calculs en stockant les résultats intermédiaires dans une variable (comme n / 1000000) ?
[ LanguageNumber n forbid_s;
	! Cas spécial pour le zéro.
	if (n == 0) {
		print "zéro";
		rfalse;
	}

	! Cas spécial du plus petit nombre Glulx.
	! La raison est que ce nombre et son négatif sont égaux.
	! On peut aussi considérer qu'il s'agit de -0 plutôt que de -2147483648, mais bon.
	! (Cf. http://inform7.com/mantis/view.php?id=2082)
	#Iftrue (WORDSIZE == 4);
	if (n == -2147483648) {
		print "moins deux milliards ";
		n = 147483648;
	}
	#Endif;

	! Si négatif, on affiche "moins" puis on continue avec le nombre remis en positif.
	if (n < 0) {
		print "moins ";
		n = -n;
	}

	! Milliards et millions seulement pour Glulx.
	#Iftrue (WORDSIZE == 4);
	! Cas des milliards.
	if (n >= 1000000000) {
		print (LanguageNumber) n / 1000000000, " milliard";
		if (n / 1000000000 > 1) {
			print "s";
		}
		n = n % 1000000000;
		if (n) {
			print " ";
		} else {
			return;
		}
	}

	! Cas des millions.
	if (n >= 1000000) {
		print (LanguageNumber) n / 1000000, " million";
		if (n / 1000000 > 1) {
			print "s";
		}
		n = n % 1000000;
		if (n) {
			print " ";
		} else {
			return;
		}
	}
	#Endif;

	! Cas des milliers.
	if (n >= 1000) {
		if (n / 1000 ~= 1) { ! Car on ne dit pas "un mille".
			! On doit interdire le s final pour le triplet des milliers.
			LanguageNumber(n / 1000, true);
			print " ";
		}
		print "mille";
		n = n % 1000;
		if (n) {
			print " ";
		} else {
			return;
		}
	}

	! Cas des centaines.
	if (n >= 100) {
		if (n / 100 ~= 1) { ! Car on ne dit pas "un cent".
			print (LanguageNumber) n / 100, " ";
		}
		print "cent";
		! Cas du s de "cent".
		if (n / 100 > 1 && n % 100 == 0 && (~~forbid_s)) {
			print "s";
		}
		n = n % 100;
		if (n) {
			print " ";
		} else {
			return;
		}
	}

	#Iftrue VARIANTE_70 == 0;
	! Cas spécial du 70.
	if (n >= 70 && n <= 79) {
		print "soixante";
		! Cas particulier du 71.
		if (n == 71) {
			print " et onze";
			return;
		}
		print "-";
		n = n % 10 + 10;
	}
	#Endif;

	#Iftrue VARIANTE_90 == 0;
	! Cas spécial du 90.
	if (n >= 90 && n <= 99) {
		print "quatre-vingt-";
		n = n % 10 + 10;
	}
	#Endif;

	! Les autres cas entre 20 et 99.
	if (n >= 20) {
		switch(n / 10) {
			2: print "vingt";
			3: print "trente";
			4: print "quarante";
			5: print "cinquante";
			6: print "soixante";
			#Iftrue VARIANTE_70 == 1;
			7: print "septante";
			#Endif;
			#Iftrue VARIANTE_80 == 0;
			8: print "quatre-vingt";
			#Endif;
			#Iftrue VARIANTE_80 == 1;
			8: print "huitante";
			#Endif;
			#Iftrue VARIANTE_80 == 2;
			8: print "octante";
			#Endif;
			#Iftrue VARIANTE_90 == 1;
			9: print "nonante";
			#Endif;
		}
		if (n % 10 == 0) {
			#Iftrue VARIANTE_80 == 0;
			! Cas du s de "quatre-vingts"
			if (n == 80 && (~~forbid_s)) print "s";
			#Endif;
			return;
		}
		#Iftrue VARIANTE_80 == 0;
		! Exception avec quatre-vingts : on dit quatre-vingt-un et non quatre-vingt et un.
		if (n % 10 == 1 && n ~= 81) {
			print " et ";
		} else {
			print "-";
		}
		#Endif;
		#Iftrue VARIANTE_80 ~= 0;
		if (n % 10 == 1) {
			print " et ";
		} else {
			print "-";
		}
		#Endif;
		n = n % 10;
	}

	! Cas lorsque on est en dessous de 19.
	if (n <= 19) {
		print (address) LanguageNumbers --> (2*n - 1);
	}
];
-) instead of "Numbers" in "Language.i6t".

Part 2.2 - Nouns

Chapter 2.2.1 - Pronouns and possessives for the player

[The adaptive text viewpoint is the viewpoint of the player when we are
writing response texts which need to work in any tense, person or number.
For example, English uses first person plural, so we write "[We] [look] up."
as a message which could come out as "I look up", "you look up", "he looks up",
and so on. It's "[We]" not "[You]" because the adaptive text viewpoint is
first person plural, not second person singular.

The reason for choosing this in English was that all the pronouns and
possessive adjectives we needed happened to be different for first person
plural: we, us, ours, ourselves, our. We also need these pronouns to be
other than third-person, so that we can define [they], [them] and so on
to refer to objects and not the player. So in practice there are only four
possible choices a language extension can make:

	first person singular (in English: I, me, mine, myself, my)
	second person plural (in English: you, you, yours, yourself, your)
	first person singular (in English: we, us, ours, ourselves, our)
	second person plural (in English: you, you, yours, yourself, your)

What shall we choose for French? We may as well use second person singular,
giving us tu, te, le tien/la tienne, te, ton. There are two complications.
Firstly we need indirect objects as well as direct objects, and although these
are the same in second person (te and te), they're different in third person
(le and lui). We'll call this "[te-lui]" for the same of this demonstration,
which is a bit awkward, but it'll do. Secondly, the reflexive pronoun is also
te, so we'll write that one "[te-se]".]

The adaptive text viewpoint of the French language is second person singular.

When play begins (this is the initialise the story viewpoint rule):
	now the story viewpoint is the second person plural.

[So now we define the following text substitutions:

	[tu], [te], [te-lui], [te-se], [le tien], [ton]

and their capitalised forms, which start with "T" not "t".]

To say tu:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "je";
	else if the story viewpoint is second person singular:
		say "tu";
	else if the story viewpoint is third person singular:
		if the player is male:
			say "il";
		otherwise:
			say "elle";
	else if the story viewpoint is first person plural:
		say "nous";
	else if the story viewpoint is second person plural:
		say "vous";
	else if the story viewpoint is third person plural:
		if the player is male:
			say "ils";
		otherwise:
			say "elles".

To say Tu:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Je";
	else if the story viewpoint is second person singular:
		say "Tu";
	else if the story viewpoint is third person singular:
		if the player is male:
			say "Il";
		otherwise:
			say "Elle";
	else if the story viewpoint is first person plural:
		say "Nous";
	else if the story viewpoint is second person plural:
		say "Vous";
	else if the story viewpoint is third person plural:
		if the player is male:
			say "Ils";
		otherwise:
			say "Elles".


To say tu-j':
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "j[']";
	else:
		say "[tu] ".

To say Tu-j':
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "J[']";
	else:
		say "[Tu] ".


To say si tu:
	now the prior named object is the player;
	if the story viewpoint is third person singular and the player is male:
		say "s'il";
	else if the story viewpoint is third person plural and the player is male:
		say "s'ils";
	else:
		say "si [tu]".

To say Si tu:
	now the prior named object is the player;
	if the story viewpoint is third person singular and the player is male:
		say "S'il";
	else if the story viewpoint is third person plural and the player is male:
		say "S'ils";
	else:
		say "Si [tu]".


To say te:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "me";
	else if the story viewpoint is second person singular:
		say "te";
	else if the story viewpoint is third person singular:
		if the player is male:
			say "le";
		otherwise:
			say "la";
	else if the story viewpoint is first person plural:
		say "nous";
	else if the story viewpoint is second person plural:
		say "vous";
	else if the story viewpoint is third person plural:
		say "les".

To say Te:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Me";
	else if the story viewpoint is second person singular:
		say "Te";
	else if the story viewpoint is third person singular:
		if the player is male:
			say "Le";
		otherwise:
			say "La";
	else if the story viewpoint is first person plural:
		say "Nous";
	else if the story viewpoint is second person plural:
		say "Vous";
	else if the story viewpoint is third person plural:
		say "Les".


To say t':
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "m[']";
	else if the story viewpoint is second person singular:
		say "t[']";
	else if the story viewpoint is third person singular:
		say "l[']";
	else if the story viewpoint is first person plural:
		say "nous ";
	else if the story viewpoint is second person plural:
		say "vous ";
	else if the story viewpoint is third person plural:
		say "les ".

To say T':
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "M[']";
	else if the story viewpoint is second person singular:
		say "T[']";
	else if the story viewpoint is third person singular:
		say "L[']";
	else if the story viewpoint is first person plural:
		say "Nous ";
	else if the story viewpoint is second person plural:
		say "Vous ";
	else if the story viewpoint is third person plural:
		say "Les ".


To say te-lui:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "me";
	else if the story viewpoint is second person singular:
		say "te";
	else if the story viewpoint is third person singular:
		say "lui";
	else if the story viewpoint is first person plural:
		say "nous";
	else if the story viewpoint is second person plural:
		say "vous";
	else if the story viewpoint is third person plural:
		say "leur".

To say Te-lui:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Me";
	else if the story viewpoint is second person singular:
		say "Te";
	else if the story viewpoint is third person singular:
		say "Lui";
	else if the story viewpoint is first person plural:
		say "Nous";
	else if the story viewpoint is second person plural:
		say "Vous";
	else if the story viewpoint is third person plural:
		say "Leur".


To say t'-lui:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "m[']";
	if the story viewpoint is second person singular:
		say "t[']";
	if the story viewpoint is third person singular:
		say "lui ";
	if the story viewpoint is first person plural:
		say "nous ";
	if the story viewpoint is second person plural:
		say "vous ";
	if the story viewpoint is third person plural:
		say "leur ".

To say T'-lui:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "M[']";
	else if the story viewpoint is second person singular:
		say "T[']";
	else if the story viewpoint is third person singular:
		say "Lui ";
	else if the story viewpoint is first person plural:
		say "Nous ";
	else if the story viewpoint is second person plural:
		say "Vous ";
	else if the story viewpoint is third person plural:
		say "Leur ".


To say te-se:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "me";
	else if the story viewpoint is second person singular:
		say "te";
	else if the story viewpoint is third person singular:
		say "se";
	else if the story viewpoint is first person plural:
		say "nous";
	else if the story viewpoint is second person plural:
		say "vous";
	else if the story viewpoint is third person plural:
		say "se".

To say Te-se:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Me";
	else if the story viewpoint is second person singular:
		say "Te";
	else if the story viewpoint is third person singular:
		say "Se";
	else if the story viewpoint is first person plural:
		say "Nous";
	else if the story viewpoint is second person plural:
		say "Vous";
	else if the story viewpoint is third person plural:
		say "Se".


To say t'-s':
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "m[']";
	else if the story viewpoint is second person singular:
		say "t[']";
	else if the story viewpoint is third person singular:
		say "s[']";
	else if the story viewpoint is first person plural:
		say "nous ";
	else if the story viewpoint is second person plural:
		say "vous ";
	else if the story viewpoint is third person plural:
		say "s[']".

To say T'-s':
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "M[']";
	else if the story viewpoint is second person singular:
		say "T[']";
	else if the story viewpoint is third person singular:
		say "S[']";
	else if the story viewpoint is first person plural:
		say "Nous ";
	else if the story viewpoint is second person plural:
		say "Vous ";
	else if the story viewpoint is third person plural:
		say "S[']".


To say toi:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "moi";
	else if the story viewpoint is second person singular:
		say "toi";
	else if the story viewpoint is third person singular:
		if the player is male:
			say "lui";
		else:
			say "elle";
	else if the story viewpoint is first person plural:
		say "nous";
	else if the story viewpoint is second person plural:
		say "vous";
	else if the story viewpoint is third person plural:
		if the player is male:
			say "eux";
		else:
			say "elles".

To say Toi:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Moi";
	else if the story viewpoint is second person singular:
		say "Toi";
	else if the story viewpoint is third person singular:
		if the player is male:
			say "Lui";
		else:
			say "Elle";
	else if the story viewpoint is first person plural:
		say "Nous";
	else if the story viewpoint is second person plural:
		say "Vous";
	else if the story viewpoint is third person plural:
		if the player is male:
			say "Eux";
		else:
			say "Elles".


To say de toi:
	if the story viewpoint is third person singular and the player is female:
		say "d'elle";
	else if the story viewpoint is third person plural:
		if the player is male:
			say "d'eux";
		else:
			say "d'elles";
	else:
		say "de [toi]".

To say De toi:
	if the story viewpoint is third person singular and the player is female:
		say "D'elle";
	else if the story viewpoint is third person plural:
		if the player is male:
			say "D'eux";
		else:
			say "D'elles";
	else:
		say "De [toi]".


To say le tien:
	let the item be the prior named object;
	if the story viewpoint is first person singular:
		if the item is plural-named:
			if the item is male:
				say "les miens";
			otherwise:
				say "les miennes";
		else:
			if the item is male:
				say "le mien";
			otherwise:
				say "la mienne";
	else if the story viewpoint is second person singular:
		if the item is plural-named:
			if the item is male:
				say "les tiens";
			otherwise:
				say "les tiennes";
		else:
			if the item is male:
				say "le tien";
			otherwise:
				say "la tienne";
	else if the story viewpoint is third person singular:
		if the item is plural-named:
			if the item is male:
				say "les siens";
			otherwise:
				say "les siennes";
		else:
			if the item is male:
				say "le sien";
			otherwise:
				say "la sienne";
	else if the story viewpoint is first person plural:
		if the item is plural-named:
			say "les nôtres";
		else:
			if the item is male:
				say "le nôtre";
			otherwise:
				say "la nôtre";
	else if the story viewpoint is second person plural:
		if the item is plural-named:
			say "les vôtres";
		else:
			if the item is male:
				say "le vôtre";
			otherwise:
				say "la vôtre";
	else if the story viewpoint is third person plural:
		if the item is plural-named:
			say "les leurs";
		else:
			if the item is male:
				say "le leur";
			otherwise:
				say "la leur".

To say Le tien:
	let the item be the prior named object;
	if the story viewpoint is first person singular:
		if the item is plural-named:
			if the item is male:
				say "Les miens";
			otherwise:
				say "Les miennes";
		else:
			if the item is male:
				say "Le mien";
			otherwise:
				say "La mienne";
	else if the story viewpoint is second person singular:
		if the item is plural-named:
			if the item is male:
				say "Les tiens";
			otherwise:
				say "Les tiennes";
		else:
			if the item is male:
				say "Le tien";
			otherwise:
				say "La tienne";
	else if the story viewpoint is third person singular:
		if the item is plural-named:
			if the item is male:
				say "Les siens";
			otherwise:
				say "Les siennes";
		else:
			if the item is male:
				say "Le sien";
			otherwise:
				say "La sienne";
	else if the story viewpoint is first person plural:
		if the item is plural-named:
			say "Les nôtres";
		else:
			if the item is male:
				say "Le nôtre";
			otherwise:
				say "La nôtre";
	else if the story viewpoint is second person plural:
		if the item is plural-named:
			say "Les vôtres";
		else:
			if the item is male:
				say "Le vôtre";
			otherwise:
				say "La vôtre";
	else if the story viewpoint is third person plural:
		if the item is plural-named:
			say "Les leurs";
		else:
			if the item is male:
				say "Le leur";
			otherwise:
				say "La leur".


To say ton:
	now the prior named object is the player; [TODO : pas sûr que ce soit le comportement le plus logique, mais ça ne devrait pas poser problème.]
	if the story viewpoint is first person singular:
		say "mon";
	else if the story viewpoint is second person singular:
		say "ton";
	else if the story viewpoint is third person singular:
		say "son";
	else if the story viewpoint is first person plural:
		say "notre";
	else if the story viewpoint is second person plural:
		say "votre";
	else if the story viewpoint is third person plural:
		say "leur".

To say Ton:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Mon";
	else if the story viewpoint is second person singular:
		say "Ton";
	else if the story viewpoint is third person singular:
		say "Son";
	else if the story viewpoint is first person plural:
		say "Notre";
	else if the story viewpoint is second person plural:
		say "Votre";
	else if the story viewpoint is third person plural:
		say "Leur".


To say ta:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "ma";
	else if the story viewpoint is second person singular:
		say "ta";
	else if the story viewpoint is third person singular:
		say "sa";
	else if the story viewpoint is first person plural:
		say "notre";
	else if the story viewpoint is second person plural:
		say "votre";
	else if the story viewpoint is third person plural:
		say "leur".

To say Ta:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Ma";
	else if the story viewpoint is second person singular:
		say "Ta";
	else if the story viewpoint is third person singular:
		say "Sa";
	else if the story viewpoint is first person plural:
		say "Notre";
	else if the story viewpoint is second person plural:
		say "Votre";
	else if the story viewpoint is third person plural:
		say "Leur".


To say tes:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "mes";
	else if the story viewpoint is second person singular:
		say "tes";
	else if the story viewpoint is third person singular:
		say "ses";
	else if the story viewpoint is first person plural:
		say "nos";
	else if the story viewpoint is second person plural:
		say "vos";
	else if the story viewpoint is third person plural:
		say "leurs".

To say Tes:
	now the prior named object is the player;
	if the story viewpoint is first person singular:
		say "Mes";
	else if the story viewpoint is second person singular:
		say "Tes";
	else if the story viewpoint is third person singular:
		say "Ses";
	else if the story viewpoint is first person plural:
		say "Nos";
	else if the story viewpoint is second person plural:
		say "Vos";
	else if the story viewpoint is third person plural:
		say "Leurs".


To say ton/ta/tes (O - an object):
	if O is plural-named:
		say "[tes] [O]";
	otherwise:
		if O is male or "[O]" starts with a vowel:
			say "[ton] [O]";
		otherwise:
			say "[ta] [O]".

To say Ton/Ta/Tes (O - an object):
	if O is plural-named:
		say "[Tes] [O]";
	otherwise:
		if O is male or "[O]" starts with a vowel:
			say "[Ton] [O]";
		otherwise:
			say "[Ta] [O]".

Chapter 2.2.2 - Pronouns and possessives for other objects

[These are similar, but easier. They are named from the third-person viewpoint
with the same number as the adaptive text viewpoint; so in the case of French,
we'll go with third person singular. We define:

	[celui] = that
	[il] = it as subject
	[le] = it as object
	[lui] = it as indirect object
	[son] = its as adjective, e.g., "its temperature"
	[le sien] = its as possessive pronoun, e.g., "that label is its"

and similarly for its capitalised forms.]

To say celui:
	let the item be the prior named object;
	if the item is the player:
		say "[toi]";
	otherwise:
		if the item is plural-named:
			if the item is male:
				say "ceux";
			otherwise:
				say "celles";
		otherwise:
			if the item is male:
				say "celui";
			otherwise:
				say "celle".

To say Celui:
	let the item be the prior named object;
	if the item is the player:
		say "[Toi]";
	otherwise:
		if the item is plural-named:
			if the item is male:
				say "Ceux";
			otherwise:
				say "Celles";
		otherwise:
			if the item is male:
				say "Celui";
			otherwise:
				say "Celle".


To say il:
	let the item be the prior named object;
	if the item is the player:
		say "[tu]";
	otherwise:
		if the item is plural-named:
			if the item is male:
				say "ils";
			otherwise:
				say "elles";
		otherwise:
			if the item is male:
				say "il";
			otherwise:
				say "elle".

To say Il:
	let the item be the prior named object;
	if the item is the player:
		say "[Tu]";
	otherwise:
		if the item is plural-named:
			if the item is male:
				say "Ils";
			otherwise:
				say "Elles";
		otherwise:
			if the item is male:
				say "Il";
			otherwise:
				say "Elle".


To say le:
	let the item be the prior named object;
	if the item is the player:
		say "[te]";
	otherwise:
		if the item is plural-named:
			say "les";
		otherwise:
			if the item is male:
				say "le";
			otherwise:
				say "la".

To say Le:
	let the item be the prior named object;
	if the item is the player:
		say "[Te]";
	otherwise:
		if the item is plural-named:
			say "Les";
		otherwise:
			if the item is male:
				say "Le";
			otherwise:
				say "La".


To say l':
	let the item be the prior named object;
	if the item is the player:
		say "[t']";
	otherwise:
		if the item is plural-named:
			say "les ";
		otherwise:
			say "l[']";

To say L':
	let the item be the prior named object;
	if the item is the player:
		say "[t']";
	otherwise:
		if the item is plural-named:
			say "Les ";
		otherwise:
			say "L[']";


To say lui:
	let the item be the prior named object;
	if the item is the player:
		say "[te-lui]";
	otherwise:
		if the item is plural-named:
			say "leur";
		otherwise:
			say "lui".

To say Lui:
	let the item be the prior named object;
	if the item is the player:
		say "[Te-lui]";
	otherwise:
		if the item is plural-named:
			say "Leur";
		otherwise:
			say "Lui".


To say son:
	let the item be the prior named object;
	if the item is plural-named:
		say "leur";
	otherwise:
		say "son".

To say Son:
	let the item be the prior named object;
	if the item is plural-named:
		say "Leur";
	otherwise:
		say "Son".


To say sa:
	let the item be the prior named object;
	if the item is plural-named:
		say "leur";
	otherwise:
		say "sa".

To say Sa:
	let the item be the prior named object;
	if the item is plural-named:
		say "Leur";
	otherwise:
		say "Sa".


To say ses:
	let the item be the prior named object;
	if the item is plural-named:
		say "leurs";
	otherwise:
		say "ses".

To say Ses:
	let the item be the prior named object;
	if the item is plural-named:
		say "Leurs";
	otherwise:
		say "Ses".


To say son/sa/ses/leur/leurs (O - an object):
	let the item be the prior named object;
	if O is plural-named:
		say "[ses] [O]";
	otherwise:
		[On doit refaire un "[regarding]" parce que le "[O]" dans la condition le change et on ne veut pas.]
		if O is male or "[O]" starts with a vowel:
			say "[regarding item][son] [O]";
		otherwise:
			say "[regarding item][sa] [O]".

To say Son/Sa/Ses/Leur/Leurs (O - an object):
	let the item be the prior named object;
	if O is plural-named:
		say "[Ses] [O]";
	otherwise:
		[On doit refaire un "[regarding]" parce que le "[O]" dans la condition le change et on ne veut pas.]
		if O is male or "[O]" starts with a vowel:
			say "[regarding item][Son] [O]";
		otherwise:
			say "[regarding item][Sa] [O]".


To say le sien:
	let the item be the prior named object;
	if the item is plural-named:
		if the item is male:
			say "les siens";
		otherwise:
			say "les siennes";
	otherwise:
		if the item is male:
			say "le sien";
		otherwise:
			say "la sienne".

To say Le sien:
	let the item be the prior named object;
	if the item is plural-named:
		if the item is male:
			say "Les siens";
		otherwise:
			say "Les siennes";
	otherwise:
		if the item is male:
			say "Le sien";
		otherwise:
			say "La sienne".


To say le leur:
	let the item be the prior named object;
	if the item is plural-named:
		say "les leurs";
	otherwise:
		if the item is male:
			say "le leur";
		otherwise:
			say "la leur".

To say Le leur:
	let the item be the prior named object;
	if the item is plural-named:
		say "Les leurs";
	otherwise:
		if the item is male:
			say "Le leur";
		otherwise:
			say "La leur".

Chapter 2.2.3 - Directions

North translates into French as le nord.
South translates into French as le sud.
East translates into French as le est.
West translates into French as le ouest.
Northeast translates into French as le nord-est.
Southwest translates into French as le sud-ouest.
Southeast translates into French as le sud-est.
Northwest translates into French as le nord-ouest.
Inside translates into French as dedans.
Outside translates into French as dehors.
Up translates into French as haut.
Down translates into French as bas.

[Inform donne par défaut automatiquement "the" comme indefinite article aux directions. On doit donc explicitement spécifier les indefinite articles pour les avoir en français.
Dans les cas spéciaux où on doit donner la propriété I6 articles à la place, on doit quand même donner un indefinite article vide sinon le comportement par défaut d'Inform va forcer le "the".
On en profite pour corriger les déterminants définis du haut, car il s'agit d'un H aspiré.]
The indefinite article of le nord is "le".
The indefinite article of le sud is "le".
The indefinite article of le nord-est is "le".
The indefinite article of le sud-ouest is "le".
The indefinite article of le sud-est is "le".
The indefinite article of le nord-ouest is "le".
The indefinite article of le bas is "le".
The indefinite article of le est is "".
Include (- with articles "L'" "l'" "l'", -) when defining l' est.
The indefinite article of le ouest is "".
Include (- with articles "L'" "l'" "l'", -) when defining l' ouest.
The indefinite article of le haut is "".
Include (- with articles "Le " "le " "le ", -) when defining le haut.
Dedans is proper-named.
Dehors is proper-named.

Understand the command "no" as something new.
Understand "o" as west.
Understand "nord-est/nordest" or "ne" as northeast.
Understand "nord-ouest/nordouest" or "no" as northwest.
Understand "sud-ouest/sudouest" or "so" as southwest.
Understand "sud-est/sudest" or "se" as southeast.
Understand "h" as up.
Understand "b" as down.
Understand "interieur" as inside.
Understand "exterieur" as outside.

Chapter 2.2.4 - Kinds

Section 2.2.4.1 - In the Standard Rules

[This ensures that if we write:

	Quatre hommes sont dans la Théâtre.

then (a) Inform will recognise these as instances of the kind "man", and (b)
it will give them each the printed name "homme" (not "man").]

An object translates into French as un objet.
A room translates into French as un endroit.
A thing translates into French as une chose.
A door translates into French as une porte.
A container translates into French as un contenant.
A vehicle translates into French as un véhicule.
A player's holdall translates into French as un fourre-tout.
A supporter translates into French as un support.
A backdrop translates into French as une toile de fond. The plural of toile de fond is toiles de fond.
A person translates into French as une personne.
A man translates into French as un homme.
A woman translates into French as une femme.
An animal translates into French as un animal.
A device translates into French as un appareil.
A direction translates into French as une direction.
A region translates into French as une région.

A number translates into French as un nombre.
A real number translates into French as un nombre réel.
A time translates into French as une heure. [TODO: ou bien « un temps » (mais c'est pas terrible) ? Parce que « heure » est ambiguë : c'est aussi bien des heures en tant qu'unité de temps (pendant 1 heure, 2 heures) que des moments (Quelle heure est-il ? 17 heures 18).]
A truth state translates into French as un booléen. [TODO: peut-être que c'est trop technique ? « état de vérité » serait mieux ou pas ???]
A text translates into French as un texte.
A unicode character translates into French as un caractère unicode.
A snippet translates into French as une bribe.
[TODO: « bribe » est la traduction littérale de « snippet ». Dans I7, un snippet est un morceau de la commande du joueur. Y aurait-il une meilleur traduction ? En même temps, c'est tellement technique qu'un créateur lambda ne risque vraiment pas de l'utiliser.]
A stored action translates into French as une action stockée. [TODO: pas sûr pour celui-là.]
A scene translates into French as une scène.
A command parser error translates into French as une erreur du parseur de commande. [TODO: pas sûr pour celui-là.]
A use option translates into French as une option utilisable. [TODO: pas sûr pour celui-là. Par quoi traduire le « use » ? Par « utilisable » ? Encore une fois, c'est assez technique, personne n'utiliserait ça.]
A response translates into French as une réponse.
A verb translates into French as un verbe.
[TODO: Pour tous les « name » ci-dessous : remplacer par titre ? Car dans un ouvrage écrit, les tableaux ont un titre plutôt qu'un nom, il me semble.]
A table name translates into French as un nom de tableau.
A equation name translates into French as un nom d'équation.
A rulebook outcome translates into French as un résultat de règles.
A action name translates into French as un nom d'action.
A figure name translates into French as un nom de figure.
A sound name translates into French as un nom de son.
A external file translates into French as un fichier externe.

Grammatical tense translates into French as un temps grammatical.
Present tense translates into French as le présent.
Future tense translates into French as le futur.
Past tense translates into French as le imparfait.
Perfect tense translates into French as le passé composé.
Past perfect tense translates into French as le plus-que-parfait.
Past historic tense translates into French as le passé simple.

Narrative viewpoint translates into French as un point de vue narratif.
First person singular translates into French as la première personne du singulier.
Second person singular translates into French as la deuxième personne du singulier.
Third person singular translates into French as la troisième personne du singulier.
First person plural translates into French as la première personne du pluriel.
Second person plural translates into French as la deuxième personne du pluriel.
Third person plural translates into French as la troisième personne du pluriel.

Grammatical gender translates into French as un genre grammatical.
Masculine gender translates into French as le genre masculin.
Feminine gender translates into French as le genre féminin.

[Traduit les descriptions dans l'index.]
The specification of objet is "Les objets sont des valeurs ayant pour but de simuler des choses physiques : des endroits, des personnes, des choses, etc. Il en existe plusieurs sortes. La valeur spéciale 'nothing' (rien) est également autorisée, et signifie 'aucun objet'.".
The specification of endroit is "Représente des lieux géographiques, aussi bien a l'intérieur qu'à l'extérieur. Le joueur ne peut en général pas interagir avec ce qui se trouve dans un autre endroit que lui. Les endroits sont organisés dans une carte.".
The specification of chose is "Représente tout ce avec quoi le joueur peut interagir qui n'est pas un endroit : des personnes, des décors, des meubles, des portes ou des parapluies égarés en sont des exemples, aussi bien que des choses plus surprenantes comme le chant d'un oiseau ou un rayon de soleil.".
The specification of porte is "Représente un passage entre deux endroits, le plus souvent une porte ou un portail, parfois un pont en bois, un toboggan ou une trappe. Est généralement visible et utilisable des deux côtés (en écrivant par exemple 'La porte bleue est à l'est de la Salle de bal and à l'ouest du Jardin.'), mais peut de temps en temps être à sens unique (en écrivant par exemple 'La trappe est à l'est de la Salle de bal. La Cave est à travers la trappe.').".
The specification of contenant is "Représente quelque chose dans lequel peuvent être mises des choses portables, telles qu'une théière ou un sac à main. Un endroit plutôt qu'un contenant doit être utilisé pour représenter un intérieur grand et immobile ; le Royal Albert Hall, par exemple.".
The specification of véhicule is "Représente un contenant assez grand pour qu'une personne puisse y entrer, et qui peut se déplacer d'endroit en endroit selon les instructions du conducteur. (Si un support doit être utilisé à la place, il est nécessaire d'inclure l'extension 'Rideable Vehicles' de Graham Nelson.)".
The specification of fourre-tout is "Représente un contenant que le joueur peut transporter avec lui tel un sac à dos, et dans lequel les objets en trop sont automatiquement rangés.".
The specification of support is "Représente une surface sur laquelle des choses peuvent être posées ; une table, par exemple.".
The specification of toile de fond is "Représente un aspect du paysage (au sens large) qui s'étend sur plusieurs endroits, comme un cours d'eau, le ciel ou un long tapis.".
The specification of personne is "Malgré son nom, ne représente pas forcément un être humain, mais tout ce qui est suffisamment doué de conscience pour que l'on puisse avoir une conversation avec lui, par exemple.".
The specification of homme is "Représente un homme ou un garçon.".
The specification of femme is "Représente une femme ou une fille.".
The specification of animal is "Représente un animal, ou bien toute créature n'étant pas un humain et assez grande pour que l'on puisse interagir avec elle : une dionée attrape-mouche géante, par exemple, mais pas du lichen.".
The specification of appareil is "Représente une machine ou un appareil pouvant être allumé ou éteint.".
The specification of direction is "Représente une direction comme le nord-ouest ou le bas. Elles sont toujours groupées par paire : le nord-est et le sud-ouest, ou le haut et le bas.".
The specification of région is "Représente une zone plus grande qu'un simple endroit, et autorise des règles à s'appliquer sur une zone géographique en entier. Chaque région peut contenir plusieurs endroits et même d'autres régions, mais elles ne peuvent pas se superposer. Par exemple, l'endroit 'Place d'Italie' pourra être dans la région 'Treizième arrondissement', elle-même étant dans la région 'Paris'. Les régions sont surtout utiles lorsque le monde de jeu est grand, et sont optionnelles.".

The specification of nombre is "Un nombre entier compris entre -32768 et 32767. Les petits nombres peuvent être écrits en lettres ('un', 'deux', 'trois', ... , 'dix', 'onze', 'douze'). Des nombres plus grands peuvent être utilisés si la source est compilée vers Glulx plutôt que vers Z-machine (voir l'onglet 'Settings').".
The specification of nombre réel is "Un nombre réel, aussi appelé nombre à virgule flottante. La différence entre un nombre réel et un nombre 'ordinaire' est que les nombres réels sont des nombres n'étant pas forcément entiers, comme 3.1416, et étant plus précis quand il s'agit de très grandes ou très petites valeurs. Les nombres réels sont uniquement autorisés si le jeu est compilé vers Glulx plutôt que vers Z-machine (voir l'onglet 'Settings'). De plus, il est à noter que le point est utilisé au lieu de la virgule pour séparer la partie entière de la partie décimale.".
The specification of heure is "Un moment de la journée, noté sous la forme '2:34 AM' ou '12:51 PM', ou une durée comme '10 minutes' ou '3 hours 31 minutes', et devant être compris entre 0 minute et 23 heures 59 minutes inclusivement.".
The specification of booléen is "Le fait que quelque chose soit 'vrai' ou 'faux' (appelé ainsi d'après le logicien du XIXe siècle George Boole, le premier à se rendre compte qu'il s'agissait d'un type de valeur).".
The specification of texte is "Du texte entre guillemets, contenant éventuellement des substitutions entre crochets.".
The specification of caractère unicode is "Un caractère : une lettre ou n'importe quel autre symbole.".
The specification of bribe is "Un fragment de la dernière commande du joueur, étant composé d'une suite de mots.".
The specification of action stockée is "Une action ayant été stockée et pouvant être essayée ultérieurement.".
The specification of scène is "Analogue à une scène dans une pièce de théâtre : une période généralement liée à des événements de l'intrigue. Une scène est créée avec une phrase comme 'Arrivée de minuit est une scène.'".
The specification of option utilisable is "Une option facultative permettant de configurer Inform, telle que 'authorial modesty option'.".
The specification of réponse is "Une réponse standard fournie par les 'Standard Rules' ou par d'autres extensions.".
The specification of verbe is "Un verbe qu'Inform est capable de conjuguer.".
The specification of nom de tableau is "À l'instar d'un tableau dans un livre ou dans un journal, les 'tables' dans Inform contiennent des valeurs organisées en colonnes et rangées. Un nom de tableau est simplement une valeur identifiant un tel tableau ; par exemple, 'Table of US Presidents' pourrait être un nom de tableau.".
The specification of nom d'équation is "À l'instar d'une formule dans un livre ou une revue scientifique, les équations dans Inform possèdent un nom.".
The specification of nom d'action is "Une action est ce qui arrive quand une des personnes peuplant le monde du jeu décide de faire quelque chose. Une action complète serait quelque chose comme 'dropping la boîte', mais un nom d'action est simplement le genre de chose étant faite : ici, ce serait 'the dropping action' (les noms d'action sont toujours écrits avec le mot 'action' à la fin, pour qu'ils ne soient pas confondus avec des actions complètes).".
The specification of nom de figure is "Quand un projet est compilé vers Glulx, il peut contenir des images en plus de texte, et celles-ci sont appelées 'figures'. Un nom de figure est simplement le nom d'une de ces images dans le projet actuel.".
The specification of nom de son is "Quand un projet est compilé vers Glulx, il peut contenir des effets sonores ou des musiques. Un nom de son est simplement le nom de l'un de ces sons dans le projet actuel.".
The specification of fichier externe is "Quand un projet est compilé vers Glulx, il peut utiliser, dans une certaine limite, des fichiers stockés sur l'ordinateur de l'utilisateur. Un fichier externe est simplement le nom de l'un de ces fichiers (pas le nom du fichier sur l'ordinateur, mais le nom lui étant donné dans la source du projet).".

Section 2.2.4.2 - In Rideable Vehicles (for use with Rideable Vehicles by Graham Nelson)

[TODO: Provoque une erreur lors de la compilation.]

[A rideable animal translates into French as un animal chevauchable.
A rideable vehicle translates into French as un véhicule chevauchable.]

Section 2.2.4.3 - In Locksmith (for use with Locksmith by Emily Short)

[TODO: provoque une erreur lors de la compilation
A passkey translates into French as un passe-partout.
A keychain translates into French as un porte-clefs.]

Chapter 2.2.5 - Plurals

[TODO: Devrais-je mettre tous ceux listé ici ?
http://fr.wiktionary.org/wiki/Annexe:Pluriels_irr%C3%A9guliers_en_fran%C3%A7ais]

Include [preform](-
language French

[We define a trie to construct the plural of a French noun. This is fairly
regular in French:]

<singular-noun-to-its-plural> ::=
	<fr-plural-exceptions> |
	...	<fr-plural-by-ending> |
	... <fr-plural-default>

<fr-plural-exceptions> ::=
	bleu			bleus |
	pneu			pneus |
	bal				bals |
	carnaval		carnavals |
	chacal			chacals |
	festival		festivals |
	corail			coraux |
	émail			émaux |
	travail			travaux |
	vitrail			vitraux |
	bijou			bijoux |
	caillou		cailloux |
	chou			choux |
	genou			genoux |
	hibou			hiboux |
	joujou			joujoux |
	pou				poux |
	aïeul			aïeux |
	bonhomme		bonshommes |
	ciel			cieux |
	œil				yeux |
	madame			mesdames |
	mademoiselle	mesdemoiselles |
	monsieur		messieurs

<fr-plural-by-ending> ::=
	*s			0 |				[tas -> tas]
	*x			0 |				[faux -> faux]
	*z			0 |				[nez -> nez]
	*au			0x |			[gateau -> gateaux]
	*eu			0x |			[neveu -> neveux]
	*al			1ux |			[journal -> journaux]

<fr-plural-default> ::=
	*		0s

-) in the Preform grammar.

Chapter 2.2.6 - Cases

[This will be significant for languages like German, but for French there's
nothing to do.]

Chapter 2.2.7 - Times of day

[affiche l'heure au format 24 h, comme « 16 h 26 ».]
Include (-
[ PrintTimeOfDay t h;
	if (t < 0) {
		print "<pas d'heure>";
		return;
	}
	h = t / ONE_HOUR;
	print h, "@{A0}h";
	if (t % ONE_HOUR) print "@{A0}", t % ONE_HOUR;
];
-) instead of "Digital Printing" in "Time.i6t".

[Affiche l'heure en lettre, comme « midi onze » ou « neuf heures moins sept ».
TODO: Autoriser le format sans soustraction ? (Par exemple : « dix heures trente-cinq » plutôt que « onze heure moins vint-cinq ».)]
Include (-
[ PrintTimeOfDayEnglish t h m dir half;
	h = (t / ONE_HOUR);
	m = t % ONE_HOUR;
	dir = " ";

	if (m > HALF_HOUR) {
		h = h + 1;
		if (h == 24) h = 0;
		m = ONE_HOUR - m;
		dir = " moins ";
		half = 1;
	}

	switch(h) {
		0: print "minuit";
		1: print "une heure";
		12: print "midi";
		21: print "vingt et une heures";
		default: print (number) h, " heures";
	}
	if (m > 0) {
		print (string) dir;
		switch(m) {
			1: print "une";
			21: print "vingt et une";
			QUARTER_HOUR: if (half == 0) print "et "; else print "le "; print "quart";
			HALF_HOUR: print "et demie";
			default: print (number) m;
		}
	}
];
-) instead of "Analogue Printing" in "Time.i6t".

[Je n'ai absolument aucune idée quant à l'utilité de la routine ci-dessous, puisque c'est la routine PrintTimeOfDay qui affiche l'heure. Et la description dans Language.i6t n'aide pas beaucoup. Puisque c'est la routine ci-dessous qui est référencée dans le DM4, j'ai l'impression qu'il s'agit d'un reste d'Inform 6.
Je ne comprends pas non plus pourquoi on affiche la division puis le modulo plutôt que de juste afficher le nombre…]
Include (-
[ LanguageTimeOfDay hours mins;
    print hours / 10, hours % 10, " h ", mins / 10, mins % 10;
];
-) instead of "Time" in "Language.i6t".

[TODO: faire en sorte que « quart d'heure » et « demie heure » soient acceptés. Il faudra aussi traduire la routine TIME_TOKEN.]
Include (-
[ RELATIVE_TIME_TOKEN first_word second_word offhour mult mn original_wn;
	original_wn = wn;
	wn = original_wn;

	first_word = NextWordStopped(); wn--;
	if (first_word == 'an' or 'a//') mn=1; else mn=TryNumber(wn);

	if (mn == -1000) {
		first_word = NextWordStopped();
		if (first_word == 'half') offhour = HALF_HOUR;
		if (first_word == 'quarter') offhour = QUARTER_HOUR;
		if (offhour > 0) {
			second_word = NextWordStopped();
			if (second_word == 'of') second_word = NextWordStopped();
			if (second_word == 'an') second_word = NextWordStopped();
			if (second_word == 'hour') {
				parsed_number = offhour;
				return GPR_NUMBER;
			}
		}
		return GPR_FAIL;
	}
	wn++;

	first_word = NextWordStopped();
	switch (first_word) {
		'minutes', 'minute', 'min': mult = 1;
		'heures', 'heure', 'h//': mult = 60;
		default: return GPR_FAIL;
	}
	parsed_number = mn*mult;
	if (mult == 60) {
		mn=TryNumber(wn);
		if (mn ~= -1000) {
			wn++;
			first_word = NextWordStopped();
			if (first_word == 'minutes' or 'minute')
				parsed_number = parsed_number + mn;
			else wn = wn - 2;
		}
	}
	return GPR_NUMBER;
];
-) instead of "Relative Time Token" in "Time.i6t".

Part 2.3 - Adjectives

[Pour permettre d'écrire les adjectifs après le nom.]

Include [preform](-
language French

<s-description-unspecified> ::=
	<s-qualifiable-noun> |
	<s-qualifiable-noun>?2 <s-applicable-adjective-list>?1

<s-common-description-unspecified> ::=
	<s-qualifiable-common-noun> |
	<s-qualifiable-common-noun>?2 <s-applicable-adjective-list>?1

<s-description-nounless-unspecified> ::=
	<s-qualifiable-noun> |
	<s-qualifiable-noun>?2 <s-applicable-adjective-list>?1 |
	<s-adjective-list>

-) in the Preform grammar.

Chapter 2.3.1 - Ajectives agreement rules

[Adjectives have six forms: neuter singular, neuter plural, masculine singular,
masculine plural, feminine singular, feminine plural. They're constructed
using tries:

	n.s.		(base text unchanged)
	n.p.		base modified by <adjective-to-plural>
	m.s.		base modified by <adjective-to-masculine-singular>
	m.p.		base modified by <adjective-to-masculine-singular>
				then further by <adjective-to-masculine-plural>
	f.s.		base modified by <adjective-to-feminine-singular>
	f.p.		base modified by <adjective-to-feminine-singular>
				then further by <adjective-to-feminine-plural>

For French, of course, there's no neuter, so the following are easy:]

Include [preform](-
language French

<adjective-to-plural> ::=
	*		0s

<adjective-to-masculine-singular> ::=
	*		0

[So the real work starts here: blanc to blancs, and so on.]

<adjective-to-masculine-plural> ::=
	<fr-adjective-unagreeing> |
	<fr-adjective-to-masculine-plural-exceptions> |
	...	<fr-adjective-to-masculine-plural-by-ending> |
	... <adjective-to-plural>

<fr-adjective-to-masculine-plural-exceptions> ::=
	banal		banals |
	fatal		fatals |
	final		finals |
	naval		navals

<fr-adjective-to-masculine-plural-by-ending> ::=
	*s			0 |				[gris -> gris]
	*x			0 |				[faux -> faux]
	*eau		0x |			[nouveau -> nouveaux]
	*al			1ux				[brutal -> brutaux]

<adjective-to-feminine-singular> ::=
	<fr-adjective-unagreeing> |
	<fr-adjective-to-feminine-singular-exceptions> |
	...	<fr-adjective-to-feminine-singular-teur> |
	...	<fr-adjective-to-feminine-singular-by-ending> |
	... <fr-adjective-to-feminine-default>

<fr-adjective-to-feminine-singular-exceptions> ::=
	blanc		blanche |
	franc		franche |
	grec		grecque |
	sec			sèche |
	inférieur	inférieure |
	supérieur	supérieure |
	intérieur	intérieure |
	extérieur	extérieure |
	majeur		majeure |
	mineur		mineure |
	meilleur	meilleure |
	bref		brève |
	doux		douce |
	faux		fausse |
	roux		rousse |
	vieux		vieille |
	complet		complète |
	concret		concrète |
	discret		discrète |
	inquiet		inquiète |
	secret		secrète |
	beau		belle |
	fou			folle |
	mou			molle |
	nouveau		nouvelle |
	bas			basse |
	bénin		bénigne |
	épais		épaisse |
	favori		favorite |
	frais		fraiche |
	gras		grasse |
	gros		grosse |
	gentil		gentille |
	jumeau		jumelle |
	las			lasse |
	long		longue |
	malin		maligne |
	nul			nulle |
	paysan		paysanne |
	sot			sotte |
	chic		chic |
	maximum		maximum |
	minimum		minimum

<fr-adjective-to-feminine-singular-teur> ::=
	*teur		3rice			[conducteur -> conductrice]

<fr-adjective-to-feminine-singular-by-ending> ::=
	*e			0 |				[vide -> vide]
	*c			1que |			[public -> publique]
	*eil		0le |			[pareil -> pareille]
	*el			0le |			[officiel -> officielle]
	*en			0ne |			[ancien -> ancienne]
	*er			2ère |			[dernier -> dernière]
	*et			0te |			[net -> nette]
	*eur		1se |			[trompeur -> trompeuse]
	*f			1ve |			[informatif -> informative]
	*gu			0ë |			[aigu -> aiguë]
	*on			0ne |			[bon -> bonne]
	*x			1se				[heureux -> heureuse]

<fr-adjective-to-feminine-default> ::=
	*			0e

<adjective-to-feminine-plural> ::=
	<fr-adjective-unagreeing> |
	... <adjective-to-plural>

<fr-adjective-unagreeing> ::=
	châtain		châtain |
	impromptu	impromptu |
	kaki		kaki |
	khaki		khaki |
	marron		marron |
	snob		snob

-) in the Preform grammar.

Chapter 2.3.2 - New adjectives

In French allumé is an adjective.
In French ancien is an adjective.
In French descendu is an adjective.
In French déverrouillé is an adjective.
In French disponible is an adjective.
In French entré is an adjective.
In French éteint is an adjective.
In French fermé is an adjective.
In French impressionné is an adjective.
In French incapable is an adjective.
In French intéressé is an adjective.
In French monté is an adjective.
In French mort is an adjective.
In French ouvert is an adjective.
In French plongé is an adjective.
In French porté is an adjective.
In French poussé is an adjective.
In French sorti is an adjective.
In French touché is an adjective.
In French verrouillé is an adjective.
In French vide is an adjective.

Part 2.4 - Verbs

Chapter 2.4.1 - Verb conjugations

[TODO: je dois revoir : verbe en -ayer, -eler, -eter, ainsi que le verbe plaire]

[Now we need to give instructions on how to conjugate verbs. See also the
published guide to Inform syntax, which goes through the English case; but
the French case below shows off features not needed for English, so it's a
better example to follow for other languages.]

[The specification below is not bad, but it does ignore a few grammatical
difficulties. Harmlessly, it constructs now obsolete forms for defective
verbs with some parts missing: French doesn't have many of these, but for
example, "poindre" lacks a past tense form in modern French. We'll construct
it anyway. Other gaps in our coverage will be marked >--> below; they might
need improving later.]

Include [preform](-
language French

[Most French verbs "conjugate with avoir": that is, they form tenses like
the perfect using "avoir" as an auxiliary -- "il a donné", he has given. But
a few exceptions "conjugate with être" instead. The cleanest way to handle
this is to give two conjugations: one for the avoir verbs, one for the être
verbs, even those the rules are identical except for two of our tenses.

>--> A small set of verbs conjugates with avoir when used transitively, but
with être when used intransitively:

	entrer, sortir, retourner, rentrer, monter, descendre, passer

Inform doesn't know when it prints a verb whether it's being used transitively
or not, so it has to make a decision: and we're going to conjugate all of these
cases with "avoir". So our present perfect and past perfect forms of these
verbs will be wrong when they're used intransitively. (But of course if they
are being used in Inform source text then they must be transitive anyway; so
this will only affect printed output in games told in the perfect tenses, which
I can't imagine many people will want to do.)]

[>--> Similarly we're going to ignore conjugation with être for verbs when used
reciprocally, e.g., "ils se regardent" (which in some contexts means "they look
at each other").]

[>--> In some cases modern French offers a choice of whether to give verbs
an irregular conjugation or not:

(a) There are two verbs with the infinitive "ressortir": one regular, meaning
	"to come with the jurisdiction of", and one irregular, meaning "to come out
	again" or "to stand out". I think the latter is more likely in IF.

(b) The mostly obsolete verb "vêtir" (to clothe, but "habiller" is far more
	common now) is sometimes irregular, sometimes not. Inform treats it as a
	regular -IR verb.]

<verb-conjugation-instructions> ::=
[Auxiliary verbs]
	être 		<fr-etre-conjugation> |
	avoir	 	<fr-avoir-conjugation> |
[Irregular -ER verbs]
	aller	 	<fr-aller-conjugation> |
	arriver 	<fr-first-with-etre-conjugation> |
	rester 		<fr-first-with-etre-conjugation> |
	tomber 		<fr-first-with-etre-conjugation> |
[Regular -ER verbs]
	-er 		<fr-first-with-avoir-conjugation> |		[e.g., "donner"]
	se ...	 	<fr-reflexive-conjugation> |			[e.g., "se lever"]
[Irregular -IR verbs]
	-jaillir 		<fr-second-with-avoir-conjugation> |
	-faillir 		<fr-second-with-avoir-conjugation> |
	-aillir		<fr-aillir-conjugation> |				[e.g. "assaillir"]
	-cueillir	<fr-cueillir-conjugation> |				[e.g. "recueillir"]
	offrir		<fr-offrir-conjugation> |
	souffrir	<fr-offrir-conjugation> |
	-ouvrir		<fr-offrir-conjugation> |				["ouvrir" and its derivations]
	mentir		<fr-dormir-conjugation> |
	dormir		<fr-dormir-conjugation> |
	servir		<fr-dormir-conjugation> |
	resservir		<fr-dormir-conjugation> |
	desservir		<fr-dormir-conjugation> |
	sortir		<fr-dormir-conjugation> |
	ressortir	<fr-dormir-conjugation> |
	-sentir		<fr-dormir-conjugation> |
	partir		<fr-partir-conjugation> |
	repartir		<fr-partir-conjugation> |
	bouillir	<fr-bouillir-conjugation> |
	-courir		<fr-courir-conjugation> |
	-quérir		<fr-querir-conjugation> |				[e.g. "acquérir", "conquérir"]
	-tenir		<fr-tenir-conjugation> |
	-venir		<fr-venir-conjugation> |
	mourir		<fr-mourir-conjugation> |
	fuir		<fr-fuir-conjugation> |
	enfuir		<fr-fuir-conjugation> |
	gésir		<fr-gesir-conjugation> |
	haïr		<fr-hair-conjugation> |
	ouïr		<fr-ouir-conjugation> |
	pouvoir		<fr-pouvoir-conjugation> |
	revoir			<fr-voir-conjugation> |
	-vouloir		<fr-vouloir-conjugation> |
	-mouvoir		<fr-mouvoir-conjugation> |
	-pleuvoir	<fr-pleuvoir-conjugation> |
	-cevoir		<fr-cevoir-conjugation> |				[e.g., "recevoir", "concevoir"]
	-evoir		<fr-evoir-conjugation> |				[e.g., "devoir", "redevoir"]
	savoir		<fr-savoir-conjugation> |
	-pourvoir	<fr-pourvoir-conjugation> |
	-voir		<fr-voir-conjugation> |
	falloir		<fr-falloir-conjugation> |
	-valoir		<fr-valoir-conjugation> |
	-asseoir	<fr-asseoir-conjugation> |
	-assoir	<fr-assoir-conjugation> |
	choir		<fr-choir-conjugation> |
	déchoir		<fr-dechoir-conjugation> |
[Regular -IR verbs]
	-ir 		<fr-second-with-avoir-conjugation> |	[e.g., "finir"]
[Irregular -RE verbs]
	-battre	<fr-battre-conjugation> |				[e.g., "battre", "abattre"]
	-indre		<fr-indre-conjugation> |				[e.g., "craindre", "teindre"]
	-soudre		<fr-soudre-conjugation> |			[e.g., "dissoudre"]
	-prendre	<fr-prendre-conjugation> |
	-mettre		<fr-mettre-conjugation> |
	-coudre		<fr-coudre-conjugation> |
	-moudre		<fr-moudre-conjugation> |
	-vaincre		<fr-vaincre-conjugation> |
	-rompre		<fr-rompre-conjugation> |
	-suivre		<fr-suivre-conjugation> |
	-vivre		<fr-vivre-conjugation> |
	naître 		<fr-naitre-conjugation> |
	renaître 		<fr-naitre-conjugation> |
	-aître 		<fr-aitre-conjugation> |
	croître		<fr-croitre-conjugation> |
	recroître	<fr-croitre-conjugation> |
	accroître	<fr-accroitre-conjugation> |
	décroître	<fr-accroitre-conjugation> |
	-croître	<fr-other-croitre-conjugation> |
	bruire		<fr-bruire-conjugation> |
	-uire		<fr-uire-conjugation> |
	-ure		<fr-ure-conjugation> |
	croire		<fr-croire-conjugation> |
	-boire		<fr-boire-conjugation> |
	-faire		<fr-faire-conjugation> |
	-traire		<fr-traire-conjugation> |
	-aire		<fr-aire-conjugation> |
	-clore		<fr-clore-conjugation> |
	dire		<fr-dire-conjugation> |
	redire		<fr-dire-conjugation> |
	-dire		<fr-regular-dire-conjugation> |
	-fire		<fr-fire-conjugation> |
	-crire		<fr-crire-conjugation> |
	-lire		<fr-lire-conjugation> |
	rire		<fr-rire-conjugation> |
	sourire		<fr-rire-conjugation> |
	frire		<fr-rire-conjugation> |
[Regular -RE verbs]
	...			<fr-third-with-avoir-conjugation>		[e.g., "vendre"]

[So here goes with avoir, which is not very irregular, but we'll need it as
an auxiliary later.

Note the presence of the asterisks when the past participle is used; "3+*"
expands to the past participle with an asterisk on the end. The closing
asterisk tells Inform that the word marked has to follow adjectival agreement
rules with the subject of the verb - something which doesn't happen for
English, where the asterisks are never used. For French we always use it.]

<fr-avoir-conjugation> ::=
	2 		ayant |
	3 		eu |
	<fr-avoir-tabulation>

<fr-avoir-tabulation> ::=
	a1+		<fr-avoir-present> |
	a1-		ne-' <fr-avoir-present> pas |
	a2+		<fr-avoir-past> |
	a2-		ne-' <fr-avoir-past> pas |
	a3+		<fr-avoir-present> 3 |
	a3-		ne-' <fr-avoir-present> pas 3 |
	a4+		<fr-avoir-past> 3 |
	a4-		ne-' <fr-avoir-past> pas 3 |
	a5+		<fr-avoir-future> |
	a5-		ne-' <fr-avoir-future> pas |
	a6+		<fr-avoir-past-historic> |
	a6-		ne-' <fr-avoir-past-historic> pas |
	p*		3+* par

<fr-avoir-present> ::=
	ai | as | a | avons | avez | ont

<fr-avoir-past> ::=
	avais |	avais | avait | avions | aviez | avaient

<fr-avoir-past-historic> ::=
	eus | eus | eut | eûmes | eûtes | eurent

<fr-avoir-future> ::=
	aurai | auras | aura | aurons | aurez | auront

[Être is an example of an irregular verb being declared as a one-off. In most
languages even the irregular verbs have patterns to them, but être is genuinely
special case, just as "to be" is in English. Note that we give the present
and past participles as fixed wording rather than giving a trie; there's no
point in writing a trie when we have only one possibility.]

<fr-etre-conjugation> ::=
	2		étant |
	3		été |
	<fr-etre-tabulation>

<fr-etre-tabulation> ::=
	a1+		<fr-etre-present> |
	a1-		ne-' <fr-etre-present> pas |
	a2+		<fr-etre-past> |
	a2-		ne-' <fr-etre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-etre-future> |
	a5-		ne-' <fr-etre-future> pas |
	a6+		<fr-etre-past-historic> |
	a6-		ne-' <fr-etre-past-historic> pas |
	p*		3+* par

<fr-etre-present> ::=
	suis | es | est | sommes | êtes | sont

<fr-etre-past> ::=
	étais |	étais | était | étions | étiez | étaient

<fr-etre-past-historic> ::=
	fus | fus | fut | fûmes | fûtes | furent

<fr-etre-future> ::=
	serai |	seras | sera | serons | serez | seront

[Aller is a train-wreck of a verb, with four different stems from three
different historical sources, but it's also pretty essential for IF. To
add to the fun, it conjugates with être.]

<fr-aller-conjugation> ::=
	2		allant |
	3		allé |
	<fr-aller-tabulation>

<fr-aller-tabulation> ::=
	a1+		<fr-aller-present> |
	a1-		ne-' <fr-aller-present> pas |
	a2+		<fr-aller-past> |
	a2-		ne-' <fr-aller-past> pas |
	a3		( t1 être ) 3+* |
	a4		( t2 être ) 3+* |
	a5+		<fr-aller-future> |
	a5-		ne-' <fr-aller-future> pas |
	a6+		<fr-aller-past-historic> |
	a6-		ne-' <fr-aller-past-historic> pas |
	p*		3+* par

<fr-aller-present> ::=
	vais | vas | va | allons | allez | vont

<fr-aller-past> ::=
	allais | allais | allait | allions | alliez | allaient

<fr-aller-past-historic> ::=
	allai | allas | alla | allâmes | allâtes | allèrent

<fr-aller-future> ::=
	irai |	iras | ira | irons | irez | iront

[French "first conjugation": regular -ER verbs.

Here the main complication is that spelling changes are made to the stem
for phonetic reasons for some of the endings, so we will actually need to
make four different stems, putting them in verb forms 5, 6, 7, 8:

	(5) always use this one, except:
	(6) for -e, -es, -ent endings;
	(7) for future tense endings;
	(8) for -a*, -o* endings.

For many first-conjugation verbs, such as "donner", all four verb forms are
the same.]

<fr-first-with-avoir-conjugation> ::=
	5 		<fr-first-stem-general> |	[see above]
	6 		<fr-first-stem-e-es-ent> |	[see above]
	7 		<fr-first-stem-future> |	[see above]
	8 		<fr-first-stem-a-o> |		[see above]
	2 		8+ant |						[present participle: stem + -ant, e.g., donnant]
	3 		5+é |						[past participle: stem + -é, e.g., donné]
	<fr-first-with-avoir-tabulation>

<fr-first-with-etre-conjugation> ::=
	5 		<fr-first-stem-general> |	[see above]
	6 		<fr-first-stem-e-es-ent> |	[see above]
	7 		<fr-first-stem-future> |	[see above]
	8 		<fr-first-stem-a-o> |		[see above]
	2 		8+ant |						[present participle: stem + -ant, e.g., donnant]
	3 		5+é |						[past participle: stem + -é, e.g., donné]
	<fr-first-with-etre-tabulation>

[So here goes working out the stems.]

<fr-first-stem-general> ::=
	*	2					[drop the last two letters: donner -> donn]

<fr-first-stem-e-es-ent> ::=
	... <fr-first-stem-e-es-ent-exceptions> |
	... <fr-first-stem-general>

<fr-first-stem-future> ::=
	<fr-first-stem-future-irregularities> |
	... <fr-first-stem-future-exceptions> |
	... <fr-first-stem-general>

<fr-first-stem-a-o> ::=
	... <fr-first-stem-a-o-exceptions> |
	... <fr-first-stem-general>

<fr-first-stem-e-es-ent-exceptions> ::=
	*éber	4èb |
	*écer	4èc |
	*éder	4èd |
	*éfer	4èf |
	*éger	4èg |						[e.g. "protéger" to "protèg"]
	*éher	4èh |
	*éjer	4èj |
	*éker	4èk |
	*éler	4èl |
	*émer	4èm |
	*éner	4èn |
	*éper	4èp |
	*éqer	4èq |
	*érer	4èr |						[e.g. "espérer" to "espèr"]
	*éser	4ès |
	*éter	4èt |
	*éver	4èv |
	*éwer	4èw |
	*éxer	4èx |
	*éyer	4èy |
	*ézer	4èz |
	*eber	4èb |
	*ecer	4èc |
	*eder	4èd |
	*efer	4èf |
	*eger	4èg |						[e.g. "protéger" to "protèg"]
	*eher	4èh |
	*ejer	4èj |
	*eker	4èk |
	*appeler	4ell |
	*eler	4èl |						[e.g. "appeler" to "appèl"]
	*emer	4èm |
	*ener	4èn |
	*eper	4èp |
	*eqer	4èq |
	*erer	4èr |						[e.g. "espérer" to "espèr"]
	*eser	4ès |
	*eter	4èt |						[e.g. "acheter" to "achèt"]
	*jeter	2t |						[e.g. "jeter" to "jett"]
	*queter	2t |						[e.g. "étiqueter" to "étiqett"]
	*ever	4èv |						[e.g. "lever" to "lèv"]
	*evrer	5èvr |
	*ezer	4èz |
	*oyer	3i |						[e.g. "nettoyer" to "nettoi"]
	*uyer	3i							[e.g. "appuyer" to "appui"]

[Except for "aller", which we conjugated as a special case above, the only
irregular -ER verbs are "envoyer" and "renvoyer", and they are only irregular
in the future tense stems:]

<fr-first-stem-future-irregularities> ::=
	envoyer		enverr |
	renvoyer	renverr

<fr-first-stem-future-exceptions> ::=
	*er		0 |
	*eber	4èber |
	*ecer	4ècer |
	*eder	4èder |
	*efer	4èfer |
	*eger	4èger |
	*eher	4èher |
	*ejer	4èjer |
	*eker	4èker |
	*eler	4èler |						[e.g. "déceler" to "décèler"]
	*appeler	4eller |
	*emer	4èmer |
	*ener	4èner |
	*eper	4èper |
	*equer	4èquer |
	*erer	4èrer |						[e.g. "liserer" to "lisèrer"]
	*eser	4èser |
	*eter	4èter |						[e.g. "acheter" to "achèter"]
	*jeter	2ter |						[e.g. "jeter" to "jetter"]
	*queter	2ter |						[e.g. "étiqueter" to "étiqetter"]
	*ever	4èver |						[e.g. "lever" to "lèver"]
	*evrer 5èvrer |
	*ezer	4èzer |
	*oyer	3ier |						[e.g. "nettoyer" to "nettoier"]
	*uyer	3ier						[e.g. "appuyer" to "appuier"]

<fr-first-stem-a-o-exceptions> ::=
	*cer	3ç |						[e.g. "commencer" to "commenç"]
	*<abcdefhijklmnopqrstuvwxz>ger	1 |		[e.g. "manger" to "mange"]

[>--> I've ignored -ayer verbs which change the "y" to "i" like -oyer verbs.
Many "-ayer" verbs don't do this -- e.g. the "y" in "payer" never changes to
"i", and similarly "balayer", "effrayer", "essayer", all quite common verbs.
It depends on the sound. Anyway, the exceptions for e-es-ent and for future
tense might need further work to cope with "-ayer" verbs which change.]

[>--> I've also been very sketchy about what to do with "-eter" verbs. Most
of these go like "acheter", and change the "-et" to "-èt", but a few others
double the "t" instead: so "tu achètes", but "tu jettes". I've just entered
a few common cases for doubling the consonant - "jeter" and its compounds,
"projeter", "rejeter", etc., and "étiqueter" (to label), because it looked
like something people might use in IF. "Breveter" (to patent), not so much.
The same issue arises with a few "-eler" verbs, where I've assumed they all
go like "appeler" and add a grave accent, but in fact a few double the "l"
instead.]

[At last we can write the tabulations. There are two of these, identical
except that one's used for verbs conjugating with avoir, one for verbs
conjugating with être.]

<fr-first-with-avoir-tabulation> ::=
	a1+		<fr-first-present> |
	a1-		ne-' <fr-first-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-first-past-historic> |
	a6-		ne-' <fr-first-past-historic> pas |
	p*		3+* par

<fr-first-with-etre-tabulation> ::=
	a1+		<fr-first-present> |
	a1-		ne-' <fr-first-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 être ) 3+* |
	a4		( t2 être ) 3+* |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-first-past-historic> |
	a6-		ne-' <fr-first-past-historic> pas |
	p*		3+* par

<fr-first-present> ::=
	6+e | 6+es | 6+e | 8+ons | 5+ez | 6+ent

<fr-first-past> ::=
	8+ais | 8+ais | 8+ait | 5+ions | 5+iez | 8+aient

<fr-first-past-historic> ::=
	8+ai | 8+as | 8+a | 8+âmes | 8+âtes | 5+èrent

<fr-first-future> ::=
	7+ai | 7+as | 7+a | 7+ons | 7+ez | 7+ont

[Regular -IR verbs.]

<fr-second-with-avoir-conjugation> ::=
	5 <fr-second-stem> |	[slot 5 we use for the stem of the verb]
	2 5+issant |			[present participle: stem + -issant, e.g., finissant]
	3 5+i |					[past participle: stem + -i, e.g., fini]
	<fr-second-with-avoir-tabulation>

<fr-second-with-etre-conjugation> ::=
	5 <fr-second-stem> |	[slot 5 we use for the stem of the verb]
	2 5+issant |			[present participle: stem + -issant, e.g., finissant]
	3 5+i |					[past participle: stem + -i, e.g., fini]
	<fr-second-with-etre-tabulation>

<fr-second-stem> ::=		[this is not much of a trie:]
	*	2					[in all cases drop the last two letters: finir -> fin]

<fr-second-with-avoir-tabulation> ::=
	a1+		<fr-second-present> |
	a1-		ne-' <fr-second-present> pas |
	a2+		<fr-second-past> |
	a2-		ne-' <fr-second-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-second-future> |
	a5-		ne-' <fr-second-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

<fr-second-with-etre-tabulation> ::=
	a1+		<fr-second-present> |
	a1-		ne-' <fr-second-present> pas |
	a2+		<fr-second-past> |
	a2-		ne-' <fr-second-past> pas |
	a3		( t1 être ) 3+* |
	a4		( t2 être ) 3+* |
	a5+		<fr-second-future> |
	a5-		ne-' <fr-second-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

<fr-second-present> ::=
	5+is | 5+is | 5+it | 5+issons | 5+issez | 5+issent

<fr-second-past> ::=
	5+issais | 5+issais | 5+issait | 5+issions | 5+issiez | 5+issaient

<fr-second-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

<fr-second-future> ::=
	1+ai | 1+as | 1+a | 1+ons | 1+ez | 1+ont

[Irregular -IR verbs: the cueillir set. These use a mixture of first and
second conjugation endings.]

<fr-cueillir-conjugation> ::=
	5 		<fr-second-stem> |	[slot 5 we use for the stem of the verb]
	6 		5 |
	7 		5+er |
	8 		5 |
	2 		5+ant |				[present participle: stem + -ant, e.g., cueillant]
	3 		5+i |					[past participle: stem + -i, e.g., cueilli]
	<fr-cueillir-tabulation>

<fr-cueillir-tabulation> ::=
	a1+		<fr-first-present> |
	a1-		ne-' <fr-first-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

[Now the assaillir set. These are like cueillir verbs except that they take
second-conjugation endings in the future tense.]

<fr-aillir-conjugation> ::=
	5 		<fr-second-stem> |	[slot 5 we use for the stem of the verb]
	6 		5 |
	7 		5 |
	8 		5 |
	2 		5+ant |				[present participle: stem + -ant, e.g., cueillant]
	3 		5+i |					[past participle: stem + -i, e.g., cueilli]
	<fr-aillir-tabulation>

<fr-aillir-tabulation> ::=
	a1+		<fr-first-present> |
	a1-		ne-' <fr-first-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-second-future> |
	a5-		ne-' <fr-second-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

[Now the offrir set. These are like -aillir verbs except that they change
vowel in the past participle.]

<fr-offrir-conjugation> ::=
	5 		<fr-second-stem> |	[slot 5 we use for the stem of the verb]
	6 		5 |
	7 		5 |
	8 		5 |
	2 		5+ant |				[present participle: stem + -ant, e.g., offrant]
	3 		<fr-offrir-pp> |	[past participle: e.g., offert]
	<fr-aillir-tabulation>

<fr-offrir-pp> ::=
	*rir	3ert				[offrir -> offert]

[The dormir set drop a consonant in the singular present tense, and are also
a mixture of first and second conjugation endings.]

<fr-dormir-conjugation> ::=
	5 		<fr-second-stem> |	[slot 5 we use for the stem of the verb]
	6 		5 |
	7 		5 |
	8 		5 |
	9 		<fr-dormir-stem> |
	2 		5+ant |				[present participle: stem + -ant, e.g., dormant]
	3 		5+i |				[past participle: e.g., dormi]
	<fr-dormir-tabulation>

<fr-dormir-stem> ::=
	*		3					[dormir -> dor]

<fr-dormir-tabulation> ::=
	a1+		<fr-dormir-present> |
	a1-		ne-' <fr-dormir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-dormir-future> |
	a5-		ne-' <fr-dormir-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

<fr-dormir-present> ::=
	9+s | 9+s | 9+t | 5+ons | 5+ez | 5+ent

<fr-dormir-future> ::=
	5+irai | 5+iras | 5+ira | 5+irons | 5+irez | 5+iront

["Partir" and "repartir", wame as "dormir" but with être.]

<fr-partir-conjugation> ::=
	5 		<fr-second-stem> |	[slot 5 we use for the stem of the verb]
	6 		5 |
	7 		5 |
	8 		5 |
	9 		<fr-partir-stem> |
	2 		5+ant |				[present participle: stem + -ant, e.g., dormant]
	3 		5+i |				[past participle: e.g., dormi]
	<fr-partir-tabulation>

<fr-partir-stem> ::=
	*		3					[dormir -> dor]

<fr-partir-tabulation> ::=
	a1+		<fr-partir-present> |
	a1-		ne-' <fr-partir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 être ) 3 |
	a4		( t2 être ) 3 |
	a5+		<fr-partir-future> |
	a5-		ne-' <fr-partir-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

<fr-partir-present> ::=
	9+s | 9+s | 9+t | 5+ons | 5+ez | 5+ent

<fr-partir-future> ::=
	5+irai | 5+iras | 5+ira | 5+ons | 5+irez | 5+iront

["bouillir", to boil or seethe, is very similar, but the shortened
stem in the present singular is even shorter.]

<fr-bouillir-conjugation> ::=
	5 		bouill |
	6 		bouill |
	7 		bouill |
	8 		bouill |
	9 		bou |
	2 		bouillant |			[present participle]
	3 		bouilli |			[past participle]
	<fr-dormir-tabulation>

[The verb "courir" and its derivatives, to run, is another mixed-up verb, having once been an
-ER verb which was then mis-spelled.]

<fr-courir-conjugation> ::=
	5 		<fr-courir-stem> |
	6 		5 |
	7 		5+r |				[i.e. form of stem to use with future]
	8 		5 |
	2 		5+ant |			[present participle]
	3 		5+u |				[past participle]
	<fr-courir-tabulation>

<fr-courir-stem> ::=
	*	2						["courir" --> "cour"]

<fr-courir-tabulation> ::=
	a1+		<fr-courir-present> |
	a1-		ne-' <fr-courir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-courir-past-historic> |
	a6-		ne-' <fr-courir-past-historic> pas |
	p*		3+* par

<fr-courir-present> ::=
	5+s | 5+s | 5+t | 5+ons | 5+ez | 5+ent

<fr-courir-past-historic> ::=
	5+us | 5+us | 5+ut | 5+ûmes | 5+ûtes | 5+urent

[The verb "quérir" is now obsolete, but derivatives like "conquérir" aren't.
They're irregular instead.]

<fr-querir-conjugation> ::=
	5 		<fr-second-stem> |	[slot 5 we use for the stem of the verb]
	9 		<fr-querir-stem> |
	6 		5 |
	7 		9+err |				[double the "r" and drop accent in the future stem]
	8 		5 |
	2 		5+ant |				[present participle]
	3 		9+is |				[past participle]
	<fr-querir-tabulation>

<fr-querir-stem> ::=
	*		4					["acquérir" --> "acqu"]

<fr-querir-tabulation> ::=
	a1+		<fr-querir-present> |
	a1-		ne-' <fr-querir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-querir-past-historic> |
	a6-		ne-' <fr-querir-past-historic> pas |
	p*		3+* par

<fr-querir-present> ::=
	9+iers | 9+iers | 9+iert | 9+érons | 9+érez | 9+ièrent

<fr-querir-past-historic> ::=
	9+is | 9+is | 9+it | 9+îmes | 9+îtes | 9+irent

[Now "tenir".]

<fr-tenir-conjugation> ::=
	5 		<fr-tenir-stem-short> |
	6 		<fr-tenir-stem-shorter> |
	7 		<fr-tenir-stem-future> |	[i.e. form of stem to use with future]
	8 		5 |
	2 		5+ant |			[present participle]
	3 		5+u |				[past participle]
	<fr-tenir-tabulation>

<fr-tenir-stem-short> ::=
	*	4en

<fr-tenir-stem-shorter> ::=
	*	4

<fr-tenir-stem-future> ::=
	*	4iendr

<fr-tenir-tabulation> ::=
	a1+		<fr-tenir-present> |
	a1-		ne-' <fr-tenir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-tenir-past-historic> |
	a6-		ne-' <fr-tenir-past-historic> pas |
	p*		3+* par

<fr-tenir-present> ::=
	6+iens | 6+iens | 6+ient | 6+enons | 6+enez | 6+iennent

<fr-tenir-past-historic> ::=
	6+ins | 6+ins | 6+int | 6+înmes | 6+întes | 6+inrent

["Venir" is almost the same.]

<fr-venir-conjugation> ::=
	5 		<fr-venir-stem-short> |
	6 		<fr-venir-stem-shorter> |
	7 		<fr-venir-stem-future> |	[i.e. form of stem to use with future]
	8 		5 |
	2 		5+ant |			[present participle]
	3 		5+u |				[past participle]
	<fr-venir-tabulation>

<fr-venir-stem-short> ::=
	*	4en

<fr-venir-stem-shorter> ::=
	*	4

<fr-venir-stem-future> ::=
	*	4iendr

<fr-venir-tabulation> ::=
	a1+		<fr-venir-present> |
	a1-		ne-' <fr-venir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 être ) 3+* |
	a4		( t2 être ) 3+* |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-venir-past-historic> |
	a6-		ne-' <fr-venir-past-historic> pas |
	p*		3+* par

<fr-venir-present> ::=
	6+iens | 6+iens | 6+ient | 6+enons | 6+enez | 6+iennent

<fr-venir-past-historic> ::=
	6+ins | 6+ins | 6+int | 6+înmes | 6+întes | 6+inrent

["Mourir" is a further variation on "courir".]

<fr-mourir-conjugation> ::=
	5 		mour |
	6 		5 |
	7 		mourr |				[i.e. form of stem to use with future]
	8 		5 |
	2 		mourant |			[present participle]
	3 		mort |				[past participle]
	<fr-mourir-tabulation>

<fr-mourir-tabulation> ::=
	a1+		<fr-mourir-present> |
	a1-		ne-' <fr-mourir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 être ) 3 |
	a4		( t2 être ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-mourir-past-historic> |
	a6-		ne-' <fr-mourir-past-historic> pas |
	p*		3+* par

<fr-mourir-present> ::=
	meurs | meurs | meurt | mourons | mourez | meurent

<fr-mourir-past-historic> ::=
	mourus | mourus | mourut | mourûmes | mourûtes | moururent

["Fuir" and "enfuir" are quite regular except for the past tense stem. But
that's enough to make us write it all out again.]

<fr-fuir-conjugation> ::=
	5 		<fr-fuir-stem> |
	6 		5 |
	7 		5+ir |
	8 		5 |
	2 		5+yant |			[present participle]
	3 		5+i |				[past participle]
	<fr-fuir-tabulation>

<fr-fuir-stem> ::=
	*		2

<fr-fuir-tabulation> ::=
	a1+		<fr-fuir-present> |
	a1-		ne-' <fr-fuir-present> pas |
	a2+		<fr-fuir-past> |
	a2-		ne-' <fr-fuir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

<fr-fuir-present> ::=
	5+is | 5+is | 5+it | 5+yons | 5+yez | 5+ient

<fr-fuir-past> ::=
	5+yais | 5+yais | 5+yait | 5+yions | 5+yiez | 5+yaient

["Gésir", a defective verb: only present, past and present participle.]

<fr-gesir-conjugation> ::=
	2 		gisant |			[present participle]
	3 		git |				[an invented past participle, should never be used]
	<fr-gesir-tabulation>

<fr-gesir-tabulation> ::=
	a1+		<fr-gesir-present> |
	a1-		ne-' <fr-gesir-present> pas |
	a2+		<fr-gesir-past> |
	a2-		ne-' <fr-gesir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-gesir-future> |
	a5-		ne-' <fr-gesir-future> pas |
	a6+		<fr-gesir-past-historic> |
	a6-		ne-' <fr-gesir-past-historic> pas |
	p*		3+* par

<fr-gesir-present> ::=
	gis | gis | gît | gisons | gisez | gisent

<fr-gesir-past> ::=
	gisais | gisais | gisait | gisions | gisiez | gisaient

<fr-gesir-future> ::=
	-- | -- | -- | -- | -- | --

<fr-gesir-past-historic> ::=
	-- | -- | -- | -- | -- | --

["Haïr".]

<fr-hair-conjugation> ::=
	5 		<fr-hair-stem> |
	6 		<fr-hair-stem-shorter> |
	7 		5+r |				[i.e. form of stem to use with future]
	8 		5 |
	2 		6+ssant |			[present participle]
	3 		<fr-hair-stem> |				[past participle]
	<fr-hair-tabulation>

<fr-hair-stem> ::=
	*	1						["haïr" --> "haï"]

<fr-hair-stem-shorter> ::=
	*	2						["haïr" --> "ha"]

<fr-hair-tabulation> ::=
	a1+		<fr-hair-present> |
	a1-		ne-' <fr-hair-present> pas |
	a2+		<fr-hair-past> |
	a2-		ne-' <fr-hair-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-hair-past-historic> |
	a6-		ne-' <fr-hair-past-historic> pas |
	p*		3+* par

<fr-hair-present> ::=
	6+is | 6+is | 6+it | 5+ssons | 5+ssez | 5+ssent

<fr-hair-past> ::=
	5+ssais | 5+ssais | 5+ssait | 5+ssions | 5+ssiez | 5+ssaient

<fr-hair-past-historic> ::=
	5+s | 5+s | 5+t | 5+mes | 5+tes | 5+rent

["Ouïr".]

<fr-ouir-conjugation> ::=
	7 		ouïr |				[i.e. form of stem to use with future]
	2 		oyant |			[present participle]
	3 		ouï |				[past participle]
	<fr-ouir-tabulation>

<fr-ouir-tabulation> ::=
	a1+		<fr-ouir-present> |
	a1-		ne-' <fr-ouir-present> pas |
	a2+		<fr-ouir-past> |
	a2-		ne-' <fr-ouir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-ouir-past-historic> |
	a6-		ne-' <fr-ouir-past-historic> pas |
	p*		3+* par

<fr-ouir-present> ::=
	ouïs | ouïs | ouït | oyons | oyez | ouïent

<fr-ouir-past> ::=
	oyais | oyais | oyait | oyions | oyiez | oyaient

<fr-ouir-past-historic> ::=
	ouïs | ouïs | ouït | ouïmes | ouïtes | 5+ouïrent

["Pouvoir".]

<fr-pouvoir-conjugation> ::=
	5 		pouv |
	6 		5 |
	7 		pourr |				[i.e. form of stem to use with future]
	8 		5 |
	2 		pouvant |			[present participle]
	3 		pu |				[past participle]
	<fr-pouvoir-tabulation>

<fr-pouvoir-tabulation> ::=
	a1+		<fr-pouvoir-present> |
	a1-		ne-' <fr-pouvoir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-pouvoir-past-historic> |
	a6-		ne-' <fr-pouvoir-past-historic> pas |
	p*		3+* par

<fr-pouvoir-present> ::=
	peux | peux | peut | pouvons | pouvez | peuvent

<fr-pouvoir-past-historic> ::=
	pus | pus | put | pûmes | pûtes | purent

["Vouloir".]

<fr-vouloir-conjugation> ::=
	5 		<fr-vouloir-stem> |
	6 		<fr-vouloir-stem-shorter> |
	7 		6+oudr |				[i.e. form of stem to use with future]
	8 		5 |
	2 		5+ant |			[present participle]
	3 		5+u |				[past participle]
	<fr-vouloir-tabulation>

<fr-vouloir-stem> ::=
	*	3						["vouloir" --> "voul"]

<fr-vouloir-stem-shorter> ::=
	*	6						["vouloir" --> "v"]

<fr-vouloir-tabulation> ::=
	a1+		<fr-vouloir-present> |
	a1-		ne-' <fr-vouloir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-vouloir-past-historic> |
	a6-		ne-' <fr-vouloir-past-historic> pas |
	p*		3+* par

<fr-vouloir-present> ::=
	6+eux | 6+eux | 6+eut | 6+oulons | 6+oulez | 6+eulent

<fr-vouloir-past-historic> ::=
	5+us | 5+us | 5+ut | 5+ûmes | 5+ûtes | 5+urent

["Mouvoir", "promouvoir" and "émouvoir".]

<fr-mouvoir-conjugation> ::=
	5 		<fr-mouvoir-stem> |
	6 		<fr-mouvoir-stem-shorter> |
	7 		5+r |				[i.e. form of stem to use with future]
	8 		5 |
	2 		5+ant |			[present participle]
	3 		6+u |				[past participle]
	<fr-mouvoir-tabulation>

<fr-mouvoir-stem> ::=
	*	3						["mouvoir" --> "mouv"]

<fr-mouvoir-stem-shorter> ::=
	*	6						["mouvoir" --> "m"]

<fr-mouvoir-tabulation> ::=
	a1+		<fr-mouvoir-present> |
	a1-		ne-' <fr-mouvoir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-mouvoir-past-historic> |
	a6-		ne-' <fr-mouvoir-past-historic> pas |
	p*		3+* par

<fr-mouvoir-present> ::=
	6+eus | 6+eus | 6+eut | 5+ons | 5+ez | 6+euvent

<fr-mouvoir-past-historic> ::=
	6+us | 6+us | 6+ut | 6+ûmes | 6+ûtes | 6+urent

["Pleuvoir" and "repleuvoir".]

<fr-pleuvoir-conjugation> ::=
	5 		<fr-pleuvoir-stem> |
	6 		<fr-pleuvoir-stem-shorter> |
	7 		5+vr |			[i.e. form of stem to use with future]
	8 		5 |
	2 		5+vant |			[present participle]
	3 		6+u |				[past participle]
	<fr-pleuvoir-tabulation>

<fr-pleuvoir-stem> ::=
	*	4						["pleuvoir" --> "pleu"]

<fr-pleuvoir-stem-shorter> ::=
	*	6						["pleuvoir" --> "pl"]

<fr-pleuvoir-tabulation> ::=
	a1+		<fr-pleuvoir-present> |
	a1-		ne-' <fr-pleuvoir-present> pas |
	a2+		<fr-pleuvoir-past> |
	a2-		ne-' <fr-pleuvoir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-pleuvoir-past-historic> |
	a6-		ne-' <fr-pleuvoir-past-historic> pas |
	p*		3+* par

<fr-pleuvoir-present> ::=
	5+s | 5+s | 5+t | 5+vons | 5+vez | 5+vent

<fr-pleuvoir-past> ::=
	5+vais | 5+vais | 5+vait | 5+vions | 5+viez | 5+vèrent

<fr-pleuvoir-past-historic> ::=
	6+us | 6+us | 6+ut | 6+ûmes | 6+ûtes | 6+urent

[-"Cevoir" verbs.]

<fr-cevoir-conjugation> ::=
	5 		<fr-cevoir-stem> |
	6 		5 |
	7 		5+r |				[i.e. form of stem to use with future]
	8 		5 |
	9		<fr-cevoir-shorter-stem> |
	2 		9+cevant |			[present participle]
	3 		9+çu |				[past participle]
	<fr-cevoir-tabulation>

<fr-cevoir-stem> ::=
	*		3					["recevoir" --> "recev"]

<fr-cevoir-shorter-stem> ::=
	*		6					["recevoir" --> "re"]

<fr-cevoir-tabulation> ::=
	a1+		<fr-cevoir-present> |
	a1-		ne-' <fr-cevoir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-cevoir-past-historic> |
	a6-		ne-' <fr-cevoir-past-historic> pas |
	p*		3+* par

<fr-cevoir-present> ::=
	9+çois | 9+çois | 9+çoit | 9+cevons | 9+cevez | 9+çoivent

<fr-cevoir-past-historic> ::=
	9+çus | 9+çus | 9+çut | 9+çûmes | 9+çûtes | 9+çurent

[Other -"evoir" verbs.]

<fr-evoir-conjugation> ::=
	5 		<fr-evoir-stem> |
	6 		5 |
	7 		5+r |				[i.e. form of stem to use with future]
	8 		5 |
	9		<fr-evoir-shorter-stem> |
	2 		9+evant |			[present participle]
	3 		<fr-evoir-past-participle> |	[past participle]
	<fr-evoir-tabulation>

<fr-evoir-stem> ::=
	*		3					["devoir" --> "dev"]

<fr-evoir-shorter-stem> ::=
	*		5					["devoir" --> "d"]

<fr-evoir-past-participle> ::=
	devoir	dû |				[i.e., irregularly add a circumflex]
	*		9+u

<fr-evoir-tabulation> ::=
	a1+		<fr-evoir-present> |
	a1-		ne-' <fr-evoir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-evoir-past-historic> |
	a6-		ne-' <fr-evoir-past-historic> pas |
	p*		3+* par

<fr-evoir-present> ::=
	9+ois | 9+ois | 9+oit | 9+evons | 9+evez | 9+oivent

<fr-evoir-past-historic> ::=
	9+us | 9+us | 9+ut | 9+ûmes | 9+ûtes | 9+urent

["Savoir".]

<fr-savoir-conjugation> ::=
	5 		sav |
	6 		5 |
	7 		saur |				[i.e. form of stem to use with future]
	8 		5 |
	2 		sachant |			[present participle]
	3 		su |				[past participle]
	<fr-savoir-tabulation>

<fr-savoir-tabulation> ::=
	a1+		<fr-savoir-present> |
	a1-		ne-' <fr-savoir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-savoir-past-historic> |
	a6-		ne-' <fr-savoir-past-historic> pas |
	p*		3+* par

<fr-savoir-present> ::=
	sais | sais | sait | savons | savez | savent

<fr-savoir-past-historic> ::=
	sus | sus | sut | sûmes | sûtes | surent

["Pourvoir".]

<fr-pourvoir-conjugation> ::=
	5 		<fr-pourvoir-stem> |
	6 		5 |
	7 		5+oir |				[i.e. form of stem to use with future]
	8 		5 |
	2 		5+oyant |			[present participle]
	3 		5+u |				[past participle]
	<fr-pourvoir-tabulation>

<fr-pourvoir-stem> ::=
	*	3							["pourvoir" --> "pourv"]

<fr-pourvoir-tabulation> ::=
	a1+		<fr-voir-present> |
	a1-		ne-' <fr-voir-present> pas |
	a2+		<fr-voir-past> |
	a2-		ne-' <fr-voir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-pourvoir-past-historic> |
	a6-		ne-' <fr-pourvoir-past-historic> pas |
	p*		3+* par

<fr-pourvoir-past-historic> ::=
	5+us | 5+us | 5+ut | 5+ûmes | 5+ûtes | 5+urent

["Falloir", a highly defective verb, used only in the third person singular.]

<fr-falloir-conjugation> ::=
	2 		fallant |			[present participle - never used, in this case]
	3 		fallu |				[past participle]
	<fr-falloir-tabulation>

<fr-falloir-tabulation> ::=
	a1+		<fr-falloir-present> |
	a1-		ne-' <fr-falloir-present> pas |
	a2+		<fr-falloir-past> |
	a2-		ne-' <fr-falloir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-falloir-future> |
	a5-		ne-' <fr-falloir-future> pas |
	a6+		<fr-falloir-past-historic> |
	a6-		ne-' <fr-falloir-past-historic> pas |
	p*		3+* par

<fr-falloir-present> ::=
	-- | -- | faut | -- | -- | --

<fr-falloir-past> ::=
	-- | -- | fallait | -- | -- | --

<fr-falloir-future> ::=
	-- | -- | faudra | -- | -- | --

<fr-falloir-past-historic> ::=
	-- | -- | fallut | -- | -- | --

["Voir" and its derivatives.]

<fr-voir-conjugation> ::=
	5 		<fr-voir-stem> |
	6 		5 |
	7 		5+err |				[i.e. form of stem to use with future]
	8 		5 |
	2 		5+oyant |			[present participle]
	3 		5+u |				[past participle]
	<fr-voir-tabulation>

<fr-voir-stem> ::=
	*		3					["voir" --> "v"]

<fr-voir-tabulation> ::=
	a1+		<fr-voir-present> |
	a1-		ne-' <fr-voir-present> pas |
	a2+		<fr-voir-past> |
	a2-		ne-' <fr-voir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-voir-past-historic> |
	a6-		ne-' <fr-voir-past-historic> pas |
	p*		3+* par

<fr-voir-present> ::=
	5+ois | 5+ois | 5+oit | 5+oyons | 5+oyez | 5+oient

<fr-voir-past> ::=
	5+oyais | 5+oyais | 5+oyait | 5+oyions | 5+oyiez | 5+oyaient

<fr-voir-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

["Valoir" and its derivatives.]

<fr-valoir-conjugation> ::=
	5 		<fr-valoir-stem> |
	6 		5 |
	7 		5+udr |				[i.e. form of stem to use with future]
	8 		5 |
	2 		5+lant |			[present participle]
	3 		5+lu |				[past participle]
	<fr-valoir-tabulation>

<fr-valoir-stem> ::=
	*		4					["valoir" --> "va"]

<fr-valoir-tabulation> ::=
	a1+		<fr-valoir-present> |
	a1-		ne-' <fr-valoir-present> pas |
	a2+		<fr-valoir-past> |
	a2-		ne-' <fr-valoir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-valoir-past-historic> |
	a6-		ne-' <fr-valoir-past-historic> pas |
	p*		3+* par

<fr-valoir-present> ::=
	5+ux | 5+ux | 5+ut | 5+lons | 5+lez | 5+lent

<fr-valoir-past> ::=
	5+lais | 5+lais | 5+lait | 5+lions | 5+liez | 5+laient

<fr-valoir-past-historic> ::=
	5+lus | 5+lus | 5+lut | 5+lûmes | 5+lûtes | 5+lurent

["Asseoir" and its derivatives. There are three conjugations in use, but two
of them are mostly obsolete now.]

<fr-asseoir-conjugation> ::=
	5 		<fr-asseoir-stem> |
	6 		5 |
	7 		5+iér |				[i.e. form of stem to use with future]
	8 		5 |
	2 		5+eyant |			[present participle]
	3 		5+is |				[past participle]
	<fr-asseoir-tabulation>

<fr-asseoir-stem> ::=
	*		4					["asseoir" --> "ass"]

<fr-asseoir-tabulation> ::=
	a1+		<fr-asseoir-present> |
	a1-		ne-' <fr-asseoir-present> pas |
	a2+		<fr-asseoir-past> |
	a2-		ne-' <fr-asseoir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-asseoir-past-historic> |
	a6-		ne-' <fr-asseoir-past-historic> pas |
	p*		3+* par

<fr-asseoir-present> ::=
	assieds | assieds | assied | asseyons | asseyez | asseyent

<fr-asseoir-past> ::=
	5+eyais | 5+eyais | 5+eyait | 5+eyions | 5+eyiez | 5+eyaient

<fr-asseoir-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

["Assoir": used for the "assois" spelling rather than "assieds".]

<fr-assoir-conjugation> ::=
	5 		<fr-assoir-stem> |
	6 		5 |
	7 		5+oir |				[i.e. form of stem to use with future]
	8 		5 |
	2 		5+eyant |			[present participle]
	3 		5+is |				[past participle]
	<fr-assoir-tabulation>

<fr-assoir-stem> ::=
	*		3					["asseoir" --> "ass"]

<fr-assoir-tabulation> ::=
	a1+		<fr-assoir-present> |
	a1-		ne-' <fr-assoir-present> pas |
	a2+		<fr-assoir-past> |
	a2-		ne-' <fr-assoir-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-assoir-past-historic> |
	a6-		ne-' <fr-assoir-past-historic> pas |
	p*		3+* par

<fr-assoir-present> ::=
	assois | assois | assoit | asseyons | asseyez | assoient

<fr-assoir-past> ::=
	5+eyais | 5+eyais | 5+eyait | 5+eyions | 5+eyiez | 5+eyaient

<fr-assoir-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

["Choir"]

<fr-choir-conjugation> ::=
	5 		choy |
	6 		5 |
	7 		choir |				[i.e. form of stem to use with future]
	8 		5 |
	2 		cheyant |			[present participle]
	3 		chu |				[past participle]
	<fr-choir-tabulation>


<fr-choir-tabulation> ::=
	a1+		<fr-choir-present> |
	a1-		ne-' <fr-choir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-choir-past-historic> |
	a6-		ne-' <fr-choir-past-historic> pas |
	p*		3+* par

<fr-choir-present> ::=
	chois | chois | choit | choyons | choyez | choient

<fr-choir-past-historic> ::=
	chus | chus | chut | chûmes | chûtes | churent

["Déchoir", not a verb common verb: to wane.]

<fr-dechoir-conjugation> ::=
	5 		déchoy |
	6 		5 |
	7 		déchoir |				[i.e. form of stem to use with future]
	8 		5 |
	2 		déchéant |			[present participle]
	3 		déchu |				[past participle]
	<fr-dechoir-tabulation>

<fr-dechoir-tabulation> ::=
	a1+		<fr-dechoir-present> |
	a1-		ne-' <fr-dechoir-present> pas |
	a2+		<fr-first-past> |
	a2-		ne-' <fr-first-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-dechoir-past-historic> |
	a6-		ne-' <fr-dechoir-past-historic> pas |
	p*		3+* par

<fr-dechoir-present> ::=
	déchois | déchois | déchoit | déchoyons | déchoyez | déchoient

<fr-dechoir-past-historic> ::=
	déchus | déchus | déchut | déchûmes | déchûtes | déchurent

[Regular -RE verbs.]

<fr-third-with-avoir-conjugation> ::=
	5 <fr-third-stem> |			[slot 5 we use for the stem of the verb]
	6 <fr-third-stem-future> |	[and slot 6 we use for the future stem]
	2 5+ant |				[present participle: stem + -ant, e.g., vendant]
	3 5+u |					[past participle: stem + -u, e.g., vendu]
	<fr-third-with-avoir-tabulation>

<fr-third-with-etre-conjugation> ::=
	5 <fr-third-stem> |			[slot 5 we use for the stem of the verb]
	6 <fr-third-stem-future> |	[and slot 6 we use for the future stem]
	2 5+ant |				[present participle: stem + -ant, e.g., vendant]
	3 5+u |					[past participle: stem + -u, e.g., vendu]
	<fr-third-with-etre-tabulation>

<fr-third-stem> ::=			[this is not much of a trie:]
	*	2					[in all cases drop the last two letters: vendre -> vend]

<fr-third-stem-future> ::=	[this is not much of a trie:]
	*	1					[in all cases drop the last letter: vendre -> vendr]

<fr-third-with-avoir-tabulation> ::=
	a1+		<fr-third-present> |
	a1-		ne-' <fr-third-present> pas |
	a2+		<fr-third-past> |
	a2-		ne-' <fr-third-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-third-future> |
	a5-		ne-' <fr-third-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

<fr-third-with-etre-tabulation> ::=
	a1+		<fr-third-present> |
	a1-		ne-' <fr-third-present> pas |
	a2+		<fr-third-past> |
	a2-		ne-' <fr-third-past> pas |
	a3		( t1 être ) 3+* |
	a4		( t2 être ) 3+* |
	a5+		<fr-third-future> |
	a5-		ne-' <fr-third-future> pas |
	a6+		<fr-second-past-historic> |
	a6-		ne-' <fr-second-past-historic> pas |
	p*		3+* par

<fr-third-present> ::=
	5+s | 5+s | 5 | 5+ons | 5+ez | 5+ent

<fr-third-past> ::=
	5+ais |	5+ais | 5+ait | 5+ions | 5+iez | 5+aient

<fr-third-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

<fr-third-future> ::=
	6+ai | 6+as | 6+a | 6+ons | 6+ez | 6+ont

["Battre" and its derivatives]

<fr-battre-conjugation> ::=
	5 		<fr-battre-stem> |
	6 		5 |
	7 		5+tr |			[i.e. form of stem to use with future]
	8 		5 |
	2 		5+tant |			[present participle]
	3 		5+tu |				[past participle]
	<fr-battre-tabulation>

<fr-battre-stem> ::=
	*		3					["battre" --> "bat"]

<fr-battre-tabulation> ::=
	a1+		<fr-battre-present> |
	a1-		ne-' <fr-battre-present> pas |
	a2+		<fr-battre-past> |
	a2-		ne-' <fr-battre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-battre-past-historic> |
	a6-		ne-' <fr-battre-past-historic> pas |
	p*		3+* par

<fr-battre-present> ::=
	5+s | 5+s | 5 | 5+tons | 5+tez | 5+tent

<fr-battre-past> ::=
	5+tais | 5+tais | 5+tait | 5+tions | 5+tiez | 5+taient

<fr-battre-past-historic> ::=
	5+tis | 5+tis | 5+tit | 5+tîmes | 5+tîtent | 5+tirent

[-indre verbs, such as "craindre", "peindre", "joindre".]

<fr-indre-conjugation> ::=
	5 		<fr-indre-stem> |
	6 		5 |
	7 		5+indr |			[i.e. form of stem to use with future]
	8 		5 |
	2 		5+ignant |			[present participle]
	3 		5+int |				[past participle]
	<fr-indre-tabulation>

<fr-indre-stem> ::=
	*		5					["craindre" --> "cra"]

<fr-indre-tabulation> ::=
	a1+		<fr-indre-present> |
	a1-		ne-' <fr-indre-present> pas |
	a2+		<fr-indre-past> |
	a2-		ne-' <fr-indre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-indre-past-historic> |
	a6-		ne-' <fr-indre-past-historic> pas |
	p*		3+* par

<fr-indre-present> ::=
	5+ins | 5+ins | 5+int | 5+ignons | 5+ignez | 5+ignent

<fr-indre-past> ::=
	5+ignais | 5+ignais | 5+ignait | 5+ignions | 5+igniez | 5+ignaient

<fr-indre-past-historic> ::=
	5+ignis | 5+ignis | 5+ignit | 5+ignîmes | 5+ignîtes | 5+ignirent

[-soudre verbs, such as "dissoudre".]

<fr-soudre-conjugation> ::=
	5 		<fr-soudre-stem> |
	7 		5+udr |			[i.e. form of stem to use with future]
	2 		5+lvant |			[present participle]
	3 		<fr-soudre-past-participle> |		[past participle]
	<fr-soudre-tabulation>

<fr-soudre-stem> ::=
	*		4					["dissoudre" --> "disso"]

<fr-soudre-past-participle> ::=
	<fr-soudre-past-participle-exceptions> |
	... <fr-soudre-past-participle-default>

<fr-soudre-past-participle-exceptions> ::=
	résoudre		résolu

<fr-soudre-past-participle-default> ::=
	*		4us

<fr-soudre-tabulation> ::=
	a1+		<fr-soudre-present> |
	a1-		ne-' <fr-soudre-present> pas |
	a2+		<fr-soudre-past> |
	a2-		ne-' <fr-soudre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-soudre-past-historic> |
	a6-		ne-' <fr-soudre-past-historic> pas |
	p*		3+* par

<fr-soudre-present> ::=
	5+us | 5+us | 5+ut | 5+lvons | 5+lvez | 5+lvent

<fr-soudre-past> ::=
	5+lvais | 5+lvais | 5+lvait | 5+lvions | 5+lviez | 5+lvaient

<fr-soudre-past-historic> ::=
	5+lus | 5+lus | 5+lut | 5+lûmes | 5+lûtes | 5+lurent

["Prendre" and its derivatives.]

<fr-prendre-conjugation> ::=
	5 		<fr-prendre-stem> |
	7 		5+endr |			[i.e. form of stem to use with future]
	2 		5+enant |			[present participle]
	3 		5+is |				[past participle]
	<fr-prendre-tabulation>

<fr-prendre-stem> ::=
	*		5					["prendre" --> "pr"]

<fr-prendre-tabulation> ::=
	a1+		<fr-prendre-present> |
	a1-		ne-' <fr-prendre-present> pas |
	a2+		<fr-prendre-past> |
	a2-		ne-' <fr-prendre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-prendre-past-historic> |
	a6-		ne-' <fr-prendre-past-historic> pas |
	p*		3+* par

<fr-prendre-present> ::=
	5+ends | 5+ends | 5+end | 5+enons | 5+enez | 5+ennent

<fr-prendre-past> ::=
	5+enais | 5+enais | 5+enait | 5+enions | 5+eniez | 5+enaient

<fr-prendre-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

["Mettre" and its derivatives.]

<fr-mettre-conjugation> ::=
	5 		<fr-mettre-stem> |
	7 		5+ettr |			[i.e. form of stem to use with future]
	2 		5+ettant |			[present participle]
	3 		5+is |				[past participle]
	<fr-mettre-tabulation>

<fr-mettre-stem> ::=
	*		5					["mettre" --> "m"]

<fr-mettre-tabulation> ::=
	a1+		<fr-mettre-present> |
	a1-		ne-' <fr-mettre-present> pas |
	a2+		<fr-mettre-past> |
	a2-		ne-' <fr-mettre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-mettre-past-historic> |
	a6-		ne-' <fr-mettre-past-historic> pas |
	p*		3+* par

<fr-mettre-present> ::=
	5+ets | 5+ets | 5+et | 5+ettons | 5+ettez | 5+ettent

<fr-mettre-past> ::=
	5+ettais | 5+ettais | 5+ettait | 5+ettions | 5+ettiez | 5+ettaient

<fr-mettre-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

["Coudre" and its derivatives.]

<fr-coudre-conjugation> ::=
	5 		<fr-coudre-stem> |
	7 		5+dr |				[i.e. form of stem to use with future]
	2 		5+sant |			[present participle]
	3 		5+su |				[past participle]
	<fr-coudre-tabulation>

<fr-coudre-stem> ::=
	*		3					["coudre" --> "cou"]

<fr-coudre-tabulation> ::=
	a1+		<fr-coudre-present> |
	a1-		ne-' <fr-coudre-present> pas |
	a2+		<fr-coudre-past> |
	a2-		ne-' <fr-coudre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-coudre-past-historic> |
	a6-		ne-' <fr-coudre-past-historic> pas |
	p*		3+* par

<fr-coudre-present> ::=
	5+ds | 5+ds | 5+d | 5+sons | 5+sez | 5+sent

<fr-coudre-past> ::=
	5+sais | 5+sais | 5+sait | 5+sions | 5+siez | 5+saient

<fr-coudre-past-historic> ::=
	5+sis | 5+sis | 5+sit | 5+sîmes | 5+sîtes | 5+sirent

["Moudre" and its derivatives.]

<fr-moudre-conjugation> ::=
	5 		<fr-moudre-stem> |
	7 		5+dr |				[i.e. form of stem to use with future]
	2 		5+lant |			[present participle]
	3 		5+lu |				[past participle]
	<fr-moudre-tabulation>

<fr-moudre-stem> ::=
	*		3					["moudre" --> "mou"]

<fr-moudre-tabulation> ::=
	a1+		<fr-moudre-present> |
	a1-		ne-' <fr-moudre-present> pas |
	a2+		<fr-moudre-past> |
	a2-		ne-' <fr-moudre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-moudre-past-historic> |
	a6-		ne-' <fr-moudre-past-historic> pas |
	p*		3+* par

<fr-moudre-present> ::=
	5+ds | 5+ds | 5+d | 5+lons | 5+lez | 5+lent

<fr-moudre-past> ::=
	5+lais | 5+lais | 5+lait | 5+lions | 5+liez | 5+laient

<fr-moudre-past-historic> ::=
	5+lus | 5+lus | 5+lut | 5+lûmes | 5+lûtes | 5+lurent

["Vaincre" and "convaincre", which converts to a "q" in past and past historic tenses.]

<fr-vaincre-conjugation> ::=
	5		<fr-vaincre-stem> |
	7 		5+cr |				[i.e. form of stem to use with future]
	2 		5+quant |				[present participle]
	3 		5+cu |				[past participle]
	<fr-vaincre-tabulation>

<fr-vaincre-stem> ::=
	*	3							["vaincre" --> "vain"]

<fr-vaincre-tabulation> ::=
	a1+		<fr-vaincre-present> |
	a1-		ne-' <fr-vaincre-present> pas |
	a2+		<fr-vaincre-past> |
	a2-		ne-' <fr-vaincre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-vaincre-past-historic> |
	a6-		ne-' <fr-vaincre-past-historic> pas |
	p*		3+* par

<fr-vaincre-present> ::=
	5+cs | 5+cs | 5+c | 5+quons | 5+quez | 5+quent

<fr-vaincre-past> ::=
	5+quais | 5+quais | 5+quait | 5+quions | 5+quiez | 5+quaient

<fr-vaincre-past-historic> ::=
	5+quis | 5+quis | 5+quit | 5+quîmes | 5+quîtes | 5+quirent

["Rompre", "corrompre" and "interrompre".]

<fr-rompre-conjugation> ::=
	5		<fr-rompre-stem> |
	7 		5+r |				[i.e. form of stem to use with future]
	2 		5+ant |				[present participle]
	3 		5+u |				[past participle]
	<fr-rompre-tabulation>

<fr-rompre-stem> ::=
	*	2							["rompre" --> "romp"]

<fr-rompre-tabulation> ::=
	a1+		<fr-rompre-present> |
	a1-		ne-' <fr-rompre-present> pas |
	a2+		<fr-third-past> |
	a2-		ne-' <fr-third-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-third-past-historic> |
	a6-		ne-' <fr-third-past-historic> pas |
	p*		3+* par

<fr-rompre-present> ::=
	5+s | 5+s | 5+t | 5+ons | 5+ez | 5+ent

["Suivre" and its derivatives.]

<fr-suivre-conjugation> ::=
	5 		<fr-suivre-stem> |
	7 		5+vr |				[i.e. form of stem to use with future]
	2 		5+vant |			[present participle]
	3 		5+vi |				[past participle]
	<fr-suivre-tabulation>

<fr-suivre-stem> ::=
	*		3					["suivre" --> "sui"]

<fr-suivre-tabulation> ::=
	a1+		<fr-suivre-present> |
	a1-		ne-' <fr-suivre-present> pas |
	a2+		<fr-suivre-past> |
	a2-		ne-' <fr-suivre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-suivre-past-historic> |
	a6-		ne-' <fr-suivre-past-historic> pas |
	p*		3+* par

<fr-suivre-present> ::=
	5+s | 5+s | 5+t | 5+vons | 5+vez | 5+vent

<fr-suivre-past> ::=
	5+vais | 5+vais | 5+vait | 5+vions | 5+viez | 5+vaient

<fr-suivre-past-historic> ::=
	5+vis | 5+vis | 5+vit | 5+vîmes | 5+vîtes | 5+virent

["Vivre", "survivre" and "revivre".]

<fr-vivre-conjugation> ::=
	5		<fr-vivre-stem> |
	6		<fr-vivre-stem-shorter> |
	7 		5+r |				[i.e. form of stem to use with future]
	2 		5+ant |			[present participle]
	3 		6+écu |				[past participle]
	<fr-vivre-tabulation>

<fr-vivre-stem> ::=
	* 2							["vivre" --> "viv"]

<fr-vivre-stem-shorter> ::=
	* 4							["vivre" --> "v"]

<fr-vivre-tabulation> ::=
	a1+		<fr-vivre-present> |
	a1-		ne-' <fr-vivre-present> pas |
	a2+		<fr-vivre-past> |
	a2-		ne-' <fr-vivre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-vivre-past-historic> |
	a6-		ne-' <fr-vivre-past-historic> pas |
	p*		3+* par

<fr-vivre-present> ::=
	6+is | 6+is | 6+it | 5+ons | 5+ez | 5+ent

<fr-vivre-past> ::=
	5+ais | 5+ais | 5+ait | 5+ions | 5+iez | 5+aient

<fr-vivre-past-historic> ::=
	6+écus | 6+écus | 6+écut | 6+écûmes | 6+écûtes | 6+écurent

["Naître" and "renaître".]

<fr-naitre-conjugation> ::=
	5		<fr-naitre-stem> |
	7 		5+îtr |				[i.e. form of stem to use with future]
	2 		5+issant |			[present participle]
	3 		<fr-naitre-past-participle> |				[past participle]
	<fr-naitre-tabulation>

<fr-naitre-stem> ::=
	*	4						["naître" --> "na"]

<fr-naitre-past-participle> ::=
	*	5é						["né"]

<fr-naitre-tabulation> ::=
	a1+		<fr-naitre-present> |
	a1-		ne-' <fr-naitre-present> pas |
	a2+		<fr-naitre-past> |
	a2-		ne-' <fr-naitre-past> pas |
	a3		( t1 être ) 3 |
	a4		( t2 être ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-naitre-past-historic> |
	a6-		ne-' <fr-naitre-past-historic> pas |
	p*		3+* par

<fr-naitre-present> ::=
	5+is | 5+is | 5+ît | 5+issons | 5+issez | 5+issent

<fr-naitre-past> ::=
	5+issais | 5+issais | 5+issait | 5+issions | 5+issiez | 5+issaient

<fr-naitre-past-historic> ::=
	5+quis | 5+quis | 5+quit | 5+quîmes | 5+quîtes | 5+quirent

["-aître" verbs, other than "naître". Note the way circumflexes mostly vanish.]

<fr-aitre-conjugation> ::=
	5		<fr-aitre-stem> |
	7 		5+aîtr |			[i.e. form of stem to use with future]
	2 		5+aissant |			[present participle]
	3 		5+u |				[past participle]
	<fr-aitre-tabulation>

<fr-aitre-stem> ::=
	*		5					["connaître" to "conn"]

<fr-aitre-tabulation> ::=
	a1+		<fr-aitre-present> |
	a1-		ne-' <fr-aitre-present> pas |
	a2+		<fr-aitre-past> |
	a2-		ne-' <fr-aitre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-aitre-past-historic> |
	a6-		ne-' <fr-aitre-past-historic> pas |
	p*		3+* par

<fr-aitre-present> ::=
	5+ais | 5+ais | 5+aît | 5+aissons | 5+aissez | 5+aissent

<fr-aitre-past> ::=
	5+aissais | 5+aissais | 5+aissait | 5+aissions | 5+aissiez | 5+aissaient

<fr-aitre-past-historic> ::=
	5+us | 5+us | 5+ut | 5+ûmes | 5+ûtes | 5+urent

["Croître" and its derivatives.]

<fr-croitre-conjugation> ::=
	5		<fr-croitre-stem> |
	7 		5+oîtr |			[i.e. form of stem to use with future]
	2 		5+oissant |			[present participle]
	3 		5+û |				[past participle]
	<fr-croitre-tabulation>

<fr-croitre-stem> ::=
	*		5					["croître" to "cr"]

<fr-croitre-tabulation> ::=
	a1+		<fr-croitre-present> |
	a1-		ne-' <fr-croitre-present> pas |
	a2+		<fr-croitre-past> |
	a2-		ne-' <fr-croitre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-croitre-past-historic> |
	a6-		ne-' <fr-croitre-past-historic> pas |
	p*		3+* par

<fr-croitre-present> ::=
	5+ois | 5+ois | 5+oît | 5+oissons | 5+oissez | 5+oissent

<fr-croitre-past> ::=
	5+oissais | 5+oissais | 5+oissait | 5+oissions | 5+oissiez | 5+oissaient

<fr-croitre-past-historic> ::=
	5+ûs | 5+ûs | 5+ût | 5+ûmes | 5+ûtes | 5+ûrent

["Croître" derivatives dropping the circumflex on past participle.]

<fr-other-croitre-conjugation> ::=
	5		<fr-croitre-stem> |
	7 		5+oîtr |			[i.e. form of stem to use with future]
	2 		5+oissant |			[present participle]
	3 		5+u |				[past participle]
	<fr-croitre-tabulation>

<fr-accroitre-conjugation> ::=
	5		<fr-croitre-stem> |
	7 		5+oîtr |			[i.e. form of stem to use with future]
	2 		5+oissant |			[present participle]
	3 		5+u |				[past participle]
	<fr-accroitre-tabulation>

<fr-accroitre-tabulation> ::=
	a1+		<fr-accroitre-present> |
	a1-		ne-' <fr-accroitre-present> pas |
	a2+		<fr-accroitre-past> |
	a2-		ne-' <fr-accroitre-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-accroitre-past-historic> |
	a6-		ne-' <fr-accroitre-past-historic> pas |
	p*		3+* par

<fr-accroitre-present> ::=
	5+ois | 5+ois | 5+oît | 5+oissons | 5+oissez | 5+oissent

<fr-accroitre-past> ::=
	5+oissais | 5+oissais | 5+oissait | 5+oissions | 5+oissiez | 5+oissaient

<fr-accroitre-past-historic> ::=
	5+us | 5+us | 5+ut | 5+ûmes | 5+ûtes | 5+urent

["Conduire", "nuire" and so on.]

<fr-uire-conjugation> ::=
	5		<fr-uire-stem> |
	7 		5+ir |							[i.e. form of stem to use with future]
	2 		5+isant |						[present participle]
	3 		<fr-uire-past-participle> |		[past participle]
	<fr-uire-tabulation>

<fr-uire-stem> ::=
	*		3								["nuire" --> "nu"]

<fr-uire-past-participle> ::=
	<fr-uire-past-participle-exceptions> |
	... <fr-uire-past-participle-default>

<fr-uire-past-participle-exceptions> ::=
	nuire	nui |
	luire	lui	|
	reluire	relui |

<fr-uire-past-participle-default> ::=
	*		2t								[otherwise add "t"]

<fr-uire-tabulation> ::=
	a1+		<fr-uire-present> |
	a1-		ne-' <fr-uire-present> pas |
	a2+		<fr-uire-past> |
	a2-		ne-' <fr-uire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-uire-past-historic> |
	a6-		ne-' <fr-uire-past-historic> pas |
	p*		3+* par

<fr-uire-present> ::=
	5+is | 5+is | 5+it | 5+isons | 5+isez | 5+isent

<fr-uire-past> ::=
	5+isais | 5+isais | 5+isait | 5+isions | 5+isiez | 5+isaient

<fr-uire-past-historic> ::=
	5+isis | 5+isis | 5+isit | 5+isîmes | 5+isîtes | 5+isirent

["Bruire", witch does not conjugate like other "-uire" verbs.]

<fr-bruire-conjugation> ::=
	5		<fr-bruire-stem> |
	7 		5+ir |							[i.e. form of stem to use with future]
	2 		5+issant |						[present participle]
	3 		brui |							[past participle]
	<fr-bruire-tabulation>

<fr-bruire-stem> ::=
	*		3								["bruire" --> "bru"]

<fr-bruire-tabulation> ::=
	a1+		<fr-bruire-present> |
	a1-		ne-' <fr-bruire-present> pas |
	a2+		<fr-bruire-past> |
	a2-		ne-' <fr-bruire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-bruire-past-historic> |
	a6-		ne-' <fr-bruire-past-historic> pas |
	p*		3+* par

<fr-bruire-present> ::=
	5+is | 5+is | 5+it | 5+issons | 5+issez | 5+issent

<fr-bruire-past> ::=
	5+issais | 5+issais | 5+issait | 5+issions | 5+issiez | 5+issaient

<fr-bruire-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

["Conclure", "inclure" and so on.]

<fr-ure-conjugation> ::=
	5		<fr-ure-stem> |
	6		<fr-ure-shorter-stem> |
	7 		5+r |							[i.e. form of stem to use with future]
	2 		5+isant |						[present participle]
	3 		<fr-ure-past-participle> |		[past participle]
	<fr-ure-tabulation>

<fr-ure-stem> ::=
	*		2								["conclure" --> "conclu"]

<fr-ure-shorter-stem> ::=
	*		3								["conclure" --> "concl"]

<fr-ure-past-participle> ::=
	<fr-ure-past-participle-exceptions> |
	... <fr-ure-past-participle-default>

<fr-ure-past-participle-exceptions> ::=
	inclure		inclus |
	perclure	perclus	|
	oclure		oclus	|
	reclure		reclus

<fr-ure-past-participle-default> ::=
	*			2							[otherwise remove "re"]

<fr-ure-tabulation> ::=
	a1+		<fr-ure-present> |
	a1-		ne-' <fr-ure-present> pas |
	a2+		<fr-ure-past> |
	a2-		ne-' <fr-ure-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-ure-past-historic> |
	a6-		ne-' <fr-ure-past-historic> pas |
	p*		3+* par

<fr-ure-present> ::=
	5+s | 5+s | 5+t | 5+ons | 5+ez | 5+ent

<fr-ure-past> ::=
	5+ais | 5+ais | 5+ait | 5+ions | 5+iez | 5+aient

<fr-ure-past-historic> ::=
	6+us | 6+us | 6+ut | 6+ûmes | 6+ûtes | 6+urent

["Croire".]

<fr-croire-conjugation> ::=
	7 		croir |				[i.e. form of stem to use with future]
	2 		croyant |			[present participle]
	3 		cru |				[past participle]
	<fr-croire-tabulation>

<fr-croire-tabulation> ::=
	a1+		<fr-croire-present> |
	a1-		ne-' <fr-croire-present> pas |
	a2+		<fr-croire-past> |
	a2-		ne-' <fr-croire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-croire-past-historic> |
	a6-		ne-' <fr-croire-past-historic> pas |
	p*		3+* par

<fr-croire-present> ::=
	crois | crois | croit | croyons | croyez | croient

<fr-croire-past> ::=
	croyais | croyais | croyait | croyions | croyiez | croyaient

<fr-croire-past-historic> ::=
	crus | crus | crut | crûmes | crûtes | crurent

["Boire" and its derivatives.]

<fr-boire-conjugation> ::=
	5		<fr-boire-stem> |
	6		<fr-boire-stem-shorter> |
	7 		5+r |				[i.e. form of stem to use with future]
	2 		6+uvant |			[present participle]
	3 		6+u |				[past participle]
	<fr-boire-tabulation>

<fr-boire-stem> ::=
	*	2						["boire" --> "boi"]

<fr-boire-stem-shorter> ::=
	*	4						["boire" --> "b"]

<fr-boire-tabulation> ::=
	a1+		<fr-boire-present> |
	a1-		ne-' <fr-boire-present> pas |
	a2+		<fr-boire-past> |
	a2-		ne-' <fr-boire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-boire-past-historic> |
	a6-		ne-' <fr-boire-past-historic> pas |
	p*		3+* par

<fr-boire-present> ::=
	5+s | 5+s | 5+t | 6+uvons | 6+uvez | 5+vent

<fr-boire-past> ::=
	6+uvais | 6+uvais | 6+uvait | 6+uvions | 6+uviez | 6+uvaient

<fr-boire-past-historic> ::=
	6+us | 6+us | 6+ut | 6+ûmes | 6+ûtes | 6+urent

["Faire" and its derivatives.]

<fr-faire-conjugation> ::=
	5		<fr-faire-stem> |
	6		<fr-faire-stem-shorter> |
	7 		6+er |		[i.e. form of stem to use with future]
	2 		5+sant |			[present participle]
	3 		5+t |				[past participle]
	<fr-faire-tabulation>

<fr-faire-stem> ::=
	*	2						["faire" --> "fai"]

<fr-faire-stem-shorter> ::=
	*	4						["faire" --> "f"]

<fr-faire-tabulation> ::=
	a1+		<fr-faire-present> |
	a1-		ne-' <fr-faire-present> pas |
	a2+		<fr-faire-past> |
	a2-		ne-' <fr-faire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-faire-past-historic> |
	a6-		ne-' <fr-faire-past-historic> pas |
	p*		3+* par

<fr-faire-present> ::=
	5+s | 5+s | 5+t | 5+sons | 5+tes | 6+ont

<fr-faire-past> ::=
	5+sais | 5+sais | 5+sait | 5+sions | 5+siez | 5+saient

<fr-faire-past-historic> ::=
	6+is | 6+is | 6+it | 6+îmes | 6+îtes | 6+irent

["Traire", "distraire", and so on, using the traditional conjugation. They're
defective in lacking a past historic.]

<fr-traire-conjugation> ::=
	5		<fr-traire-stem> |
	7 		5+ir |				[i.e. form of stem to use with future]
	2 		5+yant |			[present participle]
	3 		5+it |				[past participle]
	<fr-traire-tabulation>

<fr-traire-stem> ::=
	*		3					["traire" to "tra"]

<fr-traire-tabulation> ::=
	a1+		<fr-traire-present> |
	a1-		ne-' <fr-traire-present> pas |
	a2+		<fr-traire-past> |
	a2-		ne-' <fr-traire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	p*		3+* par

<fr-traire-present> ::=
	5+is | 5+is | 5+it | 5+yons | 5+yez | 5+ient

<fr-traire-past> ::=
	5+yais | 5+yais | 5+yait | 5+yions | 5+yiez | 5+yaient

["Plaire", "taire", and so on. I've decided to be daringly modern and use
"il plait", not "il plaît".]

<fr-aire-conjugation> ::=
	5		<fr-aire-stem> |
	7 		5+air |			[i.e. form of stem to use with future]
	2 		5+aisant |			[present participle]
	3 		5+u |				[past participle]
	<fr-aire-tabulation>

<fr-aire-stem> ::=
	*		4					["plaire" to "pl"]

<fr-aire-tabulation> ::=
	a1+		<fr-aire-present> |
	a1-		ne-' <fr-aire-present> pas |
	a2+		<fr-aire-past> |
	a2-		ne-' <fr-aire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-aire-past-historic> |
	a6-		ne-' <fr-aire-past-historic> pas |
	p*		3+* par

<fr-aire-present> ::=
	5+ais | 5+ais | 5+ait | 5+aisons | 5+aisez | 5+aisent

<fr-aire-past> ::=
	5+aisais | 5+aisais | 5+aisait | 5+aisions | 5+aisiez | 5+aisaient

<fr-aire-past-historic> ::=
	5+us | 5+us | 5+ut | 5+ûmes | 5+ûtes | 5+urent

["Éclore" and other such -clore verbs.]

<fr-clore-conjugation> ::=
	5		<fr-clore-stem> |
	6		<fr-clore-stem-shorter> |
	7 		5+r |				[i.e. form of stem to use with future]
	2 		5+sant |			[present participle]
	3 		5+s |				[past participle]
	<fr-clore-tabulation>

<fr-clore-stem> ::=
	*		2					["éclore" to "éclo"]

<fr-clore-stem-shorter> ::=
	*		3					["écl"]

<fr-clore-tabulation> ::=
	a1+		<fr-clore-present> |
	a1-		ne-' <fr-clore-present> pas |
	a2+		<fr-clore-past> |
	a2-		ne-' <fr-clore-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-clore-past-historic> |
	a6-		ne-' <fr-clore-past-historic> pas |
	p*		3+* par

<fr-clore-present> ::=
	5+s | 5+s | 6+ôt | 5+sons | 5+sez | 5+sent

<fr-clore-past> ::=
	5+sais | 5+sais | 5+sait | 5+sions | 5+siez | 5+saient

<fr-clore-past-historic> ::=
	5+sis | 5+sis | 5+sit | 5+sîmes | 5+sîtes | 5+sirent

["Dire".]

<fr-dire-conjugation> ::=
	5		<fr-dire-stem> |
	7 		5+ir |				[i.e. form of stem to use with future]
	2 		5+isant |			[present participle]
	3 		5+it |				[past participle]
	<fr-dire-tabulation>

<fr-dire-stem> ::=
	*		3					["d"]

<fr-dire-tabulation> ::=
	a1+		<fr-dire-present> |
	a1-		ne-' <fr-dire-present> pas |
	a2+		<fr-dire-past> |
	a2-		ne-' <fr-dire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-dire-past-historic> |
	a6-		ne-' <fr-dire-past-historic> pas |
	p*		3+* par

<fr-dire-present> ::=
	5+is | 5+is | 5+it | 5+isons | 5+ites | 5+isent

<fr-dire-past> ::=
	5+isais | 5+isais | 5+isait | 5+isions | 5+isiez | 5+isaient

<fr-dire-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

[Other "-dire" verbs, which are differrent in the second person plural present: "-disez" instead of "dites".]

<fr-regular-dire-conjugation> ::=
	5		<fr-regular-dire-stem> |
	6		<fr-regular-dire-stem-shorter> |
	7 		6+ir |				[i.e. form of stem to use with future]
	2 		5+sant |			[present participle]
	3 		6+it |				[past participle]
	<fr-regular-dire-tabulation>

<fr-regular-dire-stem> ::=
	<fr-regular-dire-stem-exceptions> |
		... <fr-regular-dire-stem-default>

<fr-regular-dire-stem-exceptions> ::=
	maudire	maudis

<fr-regular-dire-stem-default> ::=
	*	2						["di"]

<fr-regular-dire-stem-shorter> ::=
	*		3					["d"]


<fr-regular-dire-tabulation> ::=
	a1+		<fr-regular-dire-present> |
	a1-		ne-' <fr-regular-dire-present> pas |
	a2+		<fr-regular-dire-past> |
	a2-		ne-' <fr-regular-dire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-regular-dire-past-historic> |
	a6-		ne-' <fr-regular-dire-past-historic> pas |
	p*		3+* par

<fr-regular-dire-present> ::=
	6+is | 6+is | 6+it | 5+sons | 5+sez | 5+sent

<fr-regular-dire-past> ::=
	5+sais | 5+sais | 5+sait | 5+sions | 5+siez | 5+saient

<fr-regular-dire-past-historic> ::=
	6+is | 6+is | 6+it | 6+îmes | 6+îtes | 6+irent

["Confire", really.]

<fr-fire-conjugation> ::=
	5		<fr-fire-stem> |
	7 		5+ir |				[i.e. form of stem to use with future]
	2 		5+isant |			[present participle]
	3 		<fr-fire-past-participle> |				[past participle]
	<fr-fire-tabulation>

<fr-fire-stem> ::=
	*		3					["confire" to "conf"]

<fr-fire-past-participle> ::=
	<fr-fire-past-participle-exceptions> |
	... <fr-fire-past-participle-default>

<fr-fire-past-participle-exceptions> ::=
	suffire		suffi

<fr-fire-past-participle-default> ::=
	*		2t

<fr-fire-tabulation> ::=
	a1+		<fr-fire-present> |
	a1-		ne-' <fr-fire-present> pas |
	a2+		<fr-fire-past> |
	a2-		ne-' <fr-fire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-fire-past-historic> |
	a6-		ne-' <fr-fire-past-historic> pas |
	p*		3+* par

<fr-fire-present> ::=
	5+is | 5+is | 5+it | 5+isons | 5+isez | 5+isent

<fr-fire-past> ::=
	5+isais | 5+isais | 5+isait | 5+isions | 5+isiez | 5+isaient

<fr-fire-past-historic> ::=
	5+is | 5+is | 5+it | 5+îmes | 5+îtes | 5+irent

["Écrire" and similar.]

<fr-crire-conjugation> ::=
	5		<fr-crire-stem> |
	6		<fr-crire-stem-shorter> |
	7 		5+r |				[i.e. form of stem to use with future]
	2 		5+vant |			[present participle]
	3 		5+t |				[past participle]
	<fr-crire-tabulation>

<fr-crire-stem> ::=
	*		2					["écrire" to "écri"]

<fr-crire-tabulation> ::=
	a1+		<fr-crire-present> |
	a1-		ne-' <fr-crire-present> pas |
	a2+		<fr-crire-past> |
	a2-		ne-' <fr-crire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-crire-past-historic> |
	a6-		ne-' <fr-crire-past-historic> pas |
	p*		3+* par

<fr-crire-present> ::=
	5+s | 5+s | 5+t | 5+vons | 5+vez | 5+vent

<fr-crire-past> ::=
	5+vais | 5+vais | 5+vait | 5+vions | 5+viez | 5+vaient

<fr-crire-past-historic> ::=
	5+vus | 5+vus | 5+vut | 5+vûmes | 5+vûtes | 5+vurent

["Lire" and compounds; note the past participle, "lu".]

<fr-lire-conjugation> ::=
	5		<fr-lire-stem> |
	6		<fr-lire-stem-shorter> |
	7 		5+r |				[i.e. form of stem to use with future]
	2 		5+sant |			[present participle]
	3 		6+u |				[past participle]
	<fr-lire-tabulation>

<fr-lire-stem> ::=
	*		2					["lire" to "li"]

<fr-lire-stem-shorter> ::=
	*		3					["l"]

<fr-lire-tabulation> ::=
	a1+		<fr-lire-present> |
	a1-		ne-' <fr-lire-present> pas |
	a2+		<fr-lire-past> |
	a2-		ne-' <fr-lire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-lire-past-historic> |
	a6-		ne-' <fr-lire-past-historic> pas |
	p*		3+* par

<fr-lire-present> ::=
	5+s | 5+s | 5+t | 5+sons | 5+sez | 5+sent

<fr-lire-past> ::=
	5+sais | 5+sais | 5+sait | 5+sions | 5+siez | 5+saient

<fr-lire-past-historic> ::=
	6+us | 6+us | 6+ut | 6+ûmes | 6+ûtes | 6+urent

[And last of all: "rire" and "sourire".]

<fr-rire-conjugation> ::=
	5		<fr-rire-stem> |
	6		<fr-rire-stem-shorter> |
	7 		5+r |				[i.e. form of stem to use with future]
	2 		5+ant |				[present participle]
	3 		<fr-rire-past-participle> |					[past participle]
	<fr-rire-tabulation>

<fr-rire-stem> ::=
	*		2					["rire" to "ri"]

<fr-rire-stem-shorter> ::=
	*		3					["r"]

<fr-rire-past-participle> ::=
	<fr-rire-past-participle-exceptions> |
	... <fr-rire-stem>

<fr-rire-past-participle-exceptions> ::=
	frire		frit

<fr-rire-tabulation> ::=
	a1+		<fr-rire-present> |
	a1-		ne-' <fr-rire-present> pas |
	a2+		<fr-rire-past> |
	a2-		ne-' <fr-rire-past> pas |
	a3		( t1 avoir ) 3 |
	a4		( t2 avoir ) 3 |
	a5+		<fr-first-future> |
	a5-		ne-' <fr-first-future> pas |
	a6+		<fr-rire-past-historic> |
	a6-		ne-' <fr-rire-past-historic> pas |
	p*		3+* par

<fr-rire-present> ::=
	5+s | 5+s | 5+t | 5+ons | 5+ez | 5+ent

<fr-rire-past> ::=
	5+ais | 5+ais | 5+ait | 5+ions | 5+iez | 5+aient

<fr-rire-past-historic> ::=
	6+is | 6+is | 6+it | 6+îmes | 6+îtes | 6+irent

[Just one more thing to do: reflexive verbs, which use the reflexive pronoun,
and conjugate with être. The trickiest point here is that être, used in this
way, becomes reflexive itself: "nous ne nous sommes pas lavés", "we have not washed
ourselves", being tricky because it doesn't contain "ne sommes pas" contiguously.]

<fr-reflexive-conjugation> ::=
	0		4 |							[sets the base for the tries to the adjoint infinitive]
	5 		<fr-first-stem-general> |	[...so, e.g., this applies to "lever", not "se lever"]
	6 		<fr-first-stem-e-es-ent> |	[see above]
	7 		<fr-first-stem-future> |	[see above]
	8 		<fr-first-stem-a-o> |		[see above]
	2 		8+ant |						[present participle: stem + -ant, e.g., donnant]
	3 		5+é |						[past participle: stem + -é, e.g., donné]
	<fr-reflexive-tabulation>

<fr-reflexive-tabulation> ::=
	a1+		<fr-reflexive-pronoun> <fr-first-present> |
	a1-		ne-' <fr-reflexive-pronoun> <fr-first-present> pas |
	a2+		<fr-reflexive-pronoun> <fr-first-past> |
	a2-		ne-' <fr-reflexive-pronoun> <fr-first-past> pas |
	a3+		<fr-reflexive-pronoun> ( t1 être ) 3+* |
	a3-		ne-' <fr-reflexive-pronoun> ( t1+ être ) pas 3+* |
	a4+		<fr-reflexive-pronoun> ( t2 être ) 3+* |
	a4-		ne-' <fr-reflexive-pronoun> ( t2+ être ) pas 3+* |
	a5+		<fr-reflexive-pronoun> <fr-first-future> |
	a5-		ne-' <fr-reflexive-pronoun> <fr-first-future> pas |
	a6+		<fr-reflexive-pronoun> <fr-first-past-historic> |
	a6-		ne-' <fr-reflexive-pronoun> <fr-first-past-historic> pas |
	p*		3+* par

<fr-reflexive-pronoun> ::=
	me-' | te-' | se-' | nous | vous | se-'

-) in the Preform grammar.

Chapter 2.4.2 - Verb substitutions

To say tu es:
	if the story viewpoint is the first person singular:
		now the prior named object is the player;
		if the story tense is the perfect tense:
			say "j'ai été";
		else if the story tense is the past tense:
			say "j'étais";
		else if the story tense is the past perfect tense:
			say "j'avais été";
		else:
			say "[tu] [es]";
	else:
		say "[tu] [es]".

To say Tu es:
	if the story viewpoint is the first person singular:
		now the prior named object is the player;
		if the story tense is the perfect tense:
			say "J'ai été";
		else if the story tense is the past tense:
			say "J'étais";
		else if the story tense is the past perfect tense:
			say "J'avais été";
		else:
			say "[Tu] [es]";
	else:
		say "[Tu] [es]".

To say tu es-étais:
	if the story viewpoint is the first person singular and (the story tense is past historic tense or the story tense is perfect tense or the story tense is past tense):
		now the prior named object is the player;
		say "j'étais";
	else:
		say "[tu] [es]".

To say Tu es-étais:
	if the story viewpoint is the first person singular and (the story tense is past historic tense or the story tense is perfect tense or the story tense is past tense):
		now the prior named object is the player;
		say "J'étais";
	else:
		say "[Tu] [es]".

[Les 4 substitutions suivantes permettent de mettre un verbe à l'imparfait quand le temps de l'histoire est au passé simple ou au passé composé, plutôt que de le mettre dans ces temps-là. Sinon, le conjugue normalement selon le temps de l'histoire.
En effet, en français, on n'utilise pas que le passé simple ou que le passé composé, on les utilise avec l'imparfait. Cette substitution permet de bien choisir le temps.]
To say adapt (V - a verb) for background/bg:
	if the story tense is the past historic tense or the story tense is the perfect tense:
		say "[adapt V in past tense]";
	else:
		say "[adapt V]".

To say adapt (V - verb) from (P - narrative viewpoint) for background/bg:
	if the story tense is the past historic tense or the story tense is the perfect tense:
		say "[adapt V in past tense from P]";
	else:
		say "[adapt V from P]".

To say negate (V - a verb) for background/bg:
	if the story tense is the past historic tense or the story tense is the perfect tense:
		say "[negate V in past tense]";
	else:
		say "[negate V]".

To say negate (V - verb) from (P - narrative viewpoint) for background/bg:
	if the story tense is the past historic tense or the story tense is the perfect tense:
		say "[negate V in past tense from P]";
	else:
		say "[negate V from P]".

To say c'est:
	if the story tense is present tense:
		say "c'est";
	else if the story tense is past historic tense:
		say "ce fut";
	else if the story tense is future tense:
		say "ce sera";
	else if the story tense is perfect tense:
		say "ça a été"; [TODO : ou bien « cela a été » ?]
	else if the story tense is past perfect tense:
		say "ça avait été"; [TODO : idem.]
	else if the story tense is past tense:
		say "c'était".

To say c'est-c'était:
	if the story tense is present tense:
		say "c'est";
	else if the story tense is past historic tense or the story tense is the perfect tense or the story tense is the past tense:
		say "c'était";
	else if the story tense is future tense:
		say "ce sera".

To say C'est:
	if the story tense is present tense:
		say "C'est";
	else if the story tense is past historic tense:
		say "Ce fut";
	else if the story tense is future tense:
		say "Ce sera";
	else if the story tense is perfect tense:
		say "Ça a été"; [TODO : ou bien « cela a été » ?]
	else if the story tense is past perfect tense:
		say "Ça avait été"; [TODO : idem.]
	else if the story tense is past tense:
		say "C'était".

To say C'est-c'était:
	if the story tense is present tense:
		say "C'est";
	else if the story tense is past historic tense or the story tense is the perfect tense or the story tense is the past tense:
		say "C'était";
	else if the story tense is future tense:
		say "Ce sera".

Chapter 2.4.3 - Meaningful verbs

Section 2.4.3.1 - In the Standard Rules

[We declare French equivalents of all meaningful verbs built into the
Standard Rules. This is mostly easy, but it's awkward that "porter" is
French both for "to carry" and "to wear", so that "Elle porte une robe"
could mean either "she carries a dress" or "she wears a dress"; I've
guessed that "porter" ought to mean "carry" here, and then provided
"elle est vétue de..." for "she is wearing...".]

In French être is a verb meaning to be.
In French avoir is a verb meaning to have.
In French établir un rapport avec is a verb meaning to relate. [TODO: Pas sûr pour celui-là. Aussi, ne fonctionne pas car Inform essaie de conjuguer chaque mot un par un, plutôt que de juste conjuguer établir.]
In French fournir is a verb meaning to provide.
In French contenir is a verb meaning to contain.
In French supporter is a verb meaning to support.
In French soutenir is a verb meaning to support.
In French incorporer is a verb meaning to incorporate.
In French englober is a verb meaning to enclose.
In French porter is a verb meaning to carry.
In French arborer is a verb meaning to wear.
In French tenir is a verb meaning to hold.
In French cacher is a verb meaning to conceal.
In French ouvrir is a verb meaning to unlock. [On ne peut pas utiliser « déverrouiller », car il faut le différencier du verbe « unbolt » de Locksmith.]

Section 2.4.3.2 - In Rideable Vehicles (for use with Rideable Vehicles by Graham Nelson)

[TODO: provoque une erreur lors de la compilation]
In French monter is a verb [meaning to mount].
In French démonter is a verb [meaning to dismount]. [TODO: démonter, ce n'est pas français pour ça. On devrait plutôt dire descendre ?]

Section 2.4.3.3 - In Locksmith (for use with Locksmith by Emily Short)

[TODO: provoque une erreur lors de la compilation.]
[In French déverrouiller is a verb meaning to unbolt.]

Chapter 2.4.4 - Prepositions

[We need the following in order to make definitions of "prepositions" work
properly.]

Include [preform](-
language French

<infinitive-usage-exceptional> ::=
	/c/ être ...

-) in the Preform grammar.

[And that enables the following to work nicely.]

In French être dans is a verb meaning to be in.
In French être régionalement dans is a verb meaning to be regionally in.
In French être sur is a verb meaning to be on.
In French être une partie de is a verb meaning to be part of.
In French être une partie du is a verb meaning to be part of.
In French être une partie des is a verb meaning to be part of.
In French être vêtu de is a verb meaning to wear.
In French être vêtu du is a verb meaning to wear.
In French être vêtu des is a verb meaning to wear.
In French être vêtue de is a verb meaning to wear.
In French être vêtue du is a verb meaning to wear.
In French être vêtue des is a verb meaning to wear.
In French être supérieur à is a verb meaning to be greater than.
In French être supérieure à is a verb meaning to be greater than.
In French être plus grand que is a verb meaning to be greater than.
In French être plus grande que is a verb meaning to be greater than.
In French être inférieur à is a verb meaning to be less than.
In French être inférieure à is a verb meaning to be less than.
In French être plus petit que is a verb meaning to be less than.
In French être plus petite que is a verb meaning to be less than.
In French être au moins is a verb meaning to be at least.
In French être au plus is a verb meaning to be at most.
In French être adjacent à is a verb meaning to be adjacent to.
In French être adjacente de is a verb meaning to be adjacent to.
In French être contigu à is a verb meaning to be adjacent to.
In French être contiguë à is a verb meaning to be adjacent to.
In French être contigüe à is a verb meaning to be adjacent to. [Nouvelle orthographe. L'autre, c'est l'orthographe traditionnelle et les deux sont correctes.]
In French être au-dessus de is a verb meaning to be above.
In French être au-dessus du is a verb meaning to be above.
In French être au-dessus des is a verb meaning to be above.
In French être en dessous de is a verb meaning to be below.
In French être en dessous du is a verb meaning to be below.
In French être en dessous des is a verb meaning to be below.
In French être à travers is a verb meaning to be through.

In French être au nord de is a verb meaning the mapping north relation.
In French être au nord du is a verb meaning the mapping north relation.
In French être au nord des is a verb meaning the mapping north relation.
In French être au sud de is a verb meaning the mapping south relation.
In French être au sud du is a verb meaning the mapping south relation.
In French être au sud des is a verb meaning the mapping south relation.
In French être à l'ouest de is a verb meaning the mapping west relation.
In French être à l'ouest du is a verb meaning the mapping west relation.
In French être à l'ouest des is a verb meaning the mapping west relation.
In French être à l'est de is a verb meaning the mapping east relation.
In French être à l'est du is a verb meaning the mapping east relation.
In French être à l'est des is a verb meaning the mapping east relation.
In French être au nord-ouest de is a verb meaning the mapping northwest relation.
In French être au nord-ouest du is a verb meaning the mapping northwest relation.
In French être au nord-ouest des is a verb meaning the mapping northwest relation.
In French être au sud-est de is a verb meaning the mapping southeast relation.
In French être au sud-est du is a verb meaning the mapping southeast relation.
In French être au sud-est des is a verb meaning the mapping southeast relation.
In French être au nord-est de is a verb meaning the mapping northeast relation.
In French être au nord-est du is a verb meaning the mapping northeast relation.
In French être au nord-est des is a verb meaning the mapping northeast relation.
In French être au sud-ouest de is a verb meaning the mapping southwest relation.
In French être au sud-ouest du is a verb meaning the mapping southwest relation.
In French être au sud-ouest des is a verb meaning the mapping southwest relation.
In French être à l'intérieur de is a verb meaning the mapping inside relation.
In French être à l'intérieur du is a verb meaning the mapping inside relation.
In French être à l'intérieur des is a verb meaning the mapping inside relation.
In French être à l'extérieur de is a verb meaning the mapping outside relation.
In French être à l'extérieur du is a verb meaning the mapping outside relation.
In French être à l'extérieur des is a verb meaning the mapping outside relation.

Chapter 2.4.5 - Meaningless verbs

[A]
In French s'agir is a verb.
In French agiter is a verb.
In French aider is a verb.
In French aller is a verb.
In French allumer is a verb.
In French apprécier is a verb.
In French arriver is a verb.
In French attendre is a verb.
[C]
In French chanter is a verb.
[D]
In French descendre is a verb.
In French déverrouiller is a verb.
In French devoir is a verb.
In French donner is a verb.
[E]
In French écouter is a verb.
In French emprunter is a verb.
In French enfiler is a verb.
In French enlever is a verb.
In French essayer is a verb.
In French entendre is a verb.
In French entrer is a verb.
In French éteindre is a verb.
In French examiner is a verb.
[F]
In French faire is a verb.
In French fermer is a verb.
In French fouiller is a verb.
In French frotter is a verb.
[G]
In French goûter is a verb.
[H]
In French hésiter is a verb.
[J]
In French jongler is a verb.
[M]
In French manger is a verb.
In French manquer is a verb.
In French marmonner is a verb.
In French mener is a verb.
In French mettre is a verb.
In French monter is a verb.
[P]
In French parler is a verb.
In French passer is a verb.
In French penser is a verb.
In French poser is a verb.
In French posséder is a verb.
In French pousser is a verb.
In French pouvoir is a verb.
In French presser is a verb.
In French produire is a verb.
[R]
In French ramasser is a verb.
In French relever is a verb.
In French regarder is a verb.
In French remarquer is a verb.
In French renifler is a verb.
[S]
In French sauter is a verb.
In French savoir is a verb.
In French sembler is a verb.
In French sentir is a verb.
In French sortir is a verb.
[T]
In French tirer is a verb.
In French toucher is a verb.
In French se toucher is a verb.
In French tourner is a verb.
In French transporter is a verb.
In French trouver is a verb.
[V]
In French venir is a verb.
In French verrouiller is a verb.
In French voir is a verb.
In French vouloir is a verb.

Part 2.5 - Miscellaneous substitutions

[Raccourci pour utiliser des tirets cadratins car Inform les convertit par défaut en trait d'union.]
To say --:
	say unicode 8212.

[Raccourci pour utiliser des espaces insécables car Inform les convertit par défaut en espaces normales.]
To say _ -- running on:
	say unicode 160.

To say maintenant:
	if the story tense is present tense, say "maintenant";
	else say "à ce moment".

To say ici:
	if the story tense is present tense, say "ici";
	else say "à cet endroit".

To say Maintenant:
	if the story tense is present tense, say "Maintenant";
	else say "À ce moment".

To say Ici:
	if the story tense is present tense, say "Ici";
	else say "À cet endroit".

Volume 3 - Responses

Part 3.1 - Responses

Chapter 3.1.1 - In the Standard Rules

[And now the responses from this extension. You can get a full set of these by
trying out any English source text, e.g.,

	The Amphitheatre is a room.

and then typing the command:

	RESPONSES SET 1

This produces text which can be pasted in here before being translated.]

[Toutes les réponses sont reprises de l'extension précédente de Éric Forgeot, sauf mention contraire.
S'il y a marqué « ajout », alors la réponse n'était pas présente dans l'ancienne extension.
S'il y a marqué « modification », alors la réponse a été modifiée par rapport à l'ancienne extension (la modification est précisée).]

Section 3.1.1.1 - The final question

print the final prompt rule response (A) is ">[run paragraph on]".
print the final question rule response (A) is "Voulez-vous ".
print the final question rule response (B) is " ou ".
standard respond to final question rule response (A) is "Faites un choix parmi les propositions ci-dessus.".

Section 3.1.1.2 - Printing the locale description

you-can-also-see rule response (A) is "[Tu] ".
you-can-also-see rule response (B) is "Sur [the domain], [tu] ".
you-can-also-see rule response (C) is "Dans [the domain], [tu] ".
you-can-also-see rule response (D) is "[regarding the player][adapt the verb peux for bg] aussi voir ".
you-can-also-see rule response (E) is "[regarding the player][adapt the verb peux for bg] voir ".
you-can-also-see rule response (F) is "".

Section 3.1.1.3 - Printing a locale paragraph about a thing

use initial appearance in room descriptions rule response (A) is "Sur [the item], ".
describe what's on scenery supporters in room descriptions rule response (A) is "Sur [the item], ".

Section 3.1.1.4 - Standard actions concerning the actor's possessions

[Taking inventory]
print empty inventory rule response (A) is "[Tu] n['][adapt the verb as for bg] rien.".
print standard inventory rule response (A) is "[Tu-j'][adapt the verb as for bg][_]:[line break]". [modification : ajout d'une espace avant le deux-points]
report other people taking inventory rule response (A) is "[The actor] [fais] l'inventaire de [if the actor is plural-named]leurs[else]ses[end if] possessions.". [ajout]

[Taking]
can't take yourself rule response (A) is "[Tu] [te-se] [adapt the verb possèdes for bg] [toi]-même[if the player is plural-named]s[end if]. Voilà une problématique sur laquelle les philosophes n['][adapt the verb as from the third person plural for bg] pas dû passer beaucoup de temps.". [modification: enlevé la référence à la physique quantique.]
can't take other people rule response (A) is "[regarding the noun][Il] n['][if the story tense is the present tense and the noun is singular-named]apprécierait sûrement pas[else if the story tense is the present tense and the noun is plural-named]apprécieraient sûrement pas[else if (the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense) and the noun is singular-named]aurait sûrement pas apprécié[else if (the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense) and the noun is plural-named]auraient sûrement pas apprécié[else if the story tense is the future tense and the noun is singular-named]appréciera sûrement pas[else if the story tense is the future tense and the noun is plural-named]apprécieront sûrement pas[end if] cela.".
can't take component parts rule response (A) is "Cela [adapt the verb sembles for bg] faire partie [du whole].".
can't take people's possessions rule response (A) is "Cela [adapt the verb sembles for bg] appartenir [au owner].". [modification : avant c'était "Cela semble appartenir à quelqu'un : [noun]."]
can't take items out of play rule response (A) is "[The noun] [negate the verb es for bg] [disponible].".
can't take what you're inside rule response (A) is "[Tu] [adapt the verb dois for bg] d'abord [if noun is a supporter]descendre[otherwise]sortir[end if] [du noun].".
can't take what's already taken rule response (A) is "[Tu] [regarding the noun][l'][regarding the player][adapt the verb as for bg] déjà.".
can't take scenery rule response (A) is "[C'est-c'était] trop difficile à transporter.". [modification : avant c'était "Trop difficile à transporter"]
can only take things rule response (A) is "[Tu] [negate the verb peux for bg] transporter cela.". [ajout]
can't take what's fixed in place rule response (A) is "[C'est-c'était] fixé sur place.".
use player's holdall to avoid exceeding carrying capacity rule response (A) is "(mettant [the transferred item] dans [the current working sack] pour faire de la place)[command clarification break]".
can't exceed carrying capacity rule response (A) is "[Tu] [adapt the verb transportes for bg] déjà trop d'objets.".
standard report taking rule response (A) is "Voilà qui [es] fait.". [modification: remplacement de « D'accord » par « Voilà qui est fait ». TODO : trouver quelque chose de mieux ?]
standard report taking rule response (B) is "[The actor] [ramasses] [the noun].". [ajout]

[Removing it from]
can't remove what's not inside rule response (A) is "[regarding the noun][Il] [negate the verb es for bg] [ici] [maintenant].". [TODO: Je trouve que la phrase sonne mal.]
can't remove from people rule response (A) is "Cela [adapt the verb sembles for bg] appartenir [au owner].".

[Dropping]
can't drop yourself rule response (A) is "[Tu] [adapt the verb manques for bg] de dextérité pour cela.". [modification : ajout de "pour cela".]
can't drop body parts rule response (A) is "[Tu] [negate the verb peux for bg] poser une partie [de toi]-même[if the player is plural-named]s[end if].". [ajout]
can't drop what's already dropped rule response (A) is "[The noun] [adapt the verb es for bg] déjà [ici].".
can't drop what's not held rule response (A) is "[Tu] [negate the verb as for bg] cela.". [modification : remplacement de "ça" par "cela".] [TODO: Je n'aime pas trop la tournure.]
can't drop clothes being worn rule response (A) is "(enlevant d'abord [the noun])[command clarification break]". [modification : avant c'était "Vous prenez d'abord en main [the noun]").]
can't drop if this exceeds carrying capacity rule response (A) is "Il n'y [adapt the verb as for bg] plus de place sur [the receptacle].". [ajout]
can't drop if this exceeds carrying capacity rule response (B) is "Il n'y [adapt the verb as for bg] plus de place dans [the receptacle].". [ajout]
standard report dropping rule response (A) is "Voilà qui [es] fait.". [modification: remplacement de « D'accord » par « Voilà qui est fait. » TODO : trouver quelque chose de mieux ?].
standard report dropping rule response (B) is "[The actor] [poses] [the noun].". [ajout]

[Putting it on]
can't put something on itself rule response (A) is "[Tu] [negate the verb peux for bg] poser un objet sur lui-même.".
can't put onto what's not a supporter rule response (A) is "Poser des objets sur [the second noun] ne [regarding nothing][adapt the verb mènes for bg] à rien.". [TODO : Mettre au conditonnel ?]
can't put clothes being worn rule response (A) is "(enlevant d'abord [the noun])[command clarification break]".
can't put if this exceeds carrying capacity rule response (A) is "Il n'y [adapt the verb as for bg] plus assez de place sur [the second noun].".
concise report putting rule response (A) is "[C'est] fait.".
standard report putting rule response (A) is "[if the actor is not the player ][The actor] [else if the story tense is simple][Tu] [else][Tu-j'][end if][poses] [the noun] sur [the second noun].". [ajout]

[Inserting it into]
can't insert something into itself rule response (A) is "[Tu] [negate the verb peux for bg] mettre un objet à l'intérieur de lui-même.".
can't insert into closed containers rule response (A) is "[The second noun] [adapt the verb es for bg] [fermé].".
can't insert into what's not a container rule response (A) is "[The second noun] [negate the verb peux for bg] contenir d'objet.".
can't insert clothes being worn rule response (A) is "(enlevant d'abord [the noun])[command clarification break]".
can't insert if this exceeds carrying capacity rule response (A) is "Il n'y [adapt the verb as for bg] plus de place dans [the second noun].".
concise report inserting rule response (A) is "[C'est] fait.". [modification : "C'est fait" au lieu de "Fait."]
standard report inserting rule response (A) is "[if the actor is the player and the story tense is simple][Tu] [else if the actor is the player and the story tense is composé][Tu-j'][else][The actor] [end if][mets] [the noun] dans [the second noun].".

[Eating]
can't eat unless edible rule response (A) is "Cela [adapt the verb es for bg] non comestible, selon toute évidence.".
can't eat clothing without removing it first rule response (A) is "(enlevant d'abord [the noun])[command clarification break]".
can't eat other people's food rule response (A) is "[The owner] n['][if the story tense is the present tense and the owner is singular-named]apprécierait sûrement pas[else if the story tense is the present tense and the owner is plural-named]apprécieraient sûrement pas[else if (the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense) and the owner is singular-named]aurait sûrement pas apprécié[else if (the story tense is the past historic tense or the story tense is the perfect tense) and the owner is singular-named]aurait sûrement pas apprécié[else if the story tense is the future tense and the owner is singular-named]appréciera sûrement pas[else if the story tense is the future tense and the owner is plural-named]apprécieront sûrement pas[end if] cela.".
standard report eating rule response (A) is "[if the story tense is simple][Tu] [else][Tu-j'][end if][manges] [the noun]. Pas mauvais.". [TODO : Enlever « pas mauvais » ?]
standard report eating rule response (B) is "[The actor] [manges] [the noun].".

Section 3.1.1.5 - Standard actions which move the actor

[Going]
stand up before going rule response (A) is "(descendant d'abord [du chaise])[command clarification break]".
can't travel in what's not a vehicle rule response (A) is "[Tu] [adapt the verb dois for bg] d'abord descendre [du nonvehicle].".
can't travel in what's not a vehicle rule response (B) is "[Tu] [adapt the verb dois for bg] d'abord sortir [du nonvehicle].".
can't go through undescribed doors rule response (A) is "[Tu] [negate the verb peux for bg] aller par là.".
can't go through closed doors rule response (A) is "(ouvrant d'abord [the door gone through])[command clarification break]". [ajout]
can't go that way rule response (A) is "[Tu] [negate the verb peux for bg] aller par là.".
can't go that way rule response (B) is "[Tu] [negate the verb peux for bg], puisque [the door gone through] ne [adapt the verb mènes for bg] nulle part.".
describe room gone into rule response (A) is "[The actor] [vas] en haut". [ajout]
describe room gone into rule response (B) is "[The actor] [vas] en bas". [ajout]
describe room gone into rule response (C) is "[The actor] [vas] [if the noun is dedans]à l'intérieur[else if the noun is dehors]à l'extérieur[else][au noun][end if]". [ajout]
describe room gone into rule response (D) is "[The actor] [arrives] d'en haut". [ajout]
describe room gone into rule response (E) is "[The actor] [arrives] d'en bas". [ajout]
describe room gone into rule response (F) is "[The actor] [arrives] [if the back way is dedans]de l'intérieur[else if the back way is dehors]de l'extérieur[else][du back way][end if]". [ajout]
describe room gone into rule response (G) is "[The actor] [arrives]". [ajout]
describe room gone into rule response (H) is "[The actor] [arrives] [au room gone to] d'en haut". [ajout]
describe room gone into rule response (I) is "[The actor] [arrives] [au room gone to] d'en bas". [ajout]
describe room gone into rule response (J) is "[The actor] [arrives] [au room gone to] [if the back way is dedans]de l'intérieur[else if the back way is dehors]de l'extérieur[else][du back way][end if]". [ajout]
describe room gone into rule response (K) is "[The actor] [empruntes] [the noun]". [ajout]
describe room gone into rule response (L) is "[The actor] [arrives] [du noun]". [ajout]
describe room gone into rule response (M) is "sur [the vehicle gone by]". [ajout]
describe room gone into rule response (N) is "dans [the vehicle gone by]". [ajout]
describe room gone into rule response (O) is ", en poussant [the thing gone with], [t']emmenant". [ajout]
describe room gone into rule response (P) is ", en poussant [the thing gone with]". [ajout]
describe room gone into rule response (Q) is ", en poussant [the thing gone with]". [ajout]
describe room gone into rule response (R) is ", en poussant [the thing gone with] à l'intérieur". [ajout]
describe room gone into rule response (S) is ", [t']emmenant". [ajout]

block vaguely going rule response (A) is "[bracket]Vous devez indiquez dans quelle direction vous voulez aller.[close bracket]".

[Entering]
can't enter what's already entered rule response (A) is "Impossible, [tu es-étais] déjà sur [the noun].".
can't enter what's already entered rule response (B) is "Impossible, [tu es-étais] déjà dans [the noun].".
[La règle a directement été remplacée pour que la réponse appropriée parmi les quatre ci-dessous soit choisie]
[can't enter what's not enterable rule response (A) is "Ce [n'es pas] quelque chose sur lequel [tu] [peux] [te-se] tenir debout.".
can't enter what's not enterable rule response (B) is "Ce [n'es pas] quelque chose sur lequel [tu] [peux] [t'-s']asseoir.".
can't enter what's not enterable rule response (C) is "Ce [n'es pas] quelque chose sur lequel [tu] [peux] [t'-s']allonger.".
can't enter what's not enterable rule response (D) is "Ce [n'es pas] quelque chose dans lequel [tu] [peux] entrer.".]
can't enter closed containers rule response (A) is "[Tu] [negate the verb peux for bg] entrer dans [the noun], qui [adapt the verb es for bg] [fermé].".
can't enter if this exceeds carrying capacity rule response (A) is "Il n'y [adapt the verb as for bg] plus de place sur [the noun].". [ajout]
can't enter if this exceeds carrying capacity rule response (B) is "Il n'y [adapt the verb as for bg] plus de place dans [the noun].". [ajout]
can't enter something carried rule response (A) is "[Tu] [negate the verb peux for bg] y entrer si [the noun] [negate the verb es for bg] au sol.".
implicitly pass through other barriers rule response (A) is "(descendant [du current home])[command clarification break]". 
implicitly pass through other barriers rule response (B) is "(sortant [du current home])[command clarification break]".
implicitly pass through other barriers rule response (C) is "(montant sur [the target])[command clarification break]".
implicitly pass through other barriers rule response (D) is "(entrant dans [the target])[command clarification break]".
implicitly pass through other barriers rule response (E) is "(entrant dans [the target])[command clarification break]".
standard report entering rule response (A) is "[if the story tense is simple][Tu] [montes][else if the story tense is the perfect tense][Tu] [adapt the verb es in present tense] [monté][else if the story tense is the past perfect tense][Tu-j'][adapt the verb es in past tense] [monté][end if] sur [the noun].".
standard report entering rule response (B) is "[if the story tense is simple][Tu-j'][entres][else if the story tense is the perfect tense][Tu] [adapt the verb es in present tense] [entré][else if the story tense is the past perfect tense][Tu-j'][adapt the verb es in past tense] [entré][end if] dans [the noun].".
standard report entering rule response (C) is "[The actor] [if the story tense is simple][entres][else if the story tense is the perfect tense][adapt the verb es in present tense] [entré][else if the story tense is the past perfect tense][adapt the verb es in past tense] [entré][end if] dans [the noun].". [ajout]
standard report entering rule response (D) is "[The actor] [if the story tense is simple][montes][else if the story tense is the perfect tense][adapt the verb es in present tense] [monté][else if the story tense is the past perfect tense][adapt the verb es in past tense] [monté][end if] sur [the noun].".

[Exiting]
can't exit when not inside anything rule response (A) is "[Tu] [negate the verb peux for bg] sortir.". [modification : avant c'était "Sortir d'où ?!". Je trouvais ça un peu brutal.]
can't exit closed containers rule response (A) is "[Tu] [negate the verb peux for bg] sortir [du cage], qui [adapt the verb es for bg] [fermé].".
standard report exiting rule response (A) is "[if the story tense is simple][Tu] [descends][else if the story tense is the perfect tense][Tu] [adapt the verb es in present tense] [descendu][else if the story tense is the past perfect tense][Tu-j'][adapt the verb es in past tense] [descendu][end if] [du container exited from].".
standard report exiting rule response (B) is "[if the story tense is simple][Tu] [sors][else if the story tense is the perfect tense][Tu] [adapt the verb es in present tense] [sorti][else if the story tense is the past perfect tense][Tu-j'][adapt the verb es in past tense] [sorti][end if] [du container exited from].".
standard report exiting rule response (C) is "[The actor] [if the story tense is simple][sors][else if the story tense is the perfect tense][adapt the verb es in present tense] [sorti][else if the story tense is the past perfect tense][adapt the verb es in past tense] [sorti][end if] [du container exited from].".

[Getting off]
can't get off things rule response (A) is "[Tu] [negate the verb es for bg] sur [the noun].".
standard report getting off rule response (A) is "[if the actor is the player and the story tense is simple][Tu] [descends][else if the actor is the player and the story tense is the perfect tense][Tu] [adapt the verb es in present tense] [descendu][else if the actor is the player and the story tense is the past perfect tense][Tu-j'][adapt the verb es in past tense] [descendu][else if the actor is not the player and the story tense is simple][The actor] [descends][else if the actor is not the player and the story tense is the perfect tense][The actor] [adapt the verb es in present tense] [descendu][else if the actor is not the player and the story tense is the past perfect tense][The actor][adapt the verb es in past tense] [descendu][end if] [du noun].".

Section 3.1.1.6 - Standard actions concerning the actor's vision

[Looking]
room description heading rule response (A) is "L'obscurité".
room description heading rule response (B) is " (sur [the intermediate level])".
room description heading rule response (C) is " (dans [the intermediate level])".
room description body text rule response (A) is "Il [adapt the verb fais for bg] noir, et [tu] ne [adapt the verb peux for bg] rien voir.".
other people looking rule response (A) is "[The actor] [regardes] autour [if the actor is male]de lui[else]d'elle[end if].". [ajout]

darkness name internal rule response (A) is "L'obscurité".

[Examining]
examine directions rule response (A) is "En dépit de [tes] efforts, [tu] [if the story tense is simple]ne [vois] rien[else if the story tense is the perfect tense]n['][adapt the verb as in present tense] rien vu[else if the story tense is the past perfect tense]n['][adapt the verb as in past tense] rien vu[end if] de particulier dans cette direction.".
[La règle a directement été remplacée, car ce n'était pas très joli (ex : « Sur la table sont une lettre et un stylo »).
examine containers rule response (A) is "Dans [the noun] ".
examine containers rule response (B) is "[The noun] [es] [vide].".
examine supporters rule response (A) is "Sur [the noun] ".]
examine devices rule response (A) is "[The noun] [adapt the verb es for bg] [if story tense is present tense]actuellement [end if][if the noun is switched on][allumé][otherwise][éteint][end if].".
examine undescribed things rule response (A) is "Rien de particulier concernant [the noun].".
report other people examining rule response (A) is "[The actor] [examines] [the noun] attentivement.". [ajout]

[Looking under]
standard looking under rule response (A) is "Ces recherches [adapt the verb es from the third person plural] vaines.".
report other people looking under rule response (A) is "[The actor] [regardes] sous [the noun].". [ajout]

[Searching]
can't search unless container or supporter rule response (A) is "[Tu] [if the story tense is simple]ne [trouves] rien[else if the story tense is the perfect tense]n['][adapt the verb as in present tense] rien trouvé[else if the story tense is the past perfect tense]n['][adapt the verb as in past tense] rien trouvé[end if] d'intéressant.".
can't search closed opaque containers rule response (A) is "[Tu] [negate the verb peux for bg] voir à l'intérieur [du noun], puisqu['][il] [adapt the verb es for bg] [fermé].".
[Pareil que plus haut.
standard search containers rule response (A) is "Dans [the noun] ".
standard search containers rule response (B) is "[The noun] [es] [vide].".
standard search supporters rule response (A) is "Sur [the noun] ".
standard search supporters rule response (B) is "Il n'y [adapt the verb as from the third person singular] rien sur [the noun].".]
report other people searching rule response (A) is "[The actor] [fouilles] [the noun].". [ajout]

[Consulting it about]
block consulting rule response (A) is "[Tu] [if the story tense is simple]ne [trouves] rien[else if the story tense is the perfect tense]n['][adapt the verb as in present tense] rien trouvé[else if the story tense is the past perfect tense]n['][adapt the verb as in past tense] rien trouvé[end if] rien d'intéressant dans [the noun].".
block consulting rule response (B) is "[The actor] [regardes] dans [the noun].". [ajout]

Section 3.1.1.7 - Standard actions which change the state of things

[Locking it with]
can't lock without a lock rule response (A) is "[Tu] [negate the verb peux for bg] verrouiller cela.".
can't lock what's already locked rule response (A) is "[regarding the noun][Il] [adapt the verb es for bg] déjà [verrouillé].".
can't lock what's open rule response (A) is "[Tu] [adapt the verb dois for bg] d'abord fermer [the noun].".
can't lock without the correct key rule response (A) is "[regarding the second noun][Il] [negate the verb entres for bg] dans la serrure.".
standard report locking rule response (A) is "[if the story tense is simple][Tu] [else][Tu-j'][end if][verrouilles] [the noun].".
standard report locking rule response (B) is "[The actor] [verrouilles] [the noun].". [ajout]

[Unlocking it with]
can't unlock without a lock rule response (A) is "[Tu] [negate the verb peux for bg] déverrouiller cela.".
can't unlock what's already unlocked rule response (A) is "[regarding the noun][Il] [adapt the verb es for bg] déjà [déverrouillé].".
can't unlock without the correct key rule response (A) is "[regarding the second noun][Il] [negate the verb entres for bg] dans la serrure.".
standard report unlocking rule response (A) is "[if the story tense is simple][Tu] [else][Tu-j'][end if][déverrouilles] [the noun].".
standard report unlocking rule response (B) is "[The actor] [déverrouilles] [the noun].". [ajout]

[Switching on]
can't switch on unless switchable rule response (A) is "[Tu] [negate the verb peux for bg] allumer cela.".
can't switch on what's already on rule response (A) is "[regarding the noun][Il] [adapt the verb es for bg] déjà [allumé].".
standard report switching on rule response (A) is "[if the actor is the player][Tu-j'][else][The actor] [end if][allumes] [the noun].". [ajout]

[Switching off]
can't switch off unless switchable rule response (A) is "[Tu] [negate the verb peux for bg] éteindre cela.".
can't switch off what's already off rule response (A) is "[regarding the noun][Il] [adapt the verb es for bg] déjà [éteint].".
standard report switching off rule response (A) is "[if the actor is the player][Tu-j'][else][The actor] [end if][éteins] [the noun].". [ajout]

[Opening]
can't open unless openable rule response (A) is "[Tu] [negate the verb peux for bg] ouvrir [the noun].".
can't open what's locked rule response (A) is "[regarding the noun][Il] [adapt the verb sembles for bg] être [fermé] à clef.".
can't open what's already open rule response (A) is "[regarding the noun][Il] [adapt the verb es for bg] déjà [ouvert].".
reveal any newly visible interior rule response (A) is "[Tu-j'][ouvres] [the noun], révélant ".
standard report opening rule response (A) is "[Tu-j'][ouvres] [the noun].".
standard report opening rule response (B) is "[The actor] [ouvres] [the noun].". [ajout]
standard report opening rule response (C) is "[The noun] s['][if the story tense is simple][ouvres][else if the story tense is the perfect tense][adapt the verb es in present tense] [ouvert][else if the story tense is the past perfect tense][adapt the verb es in past tense] [ouvert][end if].". [ajout]

[Closing]
can't close unless openable rule response (A) is "[Tu] [negate the verb peux for bg] fermer [the noun].". [modification : avant c'était « [Tu] [ne peux pas] fermer cela ».]
can't close what's already closed rule response (A) is "[regarding the noun][Il] [adapt the verb es for bg] déjà [fermé].".
standard report closing rule response (A) is "[if the story tense is simple][Tu] [else][Tu-j'][end if][fermes] [the noun].".
standard report closing rule response (B) is "[The actor] [fermes] [the noun].". [ajout]
standard report closing rule response (C) is "[The noun] [if the story tense is simple]se [fermes][else if the story tense is the perfect tense]s['][adapt the verb es in present tense] [fermé][else if the story tense is the past perfect tense]s['][adapt the verb es in past tense] [fermé][end if].". [ajout]

[Wearing]
can't wear what's not clothing rule response (A) is "[Tu] [negate the verb peux for bg] porter cela.".
can't wear what's not held rule response (A) is "[Tu] [negate the verb as for bg] cela sur [toi].".
can't wear what's already worn rule response (A) is "[Tu] [regarding the noun][le] [regarding the player][adapt the verb portes for bg] déjà.".
standard report wearing rule response (A) is "[if the story tense is simple][Tu] [else][Tu-j'][end if][mets] [the noun].".
standard report wearing rule response (B) is "[The actor] [enfiles] [the noun].". [ajout]

[Taking off]
can't take off what's not worn rule response (A) is "[Tu] [negate the verb portes for bg] [the noun].".
can't exceed carrying capacity when taking off rule response (A) is "[Tu] [adapt the verb portes for bg] déjà trop de choses.". [ajout]
standard report taking off rule response (A) is "[Tu-j'][enlèves] [the noun].".
standard report taking off rule response (B) is "[The actor] [enlèves] [the noun].". [ajout]

Section 3.1.1.8 - Standard actions concerning other people

[Giving it to]
can't give what you haven't got rule response (A) is "[Tu] [negate the verb as for bg] [the noun] en main.".
can't give to yourself rule response (A) is "[if the story tense is simple][Tu] [else][Tu-j'][end if][jongles] avec [the noun] pendant un moment, mais [tu] [n'arrives pas] à grand-chose.".
can't give to a non-person rule response (A) is "[The second noun] ne [adapt the verb peux for bg] rien recevoir.". [ajout]
can't give clothes being worn rule response (A) is "(enlevant d'abord [the noun])[command clarification break]".
block giving rule response (A) is "[The second noun] [negate the verb as for bg] l'air [intéressé].".
can't exceed carrying capacity when giving rule response (A) is "[The second noun] [adapt the verb portes for bg] déjà trop de choses.".
standard report giving rule response (A) is "[if le story tense is simple][Tu] [else][Tu-j'][end if][donnes] [the noun] [au second noun].". [ajout]
standard report giving rule response (B) is "[The actor] [if le story tense is simple][te-lui] [else][t'-lui][end if][regarding the actor][donnes] [the noun].". [ajout]
standard report giving rule response (C) is "[The actor] [donnes] [the noun] [au second noun].". [ajout]

[Showing it to]
can't show what you haven't got rule response (A) is "[Tu] [negate the verb as for bg] [the noun] en main.".
block showing rule response (A) is "[The second noun] [adapt the verb es for bg] peu [impressionné].".

[Waking]
block waking rule response (A) is "Cela [negate the verb sembles for bg] nécessaire.".

[Throwing it at]
implicitly remove thrown clothing rule response (A) is "(enlevant d'abord [the noun])[command clarification break]".
futile to throw things at inanimate objects rule response (A) is "Futile.".
block throwing at rule response (A) is "[Tu-j'][hésites] au moment crucial.".

[Attacking]
block attacking rule response (A) is "La violence [negate the verb es for bg] une solution ici.".

[Kissing]
kissing yourself rule response (A) is "Cela ne [t'][regarding nothing][if the story tense is simple][aides] pas beaucoup[else if the story tense is perfect tense][adapt the verb as in present tense] pas beaucoup aidé[else if the story tense is past perfect tense][adapt the verb as in past tense] pas beaucoup aidé[end if].". [modification : ça a changé en anglais, alors j'ai fait de même (avant : « Si tu penses que ça peut aider »).]
block kissing rule response (A) is "[The noun] n['][if the story tense is the present tense and the noun is singular-named]aimerait peut-être pas[else if the story tense is the present tense and the noun is plural-named]aimeraient peut-être pas[else if (the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense) and the noun is singular-named]aurait peut-être pas aimé[else if (the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense) and the noun is plural-named]auraient peut-être pas aimé[else if the story tense is the future tense and the noun is singular-named]aimera peut-être pas[else if the story tense is the future tense and the noun is plural-named]aimeront peut-être pas[end if] cela.". [modification : je n'ai pas mis "Concentrez-vous sur le jeu !", car je trouve que c'est une action normale, que le personnage pourrait faire. Pourquoi briser le quatrième mur ?]

[Answering it that, telling it about, asking it about]
block answering rule response (A) is "Pas de réponse.".
telling yourself rule response (A) is "[Tu] [if the story tense is simple][te-se] [parles][else if the story tense is perfect tense and (the story viewpoint is first person singular or the story viewpoint is first person plural or the story viewpoint is third person plural)][te-se] [adapt the verb es in present tense] parlé[else if the story tense is perfect tense][t'-s'][adapt the verb es in present tense] parlé[else if the story tense is past perfect tense and (the story viewpoint is first person singular or the story viewpoint is first person plural or the story viewpoint is third person plural)][te-se] [adapt the verb es in past tense] parlé[else if the story tense is past perfect tense][t'-s'][adapt the verb es in past tense] parlé[end if] à [toi]-même[if the player is plural-named]s[end if] un moment.". [TODO : Bien tester.]
block telling rule response (A) is "Pas de réaction.".
block asking rule response (A) is "Pas de réponse.".

Section 3.1.1.9 - Standard actions which are checked but then do nothing unless rules intervene

[Waiting]
standard report waiting rule response (A) is "Le temps [passes]…".
standard report waiting rule response (B) is "[The actor] [attends].".

[Touching]
report touching yourself rule response (A) is "[Tu] n'y [adapt the verb vois for bg] aucune utilité.".
report touching yourself rule response (B) is "[The actor] [te touches].".
report touching other people rule response (A) is "[Tu] [adapt the verb sais for bg] tenir [tes] mains tranquilles.".
report touching other people rule response (B) is "[The actor] [if the story tense is simple][te] [regarding the actor][touches][else if the story tense is perfect tense][t'][regarding the actor][adapt the verb as in present tense] [regarding the player][touché][else if the story tense is past perfect tense][t'][regarding the actor][adapt the verb as in past tense] [regarding the player][touché][end if].". [ajout]
report touching other people rule response (C) is "[The actor] [touches] [the noun].". [ajout]
report touching things rule response (A) is "[Tu] [if the story tense is simple]ne [sens] rien[else if the story tense is perfect tense]n['][adapt the verb as in present tense] rien senti[else if the story tense is past perfect tense]n['][adapt the verb as in past tense] rien senti[end if] de particulier.".
report touching things rule response (B) is "[The actor] [touches] [the noun].". [ajout]

[Waving]
can't wave what's not held rule response (A) is "[Tu] [negate the verb as for bg] cela sur [toi].".
report waving things rule response (A) is "[Tu-j'][agites] [the noun].".
report waving things rule response (B) is "[The actor] [agites] [the noun].". [ajout]

[Pulling]
can't pull what's fixed in place rule response (A) is "[C'est-c'était] fixé sur place.".
can't pull scenery rule response (A) is "[Tu-j']en [adapt the verb es for bg] [incapable].".
can't pull people rule response (A) is "[if the story tense is the present tense]Ce serait[else if the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense]Cela aurait été[else if the story tense is the future tense]Ce sera[end if] moins que courtois.".
report pulling rule response (A) is "Rien d'évident ne [if the story tense is simple]se [produis][else if the story tense is perfect tense]s'est produit[else if the story tense is past perfect tense]s'était produit[end if].".
report pulling rule response (B) is "[The actor] [tires] [the noun].". [ajout]

[Pushing]
can't push what's fixed in place rule response (A) is "[C'est-c'était] fixé sur place.".
can't push scenery rule response (A) is "[Tu-j']en [adapt the verb es for bg] [incapable].".
can't push people rule response (A) is "[if the story tense is the present tense]Ce serait[else if the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense]Cela aurait été[else if the story tense is the future tense]Ce sera[end if] moins que courtois.".
report pushing rule response (A) is "Rien d'évident ne [if the story tense is simple]se [produis][else if the story tense is perfect tense]s'est produit[else if the story tense is past perfect tense]s'était produit[end if].".
report pushing rule response (B) is "[The actor] [pousses] [the noun].". [ajout]

[Turning]
can't turn what's fixed in place rule response (A) is "[C'est-c'était] fixé sur place.".
can't turn scenery rule response (A) is "[Tu-j']en [adapt the verb es for bg] [incapable].".
can't turn people rule response (A) is "[if the story tense is the present tense]Ce serait[else if the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense]Cela aurait été[else if the story tense is the future tense]Ce sera[end if] moins que courtois.".
report turning rule response (A) is "Rien d'évident ne [if the story tense is simple]se [produis][else if the story tense is perfect tense]s'est produit[else if the story tense is past perfect tense]s'était produit[end if].".
report turning rule response (B) is "[The actor] [tournes] [the noun].". [ajout]

[Pushing it to]
can't push unpushable things rule response (A) is "[The noun] [negate the verb peux for bg] être [poussé] autre part.". [modification : à la place de "Vous ne pouvez donc rien imaginer de mieux ?"]
can't push to non-directions rule response (A) is "Ce [negate the verb es for bg] une direction.".
can't push vertically rule response (A) is "[The noun] [negate the verb peux for bg] être [poussé] vers le haut ou vers le bas.".
can't push from within rule response (A) is "[The noun] [negate the verb peux for bg] être [poussé] [if the story tense is present tense]d'ici[else]de cet endroit[end if].".
block pushing in directions rule response (A) is "[The noun] [negate the verb peux for bg] être [poussé] d'un endroit à un autre.".

[Squeezing]
innuendo about squeezing people rule response (A) is "[Tu] [adapt the verb sais for bg] tenir [tes] mains tranquilles.".
report squeezing rule response (A) is "[Tu] n['][adapt the verb arrives for bg] à rien ainsi.".
report squeezing rule response (B) is "[The actor] [presses] [the noun].". [ajout]

Section 3.1.1.10 - Standard actions which always do nothing unless rules intervene

[Saying yes, saying no]
block saying yes rule response (A) is "Mmmh[_]?".
block saying no rule response (A) is "Mmmh[_]?".

[Burning]
block burning rule response (A) is "Cet acte dangereux [if the story tense is the present tense]ne mènerait pas[else if the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense]n'aurait pas mené[else if the story tense is the future tense]ne mènera pas[end if] à grand-chose.".

[Waking up]
block waking up rule response (A) is "Il [negate the verb s'agis for bg] d'un rêve.".

[Thinking]
block thinking rule response (A) is "Quelle bonne idée.".

[Smelling]
report smelling rule response (A) is "[Tu] ne [adapt the verb sens for bg] rien de particulier.".
report smelling rule response (B) is "[The actor] [renifles].". [ajout]

[Listening to]
report listening rule response (A) is "[Tu] n['][adapt the verb entends for bg] rien de particulier.".
report listening rule response (B) is "[The actor] [écoutes] attentivement.". [ajout]

[Tasting]
report tasting rule response (A) is "[Tu] [if the story tense is simple]ne [remarques] rien[else if the story tense is perfect tense]n['][adapt the verb as in present tense] rien remarqué[else if the story tense is past perfect tense]n['][adapt the verb as in past tense] rien remarqué[end if] de particulier.".
report tasting rule response (B) is "[The actor] [goûtes] [the noun].". [ajout]

[Cutting]
block cutting rule response (A) is "[regarding the noun][Le] couper [if the story tense is the present tense]ne servirait pas[else if the story tense is the past historic tense or the story tense is the perfect tense or the story tense is the past tense]n'aurait pas servi[else if the story tense is the future tense]ne servira pas[end if] à grand-chose.".

[Jumping]
report jumping rule response (A) is "[if the story tense is simple][Tu] [else][Tu-j'][end if][sautes] sur place, vainement.".
report jumping rule response (B) is "[The actor] [sautes] sur place.". [ajout]

[Tying it to]
block tying rule response (A) is "[Tu] n['][adapt the verb arrives for bg] à rien comme cela.". [modification : remplacement de "ça" par "cela".]

[Drinking]
block drinking rule response (A) is "[The noun] n['][adapt the verb as for bg] rien de buvable.".

[Saying sorry]
block saying sorry rule response (A) is "Ce [negate the verb es for bg] grave.". [modification : au lieu de "Pas grave".]

[Swinging]
block swinging rule response (A) is "Il n'y [adapt the verb as for bg] rien à balancer [ici].". [modification : au lieu de "Ce n'est pas une chose à laquelle il est utile de se balancer."]

[Rubbing]
[ajout : avant, l'action "frotter" était bloquée. Maintenant, elle réussit, et on frotte l'objet inutilement, d'où la nouvelle réponse.]
can't rub another person rule response (A) is "[Tu] [adapt the verb sais for bg] tenir [tes] mains tranquilles.".
report rubbing rule response (A) is "[if the story tense is simple][Tu] [else][Tu-j'][end if][frottes] [the noun].".
report rubbing rule response (B) is "[The actor] [frottes] [the noun].".

[Setting it to]
block setting it to rule response (A) is "[Tu] ne [adapt the verb peux for bg] [regarding the noun][le] régler sur rien.".

[Waving hands]
report waving hands rule response (A) is "[Tu-j'][agites] les mains.".
report waving hands rule response (B) is "[The actor] [agites] les mains.". [ajout]

[Buying]
block buying rule response (A) is "[The noun] [negate the verb es for bg] à vendre.".

[Climbing]
block climbing rule response (A) is "[Tu] [negate the verb peux for bg] arriver à grand-chose de cette manière.".

[Sleeping]
block sleeping rule response (A) is "[Tu] [negate the verb as for bg] particulièrement sommeil.".

Section 3.1.1.11 - Accessibility and visibility

adjust light rule response (A) is "[Tu es] [plongé] dans l'obscurité.".
generate action rule response (A) is "[bracket]ne prenant en compte que les seize premiers[close bracket][command clarification break]".
generate action rule response (B) is "[bracket]Il n'y a rien à faire.[close bracket]".

basic accessibility rule response (A) is "[bracket]Vous devez indiquer un nom plus précis.[close bracket]".
basic visibility rule response (A) is "Il [adapt the verb fais for bg] noir et [tu] ne [adapt the verb peux for bg] rien voir.".

requested actions require persuasion rule response (A) is "[The noun] [adapt the verb as for bg] mieux à faire.".

carry out requested actions rule response (A) is "[The noun] [adapt the verb es for bg] [incapable] de faire cela.".
access through barriers rule response (A) is "Ce [negate the verb es for bg] disponible.".
can't reach inside closed containers rule response (A) is "[The noun] [negate the verb es for bg] [ouvert].".
can't reach inside rooms rule response (A) is "[Tu] [negate the verb peux for bg] atteindre l'intérieur [du noun].".
can't reach outside closed containers rule response (A) is "[The noun] [negate the verb es for bg] [ouvert].".

Section 3.1.1.12 - List writer internal rule

list writer internal rule response (A) is " (".
list writer internal rule response (B) is ")".
list writer internal rule response (C) is " et ".
list writer internal rule response (D) is "procurant de la lumière".
list writer internal rule response (E) is "[regarding the noun][fermé]".
list writer internal rule response (F) is "[regarding the noun][vide]".
list writer internal rule response (G) is "[regarding the noun][fermé] et [vide]".
list writer internal rule response (H) is "[regarding the noun][fermé] et procurant de la lumière".
list writer internal rule response (I) is "[regarding the noun][vide] et procurant de la lumière".
list writer internal rule response (J) is "[regarding the noun][fermé], [vide][if serial comma option is active],[end if] et procurant de la lumière".
list writer internal rule response (K) is "procurant de la lumière et [regarding the noun][porté]".
list writer internal rule response (L) is "[regarding the noun][porté]".
list writer internal rule response (M) is "[regarding the noun][ouvert]".
list writer internal rule response (N) is "[regarding the noun][ouvert] mais [vide]".
list writer internal rule response (O) is "[regarding the noun][fermé]".
list writer internal rule response (P) is "[regarding the noun][fermé] et [verrouillé]".
list writer internal rule response (Q) is "contenant".
list writer internal rule response (R) is "sur [regarding the noun][le]quel[if the noun is a female]le[end if][if the noun is a plural-named]s[end if] ".
list writer internal rule response (S) is ", sur [regarding the noun][le]quel[if the noun is a female]le[end if][if the noun is a plural-named]s[end if] ".
list writer internal rule response (T) is "dans [regarding the noun][le]quel[if the noun is a female]le[end if][if the noun is a plural-named]s[end if] ".
list writer internal rule response (U) is ", à l'intérieur [if the noun is male and the noun is singular-named]duquel[else if the noun is male and the noun is plural-named]desquels[else if the noun is female and the noun is singular-named]de laquelle[else if the noun is male and the noun is singular-named]desquelles[end if] ".
list writer internal rule response (V) is "[regarding list writer internals]se [adapt the verb trouves for bg]".
list writer internal rule response (W) is "il n'y [adapt the verb as for bg] rien".
list writer internal rule response (X) is "Rien".
list writer internal rule response (Y) is "rien".

Section 3.1.1.13 - Action processing internal rule

action processing internal rule response (A) is "[bracket]Cette commande demande de faire quelque chose en dehors du jeu, aussi n'a-t-elle de sens que de vous à moi. Il ne peut être demandé de faire cela [au noun].[close bracket]".
action processing internal rule response (B) is "[bracket]Vous devez indiquer un objet.[close bracket]".
action processing internal rule response (C) is "[bracket]Vous ne devez pas indiquer un objet.[close bracket]".
action processing internal rule response (D) is "[bracket]Vous devez fournir un nom.[close bracket]".
action processing internal rule response (E) is "[bracket]Vous ne devez pas fournir un nom.[close bracket]".
action processing internal rule response (F) is "[bracket]Vous devez indiquer un second objet.[close bracket]".
action processing internal rule response (G) is "[bracket]Vous ne devez pas indiquer un objet.[close bracket]".
action processing internal rule response (H) is "[bracket]Vous devez fournir un second nom.[close bracket]".
action processing internal rule response (I) is "[bracket]Vous ne devez pas fournir un nom.[close bracket]".
action processing internal rule response (J) is "[bracket]Comme quelque chose de dramatique vient de se produire, votre liste de commandes a été raccourcie.[close bracket]".

Section 3.1.1.14 - Parser

parser error internal rule response (A) is "[bracket]Je n'ai pas compris cette phrase.[close bracket]".
[TODO : Les deux ci-dessous devraient avoir des crochets, mais comme la fin est faite en I6, on ne peut pas ajouter le crochet fermant ici.]
parser error internal rule response (B) is "Merci de reformuler. Je n'ai compris que[_]: ".
parser error internal rule response (C) is "Merci de reformuler. Je n'ai compris que[_]: (aller) ".
parser error internal rule response (D) is "[bracket]Je n'ai pas compris ce nombre.[close bracket]".
parser error internal rule response (E) is "[Tu] ne [adapt the verb vois for bg] rien de tel, à moins que cela ne [if the story tense is past historic tense or the story tense is perfect tense or the story tense is past tense]fût[else]soit[end if] sans grande importance.".
parser error internal rule response (F) is "[bracket]Vous semblez en avoir dit trop peu.[close bracket]".
parser error internal rule response (G) is "[Tu] ne [regarding the noun][l'][regarding the player][adapt the verb as for bg] pas sur [toi].".
parser error internal rule response (H) is "[bracket]Vous ne pouvez pas utiliser plusieurs objets avec ce verbe.[close bracket]".
parser error internal rule response (I) is "[bracket]Vous ne pouvez utiliser plusieurs objets qu'une fois par ligne.[close bracket]".
parser error internal rule response (J) is "[bracket]Je ne suis pas sûr de ce à quoi «[_][pronoun i6 dictionary word][_]» se réfère.[close bracket]".
[TODO : Pas sûr pour la suivante, puisque ça interpelle le protagoniste du jeu, mais ça fait aussi référence à un pronom tapé par le joueur sur son ordinateur.]
parser error internal rule response (K) is "[bracket][Tu] [negate the verb peux for bg] voir «[_][pronoun i6 dictionary word][_]» ([the noun]) pour l'instant.[close bracket]".
parser error internal rule response (L) is "[bracket]Vous avez exclu quelque chose qui n'était de toute façon pas compris dans la liste.[close bracket]".
parser error internal rule response (M) is "[Tu] ne [adapt the verb peux for bg] agir ainsi qu'avec une chose douée de conscience.".
parser error internal rule response (N) is "[bracket]Je ne connais pas ce verbe.[close bracket]".
parser error internal rule response (O) is "[bracket]Ce n'est pas une chose à laquelle vous aurez à vous référer au cours du jeu.[close bracket]".
parser error internal rule response (P) is "[bracket]Je n'ai pas compris la fin de la phrase.[close bracket]".
parser error internal rule response (Q) is "[bracket][if number understood is 0]Aucun n'est disponible[else if number understood is 1]Seulement [number understood] est disponible[else]Seulement [number understood] sont disponibles[end if].[close bracket]".
parser error internal rule response (R) is "[bracket]Ce nom n'a pas de sens dans ce contexte.[close bracket]".
parser error internal rule response (S) is "[bracket]Pour répéter une commande comme «[_]grenouille, saute[_]», écrivez seulement «[_]encore[_]», et non «[_]grenouille, encore[_]».[close bracket]".
parser error internal rule response (T) is "[bracket]Vous ne pouvez pas commencer par une virgule.[close bracket]".
parser error internal rule response (U) is "[bracket]Vous semblez vouloir parler à quelqu'un, mais je ne vois pas à qui.[close bracket]".
parser error internal rule response (V) is "[bracket]Vous ne pouvez pas discuter avec [the noun].[close bracket]".
parser error internal rule response (W) is "[bracket]Pour parler à quelqu'un, essayez d'écrire «[_][italic type]quelqu'un[roman type], bonjour[_]» ou quelque chose de similaire.[close bracket]".
parser error internal rule response (X) is "[bracket]Je vous demande pardon[_]?[close bracket]".

parser nothing error internal rule response (A) is "[bracket]Il n'y a rien à faire.[close bracket]".
parser nothing error internal rule response (B) is "[bracket]Rien [if the story tense is the future tense]ne sera[else]n['][adapt the verb es for bg][end if] disponible.[close bracket]".
parser nothing error internal rule response (C) is "[regarding the noun][Il] [adapt the verb sembles for bg] appartenir [au noun].".
parser nothing error internal rule response (D) is "[regarding the noun][Il] [negate the verb peux for bg] contenir quelque chose.".
parser nothing error internal rule response (E) is "[The noun] [negate the verb es for bg] [ouvert].".
parser nothing error internal rule response (F) is "[The noun] [adapt the verb es for bg] [vide].".

parser command internal rule response (A) is "[bracket]Désolé, impossible de corriger.[close bracket]".
parser command internal rule response (B) is "[bracket]N'y pensez même pas.[close bracket]".
parser command internal rule response (C) is "[bracket]«[_]Euh[_]» ne peut corriger qu'un seul mot.[close bracket]".
parser command internal rule response (D) is "[bracket]Vous pouvez difficilement répéter cela.[close bracket]".

[TODO : Ici aussi, les deux réponses suivantes devraient avoir des crochets, mais on ne pas car la fin est affichée avec I6.]
parser clarification internal rule response (A) is "Précisez[_]: ".
parser clarification internal rule response (B) is "Précisez[_]: ".
parser clarification internal rule response (C) is "[bracket]Désolé, il peut y avoir seulement un objet ici. Lequel voulez-vous exactement[_]?[close bracket]".
parser clarification internal rule response (D) is "[bracket]Pouvez-vous préciser ce qui est concerné par cette action[_]?[close bracket]".
parser clarification internal rule response (E) is "[bracket]Pouvez-vous préciser ce qui est concerné par cette action[_]?[close bracket]".
parser clarification internal rule response (F) is "ces choses".
parser clarification internal rule response (G) is "cela".
parser clarification internal rule response (H) is " ou ".

Section 3.1.1.15 - Yes or no question internal rule

[TODO : Enlever les crochets ? Car si c'est un personnage qui pose la question, alors ça ne fonctionne pas. En même temps, l'auteur n'aura qu'à modifier selon ses besoins.]
yes or no question internal rule response (A) is "[bracket]Répondez par oui ou par non.[close bracket] ".

Section 3.1.1.16 - Print protagonist internal rule

print protagonist internal rule response (A) is "[Tu]".
print protagonist internal rule response (B) is "[toi]-même[if the player is plural-named]s[end if]".
print protagonist internal rule response (C) is "[ton] [ancien] [toi]".

Section 3.1.1.17 - Standard implicit taking rule

standard implicit taking rule response (A) is "(prenant d'abord [the noun])[command clarification break]".
standard implicit taking rule response (B) is "([the second noun] prenant d'abord [the noun])[command clarification break]".

Section 3.1.1.18 - Player's obituary

print obituary headline rule response (A) is " [Tu] [adapt the verb es for bg] [mort] ".
print obituary headline rule response (B) is " Vous avez gagné ".
print obituary headline rule response (C) is " Fin ".

Section 3.1.1.19 - Standard actions which happen out of world

[Undoing (though not technically an action)]
immediately undo rule response (A) is "[bracket]L'utilisation de la commande «[_]annuler[_]» n'est pas autorisée dans ce jeu.[close bracket]".
immediately undo rule response (B) is "[bracket]Vous ne pouvez pas annuler alors que rien n'a encore été fait.[close bracket]".
immediately undo rule response (C) is "[bracket]Votre interpréteur ne permet pas d'annuler. Désolé[_]![close bracket]".
immediately undo rule response (D) is "[bracket]Impossible d'annuler. Désolé[_]![close bracket]".
immediately undo rule response (E) is "[bracket]Action précédente annulée.[close bracket]".

[Quitting the game]
[TODO : besoin des crochets ici ?]
quit the game rule response (A) is "[bracket]Voulez-vous vraiment quitter[_]?[close bracket] ".

[Saving the game]
save the game rule response (A) is "[bracket]La sauvegarde a échoué.[close bracket]".
save the game rule response (B) is "[bracket]La partie a bien été sauvegardée.[close bracket]".

[Restoring the game]
restore the game rule response (A) is "[bracket]Le chargement a échoué.[close bracket]".
restore the game rule response (B) is "[bracket]La sauvegarde a bien été chargée[close bracket]".

[Restarting the game]
[TODO : besoin des crochets ici ?]
restart the game rule response (A) is "[bracket]Voulez-vous vraiment recommencer[_]?[close bracket] ".
[TODO : Préciser ce qui a échoué, comme lors de sauvegardes ou des chargements ?]
restart the game rule response (B) is "[bracket]Échec.[close bracket]".

[Verifying the story file]
verify the story file rule response (A) is "[bracket]Le fichier semble intact.[close bracket]".
verify the story file rule response (B) is "[bracket]Le fichier est probablement corrompu.[close bracket]".

[Switching the story transcript on]
switch the story transcript on rule response (A) is "[bracket]Une transcription est déjà en cours.[close bracket]".
[TODO : Mettre des crochets pour cette réponse ? Étant donné que ça affiche la bannière juste après…]
switch the story transcript on rule response (B) is "Début d'une transcription de…".
switch the story transcript on rule response (C) is "[bracket]Impossible de commencer la transcription.[close bracket]".

[Switching the story transcript off]
switch the story transcript off rule response (A) is "[bracket]Aucune transcription n'est en cours.[close bracket]".
switch the story transcript off rule response (B) is "[line break][bracket]Fin de la transcription.[close bracket]".
switch the story transcript off rule response (C) is "[bracket]Impossible de terminer la transcription.[close bracket]".

[Requesting the score]
[TODO : Mettre des crochets ? Car je ne sais pas si c'est possible de prendre en compte si des rangs ont été définis ou pas.]
announce the score rule response (A) is "[if the story has ended]Dans cette partie, vous avez obtenu[otherwise]Vous avez jusqu'à présent obtenu[end if] un score de [score] sur un total possible de [maximum score], en [turn count] tour[s]".
announce the score rule response (B) is ", ce qui vous donne le rang de ".
announce the score rule response (C) is "[bracket]Il n'y a pas de score dans cette histoire.[close bracket]".
announce the score rule response (D) is "[bracket]Votre score vient d'augmenter de [number understood in words] point[s].[close bracket]".
announce the score rule response (E) is "[bracket]Votre score vient de diminuer de [number understood in words] point[s].[close bracket]".

[Preferring abbreviated room descriptions, preferring unabbreviated room descriptions, preferring sometimes abbreviated room descriptions]
[Les crochets sont directements affichés avec I6, puisqu'on ne peut pas mettre le crochet ouvrant avec I7 (voir plus bas pour le code I6).]
standard report preferring abbreviated room descriptions rule response (A) is " est passé en mode «[_]description courte[_]»[_]; tous les lieux, même ceux étant visités pour la première fois, seront décrits brièvement.".
standard report preferring unabbreviated room descriptions rule response (A) is " est passé en mode «[_]description longue[_]»[_]; tous les lieux, même ceux qui ont déjà été visités, seront décrits en détail.".
standard report preferring sometimes abbreviated room descriptions rule response (A) is " est passé en mode «[_]description normale[_]»[_]; seuls les lieux visités pour la première fois seront décrits en détail.".

[Switching score notification on/off]
standard report switching score notification on rule response (A) is "[bracket]Les notifications du score ont été activées.[close bracket]".
standard report switching score notification off rule response (A) is "[bracket]Les notifications du score ont été désactivées.[close bracket]".

[Requesting the pronoun meanings]
[Idem, les crochets sont en I6.]
announce the pronoun meanings rule response (A) is "Pour l'instant, ".
announce the pronoun meanings rule response (B) is "signifie ".
announce the pronoun meanings rule response (C) is "n'est pas défini".
announce the pronoun meanings rule response (D) is "aucun pronom n'a été défini.".

Chapter 3.1.2 - In Rideable Vehicles (for use with Rideable Vehicles by Graham Nelson)

[And now the responses from this extension. You can get a full set of these by
trying out the English source text

	Include Rideable Vehicles by Graham Nelson.
	The Amphitheatre is a room.

and then typing the command:

	RESPONSES SET 2

This produces text which can be pasted in here before being translated.]


[ajout]
can't mount when mounted on an animal rule response (A) is "[Tu es-étais] déjà sur [the steed].".
can't mount when mounted on a vehicle rule response (A) is "[Tu es-étais] déjà sur [the conveyance].".
can't mount something unrideable rule response (A) is "[Tu] [negate the verb peux for bg] monter sur [the noun].".
standard report mounting rule response (A) is "[Tu] [vas] sur [the noun].".
standard report mounting rule response (B) is "[The actor] [vas] sur [the noun].".
mounting excuses rule response (A) is "[The person asked] [adapt the verb es for bg] déjà sur [the steed].".
mounting excuses rule response (B) is "[The person asked] [adapt the verb es for bg] déjà sur [the conveyance].".
mounting excuses rule response (C) is "[The person asked] [adapt the verb peux for bg] monter sur [the noun].".
can't dismount when not mounted rule response (A) is "[Tu] [negate the verb es for bg] sur quelque chose.".
standard report dismounting rule response (A) is "[Tu] [descends] [du noun].[line break][run paragraph on]".
standard report dismounting rule response (B) is "[The actor] [descends] [du noun].".
dismounting excuses rule response (A) is "[The person asked] [negate the verb es for bg] sur quelque chose.".

Chapter 3.1.3 - In Locksmith (for use with Locksmith by Emily Short)

[ajout]

In French assurer is a verb.

opening doors before entering rule response (A) is "(ouvrant d'abord [the blocking door])[command clarification break]".
closing doors before locking rule response (A) is "(fermant d'abord [the door ajar])[command clarification break]".
closing doors before locking keylessly rule response (A) is "(fermant d'abord [the door ajar])[command clarification break]".
unlocking before opening rule response (A) is "(déverrouillant d'abord [the sealed chest])[command clarification break]".
standard printing key lack rule response (A) is "[Tu] [negate the verb as for bg] la clef correspondant [au locked-thing].".
right second rule response (A) is "[regarding the second noun][Il] [negate the verb entres for bg] dans la serrure.".
standard keylessly unlocking rule response (A) is "(avec [the key unlocked with])[command clarification break]".
standard keylessly locking rule response (A) is "(avec [the key locked with])[command clarification break]".
identify passkeys in inventory rule response (A) is " (ouvrant [the list of things unbolted by the item])".
passkey description rule response (A) is "[The noun] [adapt the verb ouvres for bg] [the list of things unbolted by the noun].".
limiting keychains rule response (A) is "[The noun] [negate the verb es for bg] une clef.".

[TODO: Les deux réponses ci-dessous provoquent une erreur, car I7 pense que le verbe dans ces déclarations est « have » plutôt que « is ».
Pour contourner ce bug, on change la réponse dans une « when play begins », en stockant d'abord la réponse dans une variable temporaire puis en utilisant cette variable pour changer la réponse. Ainsi coupée en deux étapes, il ne peut plus y avoir de confusion de verbe.]
[must have accessible the noun rule response (A) is "[Tu] ne [peux] rien faire [si tu] [ne tiens pas] [the noun].";
must have accessible the second noun rule response (A) is "[Tu] ne [peux] rien faire [si tu] [ne tiens pas] [the second noun].".]
When play begins:
	let R be the must have accessible the noun rule response (A);
	now R is "[Tu] ne [peux] rien faire [si tu] [ne tiens pas] [the noun].";
	let R be the must have accessible the second noun rule response (A);
	now R is "[Tu] ne [peux] rien faire [si tu] [ne tiens pas] [the second noun]."

Section 3.1.3.1 - Locksmith debug commands - Not for release

lock debugging rule response (A) is "[bracket]Déverrouillage [du item].[close bracket]".
report universal unlocking rule response (A) is "[bracket]Un fort clic stéréophonique vous assure que tout dans le jeu a été déverrouillé.[close bracket]".

Chapter 3.1.4 - In Basic Screen Effects (for use with Basic Screen Effects by Emily Short)

standard pausing the game rule response (A) is "[paragraph break][bracket]Appuyez sur ESPACE pour continuer.[close bracket]"

Chapter 3.1.5 - In Inanimate Listeners (for use with Inanimate Listeners by Emily Short)

[ajout]
unsuccessful persuasion of inanimate objects rule response (A) is "[The target] [negate the verb peux for bg] faire tout ce que quelqu'un [regarding nothing][adapt the verb peux for bg] accomplir.".

Chapter 3.1.6 - In Skeleton Keys (for use with Skeleton Keys by Emily Short)

[ajout]
right second rule response (A) is "[Tu] [negate the verb portes for bg] [the second noun].".
right second rule response (B) is "[regarding the second noun][Il] [negate the verb entres for bg] dans la serrure.".

Chapter 3.1.7 - In Epistemology (for use with Epistemology by Eric Eve)

[ajout]
report epistemic status rule response (A) is "[bracket][noun] - [if seen]vu[otherwise]non vu[end if] / [if familiar]familier[otherwise]non familier[end if] / [if known]connu[otherwise]inconnu[end if].[bracket]".

Part 3.2 - The Final Question

Table of Final Question Options (replaced)
final question wording	only if victorious	topic	final response rule	final response activity
"RECOMMENCER"	false	"recommencer"	immediately restart the VM rule	--
"CHARGER une partie sauvegardée"	false	"charger"	immediately restore saved game rule	--
"lire quelques SUGGESTIONS amusantes"	true	"suggestions/suggestion"	--	amusing a victorious player
"QUITTER"	false	"quitter"	immediately quit rule	--
"ANNULER la dernière commande "	false	"annuler/undo"	immediately undo rule	--

Part 3.3 - Description of the player

Section 3.3.1 - People (in place of Section SR1/11 - People in Standard Rules by Graham Nelson)

A person can be female or male. A person is usually male.
A person can be neuter. A person is usually not neuter.

A person has a number called carrying capacity.
The carrying capacity of a person is usually 100.

Include (-
	has transparent animate
	with before NULL,
-) when defining a person.

The yourself is an undescribed person. The yourself is proper-named.

The yourself is privately-named.
Understand "your former self" or "my former self" or "former self" or
	"former" as yourself when the player is not yourself.

The description of yourself is usually "[Tu es-étais] comme d'habitude."

The yourself object translates into I6 as "selfobj".
Include (-
	with saved_short_name (+ "yourself" +),
-) when defining yourself.

Part 3.4 - The banner

Include (-
[ Banner;
	BeginActivity(PRINTING_BANNER_TEXT_ACT);
	if (ForActivity(PRINTING_BANNER_TEXT_ACT) == false) {
		VM_Style(HEADER_VMSTY);
		TEXT_TY_Say(Story);
		VM_Style(NORMAL_VMSTY);
		new_line;
		TEXT_TY_Say(Headline);
		#ifdef Story_Author;
		print " par "; TEXT_TY_Say(Story_Author);
		#endif; ! Story_Author
		new_line;
		VM_Describe_Release();
		print " / Inform 7 build ", (PrintI6Text) NI_BUILD_COUNT, " ";
		print "(I6/v"; inversion;
		print " lib ", (PrintI6Text) LibRelease, ") ";
		#Ifdef STRICT_MODE;
		print "S";
		#Endif; ! STRICT_MODE
		#Ifdef DEBUG;
		print "D";
		#Endif; ! DEBUG
		new_line;
	}
	EndActivity(PRINTING_BANNER_TEXT_ACT);
];
-) instead of "Banner" in "Printing.i6t".

Part 3.5 - The bibliographical data

Section 3.5.1 - The bibliographical data - Unindexed (in place of Section SR2/6a - Unindexed Standard Rules variables - Unindexed in Standard Rules by Graham Nelson)

The story title, the story author, the story headline, the story genre and the story description are text variables.
The release number and the story creation year are number variables.

The release number is usually 1.
The story title is usually "Sans titre".
The story author is usually "Anonyme".
The story headline is usually "Une fiction interactive".
The story genre is usually "Fiction".

The story title variable translates into I6 as "Story".

Part 3.6 - Rule replacements

[Permet d'écrire "Le coffre contient un lingot" plutôt que "Dans le coffre est un lingot", qui est plutôt littéraire et inesthétique.]
The French examine containers rule is listed instead of the examine containers rule in the carry out examining rulebook.

This is the French examine containers rule:
	if the noun is a container:
		if the noun is open or the noun is transparent:
			if something described which is not scenery is in the noun and something which
				is not the player is in the noun:
				say "[The noun] [adapt the verb contiens for bg] " (A);
				list the contents of the noun, as a sentence, tersely, not listing
					concealed items;
				say ".";
				now examine text printed is true;
			otherwise if examine text printed is false:
				if the player is in the noun:
					make no decision;
				say "[The noun] [adapt the verb es for bg] [vide]." (B);
				now examine text printed is true.

[Permet d'écrire "Il y a un journal sur la table" plutôt que "Sur la table est un journal", qui est plutôt littéraire et inesthétique.]
The French examine supporters rule is listed instead of the examine supporters rule in the carry out examining rulebook.

This is the French examine supporters rule:
	if the noun is a supporter:
		if something described which is not scenery is on the noun and something which is
			not the player is on the noun:
			say "Il y [adapt the verb as for bg] " (A);
			list the contents of the noun, as a sentence, tersely, not listing
				concealed items, including contents,
				giving brief inventory information;
			say " sur [the noun]." (B);
			now examine text printed is true.

[Permet d'écrire "Le coffre contient un lingot" plutôt que "Dans le coffre est un lingot", qui est plutôt littéraire et inesthétique.]
The French standard search containers rule is listed instead of the standard search containers rule in the report searching rulebook.

Report searching a container (this is the French standard search containers rule):
	if the noun contains a described thing which is not scenery:
		say "[The noun] [adapt the verb contiens for bg] " (A);
		list the contents of the noun, as a sentence, tersely, not listing
			concealed items;
		say ".";
	otherwise:
		say "[The noun] [adapt the verb es for bg] [vide]." (B).

[Permet d'écrire "Il y a un journal sur la table" plutôt que "Sur la table est un journal", qui est plutôt littéraire et inesthétique.]
The French standard search supporters rule is listed instead of the standard search supporters rule in the report searching rulebook.

Report searching a supporter (this is the French standard search supporters rule):
	if the noun supports a described thing which is not scenery:
		say "Il y [adapt the verb as for bg] " (A);
		list the contents of the noun, as a sentence, tersely, not listing
			concealed items;
		say " sur [the noun]." (B);
	otherwise:
		say "Il n'y [adapt the verb as for bg] rien sur [the noun]." (C).

[Permet de changer la réponse de l'action "enter" en fonction des mots dans la commande du joueur.]
The French can't enter what's not enterable rule is listed instead of the can't enter what's not enterable rule in the check entering rulebook.

Check an actor entering (this is the French can't enter what's not enterable rule):
	if the noun is not enterable:
		if the player is the actor:
			if the player's command includes "asseoir":
				say "[Tu] [negate the verb peux for bg] [t'-s']y asseoir." (A);
			otherwise if the player's command includes "dans":
				say "[Tu] [negate the verb peux for bg] y entrer." (B);
			otherwise if the player's command includes "allonger" or the player's command includes "coucher":
				say "[Tu] [negate the verb peux for bg] [t'-s']y allonger." (C);
			otherwise:
				say "[Tu] [negate the verb peux for bg] y aller." (D);
		stop the action.


[Pour afficher les crochets quand on change l'abrègement des descriptions.]
Include (-
[ REP_PREFER_SOMETIMES_ABBR_R;
	if (actor ~= player) rfalse;
	print "[", (TEXT_TY_Say) Story; REP_PREFER_SOMETIMES_ABBR_RM('A'); print "]"; new_line;
]; ! Brief
-) instead of "Standard Report Prefer Sometimes Abbreviated Room Descriptions Rule" in "OutOfWorld.i6t".

Include (-
[ REP_PREFER_UNABBREVIATED_R;
	if (actor ~= player) rfalse;
	print "[", (TEXT_TY_Say) Story; REP_PREFER_UNABBREVIATED_RM('A'); print "]"; new_line;
]; ! Verbose
-) instead of "Standard Report Prefer Unabbreviated Room Descriptions Rule" in "OutOfWorld.i6t".

Include (-
[ REP_PREFER_ABBREVIATED_R;
	if (actor ~= player) rfalse;
	print "[", (TEXT_TY_Say) Story; REP_PREFER_ABBREVIATED_RM('A'); print "]"; new_line;
]; ! Superbrief
-) instead of "Standard Report Prefer Abbreviated Room Descriptions Rule" in "OutOfWorld.i6t".


[Permet d'afficher des guillemets français (chevrons) à la place des guillemets droits pour le listage des pronoms de l'action « requesting the pronouns meaning ».]
Include (-
! Pour afficher les pronoms de LanguagePronouns sans le trait d'union. (Ils sont définis avec trait d'union pour qu'il n'y ait pas d'ambiguïté avec les déterminants.)
! TODO: On garde le trait d'union de « -lui » (COI, comme « je lui donne ») pour le différencier de « lui » (disjoint, comme dans « à lui/à elle ». Trouver un meilleur moyen de montrer la différence ?.
[ PronounWithoutHyphen pronoun;
	switch(pronoun) {
		'-le': print "le";
		'-la': print "la";
		'-l^': print "l'";
		'-les': print "les";
		! '-lui': print "lui";
		'-leur': print "leur";
		'-en': print "en";
		'-y': print "y";
		default: print (address) pronoun;
	}
];

[ ANNOUNCE_PRONOUN_MEANINGS_R x y c d;
	if (actor ~= player) rfalse;
	print "["; ANNOUNCE_PRONOUN_MEANINGS_RM('A');

	c = (LanguagePronouns-->0)/3;
	if (player ~= selfobj) c++;

	if (c==0) { ANNOUNCE_PRONOUN_MEANINGS_RM('D'); rtrue; }

	for (x = 1, d = 0 : x <= LanguagePronouns-->0: x = x+3) {
		print "@<<@{A0}", (PronounWithoutHyphen) LanguagePronouns-->x, "@{A0}@>> "; ! Cette ligne a été modifiée.
		y = LanguagePronouns-->(x+2);
		if (y == NULL) ANNOUNCE_PRONOUN_MEANINGS_RM('C');
		else { ANNOUNCE_PRONOUN_MEANINGS_RM('B'); print (the) y; }
		d++;
		if (d < c-1) print ", ";
		if (d == c-1) {
			#ifdef SERIAL_COMMA; print ","; #endif;
			LIST_WRITER_INTERNAL_RM('C');
		}
	}
	if (player ~= selfobj) {
		print "@<<@{A0}", (address) ME1__WD, "@{A0}@>> "; ANNOUNCE_PRONOUN_MEANINGS_RM('B'); ! Cette ligne a été modifiée.
		c = player; player = selfobj;
		print (the) c; player = c;
	}
	".]";
];
-) instead of "Announce Pronoun Meanings Rule" in "OutOfWorld.i6t".


[Cette routine est utilisée dans une règle « for asking which do you mean » plus bas pour afficher une espace insécable avant le point d'interrogation.
Le code est un morceau du paragraphe « Noun Domain » de Parser.i6t, avec juste l'espace en plus.
TODO : On pourrait remplacer tout le paragraphe mentionné plutôt que d'utiliser une règle « which do you mean », mais il faudrait alors le recopier en entier juste pour modifier ce petit morceau. Le défaut en faisant comme on fait est qu'on a du code dupliqué (la version originale et cette version) dans la source I6 finale. La meilleure solution serait de faire un rapport de bug pour que le point d'interrogation devienne une réponse modifiable depuis I7.]
Include (-
[ FrenchForAskingWhichDoYouMean  i j k marker;
	j = 1; marker = 0;
	for (i=1 : i<=number_of_classes : i++) {
		while (((match_classes-->marker) ~= i) && ((match_classes-->marker) ~= -i))
			marker++;
		if (match_list-->marker hasnt animate) j = 0;
	}
	if (j) PARSER_CLARIF_INTERNAL_RM('A');
	else PARSER_CLARIF_INTERNAL_RM('B');

	j = number_of_classes; marker = 0;
	for (i=1 : i<=number_of_classes : i++) {
		while (((match_classes-->marker) ~= i) && ((match_classes-->marker) ~= -i)) marker++;
		k = match_list-->marker;

		if (match_classes-->marker > 0) print (the) k; else print (a) k;

		if (i < j-1)  print ", ";
		if (i == j-1) {
			#Ifdef SERIAL_COMMA;
			if (j ~= 2) print ",";
			#Endif; ! SERIAL_COMMA
			PARSER_CLARIF_INTERNAL_RM('H');
		}
	}
	print "@{A0}?^";
];
-)

[Pour exposer la routine ci-dessus.]
To print the French which do you mean question:
	(- FrenchForAskingWhichDoYouMean(); -)

For asking which do you mean (this is the add a non-breaking space to the disambiguation question rule):
	print the French which do you mean question;

Volume 4 - Command parsing

Part 4.1 - Pronouns and possessives in commands

Include (-
Array LanguagePronouns table

	! word       possible GNAs                   connected
	!             to follow:                      to:
	!             a     i
	!             s  p  s  p
	!             mfnmfnmfnmfn                 

	! Object pronouns
	'-le'    $$100000100000                    NULL
	'-la'    $$010000010000                    NULL
	'-l^'    $$110000110000                    NULL
	'-les'   $$000110000110                    NULL
	'-lui'   $$110000000000                    NULL ! Ce "-lui" correspond au COI comme "lui parler" et peut être masculin ou féminin.
	'-leur'  $$000110000000                    NULL
	'-en'    $$000000110110                    NULL
	'-y'     $$000000110110                    NULL

	! On ne met pas les pronoms sans trait d'union, sinon les déterminants le/la/les viennent parfois interférer.
	! Exemple : "manger la pomme" est compris comme "manger -la" si "pomme" est inconnu, d'où des messages d'erreur troublants pour le joueur.
	  
	! Disjunctive pronouns
	'lui'    $$100000100000                    NULL ! Ce "lui" ne peut être que masculin (comme c'est à lui/à elle).
	'elle'   $$010000010000                    NULL
	'eux'    $$000110000110                    NULL
	'elles'  $$000010000010                    NULL
;
-) instead of "Pronouns" in "Language.i6t".

Include (-
! TODO: Ajouter les déterminants démonstratifs ? (ce, cet, cette.)

Array LanguageDescriptors table
	! word       possible GNAs   descriptor      connected
	!             to follow:      type:           to:
	!             a     i
	!             s  p  s  p
	!             mfnmfnmfnmfn                 

	'mon'    $$100000100000    POSSESS_PK      0  !*! ce qui suit ne doit pas fonctionner souvent
	'ma'     $$010000010000    POSSESS_PK      0  !*! du moins je l'espère car mon/ma/mes devrait
	'mes'    $$000110000110    POSSESS_PK      0  !*! changer en fonction du type de parole
	'ton'    $$100000100000    POSSESS_PK      0  !*!
	'ta'     $$010000010000    POSSESS_PK      0  !*! (quoique ça a l'air tres tolerant)
	'tes'    $$000110000110    POSSESS_PK      0  !*!
	'notre'  $$110000110000    POSSESS_PK      0  !*!
	'nos'    $$000110000110    POSSESS_PK      0  !*!
	'votre'  $$110000110000    POSSESS_PK      0  !*!
	'vos'    $$000110000110    POSSESS_PK      0  !*!
	'son'    $$100000100000    POSSESS_PK      '-lui' ! Il s'agit bien du "-lui" COI qui peut être masculin ou féminin. 
	'sa'     $$010000010000    POSSESS_PK      '-lui'
	'ses'    $$000110000110    POSSESS_PK      '-lui'
	'leur'   $$110000110000    POSSESS_PK      '-leur'
	'leurs'  $$000110000110    POSSESS_PK      '-leur'

	'le'     $$100000100000    DEFART_PK       NULL
	'la'     $$010000010000    DEFART_PK       NULL
	'l^'     $$110000110000    DEFART_PK       NULL
	'les'    $$000110000110    DEFART_PK       NULL
	'un'     $$100000100000    INDEFART_PK     NULL
	'une'    $$010000010000    INDEFART_PK     NULL
	'des'    $$000110000110    INDEFART_PK     NULL
;
-) instead of "Descriptors" in "Language.i6t".

Part 4.2 - Understand grammar

[Comme pour les réponses, certaines lignes de compréhension ont été ajoutées ou modifiées
De plus, la section a été revue pour la rendre plus lisible.]

Chapter 4.2.1 - New Grammar Tokens

Understand "de/du/des/d'" as "[de]".
Understand "->/a/au/aux" as "[à]".

Chapter 4.2.2 - Standard actions concerning the actor's possessions


Understand "inventaire" as taking inventory.

[Pour que « inv » et « i » soient synonymes d'« inventaire » plutôt que de « inventory ».]
Understand the command "inv" as something new.
Understand the command "i" as something new.
Understand the command "inv" and "i" as "inventaire".

Understand "prendre [things]" as taking.
Understand "lever [something]" as taking.
Understand the command "pr", "ramasser", "decoller" and "cueillir" as "prendre".
Understand the command "relever" and "soulever" as "lever".

Understand "retirer [things inside] [de] [something]" as removing it from.

Understand "deposer [things preferably held]", "deposer [things preferably held] sur/au le/-- sol", "deposer [things preferably held] par terre", "mettre [things preferably held] sur/au le/-- sol" or "mettre [things preferably held] par terre" as dropping.

Understand "deposer [other things] sur [something]" or "mettre [other things] sur [something]" as putting it on.

Understand "deposer [other things] dans [something]", "mettre [other things] dans [something]" or "inserer [other things] dans [something]" as inserting it into.

Understand the command "poser", "abandonner", "lacher", "laisser" as "deposer".

Understand "manger [something preferably held]" or "manger [de] [something preferably held]" as eating.
Understand the command "devorer", "grignoter", "mastiquer" and "ingerer" as "manger".

Chapter 4.2.3 - Standard actions which move the actor

Understand "aller" as going.
Understand "aller ->/a/au/aux/en/vers/par [direction]" or "aller [direction]" as going.
Understand "prendre vers [direction]" or "prendre [direction]" as going.
Understand the command "marcher", "courir", "passer", "fuir", "suivre", "emprunter" and "franchir" as "aller".

Understand "entrer dans/par/-- [something]" as entering.
Understand "aller ->/a/au/aux/en/vers/par/dans/sur/sous/-- [something]" as entering.
Understand "monter ->/a/au/aux/en/vers/par/dans/sur/sous/-- [something]" as entering.
Understand "asseoir vous dans/sur/-- [something]" or "asseoir vous en haut [de] [something]" as entering.
Understand the command "rentrer" as "entrer".
Understand the command "remonter" as "monter".
Understand the command "allonger" and "coucher" as "asseoir".

Understand "sortir", "sortir de la", "sortir d' ici" or "dehors" as exiting.
Understand the command "partir" as "sortir".

Understand "descendre [de] [something]" as getting off.
Understand the command "redescendre" as "descendre". [ajout]

Chapter 4.2.4 - Standard actions concerning the actor's vision

Understand "regarder autour/--" as looking.

Understand "regarder [something]", "examiner [something]" and "lire [something]"  as examining.

Understand "regarder sous [something]" and "examiner sous [something]" as looking under.
Understand "regarder en sous -l' [de] [something]" as looking under. [modification: « regarder en dessous [de] [something] » ne fonctionnait pas à cause du code I6 qui remplace le mot « dessous » par « sous -l' ».]

Understand "regarder dans/sur/derriere [something]" and "examiner dans/sur/derriere [something]" as searching.
Understand "regarder a l'/-- interieur [de] [something]" as searching.
Understand "regarder a travers [something]" as searching.
Understand "chercher dans/sur/derriere/-- [something]" as searching.
Understand the command "fouiller" and "farfouiller" as "chercher".

Understand the command "x" as something new. [Pour que « x » soit synonyme de « examiner » plutôt que de « examine ».]
Understand the command "x" as "examiner".
Understand the command "decrire", "observer", "r", "v" and "voir" as "regarder".

Understand "consulter [text] dans [something]" as consulting it about (with nouns reversed).
Understand "consulter [something] au sujet [de] [text]", "consulter [something] a propos [de] [text]" or "consulter [something] a/sur [text]" as consulting it about.
Understand "lire [something] au sujet [de] [text]", "lire [something] a propos [de] [text]" or "lire [something] a/sur [text]" as consulting it about. [ajout]

Chapter 4.2.5 - Standard actions which change the state of things

Understand "fermer [something] avec [something preferably held]", "verrouiller [something] avec [something preferably held]", "fermer [something] a cle/clef" or "fermer a cle/clef [something]" as locking it with.

Understand "ouvrir [something] avec [something preferably held]" or "deverrouiller [something] avec [something preferably held]" as unlocking it with.

Understand "allumer [something]", "mettre [something] en marche/route" or "mettre en marche/route [something]" as switching on.
Understand the command "demarrer" and "commuter" as "allumer".

Understand "eteindre [something]" as switching off.
Understand the command "arreter" as "eteindre".

Understand "ouvrir [something]" as opening.
Understand the command "forcer" as "ouvrir".

Understand "fermer [something]" as closing.

Understand "revetir [something preferably held]", "mettre [something preferably held]" or "habiller vous de/du/des/d'/avec [something preferably held]" as wearing.
Understand the command "enfiler" as "revetir".

Understand "enlever [something preferably held]" as taking off.

Chapter 4.2.6 - Standard actions concerning other people

Understand "donner [something preferably held] [à] [someone]" as giving it to.
Understand "donner [à] [someone] [something preferably held]" as giving it to (with nouns reversed).
Understand "nourrir [someone] avec [something preferably held]" as giving it to (with nouns reversed).
Understand the commands "payer", "offrir" and "remettre" as "donner".

Understand "montrer [something] [à] [someone]"  as showing it to.
Understand the command "presenter" and "pointer" as "montrer".

Understand "reveiller [someone]" as waking.
Understand the command "eveiller" as "reveiller".

Understand "lancer [something preferably held] vers/a/au/aux/sur/contre/dans [something]" or "lancer [something preferably held] en direction [de] [something]" as throwing it at.
Understand the command "jeter" as "lancer".

Understand "attaquer a/au/aux/contre/-- [something]" as attacking.
Understand "tuer [someone]" or "torturer [someone]" as attacking.
Understand the command "frapper", "cogner", "combattre", "briser", "detruire" and "casser" as "attaquer".

Understand "embrasser [someone]" as kissing.
Understand the command "etreindre" as "embrasser".

Understand "repondre [text] ->/a/au/aux [someone]" as answering it that (with nouns reversed).
Understand "repondre [à] [someone] que [text]" as answering it that. [ajout]
Understand the command "dire", "crier" and "hurler" as "repondre". [ajout]

[ajout]
Understand "raconter a propos [de] [text] ->/a/au/aux [someone]" as telling it about (with nouns reversed).
Understand "raconter [à] [someone] a propos [de] [text]" as telling it about.

Understand "questionner [someone] a propos [de] [text]", "questionner [someone] au sujet [de] [text]" or "questionner [someone] sur [text]" as asking it about.
Understand "demander [à] [someone] a propos [de] [text]", "demander [à] [someone] au sujet [de] [text]" or "demander [à] [someone] pour [text]" as asking it about. [ajout]

Understand "demander [something] [à] [someone]" as asking it for (with nouns reversed).

Chapter 4.2.7 - Standard actions which are checked but then do nothing unless rules intervene

Understand "attendre" as waiting.
Understand the command "a" or "patienter" as "attendre".

Understand "toucher [something]" as touching.
Understand the command "caresser", "tater" and "palper" as "toucher". [ajout de "palper".]

Understand "agiter [something]" as waving.
Understand the command "brandir" and "secouer" as "agiter".

Understand "tirer [something]" as pulling.
Understand the command "trainer" as "tirer".

Understand "pousser [something]" as pushing.
Understand "presser [device]" as pushing.
Understand "appuyer sur/-- [something]" as pushing.

Understand "tourner [something]" as turning.
Understand the command "devisser" and "visser" as "tourner".

Understand "pousser [something] a/en/au/vers [direction]" as pushing it to.
Understand the command "deplacer" and "bouger" as "pousser".

Understand "ecraser [something]" or "presser [something]" as squeezing.
Understand the command "tordre" and "comprimer" as "ecraser".

Chapter 4.2.8 - Standard actions which always do nothing unless rules intervene

Understand "oui" as saying yes.
Understand the command "ouais", "ok", "ouaip" and "yep" as "oui". [ajout de "ouais", de "ouaip" et de "ok".]

Understand "non" as saying no.

Understand "bruler [something]" or "mettre le feu [à] [something]" as burning.
Understand the command "embraser", "cramer" and "incendier" as "bruler".

Understand "reveiller vous" or "reveiller le joueur" as waking up.

Understand "penser" as thinking.
Understand the command "reflechir" as "penser".

Understand "sentir" as smelling.
Understand "sentir [something]" as smelling.
Understand the command "renifler" and "humer" as "sentir".

Understand "ecouter" as listening.
Understand "ecouter [something]" as listening.
Understand the command "entendre" as "ecouter".

Understand "gouter [something]" as tasting.

Understand "couper [something]" as cutting.
Understand the commands "decouper", "trancher" and "elaguer" as "couper". [correction : changement de "elager" en "elaguer"]

Understand "sauter" as jumping.
Understand the command "bondir" as "sauter".

Understand "nouer [something] ->/a/au/aux/avec/sur [something]" as tying it to.
Understand the command "attacher", "fixer", "connecter" and "brancher" as "nouer".

Understand "boire du/de/dans/a/au/aux/-- [something]" as drinking.
Understand the command "avaler" and "siroter" as "boire".
[TODO: bizarre que « avaler » soit pour boire. Si on avale une clef, ce serait mieux de rediriger vers « manger » (ceci étant, c'est comme ça en anglais aussi).]

Understand "desole" or "excuser vous" as saying sorry. [ajout de "excuser vous"]
Understand  the command "pardon" as "desole". [ajout]

Understand "balancer [something]" or "balancer vous a/au/aux/sur [something]" as swinging.
Understand the command "pendre", "suspendre" and "osciller" as "balancer".

Understand "frotter [something]" as rubbing.
Understand the commands "cirer", "astiquer", "balayer", "nettoyer", "depoussierer", "essuyer" and "recurer" as "frotter".

[modification : j'ai enlevé car ça n'apportait rien (si on le tape, ça affiche le message « Merci de reformuler. Je n'ai compris que : regler. », ce qui n'aide pas beaucoup le joueur.
Understand "regler" as setting it to.]
Understand "regler [something] sur [text]" as setting it to.
Understand the command "ajuster" as "regler".

Understand "agiter la/les/ma/mes/sa/ses/votre/vos main/mains" as waving hands.
Understand "saluer" or "saluer avec la main" as waving hands.

Understand "acheter [something]" as buying.

Understand "grimper a/au/aux/par/dans/sur/-- [something]" or "grimper par sur -l' [something]" as climbing. [modification : idem que « regarder dessous ».]
Understand the command "gravir" and "escalader" as "grimper".

Understand "dormir" as sleeping.
Understand the command "somnoler" as "dormir".

Chapter 4.2.9 - Standard actions which happen out of world

Understand "quitter" as quitting the game.

Understand "sauver" or "sauvegarder" as saving the game.

Understand "charger" or "restaurer" as restoring the game.

Understand "recommencer" as restarting the game.

Understand "mode court" as preferring abbreviated room descriptions.

Understand "mode long"  as preferring unabbreviated room descriptions.

Understand "mode normal" as preferring sometimes abbreviated room descriptions.

Understand "notifier" or "notification on" as switching score notification on.

Understand "notifier off" or "notification off" as switching score notification off.

Understand "pronoms" as requesting the pronoun meanings.

Chapter 4.2.10 - Miscellaneous

Understand "* [text]" as a mistake ("[bracket]Commentaire noté.[close bracket]").

Chapter 4.2.11 - In  Rideable Vehicles (for use with Rideable Vehicles by Graham Nelson)

Understand "chevaucher [something]" as mounting.
Understand "enfourcher [something]" as mounting.

Chapter 4.2.12 - In Locksmith (for use with Locksmith by Emily Short)

Understand the command "deverrouiller" as something new.
Understand "deverrouiller [something] avec [something]" as unlocking it with.
Understand "deverrouiller [a locked lockable thing] avec [something]" as unlocking it with.
Understand "deverrouiller [a lockable thing] avec [something]" as unlocking it with.

Understand the command "ouvrir" as something new.
Understand the command "forcer" as something new.
Understand "ouvrir [something]" as opening.
Understand "ouvrir [something] avec [something]" as unlocking it with.
Understand "ouvrir [a locked lockable thing] avec [something]" as unlocking it with.
Understand "ouvrir [a lockable thing] avec [something]" as unlocking it with.
Understand the command "forcer" as "ouvrir".

Understand "deverrouiller [something]" as unlocking keylessly.
Understand "deverrouiller [a locked lockable thing]" as unlocking keylessly.
Understand "deverrouiller [a lockable thing]" as unlocking keylessly.


Understand the command "verrouiller" as something new.
Understand "verrouiller [something] avec [something]" as locking it with.
Understand "verrouiller [an unlocked lockable thing] avec [something]" as locking it with.
Understand "verrouiller [a lockable thing] avec [something]" as locking it with.

Understand the command "fermer" as something new.
Understand "fermer [something]" as closing.
Understand "fermer [something] avec [something]" as locking it with.
Understand "fermer [a locked lockable thing] avec [something]" as locking it with.
Understand "fermer [a lockable thing] avec [something]" as locking it with.

Understand "verrouiller [something]" as locking keylessly.
Understand "verrouiller [an unlocked lockable thing]" as locking keylessly.
Understand "verrouiller [a lockable thing]" as locking keylessly.
Understand "fermer [something] a clef/cle" as locking keylessly.
Understand "fermer [an unlocked lockable thing] a clef/cle" as locking keylessly.
Understand "fermer [a lockable thing] a clef/cle" as locking keylessly.
Understand "fermer a clef/cle [something]" as locking keylessly.
Understand "fermer a clef/cle [an unlocked lockable thing]" as locking keylessly.
Understand "fermer a clef/cle [a lockable thing]" as locking keylessly.

Section 4.2.12.1 - Locksmith debug commands - Not for release

Understand "toutdeverrouiller" as universal unlocking.

Part 4.3 - Additional language-specific actions

[I've taken these directly from Eric Forgeot's "French", but in an ideal world,
we wouldn't need special actions in one language rather than another.]

[J'ai enlevé les actions lire, chanter, nager et parler pour rester le plus proche possible des Standard Rules. Les autres restent, car elles sont là pour des raisons de traduction.]

Chapter 4.3.1 - InGoing

InGoing is an action applying to nothing.
Understand "entrer" as InGoing.

Check an actor InGoing:
	convert to the going action on inside.

The specification of the InGoing action is "Cette action n'en est pas véritablement une : elle est dans tous les cas convertie en l'action 'going dedans' et existe uniquement pour que le joueur puisse taper le verbe 'entrer' plutôt que le nom de la direction. À cause de cela, c'est généralement une mauvaise idée d'écrire des règles pour cette action : si une règle telle que 'Instead of InGoing, ...' est écrite, alors elle ne s'appliquera pas si le joueur tape simplement 'aller dedans' ou 'dedans'. La meilleure façon de procéder est d'écrire une règle concernant l'action 'going dedans'."

Chapter 4.3.2 - OutGoing

OutGoing is an action applying to one thing.
Understand "sortir vers/a/au/aux/de/du/des/d' [something]" as OutGoing.

Check an actor OutGoing (this is the standard check outgoing rule):
	if the actor is not in the noun:
		if the actor is the player, say "Mais [tu] [n'es pas] dans [the noun][_]!" (A);
		stop the action;
	else if the actor is in the noun:
		convert to the exiting action on nothing;

Chapter 4.3.3 - DownGoing

DownGoing is an action applying to nothing.
Understand "descendre" as DownGoing.

The specification of the DownGoing action is "Cette action n'en est pas véritablement une : elle est dans tous les cas convertie en l'action 'getting off' si le joueur est sur un support et en l'action 'going bas' sinon. Elle existe uniquement pour que le joueur puisse taper le verbe 'descendre'. À cause de cela, c'est généralement une mauvaise idée d'écrire des règles pour cette action : si une règle telle que 'Instead of DownGoing, ...' est écrite, alors elle ne s'appliquera pas si le joueur tape simplement 'descendre de la plate-forme' ou 'bas' par exemple. La meilleure façon de procéder est d'écrire une règle concernant l'action 'going bas' ou 'getting off', selon le cas."

Section 4.3.3.1 - Without Rideable Vehicles (for use without Rideable Vehicles by Graham Nelson)

Check an actor DownGoing:
	if the actor is on a supporter (called S):
		convert to the getting off action on S;
	else:
		convert to the going action on down.

Section 4.3.3.2 - With Rideable Vehicles (for use with Rideable Vehicles by Graham Nelson)

[Permet de convertir l'action en « dismount » si le joueur est sur un animal ou un véhicule chevauchable.]
Check an actor DownGoing:
	if the actor is on a supporter (called S):
		convert to the getting off action on S;
	else if the actor is carried by a rideable vehicle or the actor is carried by a rideable animal:
		convert to the dismounting action on nothing;
	else:
		convert to the going action on down.

Chapter 4.3.4 - UpGoing

UpGoing is an action applying to nothing.
Understand "monter" as UpGoing.

Check an actor UpGoing:
	convert to the going action on up.

The specification of the UpGoing action is "Cette action n'en est pas véritablement une : elle est dans tous les cas convertie en l'action 'going haut' et existe uniquement pour que le joueur puisse taper le verbe 'monter' plutôt que le nom de la direction. À cause de cela, c'est généralement une mauvaise idée d'écrire des règles pour cette action : si une règle telle que 'Instead of UpGoing, ...' est écrite, alors elle ne s'appliquera pas si le joueur tape simplement 'aller en haut' ou 'haut'. La meilleure façon de procéder est d'écrire une règle concernant l'action 'going haut'."

Chapter 4.3.5 - UpStanding

UpStanding is an action applying to nothing.

Understand "debout" or "lever vous" as UpStanding.

Check an actor UpStanding (this is the standard check upstanding rule): 
	if the actor is in the location:
		if the actor is the player, say "Inutile." (A);
		stop the action;
	else:
		convert to the exiting action on nothing.

Part 4.4 - Clarifying the parser's choice of something

[Cette section sert à afficher la bonne préposition lorsque le parser choisit lui-même l'objet sur lequel va porter l'action.
Ex :
> parler
(au voisin)
Vous n'avez rien à dire.]

Rule for clarifying the parser's choice of something (called item) while entering and the player's command includes "asseoir":
	say "(sur [the item])[command clarification break]".

Part 4.5 - Actions specifications

[Traduit les descriptions des verbes dans l'index]

Chapter 4.4.1 - Standard actions concerning the actor's possessions

The specification of the taking inventory action is "Cette action fait l'inventaire des possessions de quelqu'un : les choses qu'il porte, soit directement soit dans des contenants qu'il porte. Quand le joueur effectue cette action, la liste de ce qu'il possède, ou un message spécial s'il ne porte rien, est affiché lors des règles 'carry out' ; rien ne se passe dans les règles 'report'. L'inverse se produit lorsque ce sont d'autres personnes qui effectuent cette action : rien ne se passe lors des règles 'carry out' mais un texte tel que 'Monsieur X fait l'inventaire de ses possessions' est affiché lors des règles 'report' (en supposant que Monsieur X est visible)."

The specification of the taking action is "Cette action est la seule façon dans les 'Standard Rules' que quelque chose est porté par quelqu'un. C'est une opération très simple (ses règles 'carry out' ne sont composées que de la phrase 'now the actor carries the noun') mais de nombreuses vérifications doivent être faites (dans les règles 'check') avant que cela puisse se passer."

The specification of the removing it from action is "Cette action n'en est pas véritablement une : alors qu'il y a beaucoup de moyens de poser quelque chose (par terre, sur autre chose, dans autre chose, le donner à quelqu'un, etc.), il n'y a qu'une seule façon de prendre quelque chose dans Inform, l'action 'taking'. L'action 'removing it from' existe uniquement afin de fournir des réponses appropriées à des demandes impossibles, et est convertie dans tous les autres cas en l'action 'taking'. À cause de cela, c'est généralement une mauvaise idée d'écrire des règles pour cette action : si une règle telle que 'Instead of removing la clef, ...' est écrite, alors elle ne s'appliquera pas si le joueur tape simplement 'prendre la clef'. La meilleure façon de procéder est d'écrire une règle concernant l'action 'taking', qui couvrira toutes les possibilités."

The specification of the dropping action is "Cette action est l'une des cinq actions permettant à un acteur de se débarrasser d'un objet qu'il porte, les autres étant 'inserting into' (mettre dans un contenant), 'putting on' (mettre sur un support), 'giving to' (donner à quelqu'un) et 'eating' (manger). L'action 'dropping' signifie 'poser un objet par terre', le plus souvent sur le sol de l'endroit où se trouve la personne, mais aussi éventuellement l'intérieur d'une boîte si la personne est dans celle-ci, et ainsi de suite.

La règle 'can't drop clothes being worn' essaie silencieusement l'action 'taking off' (enlever un vêtement) pour tout vêtement en train d'être posé : retirer cette règle enlève à la fois ce comportement et également la nécessité que les vêtements ne puissent simplement être posés."

The specification of the putting it on action is "Par cette action, une personne pose une chose qu'il tient sur un support : un exemple serait poser une pomme sur une table."

The specification of the inserting it into action is "Par cette action, une personne pose une chose qu'il tient dans un contenant : un exemple serait poser une pièce dans une boîte de collection."

The specification of the eating action is "Cette action est la seule, de toutes les actions incluses par défaut, pouvant détruire un objet : la règle 'carry out' déplace l'objet en train d'être mangé hors du jeu, et rien dans les 'Standard Rules' ne peut par la suite le récupérer."

Chapter 4.4.2 - Standard actions which move the actor

The specification of the going action is "C'est l'action permettant aux personnes de se déplacer d'un endroit à l'autre en utilisant n'importe quelles connexion ou porte à disposition. Les 'Standard Rules' sont écrites de telle sorte que le nom de cette action peut être une direction ou une porte située au même endroit que l'acteur : les commandes du joueur ne peuvent utiliser que des directions, mais l'action 'going' peut aussi résulter de l'action 'entering' ; dans ce cas-ci, le nom peut effectivement être une porte."

The specification of the entering action is "Alors que l'action 'going' permet à une personne de se déplacer d'un endroit à un autre, cette action est destinée aux mouvements au sein d'un même endroit : entrer dans une cage ou s'asseoir sur un canapé, par exemple (l'action 'entering' n'est pas autorisée à faire changer d'endroit, toute tentative d'entrer dans une porte est convertie en l'action 'going'). Ce qui rend cette action plus compliquée qu'il n'y paraît est le fait que le joueur puisse vouloir entrer dans un objet étant lui-même à l'intérieur ou faisant partie d'un autre objet, étant lui-même... et ainsi de suite. Pour garder en réalisme, la règle 'implicitly pass through other barriers' génère automatiquement les actions 'entering' et 'exiting' nécessaires pour passer tout ce qui pourrait se trouver sur le chemin de l'acteur : par exemple, dans un endroit avec deux cages A et B, un acteur dans la cage A et essayant d'aller dans la cage B devra d'abord sortir avant de pouvoir entrer dans celle-ci."

The specification of the exiting action is "Alors que l'action 'going' permet à une personne de se déplacer d'un endroit à un autre et que l'action 'entering' permet d'aller plus 'profondément' dans d'autres objets, cette action permet de revenir vers le sol principal de l'endroit. Sortir d'une armoire résultera en l'action 'exiting', par exemple. Si l'acteur nest déjà à l'intérieur de rien ou sur rien, et qu'un endroit est à l'extérieur de l'endroit actuel, l'action 'exiting' est automatiquement convertie en l'action 'going'. Enfin, il est à noter que, contrairement à l'action 'entering', cette action n'est utile que pour sortir d'un contenant : si l'acteur est sur un support, cette action est convertie en l'action 'getting off'."

The specification of the getting off action is "Cette action peut être utilisée lorsque l'acteur est sur un support : debout sur une plate-forme, assis sur un fauteuil ou même allongé sur un lit. Contrairement à l'action 'exiting', l'action 'getting off' requiert un nom : la plate-forme, le fauteuil ou le lit en question, par exemple."

Chapter 4.4.3 - Standard actions concerning the actor's vision

The specification of the looking action is "Cette action décrit l'endroit dans lequel se trouve le joueur ainsi que les objets visibles par celui-ci, mais est rendue plus compliquée par les problèmes de visibilité, justement. Inform la détermine en divisant l'endroit en 'niveaux de visibilité'. Pour un acteur sur le sol même de l'endroit, il n'y a qu'un seul de ces niveaux : l'endroit lui-même. Mais pour un acteur assis sur une chaise dans un contenant lui-même sur un portique de chargement aura quatre niveaux de visibilité : la chaise, le contenant, le portique et l'endroit. Les règles de l'action 'looking' utilisent une phrase spéciale, 'the visibility-holder of X', afin de 'monter' d'un niveau au suivant : le 'visibility holder of le contenant' est le portique.

Le 'visibility level count' est le nombre de niveaux que le joueur peut voir, et le 'visibility ceiling' est le niveau de visibilité visible le plus haut. Pour un joueur se tenant directement dans un endroit éclairé, le 'visibility level count' sera de 1 et le 'visibility ceiling' sera l'endroit. Un joueur assis sur une chaise dans un contenant fermé et opaque aura un 'visibility level count' de 2, et le 'visibility ceiling' sera le contenant. De plus, de la lumière est nécessaire afin de voir quelque chose : si le joueur est dans le noir, le 'level count' sera de 0 et le 'ceiling' sera la valeur 'nothing' (rien).

Enfin, il est à noter que des actions autres que 'looking'  produisent des descriptions d'endroits dans certains cas : l'action 'going', bien évidemment, mais aussi sortir d'un contenant ('exiting') ou descendre d'un support ('getting off') (la phrase utilisée pour cela est 'produce a room description with going spacing conventions', et des règles 'carry out' ou 'report' pour de nouvelles actions peuvent également l'utiliser si le besoin s'en fait sentir. Les conventions d'espace affectent les divisions des paragraphes, et la description d'un endroit peut ne pas s'afficher selon les réglages 'VERBOSE'). Les descriptions affichées par cette phrase sont produites un utilisant les règles 'check', 'carry out' et 'report' de l'action 'looking', mais ne sont pas affectées par les règles 'before', 'after' et 'instead' : elles ne comptent donc pas comme une nouvelle action. La variable de l'action 'looking' nommée 'room-describing action' stocke le nom de l'action produisant la description d'un endroit : si le joueur tape 'REGARDER', ce sera l'action 'looking', mais si le joueur tape 'ALLER VERS EST', ce sera l'action 'going'. Ceci peut être utilisé pour personnaliser les règles 'carry out' afin que des descriptions différentes soient produites selon que le joueur arrive dans l'endroit ou ne fait que regarder alors qu'il y est déjà."

The specification of the examining action is "L'action de regarder attentivement un objet de près. Il est à noter que le nom peut être une direction ou une chose, c'est pourquoi les 'Standard Rules' incluent la règle 'examine directions rule' pour gérer des directions : elle affiche simplement le message 'En dépit de vos efforts, vous ne voyez rien de particulier dans cette direction' et arrête l'action (pour gérer cela différemment, il est possible de remplacer cette règle par une autre dans les 'carry out examining rules').

Certaines choses n'ont pas de description, ou du moins une description vide. Il est dans ce cas quand même possible que quelque chose d'intéressant s'affiche (si le nom est un contenant, un support, un appareil ou une direction), mais dans le cas contraire, une réponse générique est affichée ; ceci est fait par la règle 'examine undescribed things rule'."

The specification of the looking under action is "Le monde standard créé par Inform ne connaît pas la notion d'être sous quelque chose, ce qui fait que cette action est fournie de manière minimale par les 'Standard Rules' ; elle n'existe que par tradition (et aussi car 'REGARDER SOUS LA TABLE' est une commande qu'il est logique de comprendre, même si rien d'intéressant ne se passe). Cette action affiche soit qu'il n'y a rien sous l'objet en question, soit qu'une autre personne regarde sous un objet, en fonction de qui exécute l'action.

La manière la plus simple de rendre cette action utile est d'écrire une règle telle que 'Instead of looking under la commode for the first time: now the
player has la clef d'argent; say ...' et ainsi de suite."

The specification of the searching action is "Cette action permet de regarder le contenu d'un contenant ouvert ou transparent, ou bien les choses sur un support. Cela est en général déjà mentionné dans les descriptions des endroits, ce qui rend cette action inutile, mais ce n'est pas le cas pour un objet ayant la propriété 'scenery'. Fouiller un tel objet permettrait alors de donner au joueur plus d'informations que ce que la description de l'endroit donnerait.

Les règles 'check' de cette action empêchent de fouiller autre chose que des contenants et des supports : les 'Standard Rules' n'autorisent donc pas à fouiller quelqu'un, par exemple. Cependant, il est facile d'ajouter des règles 'instead' ('Instead of searching Dr Watson: ...') ou même une nouvelle règle 'check' ('Check searching someone (called the suspect): ...') afin de modifier le comportement de cette action."

The specification of the consulting it about action is "Cette action est très flexible et potentiellement puissante, mais seulement parce qu'elle laisse pratiquement tout le travail à l'auteur pour la prendre en charge totalement. L'idée est de répondre à des commandes comme 'CONSULTER LE LIVRE D'HISTOIRE À PROPOS DE HENRY FITZROY', où le sujet serait la bribe de commande 'HENRY FITZROY' et la chose, le livre.

Les 'Standard Rules' répondent à cette action en affichant simplement que le joueur ne trouve rien d'intéressant. Les réponses intéressantes doivent être fournies par l'auteur, en utilisant des règles telles que 'Instead of consulting le livre d'histoire about...'"

Chapter 4.4.4 - Standard actions which change the state of things

The specification of the locking it with action is "L'action d'utiliser une clef afin que quelque chose comme une porte ou un contenant ne puisse plus être ouvert avant d'être déverrouillé (seules les choses fermées peuvent être verrouillées).

Cette action peut être effectuée sur n'importe quel type d'objet ayant les propriétés 'lockable/unlockable', 'locked/unlocked', 'openable/unopenable' et 'open/closed'. La règle 'can't lock without a lock rule' s'assure que l'objet possède les propriétés 'locked' et 'lockable'. Dans ce cas-ci, il est tenu pour acquis que les autres propriétés peuvent être vérifiées en toute sécurité. Dans les 'Standard Rules', les contenants et les portes satisfont ces conditions.

Il est donc possible de créer un nouveau type qui peut être ouvert, fermé, verrouillé et déverrouillé : 'Une valise is a kind of thing. Une valise can be openable.
Une valise can be open. Une valise can be lockable. Une valise can be
locked. Une valise is usually openable, lockable, open and unlocked'.

Inform vérifie si la clef correspond à ce qui est en train d'être verrouillé avec la règle 'can't lock without the correct
key rule'. L'acteur doit tenir directement le second objet (la clef, donc), qui doit être le 'matching key' de l'objet (cette propriété est rarement nommée directement, car elle est définie automatiquement par des assertions comme 'La clef d'argent ouvre le portillon').

Les 'Standard Rules' fournissent les actions 'locking it with' et 'unlocking it with' à un niveau assez basique : elles peuvent être améliorées en utilisant l'extension 'Locksmith' d'Emily Short, incluse avec Inform."

The specification of the unlocking it with action is "Cette action annule l'effet de l'action 'locking it with', et permet à l'objet d'être ouvert de nouveau, en assumant que l'acteur possède la bonne clef.

Cette action peut être effectuée sur n'importe quel type d'objet ayant les propriétés 'lockable/unlockable', 'locked/unlocked', 'openable/unopenable' et 'open/closed'. La règle 'can't unlock without a lock rule' s'assure que l'objet possède les propriétés 'locked' et 'lockable'. Dans ce cas-ci, il est tenu pour acquis que les autres propriétés peuvent être vérifiées en toute sécurité. Dans les 'Standard Rules', les contenants et les portes satisfont ces conditions.

Il est donc possible de créer un nouveau type qui peut être ouvert, fermé, verrouillé et déverrouillé : 'Une valise is a kind of thing. Une valise can be openable.
Une valise can be open. Une valise can be lockable. Une valise can be
locked. Une valise is usually openable, lockable, open and unlocked'.

Inform vérifie si la clef correspond à ce qui est en train d'être déverrouillé avec la règle 'can't unlock without the correct
key rule'. L'acteur doit tenir directement le second objet (la clef, donc), qui doit être le 'matching key' de l'objet (cette propriété est rarement nommée directement, car elle est définie automatiquement par des assertions comme 'La clef d'argent ouvre le portillon').

Les 'Standard Rules' fournissent les actions 'locking it with' et 'unlocking it with' à un niveau assez basique : elles peuvent être améliorées en utilisant l'extension 'Locksmith' d'Emily Short, incluse avec Inform."

The specification of the switching on action is "Cette action, avec 'switching off', est la plus simple façon d'interagir avec des machines (ou des objets faisant partie de machines) : les objets de type 'appareil' sont toujours considérés comme étant allumés ou éteints à un moment donné.

Ces actions peuvent également fonctionner avec n'importe quel autre type, tant qu'il possède la propriété 'switched on/switched off'."

The specification of the switching off action is "Cette action, avec 'switching on', est la plus simple façon d'interagir avec des machines (ou des objets faisant partie de machines) : les objets de type 'appareil' sont toujours considérés comme étant allumés ou éteints à un moment donné.

Ces actions peuvent également fonctionner avec n'importe quel autre type, tant qu'il possède la propriété 'switched on/switched off'."

The specification of the opening action is "Cette action fait en sorte qu'une chose ne soit plus une barrière physique. Cette action peut être effectuée sur n'importe quel type ayant les propriétés 'openable/unopenable' et 'open/closed'. La règle 'can't open unless openable rule' vérifie si l'objet peut être 'openable' et s'il l'est (il est pris pour acquis que ce qui est 'openable' peut aussi être 'open'). Dans les 'Standard Rules', les contenants et les portes satisfont ces conditions.

Dans le cas où la chose étant ouverte est aussi verrouillable ('lockable'), il est impossible de l'ouvrir si elle est verrouillée ('locked'). Les contenants et les portes peuvent être verrouillables, mais les actions 'opening' et 'closing' fonctionnent aussi avec les types ne le pouvant pas.

Il est possible de créer un nouveau type avec lequel ces actions fonctionneront : 'Un casier is a kind of thing. Un casier can be openable. Un casier can be open. Un casier is usually openable and closed.'

La signification de 'open' (ouvert) et 'closed' (fermé) est différente selon le type de l'objet. Quand un contenant est fermé, une personne à l'extérieur ne peut pas atteindre son intérieur, et vice-versa ; quand une porte est fermée, une personne ne peut pas utiliser l'action 'going' pour passer à travers elle. Si un nouveau type comme le casier est créé, il est nécessaire d'écrire de nouvelles règles pour donner une signification à ces propriétés."

The specification of the closing action is "Cette action fait en sorte qu'une chose devienne une barrière physique. Cette action peut être effectuée sur n'importe quel type ayant les propriétés 'openable/unopenable' et 'open/closed'. La règle 'can't close unless openable rule' vérifie si l'objet peut être 'openable' et s'il l'est (il est pris pour acquis que ce qui est 'openable' peut aussi être 'open', et donc 'closed'). Dans les 'Standard Rules', les contenants et les portes satisfont ces conditions.

Il est possible de créer un nouveau type avec lequel les actions 'opening' et 'closing' fonctionneront : 'Un casier is a kind of thing. Un casier can be openable. Un casier can be open. Un casier is usually openable and closed.'

La signification de 'open' (ouvert) et 'closed' (fermé) est différente selon le type de l'objet. Quand un contenant est fermé, une personne à l'extérieur ne peut pas atteindre son intérieur, et vice-versa ; quand une porte est fermée, une personne ne peut pas utiliser l'action 'going' pour passer à travers elle. Si un nouveau type comme le casier est créé, il est nécessaire d'écrire de nouvelles règles pour donner une signification à ces propriétés."

The specification of the wearing action is "Les 'Standard Rules' fournissent uniquement un modèle simple concernant les vêtements. Une chose peut être portée (dans le sens de porter un habit) seulement si elle possède la propriété 'wearable' (écrire une phrase telle que 'Mr Jones arbore un feutre' implique automatiquement que le feutre est 'wearable'). Il n'y a pas de vérification concernant la quantité de vêtements qu'une personne peut porter ni concernant la distinction entre vêtement et sous-vêtements.

Il est nécessaire d'avoir un objet dans l'inventaire avant de pouvoir le porter, comme le stipule la règle 'can't wear what's not held rule'."

The specification of the taking off action is "Les 'Standard Rules' fournissent uniquement une modèle simple concernant les vêtements. Une chose peut être portée (dans le sens de porter un habit) seulement si elle possède la propriété 'wearable' (écrire une phrase telle que 'Mr Jones arbore un feutre' implique automatiquement que le feutre est 'wearable'). Il n'y a pas de vérification concernant la quantité de vêtements qu'une personne peut porter ni concernant la distinction entre vêtement et sous-vêtements.

Quand un vêtement est enlevé, il revient dans l'inventaire direct de l'acteur, plutôt que d'être posé par terre, par exemple."

Chapter 4.4.5 - Standard actions concerning other people

The specification of the giving it to action is "Cette action aurait pu être rangée dans la catégorie des actions concernant les possessions d'un acteur car, comme les actions 'dropping' (poser), 'putting it on' (mettre sur) et 'inserting it into' (mettre dans), elle permet de se débarrasser d'un objet de l'inventaire.

Les 'Standard Rules' implémentent cette action totalement : si jamais les règles 'carry out' et 'report' sont atteintes, l'objet est effectivement transféré au destinataire, et un message est correctement affiché. Cependant, donner quelque chose à quelqu'un n'est pas aussi simple que poser un livre sur une étagère : l'autre personne doit accepter. La dernière règle 'check', c'est-à-dire la règle 'block giving rule', fait en sorte que le destinataire refuse le cadeau ; il n'aura pas l'objet dans son inventaire. Il est toutefois possible de la remplacer par une règle faisant un choix plus sophistiqué à propos de qui accepte quoi de qui, bloquant les tentatives quand nécessaire."

The specification of the showing it to action is "N'importe qui peut montrer quelque chose de son inventaire à quelqu'un d'autre, mais pas un décor visible. Cette action est donc appropriée pour montrer le pendentif d'émeraude à Katarina, mais pas pour montrer la chambre de l'Orange River Rock à Mr Douglas.

Les 'Standard Rules' implémentent cette action minimalement, vérifiant d'abord si l'action a du sens avant de bloquer n'importe quelle tentative avec la règle 'block showing rule', en affichant un message tel que 'Katarina est peu impressionnée'. Il n'y a donc pas de règles 'carry out' ou 'report'. Pour traiter cette action de façon plus intéressante et systématique, il faudrait retirer la règle 'block showing rule' et écrire ses propres règles 'carry out' et 'report'. Cependant, il est plus probable de n'avoir qu'à gérer des cas spécifiques, et il suffit donc dans la plupart des cas d'écrire une règle 'instead'."

The specification of the waking action is "L'action de secouer une personne endormie afin de la réveiller. Elle n'est présente dans les 'Standard Rules' que pour des raisons historiques. Inform ne fournit pas par défaut de modèle pour des personnes endormies ou éveillées, et cette action ne fait rien : elle est toujours bloquée par la règle 'block waking rule'."

The specification of the throwing it at action is "Jeter quelque chose à quelqu'un ou vers quelque chose d'autre est difficile à modéliser pour Inform. Il y a tant de choses à prendre en compte : si l'acteur peut voir la cible, peut-il l'atteindre ? Et que se passe-t-il si l'objet est lourd, comme une enclume, ou peu aérodynamique, comme une plume ? S'il y a quelque chose entre la cible et le lanceur, comme une cage ayant des barreaux espacés d'une telle façon que seuls des objets d'une certaine taille et d'une certaine forme peuvent passer ? Et enfin, que se passe-t-il si l'action réussit ? Le projectile se cassera-t-il, causera-t-il des dégâts, tombera-t-il par terre, dans un contenant ou sur un support ? Et ainsi de suite.

Comme il semble impossible de modéliser cette action d'une manière générale, Inform la fournit pour que l'auteur puisse l'utiliser dans des cas spécifiques. Les règles 'check' s'assurent simplement que le projectile n'est pas un vêtement porté, puis l'action est bloquée par les règles 'futile to throw things at inanimate objects rule' ou 'block throwing at rule' qui affichent un message générique.

Pour que cette action fasse quelque chose, il faut écrire des règles 'instead' pour des circonstances spéciales, ou bien retirer ces règles 'check' et écrire des règles 'carry out' et 'report'."

The specification of the attacking action is "La violence est rarement la solution, et les tentatives d'effectuer cette action sur une autre personne sont généralement bloquée, car considérées comme irréalistes ou non sérieuses (on peut trouver un vendeur énervant, mais les fictions interactives ne sont pas GTA, et réagir en tuant quelqu'un n'est pas forcément une bonne option). Les 'Standard Rules' bloquent simplement cette action, mais des exceptions peuvent être écrites."

The specification of the kissing action is "C'est probablement parce qu'Inform a été écrit par un Anglais que les tentatives d'embrasser quelqu'un sont normalement bloquées, étant considérées comme irréalistes ou non sérieuses. Cette action existe pour que des exceptions soient écrites."

The specification of the answering it that action is "Les 'Standard Rules' ne fournissent pas de façons systématiques de gérer les conversations : Inform est plutôt écrit de telle façon qu'il soit aussi facile que possible de créer des règles spécifiques concernant les dialogues ; toute tentative de communication est sinon rejetée par un message générique.

Le sujet ici peut être n'importe quel texte entre guillemets, pouvant contenir des substitutions entre crochets : voir la section de la documentation expliquant la compréhension ('Understanding').

L'action 'answering it that' existe pour que le joueur puisse dire n'importe quoi à une autre personne. Une convention dans les fictions interactives est qu'une commande comme 'DAPHNÉ, PRENDRE MASQUE' constitue une demande de faire cette action à Daphné : si les règles de persuasion font en sorte qu'elle accepte, alors l'action 'Daphné taking the masque' (Daphné prenant le masque) a lieu. Mais si le joueur tape 'DAPHNÉ, 12375', 'DAPHNÉ, BON SANG' ou n'importe quoi d'autre n'ayant pas de sens en tant que commande, l'action 'answering Daphné that ...' sera générée.

Il est également possible pour le joueur de taper 'RÉPONDRE 12375 À DAPHNÉ', si Daphné vient de poser une question par exemple."

The specification of the telling it about action is "Les 'Standard Rules' ne fournissent pas de façons systématiques de gérer les conversations : Inform est plutôt écrit de telle façon qu'il soit aussi facile que possible de créer des règles spécifiques concernant les dialogues ; toute tentative de communication est sinon rejetée par un message générique.

Le sujet ici peut être n'importe quel texte entre guillemets, pouvant contenir des substitutions entre crochets : voir la section de la documentation expliquant la compréhension ('Understanding').

L'action 'telling it that' existe afin de prendre en compte des commandes comme 'DIRE À ALEX À PROPOS DE LA GUITARE'. Dans les fictions interactives, une telle commande est un raccourci signifiant par convention 'dire à Alex tout ce que je sais à propos de la guitare' et n'est censée faire du sens que si le joueur a découvert quelque chose d'important et qui pourra intéresser Alex sur la guitare."

The specification of the asking it about action is "Les 'Standard Rules' ne fournissent pas de façons systématiques de gérer les conversations : Inform est plutôt écrit de telle façon qu'il soit aussi facile que possible de créer des règles spécifiques concernant les dialogues ; toute tentative de communication est sinon rejetée par un message générique.

Le sujet ici peut être n'importe quel texte entre guillemets, pouvant contenir des substitutions entre crochets : voir la section de la documentation expliquant la compréhension ('Understanding').

L'action 'asking it about' existe afin de prendre en compte des commandes comme 'QUESTIONNER STEPHEN AU SUJET DE PÉNÉLOPE'. Dans les fictions interactives, une telle commande est un raccourci signifiant par convention 'engager une conversation avec Stephen et essayer de connaître ce qu'il sait à propos de Pénélope'. Par convention encore, Stephen n'est pas obligé de répondre s'il n'y a pas de raison de supposer qu'il a quelque chose de pertinent à dire. 'QUESTIONNER JANE À PROPOS DU PUDDING AU RIZ', par exemple, n'est pas forcé d'afficher une recette complète, même si Jane est une servante du XIXe siècle et en connaissant donc vraisemblablement une."

The specification of the asking it for action is "Les 'Standard Rules' ne fournissent pas de façons systématiques de gérer les conversations, mais cette action n'en est pas véritablement une : elle n'implique pas de discours en tant que tel. Elle n'existe que pour prendre en compte des commandes comme 'DEMANDER LE FOUET À SALLY', où le fouet est un objet que Sally et le joueur peuvent voir.

Assez étrangement, mais pour des raisons historiques, un acteur se demandant lui-même quelque chose fera l'inventaire de ses possessions à la place. Tous les autres cas sont convertis en l'action 'giving it to' (donner à) : par exemple, 'DEMANDER LE FOUET À SALLY' est traité comme 'SALLY, DONNER MOI LE FOUET', une action que Sally fera et qui suivra les règles de l'action 'giving it to'.

Pour demander des informations sur quelque chose d'abstrait ou d'intangible, voir l'action 'asking it about'."

Chapter 4.4.6 - Standard actions which are checked but then do nothing unless rules intervene

The specification of the waiting action is "L'action de l'inaction : que serions-nous s'il n'était pas possible d'attendre ? Attendre ne fait pas avancer le temps (cela arrive de toute façon), mais représente une volonté de l'acteur de ne pas remplir ce temps. Cette action existe pour que des règles puissent lui être associées : par exemple, on peut imaginer qu'un joueur décidant délibérément d'attendre remarque quelque chose qu'un joueur pressé n'aurait pas vu, et écrire une règle en conséquence.

Cette action ne possède pas de règles 'check' et 'carry out' : n'importe qui peut attendre, n'importe quand, et cela ne provoque rien."

The specification of the touching action is "Cette action permet à quelqu'un de toucher quelque chose, sans appliquer de pression. Un écran tactile ou une créature pourraient réagir, mais probablement pas un bouton ou un levier.

Il n'y a pas de règle 'check' pour cette action dans les 'Standard Rules', étant donné que le fait de pouvoir être touché est déjà une condition nécessaire pour cette action, ni de règles 'carry out', car rien dans le modèle standard d'Inform ne réagit à un simple toucher. Les règles 'report' ont quand même prévu une réponse spéciale aux tentatives de toucher d'autres personnes."

The specification of the waving action is "Cette action signifie 'secouer' ou 'agiter' dans le sens de brandir un sceptre : l'objet doit être dans l'inventaire (ou porté) par l'acteur.

Dans les 'Standard Rules', il n'y a pas de règles 'carry out' pour cette action, car rien dans le modèle standard d'Inform ne réagit à elle. Cette action est fournie pour que l'auteur puisse spécifier des cas particuliers : secouer une baguette de fer rouillé avec une étoile au bout, par exemple."

The specification of the pulling action is "Cette action permet de tirer un objet pas plus gros que le joueur sans le déplacer véritablement.

Dans les 'Standard Rules', il n'y a pas de règles 'carry out' pour cette action, car rien dans le modèle standard d'Inform ne réagit à elle. Cette action est fournie pour que l'auteur puisse spécifier des cas particuliers : tirer un levier, par exemple ('Le grand levier rouge est un fixed in place appareil. Instead of pulling le grand levier rouge, try switching on le levier. Instead of pushing le grand levier rouge, try switching off le levier.')"

The specification of the pushing action is "Cette action permet de pousser un objet pas plus gros que le joueur sans le déplacer véritablement (voir aussi l'action 'pushing it to' lorsqu'il s'agit de pousser des objets sur une plus grande distance, d'un endroit à l'autre).

Dans les 'Standard Rules', il n'y a pas de règles 'carry out' pour cette action, car rien dans le modèle standard d'Inform ne réagit à elle. Cette action est fournie pour que l'auteur puisse spécifier des cas particuliers : pousser un levier, par exemple ('Le grand levier rouge est un fixed in place appareil. Instead of pulling le grand levier rouge, try switching on le levier. Instead of pushing le grand levier rouge, try switching off le levier.')"

The specification of the turning action is "L'action de tourner quelque chose, comme un cadran.

Dans les 'Standard Rules', il n'y a pas de règles 'carry out' pour cette action, car rien dans le modèle standard d'Inform ne réagit à elle. Cette action est fournie pour que l'auteur puisse spécifier des cas particuliers : tourner un cabestan, par exemple."

The specification of the pushing it to action is "Cette action permet de pousser un gros objet, n'étant pas dans l'inventaire, d'un endroit à un autre : pousser une balle de foin vers l'est, par exemple.

Elle est rapidement convertie en une forme spéciale de l'action 'going'. Si l'objet possède la propriété 'pushable between rooms', alors cette action est convertie en l'action going par la règle 'standard pushing in directions rule'. Si l'action réussit, alors l'action 'pushing it to' s'arrête ; c'est seulement si l'objet ne possède pas la propriété que la règle 'block pushing in directions rule' s'applique, mettant fin à l'action."

The specification of the squeezing action is "L'action de presser une bouteille de ketchup dans l'inventaire ou d'enserrer un pillier.

Dans les 'Standard Rules', il n'y a pas de règles 'carry out' pour cette action, car rien dans le modèle standard d'Inform ne réagit à elle. Cette action est fournie pour que l'auteur puisse spécifier des cas particuliers. Un message spécial est affiché aux joueurs essayant de presser des personnes, l'action étant bloquée par une règle 'check squeezing'."

Chapter 4.4.7 - Standard actions which always do nothing unless rules intervene

The specification of the saying yes action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the saying no action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the burning action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the waking up action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the thinking action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the smelling action is "Les 'Standard Rules' définissent cette action minimalement, en affichant un message indiquant que le joueur ne sent rien de particulier."

The specification of the listening to action is "Les 'Standard Rules' définissent cette action minimalement, en affichant un message indiquant que le joueur n'entend rien de particulier."

The specification of the tasting action is "Les 'Standard Rules' définissent cette action minimalement, en affichant un message indiquant que le joueur ne sent rien de particulier."

The specification of the cutting action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the jumping action is "Les 'Standard Rules' définissent cette action minimalement, en affichant un message indiquant que l'acteur saute sur place."

The specification of the tying it to action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the drinking action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the saying sorry action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the swinging action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the rubbing action is "Les 'Standard Rules' définissent cette action minimalement, en affichant un message indiquant que l'action a eu lieu."

The specification of the setting it to action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the waving hands action is "Les 'Standard Rules' définissent cette action minimalement, en affichant un message indiquant que l'acteur agite les mains."

The specification of the buying action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the climbing action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

The specification of the sleeping action is "Les 'Standard Rules' définissent cette action minimalement, la bloquant avec une règle 'check' qui l'arrête à chaque tentative. Elle existe uniquement pour que des règles 'before' ou 'instead' puissent être écrites, afin que l'action puisse faire quelque chose d'intéressant dans certains cas (il est aussi possible de reconstruire totalement l'action, en retirant la règle la bloquant et en ajoutant des règles 'check', 'carry out' et 'report')."

Part 4.6 - Command parser internals

Include (-
! Cette routine est utilisée par PrintCommand, qui affiche la commande tapée par le joueur ("Je n'ai compris que : X").
! TODO : Trouver un moyen d'ajouter des mots depuis I7 ? (Par exemple avec un tableau.) Ce n'est pas très très grave sinon.
[ LanguageVerb i;
	switch (i) {
		'i//','inv','inventaire': print "inventaire";
		'r//': print "regarder";
		'x//': print "examiner";
		'z//': print "attendre";
		'v//': print "regarder";
		'a//': print "attendre";
		'!//': print "dire";
		'?//': print "demander";
		'q//': print "quitter";
		'pr': print "prendre";

		! Les mots du dictionnaire d'Inform n'ont que 9 lettres au maximum. Il faut donc indiquer comment afficher un verbe à 10 lettres ou plus.
		! TODO : valable aussi pour Glulx ? Il me semble qu'on peut augmenter cette limite en tout cas.
		'verrouiller': print "verrouiller";
		'deverrouiller': print "déverrouiller";
		'introduire': print "introduire";
		'transferer': print "transférer";
		'abandonner': print "abandonner";
		'farfouiller': print "farfouiller";
		'depoussierer': print "dépoussierer";
		'questionner': print "questionner";
		'interroger': print "interroger";

		! On n'écrit pas les accents dans un verbe pour plus de facilité pour le joueur (cf. enleve_accents).
		! Il faut donc réécrire les accents pour les verbes qui en ont besoin.

		'inserer': print "insérer";
		'transferer': print "transférer";
		'decoller': print "décoller";
		'lacher': print "lâcher";
		'oter': print "ôter";
		'revetir': print "revêtir";
		'vetir': print "vêtir";
		'deguiser': print "déguiser";
		'devorer': print "dévorer";
		'bruler': print "brûler";
		'detruire': print "détruire";
		'ecraser': print "écraser";
		'elaguer': print "élaguer";
		'decrire': print "décrire";
		'ecouter': print "écouter";
		'gouter': print "goûter";
		'tater': print "tâter";
		'trainer': print "traîner";
		'deplacer': print "déplacer";
		'regler': print "régler";
		'devisser': print "dévisser";
		'eteindre': print "éteindre";
		'arreter': print "arrêter";
		'demarrer': print "démarrer";
		'recurer': print "récurer";
		'repondre': print "répondre";
		'reveiller': print "réveiller";
		'eveiller': print "éveiller";
		'etreindre': print "étreindre";
		'reflechir': print "réfléchir";

		! Y'a pas que les verbes qui sont accentués !
		'a':	 print "à";
		'derriere': print "derrière";
		'cle': print "clé";

		default: rfalse;
	}
	rtrue;
];

[ LanguageVerbLikesAdverb w;
	if (w == 'look' or 'go' or 'push' or 'walk') rtrue;
	rfalse;
];

[ LanguageVerbMayBeName w;
	if (w == 'long' or 'short' or 'normal' or 'brief' or 'full' or 'verbose') rtrue;
	rfalse;
];
-) instead of "Commands" in "Language.i6t".

Include (-
Constant AGAIN1__WD = 'encore';
Constant AGAIN2__WD = 'g//';
Constant AGAIN3__WD = 'encore'; ! TODO : Garder "again" ?
Constant OOPS1__WD = 'oops';
Constant OOPS2__WD = 'euh'; ! 'o//';
Constant OOPS3__WD = 'heu';
Constant UNDO1__WD = 'undo';
Constant UNDO2__WD = 'annule';
Constant UNDO3__WD = 'annuler';

Constant ALL1__WD = 'tous';
Constant ALL2__WD = 'toutes';
Constant ALL3__WD = 'tout';
Constant ALL4__WD = 'tout';
Constant ALL5__WD = 'tout';
Constant AND1__WD = 'et';
Constant AND2__WD = 'et';
Constant AND3__WD = 'et';
Constant BUT1__WD = 'mais pas'; ! TODO : Ne fonctionne pas car en deux mots.
Constant BUT2__WD = 'excepte';
Constant BUT3__WD = 'sauf';
Constant ME1__WD = 'moi';
Constant ME2__WD = 'toi'; !*! nous ? moi-même ?
Constant ME3__WD = 'vous';
Constant OF1__WD = 'de';
Constant OF2__WD = 'de';
Constant OF3__WD = 'du';
Constant OF4__WD = 'de';
Constant OTHER1__WD = 'autre';
Constant OTHER2__WD = 'autre';
Constant OTHER3__WD = 'autre';
Constant THEN1__WD = 'alors';
Constant THEN2__WD = 'puis';
Constant THEN3__WD = 'ensuite';

Constant NO1__WD = 'n//';
Constant NO2__WD = 'non';
Constant NO3__WD = 'non';
Constant YES1__WD = 'o//';
Constant YES2__WD = 'y//';
Constant YES3__WD = 'oui';

Constant AMUSING__WD = 'amusing';
Constant FULLSCORE1__WD = 'fullscore';
Constant FULLSCORE2__WD = 'full';
Constant QUIT1__WD = 'quit'; !*! "q//" ?
Constant QUIT2__WD = 'quitter';
Constant RESTART__WD = 'recommencer';
Constant RESTORE__WD = 'charger';
-) instead of "Vocabulary" in "Language.i6t".

Part 4.7 - Informese translation of commands

[Cette variable permet à l'auteur de changer facilement quand les diacritiques sont supprimés des commandes.
Ça serait plus informien d'utiliser une kind of value, mais Inform les fait compter à partir de 1 et pas de 0, alors ça impliquerait de modifier LanguageToInformese ; je préfère éviter pour le moment.]
Gestion-diacritiques is a number that varies.
The gestion-diacritiques variable translates into I6 as "gardeaccents".

Include (-
! LanguageToInformese
! ------------------------------------------------------------------------------
!   Part III.   Translation
! ------------------------------------------------------------------------------

! Routines utiles pour reconnaître les versions accentuées d'une lettre
[ IsAnA c;
	! aàáâăäãæ + majuscules
	#Ifdef TARGET_ZCODE;
	if (c == 'a' or 'A' or 155 or 158 or 169 or 175 or 181 or 186 or 191 or 196 or 201 or 202 or 205 or 208 or '@ae' or 212) return true;
	#Ifnot; ! TARGET_GLULX - donc il faut les valeurs Unicode !
	if ((c == 'a' or 'A') || (c > 191 && c < 199) || (c > 223 && c < 231)) return true;
	#Endif; ! TARGET_
	return false;
];
[ IsAnE c;
	! eéèęë + majuscules
	#Ifdef TARGET_ZCODE;
	if (c == 'e' or 'E' or 164 or 167 or 170 or 176 or 182 or 187 or 192 or 197 ) return true;
	#Ifnot; ! TARGET_GLULX - donc il faut les valeurs Unicode !
	if ((c == 'e' or 'E') || (c > 199 && c < 204) || (c > 231 && c < 236)) return true;
	#Endif; ! TARGET_
	return false;
];
[ IsAnI c;
	! iîïí + majuscules
	#Ifdef TARGET_ZCODE;
	if (c == 'i' or 'I' or 165 or 168 or 171 or 177 or 183 or 188 or 193 or 198 ) return true;
	#Ifnot; ! TARGET_GLULX - donc il faut les valeurs Unicode !
	if ((c == 'i' or 'I') || (c > 203 && c < 208) || (c > 235 && c < 240)) return true;
	#Endif; ! TARGET_
	return false;
];
[ IsAnO c;
	! oóòôőöœ + majuscules
	#Ifdef TARGET_ZCODE;
	if (c == 'o' or 'O' or 156 or 159 or 172 or 178 or 184 or 189 or 194 or 199 or 203 or 204 or 207 or 210 or '@oe' or 221 ) return true;
	#Ifnot; ! TARGET_GLULX - donc il faut les valeurs Unicode !
	! les valeurs 338 et 339 (oe et OE) seront transformées automatiquement en ? par Glulx avant même cette fonction, donc ça ne marchera pas
	if ((c == 'o' or 'O') || (c > 209 && c < 215) || (c == 216 or 248 or 338 or 339) || (c > 241 && c < 247)) return true;
	#Endif; ! TARGET_
	return false;
];
[ IsAnU c;
	! uüůúű + majuscules
	#Ifdef TARGET_ZCODE;
	if (c == 'u' or 'U' or 157 or 160 or 173 or 179 or 185 or 190 or 195 or 200 ) return true;
	#Ifnot; ! TARGET_GLULX - donc il faut les valeurs Unicode !
	if ((c == 'u' or 'U') || (c > 216 && c < 221) || (c > 248 && c < 253)) return true;
	#Endif; ! TARGET_
	return false;
];

[ convertir_lettre i ;
	! On traite les ligatures en premier pour les séparer des a et des o accentués.
	#IfDef TARGET_ZCODE;
	if (buffer->i == '@ae') { buffer->i='a'; LTI_Insert( ++i, 'e'); return 2;}
	if (buffer->i == '@oe') { buffer->i='o'; LTI_Insert( ++i, 'e'); return 2;}
	#IfNot; ! TARGET_GLULX;
	if (buffer->i == 198 or 230) { buffer->i='a'; LTI_Insert( ++i, 'e'); return 2; }
	! Pas d'équivalent pour oe, zut! Le code Unicode étant >255, c'est automatiquement transformé en '?', avant même cette routine...
	#Endif;

	! les autres lettres accentuées
	if (IsAnA(buffer->i)) { buffer->i='a'; return 1; }
	if (IsAnE(buffer->i)) { buffer->i='e'; return 1; }
	if (IsAnI(buffer->i)) { buffer->i='i'; return 1; }
	if (IsAnO(buffer->i)) { buffer->i='o'; return 1; }
	if (IsAnU(buffer->i)) { buffer->i='u'; return 1; }
	switch(buffer->i) {
		! 'y tréma': buffer->i='y'; return 1; Plante si on écrit le caractère en question, même dans un commentaire !
		'ý': buffer->i='y'; return 1;
		'ñ': buffer->i='n'; return 1;
		'ç': buffer->i='c'; return 1;
	}
];

! 0: On enlève toujours les diacritiques des commandes.
! 1: On enlève les diacritiques si le mot n'a pas été compris.
! 2: On n'enlève jamais les diacritiques.
Global gardeaccents = 0;

! La fonction enleve_accents enlève les accents des mots qui n'ont pu être
! interprétés. De cette manière, le joueur peut utiliser les accents ou non.
! Pour cela le jeu doit définir les mots sans accent, par exemple :
! object set_of_keys "trousseau de clés"
! with name 'trousseau' 'cles'
!
! Si le joueur demande : "examiner cles", le mot est compris directement.
! S'il demande : "examiner clés" le mot n'est pas compris, ce qui déclenche
! la suppression des accents et une nouvelle analyse.
!
! L'appel de cette fonction peut être désactivé avec la commande de
! deboguage "accents on" pour que les accents soient conservés.
[ enleve_accents x i word at len lettresremplacees;
	#Ifdef DEBUG; affiche_buffer(buffer, "  [ enleve_accents :^  - Buffer reçu : "); #Endif;
	if (gardeaccents ~= 2) {
		for (x=0:x<NbMots():x++) { ! pour chaque mot
			word = Mot(x);
			at = PositionMot(x);
			len = LongueurMot(x);
			if ( gardeaccents == 0 || (gardeaccents == 1 && word==0) ) {
				#Ifdef DEBUG;
				if (parser_trace >= 7 && gardeaccents == 1) {
					print "    NON COMPRIS : |";
					for (i=at:i<at+len:i++) print (char) buffer->i;
					print "|^";
				}
				#Endif;
				for (i=at:i<at+len:i++) {
					lettresremplacees = convertir_lettre(i);
					! Si on a remplacé æ par ae, la longueur a augmenté.
					if (lettresremplacees == 2) { len++; }
				}
				! Tokenise__(buffer,parse);
				VM_Tokenise(buffer,parse);
			}
		}
	}
	#Ifdef DEBUG; affiche_buffer(buffer, "  - Buffer sans accents : "); #Endif;
];

! enlève le tiret de départ des mots qui ne sont pas dans le dictionnaire
[ enleve_tirets x i word at len;
	i=NULL; ! pour retirer warning à la compilation glulx
	#Ifdef DEBUG; affiche_buffer(buffer, "  [ enleve_tirets :^  - Buffer reçu : "); #Endif;
	for (x=0:x<NbMots():x++) { ! pour chaque mot
		word = Mot(x);
		at = PositionMot(x);
		len = LongueurMot(x);
		if (word == 0) { ! non compris
			#Ifdef DEBUG;
			if (parser_trace >= 7) {
				print "    NON COMPRIS : |";
				for (i=at:i<at+len:i++) print (char) buffer->i;
				print "|^";
			}
			#Endif;
			if (buffer->at == '-') buffer->at = ' ';
			!Tokenise__(buffer,parse);
			VM_Tokenise(buffer,parse);
		}
	}
	#Ifdef DEBUG; affiche_buffer(buffer, "  - Buffer sans tirets : "); #Endif;
];

[ NbMots; ! nombre de mots dans parse
	#Ifdef TARGET_ZCODE;
	return parse->1;
	#Ifnot; ! TARGET_GLULX
	return parse-->0;
	#Endif; ! TARGET_
];

[ NbChars; ! nombre de chars dans buffer
	#Ifdef TARGET_ZCODE;
	return buffer->1;
	#Ifnot; ! TARGET_GLULX
	return buffer-->0;
	#Endif; ! TARGET_
];

[ Mot n; ! valeur (dictionnaire) du mot numéro n de parse
	#Ifdef TARGET_ZCODE;
	return parse-->(n*2 + 1);
	#Ifnot; ! TARGET_GLULX
	return parse-->(n*3 + 1);
	#Endif; ! TARGET_
];

[ PositionMot n; ! position dans buffer du mot numéro n de parse
	#Ifdef TARGET_ZCODE;
	return parse->(n*4 + 5);
	#Ifnot; ! TARGET_GLULX
	return parse-->(n*3 + 3);
	#Endif; ! TARGET_
];

[ LongueurMot n;   ! longueur (en chars) dans buffer du mot numéro n de parse
	#Ifdef TARGET_ZCODE;
	return parse->(n*4 + 4);
	#Ifnot; ! TARGET_GLULX
	return parse-->(n*3 + 2);
	#Endif; ! TARGET_
];

[ EcraseMot n i;        ! écrase avec des espaces dans buffer le mot numéro n
	for(i=0:i<LongueurMot(n):i++)
		buffer->(PositionMot(n)+i) = ' ';
];

[ DernierMot n; ! vrai si le mot numéro n est le dernier ou suivi d'un "point" (THEN1__WD, ...)
	if (n==NbMots()-1) ! le mot numéro n est-il le dernier ?
		return true;
	else ! est-il suivi d'un "point" ?
		return (Mot(n+1) == THEN1__WD or THEN2__WD or THEN3__WD);
];

[ LanguageToInformese i word wordsuiv at b RangVerbe RangDernier;
	!Tokenise__(buffer,parse);
	VM_Tokenise(buffer,parse);
	#Ifdef DEBUG; affiche_buffer(buffer, "[ LanguageToInformese:^* Buffer reçu : "); #Endif;
	for (i=0:i<NbMots():i++) { ! balayer toute la phrase
		word = Mot(i);
		if (DernierMot(i)) wordsuiv=THEN1__WD; else wordsuiv=Mot(i+1);
		at = PositionMot(i); ! position du mot numéro i dans buffer
		if (word == 'dessus') {
			!LTI_Insert(at, ' '); ! remplace
			buffer->at = 's';
			buffer->(at+1) = 'u';
			buffer->(at+2) = 'r';
			buffer->(at+3) = '-'; ! TODO : Devrait pouvoir reprendre un pluriel.
			buffer->(at+4) = 'l';
			buffer->(at+5) = ''';
			!Tokenise__(buffer,parse);
			VM_Tokenise(buffer,parse);
			i = 0; continue;
		}
		if (word == 'dessous') {
			!LTI_Insert(at, ' '); ! remplace
			buffer->at = 's';
			buffer->(at+1) = 'o';
			buffer->(at+2) = 'u';
			buffer->(at+3) = 's';
			buffer->(at+4) = '-'; ! TODO : Devrait pouvoir reprendre un pluriel.
			buffer->(at+5) = 'l';
			buffer->(at+6) = ''';
			!Tokenise__(buffer,parse);
			VM_Tokenise(buffer,parse);
			i = 0; continue;
		}
!*! pas forcément une bonne idée car "dedans" est aussi une direction !*! mais "mets-le dedans" ?
!         if (word == 'dedans') !*! dehors ?
!         {   LTI_Insert(at, ' '); ! remplace
!             LTI_Insert(at, ' ');
!             buffer->at     = 'd';
!             buffer->(at+1) = 'a';
!             buffer->(at+2) = 'n';
!             buffer->(at+3) = 's';
!             buffer->(at+4) = ' ';
!             buffer->(at+5) = 'l';
!             buffer->(at+6) = ''';
!             !Tokenise__(buffer,parse);
!				VM_Tokenise(buffer,parse);
!             i = 0; continue;
!         }

! "nord-est" ou "nord est" devient "nordest"
		if ( (word=='nord-est'or'nord-ouest') || ((word=='nord')&&(wordsuiv=='est'or'ouest')) )
		{
			buffer->at     = ' '; ! décale
			buffer->(at+1) = 'n';
			buffer->(at+2) = 'o';
			buffer->(at+3) = 'r';
			buffer->(at+4) = 'd';
			!Tokenise__(buffer,parse);
			VM_Tokenise(buffer,parse);
			i = 0; continue;
		}
! "sud-est" ou "sud est" devient "sudest"
		if ( (word=='sud-est'or'sud-ouest') || ((word=='sud')&&(wordsuiv=='est'or'ouest')) )
		{
			buffer->at     = ' '; ! décale
			buffer->(at+1) = 's';
			buffer->(at+2) = 'u';
			buffer->(at+3) = 'd';
			!Tokenise__(buffer,parse);
			VM_Tokenise(buffer,parse);
			i = 0; continue;
		}
	}

! insertion d'une espace avant chaque tiret et après chaque apostrophe 
	for (i=WORDSIZE:i<WORDSIZE+NbChars():i++) {
		if (buffer->i == '-') LTI_Insert(i++, ' ');
		if (buffer->i == ''') LTI_Insert( ++i, ' ');  
		! autre notation (interrogation) 'antislash'' par exemple (interrogation)
	}
	!Tokenise__(buffer,parse);
	VM_Tokenise(buffer,parse);

! Suppression de 'je' ou 'j^' en début de phrase.
! Par exemple, "je vais au nord" devient "vais au nord".
	!if (Mot(0) == 'je' or 'j^')
	!{
		!EcraseMot(0);
		!Tokenise__(buffer,parse);
		!VM_Tokenise(buffer,parse);
	!}

! Ce qui suit ne tient pas bien compte des commandes s'adressant à quelqu'un ("machin, fais ceci").
! Transformation de phrases à l'infinitif commençant par un ou deux pronoms suivis d'un mot (verbe, probablement).
! Ex : "le lui donner" devient "donner -le a -lui".

! Étape A : "le/la/l'/les" (suivi éventuellement de "lui/leur") passe après le verbe. Ex : "lui donner -le"
	word=Mot(0); ! 1er mot
	if ((NbMots()>=2)&&(Mot(1)=='lui'or'leur'))
		RangVerbe=2;
	else
		RangVerbe=1;
	! verbe = 2e ou 3e mot ?
	b=PositionMot(RangVerbe)+LongueurMot(RangVerbe);
	! juste après le verbe (egal) position du verbe (plus) longueur du verbe ne rien faire si la phrase ne comporte pas de verbe
	if (~~DernierMot(RangVerbe-1)) {
		if (word == 'le') {
			EcraseMot(0);
			LTI_Insert(b, ' ');
			LTI_Insert(b+1, '-');
			LTI_Insert(b+2, 'l');
			LTI_Insert(b+3, 'e');
		}
		if (word == 'la') {
			EcraseMot(0);
			LTI_Insert(b, ' ');
			LTI_Insert(b+1, '-');
			LTI_Insert(b+2, 'l');
			LTI_Insert(b+3, 'a');
		}
		if (word == 'l^') {
			EcraseMot(0);
			LTI_Insert(b, ' ');
			LTI_Insert(b+1, '-');
			LTI_Insert(b+2, 'l');
			LTI_Insert(b+3, ''');
		}
		if (word == 'y//') { ! TODO: Revoir comment gérer ce pronom ?
			EcraseMot(0);
			LTI_Insert(b, ' ');
			LTI_Insert(b+1, '-');
			LTI_Insert(b+2, 'y');
		}
		if (word == 'en') {
			EcraseMot(0);
			LTI_Insert(b, ' ');
			LTI_Insert(b+1, '-');
			LTI_Insert(b+2, 'e');
			LTI_Insert(b+3, 'n');
		}
		if (word == 'les') {
			EcraseMot(0);
			LTI_Insert(b, ' ');
			LTI_Insert(b+1, '-');
			LTI_Insert(b+2, 'l');
			LTI_Insert(b+3, 'e');
			LTI_Insert(b+4, 's');
		}
	}
	!Tokenise__(buffer,parse);
	VM_Tokenise(buffer,parse);

! Étape B : "lui/leur" passe après le verbe avec l'ajout de la préposition "a". Ex : "lui donner -le" devient "donner -le a -lui"
	word=Mot(0); ! 1er mot
	! RangDernier est le rang du dernier mot du bloc : verbe + "-le/-la/-les"
	if ((NbMots()>=3)&&(Mot(2)=='-le'or'-la'or'-les' or'-lui'))
		RangDernier=2;
	else
		RangDernier=1; ! "-le/-la/-les" après le verbe ?
	b=PositionMot(RangDernier)+LongueurMot(RangDernier);
	! juste après bloc = position du dernier + longueur du dernier
	if (~~DernierMot(0)) { ! ne rien faire si la phrase ne comporte pas de verbe
		if (word == 'lui') { ! "lui parler" devient "parler a -lui"
			EcraseMot(0);
			LTI_Insert(b, ' ');
			LTI_Insert(b+1, 'a');
			LTI_Insert(b+2, ' ');
			LTI_Insert(b+3, '-');
			LTI_Insert(b+4, 'l');
			LTI_Insert(b+5, 'u');
			LTI_Insert(b+6, 'i');
		}
		if (word == 'leur') {
			EcraseMot(0);
			LTI_Insert(b, ' ');
			LTI_Insert(b+1, 'a');
			LTI_Insert(b+2, ' ');
			LTI_Insert(b+3, '-');
			LTI_Insert(b+4, 'l');
			LTI_Insert(b+5, 'e');
			LTI_Insert(b+6, 'u');
			LTI_Insert(b+7, 'r');
		}
	}
	!Tokenise__(buffer,parse);
	VM_Tokenise(buffer,parse);

	if ( (word == 'me' or 'm^' or 'te' or 't^' or 'se' or 's^' or 'nous' or 'vous') && ~~DernierMot(0) ) ! sinon gènerait "se", abréviation de "sud-est"
	{
		EcraseMot(0);
		LTI_Insert(b, ' ');
		LTI_Insert(b+1, 'v');
		LTI_Insert(b+2, 'o');
		LTI_Insert(b+3, 'u');
		LTI_Insert(b+4, 's');
	}
	!Tokenise__(buffer,parse);
	VM_Tokenise(buffer,parse);
	! TODO à retirer car pose pb avec I7 ? non : bien vérifier qu'il n'y a pas de verbe reflexif sans le mot 'vous' dedans, sinon cela provoque cette erreur.

! Maintenant que les traitements sur l'infinitif ont été faits,
! enlever le tiret en début de mot pour ceux qui n'existent pas dans le dictionnaire
! (conserve '-lui','-le','-la'... et les mots prévus par le joueur)
	enleve_tirets();

! Avertir ceux qui oublient de mettre des traits d'union entre les pronons et le verbe
! à l'impératif et corriger les cas les plus simples : !*! le plus possible
	enleve_accents(); ! sinon "à" n'est pas reconnu !*! placer cette fonction encore plus en amont ?
	if ( ((NbMots()==2)&&(Mot(1)=='le'or'la'or'les'or'lui'or'leur')) || ! "parle lui" devient "parle-lui"
		((NbMots()>=2)&&(Mot(1)=='lui')) || ! "donne lui la pomme" devient "donne-lui la pomme" (pas de confusion possible avec l'article)
		((NbMots()>=4)&&(Mot(1)=='le'or'la'or'les'or'lui'or'leur')&&(Mot(2)=='a//'or'au'or'aux'or'de'or'du'or'des'or'dans'or'sur')) ) ! "donne le aux moutons" devient "donne-le aux moutons"
	{
		LTI_Insert(PositionMot(1), '-');
		print "[Mettez toujours un trait d'union entre le pronom et le verbe à l'impératif.]^";
	}
	if ((NbMots()==3)&&(Mot(1)=='le'or'la'or'les'or'-le'or'-la'or'-les')&&(Mot(2)=='lui'or'leur'))
	{ ! "donne le lui" ou "donne-le lui" devient "donne-le-lui"
		if (Mot(1)=='le'or'la'or'les') LTI_Insert(PositionMot(1), '-');
		LTI_Insert(PositionMot(2), '-');
		print "[Mettez toujours un trait d'union entre chaque pronom et le verbe à l'impératif.]^";
	}

! remplacer "toi/vous/nous" en 2e position par "vous"
	if ((Mot(1) == 'moi' or 'toi' or 'nous')) !*! pas sûr encore, sert à gérer "réveillons nous" -> "réveillons vous"
	{
		EcraseMot(1); !*! fiable mais le buffer est agrandi de 3 ou 4 caractères : pas grave ?
		LTI_Insert(PositionMot(1)  , 'v');
		LTI_Insert(PositionMot(1)+1, 'o');
		LTI_Insert(PositionMot(1)+2, 'u');
		LTI_Insert(PositionMot(1)+3, 's');
	}
	!Tokenise__(buffer,parse);
	VM_Tokenise(buffer,parse);

	enleve_accents(); !*! déjà fait plus haut ? on ne sait jamais avec enleve_tirets() !*! rendre la suppression des accents systématique ? (dictionnaire ou pas)

	#Ifdef DEBUG; affiche_buffer(buffer, "* Buffer traduit en informese : "); #Endif;
];

#Ifdef DEBUG;
[ affiche_buffer buffer msg i len;
	if (parser_trace>=7) {
		#Ifdef TARGET_ZCODE;
		len=buffer->1;
		#Ifnot; ! TARGET_GLULX
		len=buffer-->0;
		#Endif; ! TARGET_
		print (string) msg,"|";
		for(i=WORDSIZE:i<WORDSIZE+len:i++) print (char) buffer->i;
		print "|^";
	}
];
#Endif;

-) instead of "Translation" in "Language.i6t".

French Language ends here.

---- DOCUMENTATION ----

Chapter: Utilisation de base

Section: Présentation

Cette extension permet d'écrire des fictions interactives en français avec Inform 7. Avec elle, il est possible d'écrire une partie de son code source en français, tous les textes dans un jeu créé avec elle seront en français et le joueur pourra taper des commandes en français. Les descriptions des types d'objets et des actions dans l'index sont également traduites.

Section: Installation

Pour pouvoir utiliser l'extension, vous devez d'abord copier le fichier "about.txt", venant avec l'extension, dans votre installation d'Inform.

Déplacez-le donc dans le dossier suivant (en écrasant l'ancien fichier) :

	- Windows : "C:\Program Files (x86)\Inform 7\Internal\Languages\French\about.txt"
	- macOS : clic droit sur l'icône d'Inform, puis "Afficher le contenu du paquet" ; de là, le fichier se trouve dans "Contents/Resources/retrospective/6L38/Languages/French/about.txt"
	- Linux : "/usr/share/gnome-inform7/Extensions/Reserved/Languages/French/about.txt" ou "/usr/share/gnome-inform7/Languages/French/about.txt" (à confirmer)

Sinon, vous pouvez ouvrir le fichier "about.txt" qui se trouve à l'emplacement mentionné ci-dessus et remplacer "Eric Forgeot" par "Nathanael Marion".

Sur macOS, vous devez vous assurer de sélectionner la version 6L32 d'Inform dans l'onglet "Settings" de votre projet.

Vous êtes maintenant prêt à créer une fiction interactive en français. Pour cela, il suffit d'écrire "(in French)" à la fin de la première ligne de votre code source (celle spécifiant le titre du jeu et le nom de l'auteur).

Par exemple:

	"Le Roi de Fihnargaia" by Éric Forgeot (in French)

	Le Petit couloir est un endroit.

Attention, vous ne devez PAS inclure l'extension avec la ligne "Include French Language by Nathanael Marion" !

Section: Écrire sa source en français

Avec cette extension, il est possible (mais pas obligatoire) d'écrire une partie de son code en français, à savoir l'état initial du monde et les conditions. Par exemple :

	Les cuisines sont un endroit.
	Le grimoire est une chose dans les cuisines.
	L' armoire (f) est dans les cuisines.
	La chope est dans l' armoire.
	Les pâtisseries (f) sont des choses edible dans les cuisines.

Ce code va créer un endroit appelé "cuisines" et y mettre le grimoire, l'armoire (contenant la chope) et les pâtisseries.

Notez le "(f)" après l'armoire et les pâtisseries, qui sert à indiquer que ces deux objets sont féminins : le code ne peut pas le deviner simplement avec les déterminants "l'" ou "les" (si vous préférez utiliser les déterminants en anglais, il devient obligatoire de spécifier le genre avec "(m)" et "(f)" à chaque fois).

Il doit toujours y avoir une espace entre le déterminant et le nom (afin qu'Inform puisse comprendre qu'il s'agit bien de deux mots séparés). Il est donc possible d'écrire "l' armoire (f)" ou "la armoire", mais pas "l'armoire".

Les adjectifs doivent toujours être écrits en anglais, et donc ne s'accordent pas (comme "edible"). Il est cependant en général possible de les écrire après le nom plutôt qu'avant. (Si vous obtenez une erreur de compilation dans ce cas, essayez de mettre l'adjectif avant le nom, comme en anglais.)

Vous remarquerez également que les verbes et les types d'objet et de valeur peuvent être en français.

Voici les équivalences français-anglais pour les types :

	objet -> object
	endroit -> room
	chose -> thing
	porte -> door
	contenant -> container
	véhicule -> vehicle
	fourre-tout -> player's holdall
	support -> supporter
	toile de fond -> backdrop
	personne -> person
	homme -> man
	femme -> women
	animal -> animal
	appareil -> device
	direction -> direction
	région -> region
	nombre -> number
	nombre réel -> real number
	heure -> time
	booléen -> truth state
	texte -> text
	caractère unicode -> unicode character
	bribe -> snippet
	action stockée -> stored action
	scène -> scene
	erreur du parseur de commande -> command parser error
	option -> use option
	réponse -> response
	verbe -> verb
	nom de tableau -> table name
	nom d'équation -> equation name
	résultat de règles -> rulebook outcome
	nom d'action -> action name
	nom de figure -> figure name
	nom de son -> sound name
	fichier externe -> external file

Et celles pour les verbes :

	être -> to be
	avoir -> to have
	établir un rapport avec -> to relate
	fournir -> to provide
	contenir -> to contain
	supporter/soutenir -> to support
	incorporer  -> to incorporate
	englober -> to enclose
	porter -> to carry
	arborer -> to wear
	tenir -> to hold
	cacher -> to conceal
	ouvrir -> to unlock
	être dans -> to be in
	être sur -> to be on
	être une partie de/du/des -> to be part of
	être vêtu/vêtue de/du/des -> to wear
	être supérieur/supérieure à -> to be greater than
	être plus grand/grande que -> to be greater than
	être inférieur/inférieure à -> to be less than
	être plus petit/petite que -> to be less than
	être au moins -> to be at least
	être au plus -> to be at most
	être adjacent/adjacente/contigu/contiguë à -> to be adjacent to
	être au-dessus de/du/des -> to be above
	être en dessous de/du/des -> to be below
	être à travers -> to be through
	être au nord de/du/des -> to be north from (de même pour les sept autres directions)

Trois autres notions sont aussi traduites :

	tenu -> carried
	porté -> worn
	ici -> here

Si vous créez votre propre type, il est préférable de le créer en anglais, puis de le traduire :

	A horse is a kind of animal.
	A horse translates into French as un cheval.

Cela permet de créer le pluriel approprié en français (ici, "chevaux").

Vous pouvez également écrire les nombres jusqu'à douze en lettres et en français.

Bien évidemment, rien ne vous oblige à utiliser ces traductions. Vous pouvez toujours utiliser "thing" à la place de "chose", par exemple.

Enfin, pour afficher le nom d'un objet dans un texte avec le déterminant adéquat, il est possible d'utiliser les substitutions suivantes :

	"[le (objet)]"
	"[la (objet)]"
	"[l' (objet)]" (noter l'espace)
	"[les (objet)]"
	"[un (objet)]"
	"[une (objet)]"
	"[des (objet)]"
	"[du (objet)]"
	"[de la (objet)]"
	"[au (objet)]"
	"[à la (objet)]"
	"[aux (objet)]"

La substitution "[du (objet)]" et "[de la (objet)]" afficheront le nom de l'objet précédé de "du", de "de la" ou de "des", suivant le genre et le nombre dudit objet (cela n'est cependant pas le cas pour "[des (objet)]", qui est déjà utilisé pour afficher le nom de l'objet précédé par l'article indéfini). De manière similaire, "[au (objet)]", "[à la (objet)]" et "[aux (objet)]" afficheront le nom de l'objet précédé de "au", de "à la" ou de "aux".

Toutes les substitutions ci-dessus existent avec une majuscule au déterminant pour l'afficher avec une majuscule initiale dans le texte en jeu.

Comme pour les types et les verbes, il est toujours possible d'utiliser les substitutions en anglais "[the (objet)]" (à la place de "[le/la/l'/les (objet)]") et "[a/an (objet)]" (à la place de de "[un/une/des (objet)]") ; le résultat sera le même.

Section: Cas particuliers pour les déterminants

Parfois, l'extension a du mal à choisir les déterminants à utiliser pour les objets. Dans ces cas-là, il faut spécifier une propriété Inform 6, "articles", comme cela :

	*:Include (-
		with articles "Mon article défini" "mon article défini" "mon article indéfini",
	-) when defining X.

(Où X est l'objet qui aura cette propriété.)

Des exemples spécifiques suivent.

- Premièrement, les H aspirés (car il sont considérés comme muets autrement) :

	*:Le hibou est un animal.

	Include (-
		with articles "Le " " le " "un ",
	-) when defining le hibou.

(Il y a une espace après chaque déterminant.)

- Deuxièmement, les mots commençant par un oe collé (Inform a des problèmes avec ce caractère) :

	*:L' oeuf est une chose. Le printed name est "œuf".

	Include (-
		with articles "L'" "l'" "un ",
	-) when defining l' oeuf.

(On ne peut pas écrire de oe collé directement dans la source, alors il faut spécifier le printed name. Comme pour le hibou, il y a une espace après "un".)

- Finalement, quand on veut un indefinite article élidé:

	*:L' Orbe étincelant est une chose.

	Include (-
		with articles "L'" "l'" "l'",
	-) when defining l' Orbe étincelant.

(Si on avait écrit :

	L' indefinite article de l' Orbe est "l[']".

alors il y aurait eu une espace entre le déterminant et le nom en jeu.)

Section: Compréhension

Par défaut, le jeu retirera toujours les accents et autres diacritiques des commandes avant d'interpréter ces dernières ; c'est pourquoi il faut écrire les lignes de compréhension sans diacritiques :

	Understand "pale", "epee", "fantome", "du", "demon", "des" or "iles" as la lame.

Le jeu n'ajoutera jamais les diacritiques si le joueur ne les tape pas. Si les diacritiques sont spécifiés dans une ligne "Understand", le joueur ne pourra plus interagir avec l'objet : les accents seront requis dans la commande, mais le jeu les enlèvera avant qu'elle ne soit interprétée.

Si le nom de l'objet dans la source a des diacritiques, il faut donc aussi absolument ajouter une ligne de compréhension, même si cela semble redondant :

	Les pâtisseries (f) sont des choses edible dans les cuisines.
	Understand "patisseries" as les pâtisseries.

(Il est possible de changer comment les diacritiques sont gérés dans les commandes. Voir la section dans le chapitre "Utilisation avancée" plus bas.)

Si le joueur tape un verbe pronominal, l'objet de l'action résultante sera le personnage-joueur.

	>me fouiller
	>s'examiner

Dans ces exemples, le joueur fouillera ou examinera lui-même.

Pour définir une nouvelle commande pronominale qui ne s'applique pas à un objet, le mot "vous" doit être écrit après le verbe :

	Understand "enfuir vous" as fleeing.

Cela permettra au joueur de taper les commandes suivantes, qui résulteront toutes en l'action "fleeing" :

	>m'enfuir
	>s'enfuir
	>vous enfuir

Il n'y a donc pas besoin de définir une commande pour chacun des pronoms.

Une espace doit être insérée après chaque apostrophe dans les ligne de compréhension qui en contiennent une pour qu'elles puissent être comprises :

	Understand "aujourd' hui" as maintenant.

Et enfin, deux jetons ont été ajoutés pour les lignes de compréhension :

	"[de]", qui sera compris comme "de/du/des/d'".
	"[à]", qui sera compris comme "->/a/au/aux".

Section: Variantes régionales

Des options sont fournies pour configurer quelles variantes régionales seront utilisées par Inform.

Pour changer la façon dont le nombre 70 s'affiche quand on utilise la substitution "[(nombre) in words]" :

	Use variante soixante-dix. (Utilisée par défaut.)
	Use variante septante.

Pour changer la façon dont le nombre 80 s'affiche quand on utilise la substitution "[(nombre) in words]" :

	Use variante quatre-vingts. (Utilisée par défaut.)
	Use variante huitante.
	Use variante octante.

Pour changer la façon dont le nombre 90 s'affiche quand on utilise la substitution "[(nombre) in words]" :

	Use variante quatre-vingt-dix. (Utilisée par défaut.)
	Use variante nonante.

Dans chacun des cas ci-dessus, il ne faut pas utiliser deux options configurant le même nombre pour ne pas avoir un problème de compilation. (Par exemple, on ne peut pas utiliser huitante et octante en même temps).

Il est possible de directement spécifier une variante du français :

	Use Belgian dialect.
	Use Swiss dialect.

Pour le moment, cela n'a d'effet que pour les nombres (utilisation de "septante" et "nonante" pour la Belgique, par exemple). Il est possible de changer le comportement de ces options en les combinant avec d'autres. Par exemple, pour utiliser les variantes suisses sauf pour "quatre-vingts" (pour ne pas avoir "huitante", donc) :

	Use variante quatre-vingts.
	Use Swiss dialect.

Section: Autres substitutions utiles

Inform convertit les tirets cadratin et demi-cadratin dans les textes en traits d'union. Pour écrire un véritable tiret cadratin, il faut donc utiliser cette substitution :

	"[--]"

Il en va de même pour les espaces insécables, qui sont converties en espaces normales. Il faut donc utiliser la substitution suivante pour en avoir :

	"[_]"

Il s'agit d'un tiret bas, ou underscore.

Chapter: Texte adaptatif

Section: Le temps et le point de vue de l'histoire

Depuis la version 6L02 d'Inform, le temps et le point de vue de l'histoire peuvent être changés. On les spécifie en général au début du jeu, mais ils peuvent également être modifiés au cours de l'histoire :

	When play begins:
		now the story viewpoint is first person singular.

	Instead of thinking for the first time:
		say "Seul, je n'ai rien à faire, et je me laisse happer par des souvenirs qui remontent du plus profond de mon âme.";
		now the player is in le souvenir d'enfance;
		now the story tense is the past historic tense.

Par défaut, le point de vue est à la deuxième personne du pluriel (vous). Il peut être changé en modifiant le "story viewpoint", qui peut prendre six valeurs :

	first person singular (1re personne du singulier - je)
	second person singular (2e personne du singulier - tu)
	third person singular (3e personne du singulier - il ou elle)
	first person plural (1re personne du pluriel - nous)
	second person plural (2e personne du pluriel - vous)
	third person plural (3e personne du pluriel - ils ou elles)

Pour utiliser "elle" ou "elles", il faut spécifier que le joueur est une femme tout en utilisant le point de vue approprié :

	Nevena est une femme. Le player est Nevena.

Si on utilise la troisième personne du pluriel, il faut également ajouter la propriété "plural-named" au joueur (objet "yourself" par défaut).

Le temps du jeu, quant à lui, est au présent par défaut, et est changé en modifiant le "story tense", qui peut prendre six valeurs :

	present tense (présent)
	past historic tense (passé simple)
	future tense (futur simple)
	perfect tense (passé composé)
	past tense (imparfait)
	past perfect tense (plus-que-parfait)

Pour un récit au passé, il est conseillé d'utiliser le "past historic tense" ou le "perfect tense" et non le "past tense". Ainsi, certains verbes seront conjugués à l'imparfait si approprié. Vous pouvez utiliser le "past tense" si vous le souhaitez, mais tous les verbes seront alors conjugué à l'imparfait, sans passé simple ou composé.

Le "past perfect tense" n'a pas été testé et certaines réponses ne seront pas correctes avec ce temps. Heureusement, il est peu probable qu'un auteur veuille utiliser le plus-que-parfait comme temps de l'histoire ; mais si vous le voulez vraiment, veuillez nous contacter.

Ce temps a tout de même une utilité : il est possible de conjuguer un verbe dans n'importe quel temps, indépendamment de celui de l'histoire (cf. section 14.9 du manuel d'Inform).

À noter également que ces deux substitutions de texte sont disponibles :

	"[maintenant]" : affiche "maintenant" si le temps est au présent, et "à ce moment" sinon.
	"[ici]" : affiche "ici" si le temps est au présent, et "à cet endroit" sinon.

Ces substitutions existent avec une majuscule, au cas où elles doivent être utilisées en début de phrase.

Section: Les pronoms et déterminants adaptatifs

Si le point de vue vient à changer au cours du jeu, il est important d'écrire ses textes de façon à ce que les pronoms se référant au joueur changent dynamiquement. Pour cela, l'extension fournit ces substitutions de texte :

	"[tu]", pour le sujet : "je", "tu", "il"...

	"[tu-j']" : même chose que la substitution précédente, sauf pour le "je", qui est remplacé par "j'" (utile pour les verbes commençant par une voyelle).

	"[si tu]" : "si je", "si tu", "s'il"...

	"[te]", pour le complément direct : "me", "te", "le"... comme dans "je le donne".

	"[t']", pour la version élidée du précédent : "m'", "t'", "l'"...

	"[te-lui]", pour le complément indirect : "me", "te", "lui"... comme dans "je lui donne".

	"[t'-lui]", pour la version élidée du précédent : "m'", "t'", "lui "...

	"[te-se]", pour le pronom réfléchi : "me", "te", "se"... comme dans "il se donne".

	"[t'-s']", pour la version élidée du précédent : "m'", "t'", "s'"...

	"[toi]" : "moi", "toi", "lui"... comme dans "toi", "moi", "eux-mêmes"...

	"[de toi]" : "de moi", "de toi", "d'elle", "d'eux"...

	"[le tien]" : "la mienne", "le tien", "les vôtres"... Il faut écrire "[regarding (objet)]" auparavant pour effectuer l'accord avec ledit objet.

	"[ton/ta/tes (objet)]" : "mon [objet]", "ta [objet]", "notre [objet]"... (En fonction du point de vue et de l'objet donné.)

	"[ton]", "[ta]", "[tes]" : même chose que ci-dessus en fonction du point de vue, mais à un genre et un nombre fixé, quand l'objet n'existe pas dans le monde du jeu et que le texte est statique : "[Tu] [sais] tenir [tes] mains tranquilles[_]!".

Encore une fois, ces substitutions existent avec une majuscule initiale, au cas où elles seraient utilisées en début de phrase.

Des substitutions similaires existent, mais qui concernent le dernier objet affiché, ou l'objet dans la substitution "[regarding (objet)]" :

	"[celui]" : "celui", "celle", "ceux" ou "celles".

	"[il]" : "il", "elle", "ils" ou "elles".

	"[le]" : "le", "la" ou "les".

	"[l']", version élidée du précédent : "l'" ou "les ".

	"[lui]" : "lui" ou "leur" (pronom COI).

	"[son/sa/ses/leur/leurs (objet)]" : "son [objet]", "ses [objet]", "leurs [objet]"... en fonction du prior named object (le propriétaire), et l'objet donné.

	"[son]" : "son" ou "leur".

	"[sa]" : "sa" ou "leur".

	"[ses]" : "ses" ou "leurs".

	"[le sien]" : "le sien", "la sienne", "les siens" ou "les siennes".

	"[le leur]" : "le leur", "la leur" ou "les leur".

Comme toujours, ces substitutions existent avec une majuscule initiale.

Section: Les adjectifs adaptatifs

Si un adjectif doit qualifier un nom dont on ne connait pas l'identité à l'avance -- par exemple "[Le noun] est beau" --, il est nécessaire que l'adjectif s'accorde en conséquence. Il serait possible d'écrire

	"[Le noun] est [if the noun is male and the noun is singular-named]beau[else if the noun is male and the noun is plural-named]beaux[else if the noun is female and the noun is singular-named]belle[else]belles[end if]"

mais cela deviendrait vite fastidieux si le jeu comporte de nombreux cas comme celui-là.

C'est pourquoi il est possible de créer de nouvelles substitutions d'adjectifs :

	In French beau is an adjective.

Inform s'occupera tout seul des règles d'accord, tenant même en compte les exceptions dans ces règles. Pour utiliser cet adjectif venant d'être déclaré, il suffit d'écrire :

	Instead of examining something, say "[Le noun] est [beau].".

(Notez les crochets autour de "beau".)

Voici la liste des adjectifs ayant déjà été déclarés dans l'extension, et que vous pouvez donc utiliser directement :

	allumé, ancien, descendu, déverrouillé, disponible, entré, éteint, fermé, impressionné, incapable, intéressé, monté, mort, ouvert, plongé, porté, poussé, sorti, verrouillé et vide.

Section: Les verbes adaptatifs

Comme pour les adjectifs, les verbes ont besoin de s'accorder avec ce qui les précède, en plus d'être conjugués au temps de l'histoire. Il est donc possible de créer un verbe et ce, aussi facilement qu'un adjectif :

	In French écrire is a verb.

Il devient alors utilisable dans un texte, aussi bien à la forme affirmative que négative :

	Instead of examining l' ordinateur, say "[Tu] [écris] une fiction interactive ces temps-ci.".
	Instead of examining a person, say "[regarding the noun][Il] [n'écris pas] une fiction interactive.".

Le verbe se conjuguera automatiquement au temps de l'histoire et avec l'objet qui le précède, ou avec l'objet dans "[regarding (objet)]". Notez que la substitution est toujours écrite à la deuxième personne du singulier au présent, même dans des phrases où le sujet est à une autre personne.

L'extension définit déjà les verbes suivants, qui sont donc prêts à être utilisés :

	s'agir, agiter, aider, aller, allumer, apprécier, arborer, arriver, attendre, avoir, cacher, chanter, clôturer, contenir, descendre, déverrouiller, devoir, donner, écouter, emprunter, enfiler, enlever, entendre, entrer, essayer, éteindre, être, examiner, faire, fermer, fouiller, fournir, frotter, goûter, hésiter, incorporer, jongler, manger, manquer, marmonner, mener, mettre, monter, ouvrir, parler, passer, penser, porter, poser, posséder, pousser, pouvoir, presser, produire, ramasser, relever, regarder, remarquer, renifler, sauter, savoir, sembler, sentir, sortir, soutenir, supporter, tenir, tirer, toucher, tourner, transporter, trouver, venir, verrouiller et voir.

Lors de la définition d'un verbe, il est bon de connaître les cas suivants:

	"Asseoir" utilisera la conjugaison en "-ied" : "assieds", "assiérai".
	"Assoir" utilisera la conjugaison en "-ois" : "assois", "assoirai".

Enfin, l'extension définit des substitutions pour quelques cas spécifiques, que voici :

	"[tu es]" : équivalent à "[tu] [es]", sauf dans les cas où l'élision est nécessaire ("j'étais", "j'ai été", "j'avais été").

	"[adapt the verb (verbe) for background/bg]" : conjugue le verbe donné dans le temps de l'histoire, sauf si le "story tense" est un temps du passé. Dans ce cas-ci, le verbe sera conjugué à l'imparfait plutôt qu'au temps de l'histoire. Cela est utile pour les actions de second plan ou les descriptions. Le verbe doit être écrit au présent à la deuxième personne du singulier dans cette substitution.

	"[adapt the verb (verbe) from (point de vue) for background/bg]" : conjugue le verbe de la même façon que ci-dessus, mais à une personne spécifique.

	"[negate the verb (verbe) for background/bg]" et "[negate the verb (verbe) from (point de vue) for background/bg]" : même chose que les substitutions précédentes, mais en affichant le verbe dans sa forme négative (ne ... pas).

	"[c'est]" : affiche "c'est" selon le temps de l'histoire. (Utile car il n'y a pas d'élision avec certains temps, comme le futur simple : "ce sera".)

	"[c'est-c'était]" : même chose que ci-dessus, sauf si le "story tense" est un temps du passé. Dans ce cas-ci, affiche "c'était" (à l'imparfait).

La première et les deux dernières substitutions existent également avec une majuscule initiale. Les substitutions "[ce n'est pas]" et "[ce n'est-n'était pas]" n'ont volontairement pas été définies, car il est possible d'écrire à la place :

	"Ce [n'es pas]"
	"Ce [adapt the verb es from the third person singular for background]"

Chapter: Utilisation avancée

Ce chapitre explique des concepts avancés, qu'il n'y a pas besoin de connaître pour écrire des projets en français.

Section: Compiler vers la Z-machine

Par défaut, les jeux produits avec l'extension française sont trop gros pour la Z-machine. Il est possible de rendre le fichier compilé plus petit en utilisant l'option suivante :

	Use OMIT_UNUSED_ROUTINES of 1.

Pour de petits projets, cela peut permettre de compiler vers la Z-machine.

Et même si vous restez sur Glulx, cette option permet de réduire la taille du fichier final de manière non négligeable (presque 100 ko pour un petit projet). Il ne devrait normalement pas y avoir d'effets secondaires.

(Pour les utilisateurs Inform 6 : cette option permet de ne pas compiler les routines I6 non utilisées par le jeu.)

Section: Changer la façon dont le jeu traite les diacritiques dans les commandes

Même s'il est rarement nécessaire de changer comment les diacritiques sont traités dans les commandes, il est possible de le faire en modifiant la valeur de la variable "gestion-diacritiques" :

	When play begins:
		now gestion-diacritiques is 1.

Une valeur de 0 correspond au comportement par défaut (diacritiques toujours supprimés).

Avec une valeur de 1, le jeu enlèvera les diacritiques des mots qu'il ne connaît pas. (Pour les utilisateurs d'Inform 6 : cela arrive quand un mot n'est pas dans le dictionnaire.) Cela est utile quand on veut par exemple pouvoir distinguer un "foret" d'une "forêt".

Cela peut néanmoins être dangereux, car si un mot dans une ligne de compréhension contient un accent, alors l'accent ne sera plus jamais enlevé pour ce mot, étant donné qu'Inform le connaîtra. Ceci est notamment important pour le mot "à" : si cette préposition (avec l'accent) se trouve dans l'une de vos lignes de commande, alors beaucoup d'actions ne pourront plus être effectuées par le joueur car elles ont été définies sans accents dans l'extension.

Une valeur de 2 fait en sorte que les diacritiques soient toujours gardés. Cela n'est vraiment pas recommandé car les lignes de compréhension sont écrites sans diacritiques dans l'extension, donc beaucoup d'actions ne pourront plus être effectuées.

Chapter: Annexes

Section: Bogues connus

La liste complète des bogues et autres améliorations à faire sur l'extension est disponible à cette adresse :

	https://gitlab.com/fiction-interactive-fr/inform7-fr/-/issues

Voici ceux qu'un auteur est le plus susceptible de rencontrer.

- Problème lors de la création de supports

Il est impossible de créer un support en tapant une ligne comme celle-ci :

	La table est un support dans la salle à manger.

En effet, cette assertion est lue "(La table est un) support (dans la salle à manger)" (où le verbe serait "to support") plutôt que "(La table) est (un support) dans (la salle à manger)" (où le verbe serait "être dans". Elle crée donc une chose nommée "dans la salle à manger" qui est sur un support nommé "la table est un". La seule solution trouvée est de séparer l'assertion en deux :

	La table est un support. La table est dans la salle à manger.

- Si vous trouvez d'autres bogues ou des fautes, ou que vous avez des remarques sur l'extension, n'hésitez pas à écrire sur notre forum ou sur Discord (liens plus bas) ou à les signaler au lien plus haut.

Section: Notes

L'extension est mise à jour régulièrement. Assurez-vous d'avoir la version la plus récente ici :

	https://gitlab.com/fiction-interactive-fr/inform7-fr

Une extension appelée "Experimental French Features" est également disponible à cette adresse. Elle permet d'écrire une encore plus grande partie de sa source en français. Cependant, comme son nom l'indique, il est possible qu'elle puisse créer des problèmes (même si tout semble fonctionner). À utiliser à vos propres risques ! Quand ces fonctionnalités supplémentaires seront bien supportées par Inform 7, elles seront incluses dans la présente extension.

Section: Remerciements et contact

All hail to Sarganar and the Spanish translation team!

	http://www.caad.es/informate/infsp/index.htm

Nathanaël Marion, Hugo Labrande, Éric Forgeot, Jean-Luc Pontico, Samuel Verschelde et Rémi Verschelde :

	http://www.fiction-interactive.fr/

Notre forum :

	http://ifiction.free.fr/taverne

Notre serveur Discord :

	https://discord.gg/EhmdFsv

Example: * Actions supplémentaires - Exemples d'implantation d'actions qui étaient incluses avec d'anciennes versions d'Inform ou de l'extension française.

Ces actions ont soit été incluses dans les précédentes version de l'extension, soit été retirées des actions de bases d'Inform. Leur implantation est montrée ci-dessous afin d'assurer la compatibilité avec la source d'anciens jeux. Libre à vous de les adapter !

Lire / Reading

	*:Understand the command "read" as something new.
	Understand the command "lire" as something new.
	Reading is an action applying to one visible thing and requiring light.
	Understand "read [something]" or "lire [something]" as reading.

	Report reading (this is the standard report reading rule):
		say "Il n'y [adapt the verb as for bg] rien de spécial à lire [ici]." (A).

	Report someone reading (this is the report other people reading rule):
		say "[The actor] [essayes] de lire quelque chose sur [le noun]." (A).

Chanter / Singing

	*:Singing is an action applying to nothing.
	Understand "sing" or "chanter" as singing.
	Understand the command "fredonner" as "chanter".

	Report singing (this is the standard report singing rule):
		say "[if the story tense is simple][Tu] [else][Tu-j'][end if][chantes] un morceau de la première chanson qui [te-lui] [adapt the verb viens from the third person singular for bg] à l'esprit." (A).

	Report someone singing (this is the report other people singing rule):
		say "[The actor] se [mets] à chanter pendant un moment." (A).

Nager / Swimming

	*:Swimming is an action applying to nothing.
	Understand "swim" or "nager" as swimming.
	Understand the command "dive" as "swim".
	Understand the command "plonger" as "nager".

	Check an actor swimming (this is the block swimming rule):
		if the actor is the player:
			say "Il n'y [adapt the verb as from the third person singular for bg] pas assez d'eau pour nager [ici]." (A);
		stop the action.

Parler / Talking to

Les règles "does the player mean" à la fin permettent de privilégier les personnes, sauf quand il s'agit du joueur (auquel cas on reste indifférent).

	*:Talking to is an action applying to one visible thing.
	Understand "talk to [something]", "speak to [something]", "parler avec/a/au/aux [something]" or "questionner [something]" as talking to.
	Understand the command "discuter" as "parler".

	Check an actor talking to (this is the can't talk to a non-person rule):
		if the noun is not a person:
			if the actor is the player:
				say "[Tu] [negate the verb peux for bg] parler [au noun][_]!" (A);
			stop the action.

	Check an actor talking to (this is the talking to yourself rule):
		if the noun is the actor:
			if the actor is the player:
				say "[Tu] [if the story tense is simple][te-se] [parles][else if the story tense is perfect tense and (the story viewpoint is first person singular or the story viewpoint is first person plural or the story viewpoint is third person plural)][te-se] [adapt the verb es in present tense] parlé[else if the story tense is perfect tense][t'-s'][adapt the verb es in present tense] parlé[else if the story tense is past perfect tense and (the story viewpoint is first person singular or the story viewpoint is first person plural or the story viewpoint is third person plural)][te-se] [adapt the verb es in past tense] parlé[else if the story tense is past perfect tense][t'-s'][adapt the verb es in past tense] parlé[end if] à [toi]-même[if the player is plural-named]s[end if] pendant un moment." (A);
			stop the action.

	Unsuccessful attempt by someone talking to while the reason the action failed is the talking to yourself rule (this is the other people talking to themselves rule):
		[TODO : Le "[lui]" est le pronom conjoint (lui/leur) alors qu'il faudrait le disjoint (lui/elle/eux/elles).]
		say "[L' actor] [marmonnes] quelques mots à [lui]-même[if the actor is plural-named]s[end if] pendant un moment." (A).

	Report an actor talking to (this is the standard report talking to rule):
		say "[if the actor is the player][Tu][else][The actor][end if] n['][adapt the verb as for bg] rien à dire." (A).

	Does the player mean talking to a person:
		it is very likely.

	Does the player mean talking to the player:
		it is possible.

Example: *** Le Roi de Fihnargaia - Un petit exemple de jeu en français.

	*:"Le Roi de Fihnargaia" by Eric Forgeot (in French)

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
	[Before showing tablier to la reine for the first time:
	say "Vous détachez votre tablier pour le présenter à la Reine, mais maladroit comme vous l'êtes, vous détachez en même temps votre pantalon, qui tombe à vos pied.";
	try showing tablier to reine des nains;
	say "Le Roi, malgré sa bonhommie légendaire, s'en offusque (ou est vaguement jaloux), et il vous fait jeter dans les cachots sombres de Fihnargaia.[line break]Six mois plus tard, vous revoilà devant lui.";
	stop the action.]

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
		now le roi des nains est distrait; [mais comme on gagne juste après, à quoi ça sert ?]
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

	Instead of smelling les pâtisseries, say "Une bonne odeur appétissante…".

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
	[Rule for printing the name of tonneau:
	say "tonneau";
	omit contents in listing.]

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
