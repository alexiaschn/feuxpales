Version 1/171112 of Experimental French Features by Nathanael Marion begins here.

"This experimental extension translates as far as it can the syntax, the phrases, the variables and the adjectives into French. Will be deprecated when Inform will support it natively."

Use authorial modesty.

Volume 1 - French Syntax

[Cette section ne fonctionne que si elle est lue très tôt lors de la compilation.
Il y a deux moyens d'y parvenir :
Écrire la grammaire Preform directement au début de la source du jeu ou l'inclure dans l'extension French Language.

Forcer l'auteur à copier un énorme texte dans sa source est peu pratique,
et il n'est pas possible de modifier la source de l'extension française car ces fonctionnalités ne sont pas encore officielles.

J'utilise donc un remplacement de section afin qu'Inform croit que le code qui suit provient de l'extension French Language.
J'ai choisi le chapitre sur les cas grammaticaux, car il est vide par défaut, cela évite de recopier une partie de l'extension ici.

Certaine parties ne fonctionnent cependant que quand elles sont incluses dans la source du jeu. L'auteur sera obligé de les ajouter lui-même.]

Chapter 2.2.6 - Cases (in place of Chapter 2.2.6 - Cases in French Language by Nathanael Marion)

Include (-
language French

<include-in-debugging-sentence-subject> ::=
	seulement <debugging-log-request> |	
	<debugging-log-request>			

<debugging-log-request> ::=
	tous |					
	rien |						
	<preform-nonterminal> |			
	...								

<extension-documentation-heading> ::=
	chapitre : ... |		
	section : ...		

<extension-example-header> ::=
	exemple : <row-of-asterisks> ... - ... |
	exemple : ... - ...								

<extension-documentation-paste-marker> ::=
	* : ...

<pronoun> ::=
	<nominative-pronoun> |	
	<accusative-pronoun>	

<nominative-pronoun> ::=
	il/elle |				
	ils/elles					

[???]
<accusative-pronoun> ::=
	le/la/l' |			
	les					

<possessive-first-person> ::=
	mon/ma/mes |					
	notre/nos						

<possessive-second-person> ::=
	ton/ta/tes |					
	votre/vos					

<possessive-third-person> ::=
	son/sa/ses |			
	leur/leurs					

<relative-clause-marker> ::=
	qui

[pas utile ???]
<non-participles> ::=
	thing/something

<negated-clause> ::=
	non ...

<determiner-names> ::=
	tous/toutes |
	chaque |
	every |	[???]
	aucun/aucuns/aucune/aucunes |
	aucun/aucuns/aucune/aucunes |
	quelques |
	any |	[???]
	tous/toutes sauf |
	tous/toutes excepté |
	presque tous/toutes |
	presque aucun/aucuns/aucune/aucunes |
	la plupart du/de/des |
	moins de la moitié |
	au moins |
	au plus |
	exactement |
	moins que |
	less than |	[???]
	plus que |
	greater than |	[???]
	autre/autres que

[???]
<determination-of> ::=
	du/de/des le/la/les ... |	
	du/de/des ... |		
	...				

[???]
<excluded-from-determiners> ::=
	no one ***

<historical-reference-possible> ::=
	*** tour/tours/fois

<historical-reference> ::=
	pendant/pour <repetition-specification> |		
	<repetition-specification>				

<repetition-specification> ::=
	seulement/exactement <repetitions> |			
	au plus <repetitions> |					
	moins que <repetitions> |				
	au moins <repetitions> |				
	plus que <repetitions> |				
	en dessous de <repetitions> |					
	au-dessus de <repetitions> |					
	<repetitions>							

<iteration-repetitions> ::=							
	/d/ <rep-number> à <rep-number> fois |
	/e/ <rep-number> fois					

<turn-repetitions> ::=
	<rep-number> à <rep-number> tour/tours |
	<rep-number> tour/tours

<specifies-sentence-subject> ::=
	... ( {<literal-pattern-group-list>} ) |			
	<k-kind-articled> fois <k-kind-articled> |			
	<spec-type-expression> fois <spec-type-expression> |[issues PM_MultiplyingNonKOVs]
	...																	

<literal-pattern-group-tail> ::=
	, et <literal-pattern-group-list> |	
	,/et <literal-pattern-group-list>		

<literal-pattern-group> ::=
	singulier |								
	pluriel |								
	<literal-pattern-group-name> |			
	en ...... |								
	......									[issues PM_BadLPNameOption]

[???]
<literal-pattern-specification-tail> ::=
	with parts <literal-pattern-part-list> |
	<scaling-instruction> |					
	<scaling-instruction> offset by <literal> |
	offset by <literal> |					
	equivalent to <literal>					

[???]
<scaling-instruction> ::=
	scaled up by <cardinal-number> |		
	scaled up by <literal-real-number> |	
	scaled down by <cardinal-number> |		
	scaled down by <literal-real-number> |	
	scaled at <cardinal-number>	|			
	scaled at <literal-real-number>							

<literal-pattern-part-tail> ::=
	, et <literal-pattern-part-list> |		
	,/et <literal-pattern-part-list>		

<literal-pattern-part-option-tail> ::=
	, et <literal-pattern-part-option-list> |
	,/et <literal-pattern-part-option-list>

[???]
<literal-pattern-part-option> ::=
	optionnel |								
	preamble optional |						
	without leading zeros |					
	......									[issues PM_BadLPPartOption]

<literal-time> ::=
	moins <elapsed-time> | 										
	<elapsed-time> | 											
	<clock-time>												

<elapsed-time> ::=
	<cardinal-number> heure/heures |								
	<cardinal-number> minute/minutes |							
	<cardinal-number> heure/heures <cardinal-number> minute/minutes		

<event-rule-preamble> ::=
	à/À <clock-time> |				
	au moment où ... |			
	au moment où ... |			[issues PM_AtTimeThat]
	à/À ...							[issues PM_AtWithoutTime]

<value-understood-variable-name> ::=
	<k-kind> compris

<relation-names> ::=
	égalité |
	universalité |
	signification |
	fourniture |
	numériquement plus grand ou égal |
	numériquement plus grand |
	numériquement plus petit ou égal |
	numériquement plus petit ou égal |
	adjacence |
	contenu régionalement |
	contenu |
	support |
	incorporation |
	port |
	tenue |		[??? pas sûr]
	habillement |
	possession |
	visibilité |
	touchabilité |
	dissimulation |
	clôture |
	contenu dans un endroit				

<relates-sentence-left-object> ::=
	<relation-term-basic> ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées ... ) |				
	<relation-term-basic>								

<relates-sentence-right-object> ::=
	<relation-term-right-named> with fast route-finding |	[???]
	<relation-term-right-named> quand/lorsque ... |				
	<relation-term-right-named>							

<relation-term-right-named> ::=
	<relation-term-right> ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées ... ) |				
	<relation-term-right>								

<relation-term-right> ::=
	{un/une/des autres} |											
	{les uns les autres} |										
	{les uns les autres en groupe} |							
	<relation-term-basic>								

<relation-term-basic> ::=
	un/une ... |											
	plusieurs ... |										
	...	

[???]
<infinitive-usage-exceptional> ::=
	{be able to ...} |				
	{be able to} |					
	be ...							

<conjugation> ::=
	<nominative-pronoun> est/sont ... |
	<nominative-pronoun> ...		

<verb-implies-sentence-object> ::=
	relation <relation-name> inverse |	
	relation <relation-name> |			
	être <preposition> |				
	<verb-infinitive> |				
	propriété ... |						
	relation ... |						[issues PM_VerbRelationUnknown]
	{relation} |						[issues PM_VerbRelationVague]
	...									[issues PM_VerbUnknownMeaning]

<comparative-property-construction> ::=
	... than		[???]						

<same-property-as-construction> ::=
	aussi ... que					

<same-property-as-in-lexicon> ::=
	la même propriété que

<heading> ::=
	volume ... |					
	livre ... |						
	partie ... |						
	chapitre ... |					
	section ...						

<extension-end-marker-sentence> ::=
	... commence/commencent ici |			
	... se termine/terminent ici				

<structural-sentence> ::=
	<if-start-of-source-text> <quoted-text> |			
	<if-start-of-source-text> <quoted-text> ... |		
	<language-modifying-sentence> |						
	* |													
	* <quoted-text-without-subs> |						
	<if-start-of-paragraph> tableau ... |					
	<if-start-of-paragraph> équation ... |				
	inclure <nounphrase-articled> par <nounphrase> |		
	inclure (- ...										

<language-modifying-sentence> ::=
	include/inclure (- ### in the preform grammar |		
	use ... language element/elements		[???]

<use-option-sentence-shape> ::=
	use/utiliser ... .

<comma-divisible-sentence> ::=
	au lieu de ... |
	à/À chaque tour *** |
	avant de/d' ... |
	après ... |
	quand/lorsque ...

<list-or-division> ::=
	...... , _ou ...... |
	...... _ou ......

<heading-qualifier> ::=
	... ( <bracketed-heading-qualifier> ) |
	... pas dans la version finale |				
	... dans la version finale seulement |				
	... non indexé

<bracketed-heading-qualifier> ::=
	pas dans la version finale |					
	dans la version finale seulement |					
	non indexé |							
	<platform-qualifier> |				
	<extension-qualifier>				

<platform-qualifier> ::=
	pour <platform-identifier> seulement |	
	pas pour <platform-identifier>		

<platform-identifier> ::=
	<language-element> language element |	[???]
	...... language element |			[issues PM_UnknownLanguageElement]
	<virtual-machine> |					
	......								[issues PM_UnknownVirtualMachine]

<extension-qualifier> ::=
	à utiliser avec <extension-identifier> |				
	à utiliser sans <extension-identifier> |			
	à ne pas utiliser avec <extension-identifier> |			
	au lieu (<quoted-text>) dans <extension-identifier> |
	au lieu de ...... dans <extension-identifier>		

<extension-identifier> ::=
	...... par ......					

<nonstructural-sentence> ::=
	<nounphrase-definite> {est traduit dans/en <translation-target> par} <nounphrase-articled> |
	<nounphrase-alternative-list> {spécifie} <nounphrase> |
	<nounphrase-as-subject> {sont définis par} <nounphrase-as-object> |	
	le pluriel de <article> <nounphrase> {est} <nounphrase> |		
	le pluriel du/de/des <nounphrase> {est} <nounphrase> |		
	<nounphrase> {est une action} <nounphrase-actionable> |
	... est une action |									[issues PM_BadActionDeclaration]
	<nounphrase> {commence quand/lorsque} <nounphrase> |			
	<nounphrase> {se termine quand/lorsque} <nounphrase> |				
	<nounphrase> {termine} <nounphrase> quand/lorsque <nounphrase> |
	<nounphrase-figure> {est le fichier} <nounphrase> |	
	<nounphrase-sound> {est le fichier} <nounphrase> |		
	{tester} <nounphrase> avec <nounphrase> |				
	{comprendre} <nounphrase> comme <nounphrase> |	[??? Pas sûr pour "comme"]
	{l'histoire} {is episode} <nounphrase> |	[??? Pas sûr pour is "episode"]
	<nounphrase-external-file> {se nomme} <nounphrase> |		[??? "se nomme" ou "s'appelle" ou "est appelé" ?]
	<nounphrase> {est} {une activité} |					
	le verbe <nounphrase> {implique/signifie} <nounphrase-definite> |
	en <natural-language> <nounphrase> {est} {un verbe} |	
	to <nounphrase> {est} {un verbe} |						
	en <natural-language> <nounphrase> {est un verbe impliquant/signifiant} <nounphrase-definite> |
	to <nounphrase> {est un verbe impliquant/signifiant} <nounphrase-definite> |
	en <natural-language> <nounphrase> {est} {un adjectif} |
	en <natural-language> <nounphrase> {est un adjectif impliquant/signifiant} <nounphrase-definite> |
	<nounphrase> {peut/peuvent être} <nounphrase> |				
	<nounphrase> {est soit} <nounphrase> |	[either --> soit ???]
	<nounphrase-rule-list> {est/sont listée/listées} <nounphrase> |						
	<nounphrase-rule-list> {n'/ne est/sont listée/listées} <nounphrase> |		[??? à voir pour le "ne"]
	<nounphrase-rule-list> {ne fait/font rien} |									
	<nounphrase-rule-list> {ne fait/font rien} si/quand/lorsque <nounphrase> |				
	<nounphrase-rule-list> {ne fait/font rien} à moins que <nounphrase> |				
	<nounphrase-rule> {rempalce} <nounphrase-rule> |						
	<nounphrase-rule> {remplace} <nounphrase-rule> si/quand/lorsque <nounphrase> |
	<nounphrase-rule> {remplace} <nounphrase-rule> à moins que <nounphrase> |	
	<nounphrase> {met en relation} <nounphrase> à <nounphrase> |	[??? pas sûr pour la trad de "relates"]
	... peut avoir ... |									[issues PM_CanHave]
	<existential-sentence> |							
	<regular-sentence> |								
	{utiliser} <nounphrase> est traduit par <nounphrase> |		
	{utiliser} <nounphrase-articled-list> |					
	{publier avec} <nounphrase-articled-list> |			[ release --> publier ???]
	{indexer la carte avec} <nounphrase-articled-list> |		
	{inclure} <nounphrase-articled-list> dans le journal de débuggage|	[debugging log --> journal de débuggage ???]
	{omettre} <nounphrase-articled-list> du journal de débuggage |	
	{documenter} <nounphrase> à <nounphrase>		[??? pas sûr pour la préposition]			

<nounphrase-figure> ::=
	figure ...						

<nounphrase-sound> ::=
	son ...						

<variable-creation-tail> ::=
	... qui varie/varient |
	variable de ...				

[??? pas sûr pour les existential-np]
<existential-sentence> ::=
	{<s-existential-np>} a {... appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées <np-articled-balanced>} | 	
	<s-existential-np> a <existential-sentence-inner> |				
	<s-existential-np> a ... {<certainty> <preposition> <certainty>} ... |[issues PM_TwoLikelihoods]
	<s-existential-np> a ... {<certainty> <preposition>} ... |			
	<s-existential-np> a ... {<preposition> <certainty>} ... |			
	<s-existential-np> a ... {<preposition>} ... |						
	{<s-existential-np>} {a <certainty>} ... |							
	{<s-existential-np>} {<certainty> is/are} ... |	[??? pas sûr pour celui là]
	{<s-existential-np>} {a} ...															

<certainty> ::=
	toujours |					
	généralement |					
	rarement |						
	jamais |								
	initialement							

[ci-dessous à revoir ???]

<regular-sentence> ::=
	... <regular-sentence-tail1-without-rc> |										
	... <regular-sentence-tail2-without-rc> |										
	... <regular-sentence-tail3-without-rc> |										
	... <regular-sentence-tail4-without-rc> |										
	... <regular-sentence-tail1>	|												
	... <regular-sentence-tail2>	|												
	... <regular-sentence-tail3>	|												
	... <regular-sentence-tail4>													

<regular-sentence-tail1-without-rc> ::=
	<relative-clause-marker> <certainty> <general-verb-present-positive> ... |
	<relative-clause-marker> <general-verb-present-positive> ... |					
	<negated-noncopular-verb-present> ... |											
	<regular-sentence-tail1-inner>													

<regular-sentence-tail2-without-rc> ::=
	<relative-clause-marker> <certainty> <general-verb-present-positive> ... |
	<relative-clause-marker> <general-verb-present-positive> ... |					
	<negated-noncopular-verb-present> ... |											
	<regular-sentence-tail2-inner>													

<regular-sentence-tail3-without-rc> ::=
	<relative-clause-marker> <certainty> <general-verb-present-positive> ... |
	<relative-clause-marker> <general-verb-present-positive> ... |					
	<negated-noncopular-verb-present> ... |											
	<regular-sentence-tail3-inner>													

<regular-sentence-tail4-without-rc> ::=
	<relative-clause-marker> <certainty> <general-verb-present-positive> ... |
	<relative-clause-marker> <general-verb-present-positive> ... |					
	<negated-noncopular-verb-present> ... |											
	<regular-sentence-tail4-inner>													

<regular-sentence-tail1> ::=
	<negated-noncopular-verb-present> ... |											
	<regular-sentence-tail1-inner>													

<regular-sentence-tail2> ::=
	<negated-noncopular-verb-present> ... |											
	<regular-sentence-tail2-inner>													

<regular-sentence-tail3> ::=
	<negated-noncopular-verb-present> ... |											
	<regular-sentence-tail3-inner>													

<regular-sentence-tail4> ::=
	<negated-noncopular-verb-present> ... |											
	<regular-sentence-tail4-inner>													

<regular-sentence-tail1-inner> ::=
	{<certainty> <possession-verb-present-positive> <certainty>} ... |[issues PM_TwoLikelihoods]
	{<possession-verb-present-positive> <certainty>} ... |			
	{<certainty> <possession-verb-present-positive>} ... |			
	{<possession-verb-present-positive>} ...						

<regular-sentence-tail2-inner> ::=
	{<certainty> <copular-verb-present-positive> <certainty>} ... |	[issues PM_TwoLikelihoods]
	{<copular-verb-present-positive> <certainty>} ... |				
	{<certainty> <copular-verb-present-positive>} ... |				
	{<copular-verb-present-positive>} ...							

<regular-sentence-tail3-inner> ::=
	{<certainty> <general-verb-present-positive> <certainty>} ... |	[issues PM_TwoLikelihoods]
	{<general-verb-present-positive> <certainty>} ... |				
	{<certainty> <general-verb-present-positive>} ... |				
	{<general-verb-present-positive>} ...							

<regular-sentence-tail4-inner> ::=
	{<certainty> <general-verb-present-positive> <certainty>} ... |	[issues PM_TwoLikelihoods]
	{<foreign-verb-present-positive> <certainty>} ... |				
	{<certainty> <foreign-verb-present-positive>} ... |				
	{<foreign-verb-present-positive>} ...							

<bad-nonstructural-sentence-diagnosis> ::=
	... <bad-nonstructural-sentence-diagnosis-tail>

<bad-nonstructural-sentence-diagnosis-tail> ::=
	<relative-clause-marker> <certainty> <general-verb-present-positive> ... |
	<relative-clause-marker> <general-verb-present-positive> ... |					
	<past-tense-verb> ... |															[issues PM_NonPresentTense]
	<negated-verb> ...																[issues PM_NegatedVerb1]					

<np-articled-tail> ::=
	, {_et} <nounphrase-articled-list> |		
	{_,/et} <nounphrase-articled-list>						

<np-rule-tail> ::=
	, {_et} <nounphrase-rule-list> |			
	{_,/et} <nounphrase-rule-list>				

<nounphrase-rule> ::=
	règle ...							

<np-alternative-tail> ::=
	, {_ou} <nounphrase-alternative-list> |		
	{_,/ou} <nounphrase-alternative-list>

[les 2 ci-dessous à revoir ???]

<np-relative-phrase-limited> ::=
	<np-relative-phrase-implicit> |							
	<probable-participle> *** |								
	<np-relative-phrase-exception> |						
	<np-relative-phrase-explicit>							

<np-relative-phrase-unlimited> ::=
	<np-relative-phrase-implicit> |							
	<np-relative-phrase-exception> |						
	<np-relative-phrase-explicit>							

[??? J'ai commenté, car cela posait problème avec avec "Le salon est à l'intérieur du jardin"]
[<np-relative-phrase-exception> ::=
	à l'intérieur du/de/des ...]	

<np-relative-phrase-explicit> ::=
	<preposition> _,/et ... |			
	<preposition> _,/et |				
	<preposition> <np-inner-without-rp>	

<np-inner-without-rp> ::=
	... |										
	<np-inner> {appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées} <np-articled-balanced> |
	<np-inner> <np-with-or-having-tail> |		
	<np-inner> <np-tail> |					
	<np-kind-phrase> |							
	<np-inner> <np-from-or-of-tail> |			
	<nominative-pronoun> |						
	<np-articled-balanced>						

[??? à revoir]
<np-with-or-having-tail> ::=
	it with action *** |					
	{with/having} (/) *** |					
	{with/having} ... ( <response-letter> ) |
	{with/having} <np-new-property-list>							

<np-new-property-tail> ::=
	, {_et} <np-new-property-list> |
	{_,/et} <np-new-property-list>

<np-tail> ::=
	, {_et} <np-inner> |	
	{_,/et} <np-inner>	

<np-kind-phrase-unarticled> ::=
	type/types |				
	type/types de/d' <np-inner>

<np-from-or-of-tail> ::=
	en présence du/de/des ... |	
	... qui varie |			
	variable de ... |				
	<property-name-v> *** |		
	_du/de/des/d'/d'un/d'une <np-inner> |			
	_from <np-inner>	[???]

<action-name-formal> ::=
	action ...

<activity-name-formal> ::=
	activité ...

<relation-name-formal> ::=
	relation ...

<rule-name-formal> ::=
	règle ...

<rulebook-name-formal> ::=
	livre de règles ...

<has-property-name-tail> ::=
	, {_et} <has-properties-called-sentence-object> |
	{_,/et} <has-properties-called-sentence-object>								

<bad-property-name-diagnosis> ::=
	<article> |									[issues PM_PropertyCalledArticle]
	présence |									[issues PM_PropertyCalledPresence]
	*** , *** |									[issues PM_PropertyNameForbidden]
	*** <quoted-text> ***						[issues PM_PropertyNameForbidden]

[Doit être identique à <s-command>]
<control-structure-phrase> ::=
	/a/ si ... est début |			
	/b/ si ... est |					
	/c/ si ... |
	/c/ à moins que |				
	/d/ répéter/parcourir ... |
	/d/ parcourir ... |			
	/e/ tant que ... |					
	/f/ sinon |			
	/g/ sinon si ... |
	/g/ sinon à moins que |
	/h/ -- sinon |				
	/i/ -- ... |					
	/j/ let ... be the phrase ...		[???]

<end-control-structure-phrase> ::=
	/a/ fin si |
	/a/ fin à moins que |				
	/b/ fin tant que |					
	/c/ fin répéter					

<phrase-beginning-block> ::=
	... début

<extension-title-and-version> ::=
	version <extension-version> de <definite-article> <extension-unversioned> |
	version <extension-version> du/de/des <extension-unversioned> |				
	<extension-unversioned>							

<begins-here-sentence-subject> ::=
	<extension-title-and-version> par ... |
	...									[issues PM_ExtMiswordedBeginsHere]

<no-verb-diagnosis> ::=
	avant/chaque/après/quand/lorsque/instead/vérification/exécution/annonce ... |[issues PM_RuleWithoutColon]	[???]
	si ... |												[issues PM_IfOutsidePhrase]
	... , ... |												[issues PM_NoSuchVerbComma]
	...														[issues PM_NoSuchVerb]

<newfound-property-of> ::=
	{<property-name-v>} du/de/des ...

<creation-problem-diagnosis> ::=
	<article> |							[issues PM_NameIsArticle]
	... (/) ... |						[issues PM_NameWithBrackets]
	ni--crash--1 |						[issues PM_Crash1]
	ni--crash--10 |						[issues PM_Crash10]
	ni--crash--11 |						[issues PM_Crash11]
	, ... |								[issues PM_StartsWithComma]
	... , |								[issues PM_EndsWithComma]
	... quand/lorsque ... |				[issues PM_ObjectIncWhen]
	*** <quoted-text> *** |				[issues PM_NameWithText]
	<storage-nonkind-types> |			[issues PM_NameReserved]
	<command-phrase-nonkind-types> |	[issues PM_NameReserved]
	<condition-nonkind-types>			[issues PM_NameReserved]

<text-ending-with-a-calling> ::=
	... ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées le/la/les/l' ... ) |
	... ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées ... )

<text-including-a-calling> ::=
	... ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées ... ) ***

<unfortunate-name> ::=
	... avec/having/et/ou ... |	[??? pas sûr pour "having"]
	<unsuitable-name>

<something-loose-diagnosis> ::=
	*** quelque chose ***	[issues PM_EquatesSomethingToValue]	[???]

<forbidden-property-owners> ::=
	<article> type |	[issues PM_PropertyOfKind1]
	type |				[issues PM_PropertyOfKind1]
	<pronoun>			[issues PM_PropertyOfPronoun]

<can-be-sentence-object> ::=
	soit <nounphrase-alternative-list> ( <condition-name> ) |
	<nounphrase-alternative-list> ( <condition-name> ) |	
	soit <nounphrase-alternative-list> |					
	<nounphrase-alternative-list>							

<condition-name> ::=
	c'est <condition-name-inner> |	
	<condition-name-inner>					

<condition-name-innermost> ::=
	propriété <nounphrase> |				
	<nounphrase>			

<literal> ::=
	<cardinal-number> |					
	moins <cardinal-number> |			
	<quoted-text> ( <response-letter> ) |
	<quoted-text> |						
	<literal-real-number> |				
	<literal-truth-state> |				
	<literal-list> |					
	unicode <unicode-character> |		
	<literal-time> |					
	<literal-unit-notation>

<literal-truth-state> ::=
	faux |
	vrai

<literal-real-number> ::=
	_ pi |					
	_ e |					
	plus infini |			
	moins infini |		
	<literal-real-in-digits>

<s-constant-value> ::=
	<s-literal> |									
	rien	|										
	<s-miscellaneous-proper-noun> |					
	résultat <s-rulebook-outcome-name> |				
	option <s-use-option-name> |					
	verbe <instance-of-verb> |							
	<s-rule-name> réponse ( <response-letter> )									

<s-adjective-list> ::=
	non <indefinite-article> <s-adjective-list-unarticled> |	[???]
	<indefinite-article> <s-adjective-list-unarticled> |	
	<s-adjective-list-unarticled>							

<s-adjective-list-unarticled> ::=
	non <s-adjective> |										
	<s-adjective> |											
	non <s-adjective> <s-adjective-list-unarticled> |		
	<s-adjective> <s-adjective-list-unarticled>	

<s-description-uncomposite> ::=
	<s-description-uncalled> ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées <s-calling-name> ) |		
	<s-description-uncalled>								

[Mis par défaut dans l''extension française.

<s-description-unspecified> ::=
	<s-qualifiable-noun> |										
	<s-qualifiable-noun>?2 <s-applicable-adjective-list>?1		

<s-common-description-unspecified> ::=
	<s-qualifiable-common-noun> |
	<s-qualifiable-common-noun>?2 <s-applicable-adjective-list>?1
]

<s-description-nounless-uncomposite> ::=
	<s-description-nounless-uncalled> ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées <s-calling-name> ) |
	<s-description-nounless-uncalled>					

[De même.

<s-description-nounless-unspecified> ::=
	<s-qualifiable-noun> |										
	<s-qualifiable-noun>?2 <s-applicable-adjective-list>?1 |		
	<s-adjective-list>
]				

<s-type-expression-unarticled> ::=
	variable/variables <s-variable-scope> |		
	<s-variable-scope> qui varie/varient |
	<s-nonkind-type> |							
	<k-kind> |									
	<s-literal> |								
	<s-description> |							
	<s-constant-value>			

[???]
<s-variable-scope> ::=
	existing |								
	existing <s-type-expression> |			
	nonexisting |							
	nonexisting <s-type-expression> |		
	global |								
	global <s-type-expression> |			
	<s-type-expression>

[???]
<s-value> ::=
	( <s-value> ) |									
	<s-variable> |									
	<if-table-column-expected> <s-table-column-name> |
	<if-property-name-expected> <s-property-name> |	
	<s-constant-value>	|							
	<s-value> where <s-plain-text> |				
	<if-let-equation-mode> <s-plain-text-with-equals> |
	<s-property-name> |								
	<s-action-pattern-as-value> |					
	<s-value-phrase-non-of> |						
	<s-adjective-list-as-desc> |					
	<s-purely-physical-description> |				
	<s-table-reference> |							
	member/members of <s-description> |				
	member/members of <s-local-variable> |			
	<s-property-name> du/de/des <s-value> |				
	<if-pronoun-present> <possessive-third-person> <s-property-name> |
	entry <s-value> of/in/from <s-value> |			
	<s-description> |								
	<s-table-column-name> |							
	<s-value-phrase>

<property-of-shape> ::=
	<s-property-name> du/de/des ...

<s-table-reference> ::=
	entrée <s-table-column-name> |															
	<s-table-column-name> à la ligne <s-value> du/dans <s-value> |									
	<s-table-column-name> listé/listés/listée/listées dans <s-value> |												
	<s-table-column-name> correspondant à <s-table-column-name> dans <s-value> in <s-value> |
	<s-table-column-name> de <s-value> dans <s-value>		

<s-sentence> ::=
	<s-existential-np> <s-existential-verb-tail> |
	<s-noun-phrase> <s-general-verb-tail>			

[Enlevé car causait des problèmes avec des phrases comme "while there is a open door" (Inform pensait alors qu'il fallait forcément un nom de tableau).
[???]
<s-existential-np> ::=
	il y							
]

<s-universal-relation-term> ::=
	<s-noun-phrase> avec <s-noun-phrase>

[??? pour les 3 ci-dessous]
<s-np-with-relative-clause> ::=
	<s-noun-phrase-nounless> <s-implied-relative-verb-tail> |	
	<s-noun-phrase> <s-relative-verb-tail>					

<s-implied-relative-verb-tail> ::=
	<preposition> <s-noun-phrase-nounless> |					
	not <preposition> <s-noun-phrase-nounless>					

<s-relative-verb-tail> ::=
	<relative-clause-marker> <copular-verb> <preposition-implying-player> |	
	<relative-clause-marker> <copular-verb> <preposition> <s-noun-phrase-nounless> |
	<relative-clause-marker> <copular-verb> <s-noun-phrase-nounless> |		
	<relative-clause-marker> <universal-verb> <s-universal-relation-term> |
	<relative-clause-marker> <general-verb> <s-noun-phrase>					

<s-condition-pure> ::=
	( <s-condition-pure> ) |					
	<s-condition-pure> , et <s-condition-pure> |
	<s-condition-pure> et <s-condition-pure> |	
	<s-condition-pure> , ou <s-condition-pure> |
	<s-condition-pure> ou <s-condition-pure> |	
	<s-condition-with-chronology> |				
	<s-condition-atomic>

<s-condition-atomic> ::=
	<s-phrase-option-in-use> |							
	non <s-phrase-option-in-use> |	[???]						
	<s-nonexistential-phrase-to-decide> |				
	<s-past-action-pattern-as-condition> |				
	<s-past-action-pattern-as-negated-condition> |		
	<s-action-pattern-as-condition> |					
	<s-action-pattern-as-negated-condition> |			
	<s-sentence> |										
	<s-existential-phrase-to-decide>					

<s-nonexistential-phrase-to-decide> ::=
	<existential-verb-phrase> |							
	<s-phrase-to-decide> |								
	non <s-phrase-to-decide>	[???]						

<s-existential-phrase-to-decide> ::=
	^<existential-verb-phrase> |						
	<s-phrase-to-decide> |								
	non <s-phrase-to-decide> [???]			

<existential-verb-phrase> ::=
	<s-existential-np> est/sont ...

<s-command> ::=
	/a/ ( <s-command> ) |					
	/b/ sinon |					
	/c/ sinon si *** début |
	/c/ sinon à moins que *** début |
	/d/ sinon si *** , *** |
	/d/ sinon à moins que *** , *** |
	/e/ sinon si ... |
	/e/ sinon à moins que ... |		
	/f/ sinon ^si *** |
	/f/ sinon ^à ^moins ^que *** |		
	/g/ -- sinon |						
	/h/ -- <s-value> |						
	/i/ <s-command-phrase> |				
	/j/ <s-rulebook-outcome-name>

<s-command-phrase> ::=
	à la place <s-command-phrase-inner> |	
	<s-command-phrase-inner> à la place |	
	<s-command-phrase-inner>			

<s-command-phrase-inner> ::=
	dire <s-say-phrase> |				
	<s-to-phrase>						

<s-say-phrase> ::=
	<s-say-term> , <s-say-term> |		
	<quoted-text-with-subs> |			
	verbe <adaptive-verb> |				
	adjectif <adaptive-adjective> |	
	<adaptive-verb> |					
	verbe <modal-verb> <adaptive-verb> |	
	<modal-verb> <adaptive-verb> |		
	<adaptive-adjective> |				
	<s-text-substitution>		

<notable-linguistic-kinds> ::=
	langue naturelle |
	genre grammatical |
	temps grammatical |
	point de vue narratif |
	cas grammatical

<k-kind-as-name-token> ::=
	( <k-kind-as-name-token> ) |			
	nom du type du/de/des <k-kind-abbreviating> |	
	nom du type <k-kind-abbreviating> |	
	nom du type du/de/des ... |					
	nom du type ...											

<k-variable-definition> ::=
	<k-formal-kind-variable> |						
	<k-kind-of-kind> de type <k-formal-kind-variable>

[utile ???]
<k-irregular-kind-construction> ::=
	indexed text | 			
	indexed texts | 		
	object-based rulebook producing <k-kind> |
	object-based rulebook |	
	action-based rulebook |	
	object-based rule producing <k-kind> |	
	object-based rule |		
	action-based rule |		
	either-or property						

<k-optional-material> ::=
	( <k-optional-material> ) |			
	<article> <k-optional-material> |	
	rien |							
	action |							
	<k-kind>							

<k-tupled-material> ::=
	( <k-tuple-list> ) |				
	rien |							
	<k-single-material>			

[???]
<storage-nonkind-types> ::=
	storage |
	storages |
	variable |
	variables |
	property-value |
	property-values |
	table-reference |
	table-references |
	list-entry |
	list-entries

[???]
<command-phrase-nonkind-types> ::=
	phrase |
	phrases |
	action |
	actions |
	now-condition |
	now-conditions

<structural-phrase-problem-diagnosis> ::=
	/a/ sinon ^si *** |		[issues PM_WrongOtherwise]
	/a/ sinon ^{à moins que} *** |		[issues PM_WrongOtherwise]
	/b/ sinon si ... , ... |[issues PM_WrongOtherwise2]
	/b/ sinon à moins que ... , ... |[issues PM_WrongOtherwise2]
	/c/ sinon si ... début |[issues PM_WrongOtherwise3]
	/c/ sinon à moins que ... début |[issues PM_WrongOtherwise3]
	/d/ si ... alors |				[issues PM_WrongThen]
	/d/ à moins que ... alors |				[issues PM_WrongThen]
	/e/ si ... |							[issues PM_PossibleUnterminatedIf]
	/f/ à moins que ... |						[issues PM_PossibleUnterminatedUnless]
	/g/ continuer							[issues PM_WrongContinue]

<unknown-text-shape> ::=
	dire ... |			
	... et/ou ... |	
	...

<unknown-value-problem-diagnosis> ::=
	tours |						[issues PM_NumberOfTurns]
	... est/sont hors du jeu |	[issues PM_OutOfPlay]
	unicode ... |				[issues PM_MidTextUnicode]
	condition ... |				[issues PM_UnknownCondition]
	...							[issues PM_Unknown]

<unknown-use-option-diagnosis> ::=
	^option ...  |				[issues PM_OptionlessOption]
	...							[issues PM_Unknown]

<unknown-activity-diagnosis> ::=
	... du/de/des |					[issues PM_ActivityOf]
	...							[issues PM_Unknown]

<failed-text-substitution-diagnosis> ::=
	heure |							[issues PM_Time2]
	l'heure |						[issues PM_Time2]
	<spec-description> |			[issues PM_SayDescription]
	une liste de ... |					[issues PM_SayAList]
	<spec-type-expression-or-value>	|[issues PM_AllSayInvsFailed]
	...								[issues last-resort failed ts]								

<condition-problem-part-tail> ::=
	, et/ou <condition-problem-diagnosis> |					
	,/et/ou <condition-problem-diagnosis>						

<condition-problem-part> ::=
	/a/ <spec-condition> |						
	/b/ <spec-value> |							
	/c/ ... commence |
	/c/ ... se termine |						
	/d/ quand/lorsque *** |						
	/e/ ...

<property-name-construction> ::=
	propriété ...

<name-looking-like-property-test> ::=
	*** du/de/des ***

<measurement-adjective-definition> ::=
	/a/ <possessive-third-person> ... n'est pas ... |					[issues PM_GradingMisphrased]
	/a/ <possessive-third-person> ... ne sont pas ... |
	/b/ <possessive-third-person> {<property-name>} est/sont <measurement-range> |
	/c/ <possessive-third-person> ... est/sont <measurement-range>				

<measurement-range> ::=
	... ou plus |	
	... or moins |	
	...		

<table-column-heading-unbracketed> ::=
	<article> |									[issues PM_TableColumnArticle]
	{sujet} |									
	{<property-name>} |							
	{<s-constant-value>} |						[issues PM_TableColumnAlready]
	...											

<table-column-name-construction> ::=
	colonne ...

<table-header> ::=
	<table-new-name> ( continué ) |
	<table-new-name> ( corrigé ) |	
	<table-new-name> ( remplacé ) |	
	<table-new-name>				

<table-new-name> ::=
	tableau ... - ... |				
	tableau ### |						
	tableau du/de/des ... |					
	tableau ...						[issues PM_TableMisnamed]

<table-names-construction> ::=
	tableau ... |
	tableau du/de/des ...

<table-footer> ::=
	*** avec <cardinal-number> ligne/lignes vide/vides |	
	*** avec une/des ligne/lignes vide/vides pour chaque ...	

<table-cell-value> ::=
	l'action de <spec-stored-action> |
	<spec-stored-action> |				
	<instance-of-non-object> |			
	<spec-type-expression>				

<list-of-double-quotes> ::=
	<quoted-text> ou <list-of-double-quotes> |
	<quoted-text>

<rankings-table-name> ::=
	rangs

<defined-by-sentence-subject> ::=
	type/types de <spec-type-expression> |
	<spec-instance> |					[issues PM_TableDefiningObject]
	<spec-type-expression> |			
	...									[issues PM_TableDefiningTheImpossible]

[???]
<unfortunate-table-column-property> ::=
	location					[issues PM_TableColumnLocation]

<equation-name> ::=
	équation {<cardinal-number>} - ... |	
	équation {<cardinal-number>} |			
	équation - ... |						
	équation ...							[issues PM_EquationMisnumbered]

<equation-names-construction> ::=
	équation ... |
	... équation

<equation-where> ::=
	... où ...						

<equation-where-tail> ::=
	, _et <equation-where-list> |						
	_,/et <equation-where-list>		

<equation-where-setting> ::=
	<equation-symbol> est/sont <k-kind> |	
	<equation-symbol> est/sont <spec-value> |
	<equation-symbol> est/sont ... |		[issues PM_EquationSymbolNonValue]
	<equation-symbol> = <k-kind> |		[issues PM_EquationSymbolEqualsKOV]
	<equation-symbol> = <spec-value> |	
	<equation-symbol> = ... |			[issues PM_EquationSymbolNonValue]
	<equation-symbol>

<new-rulebook-name> ::=
	/a/ <definite-article> <new-rulebook-name> |
	/b/ règles <new-rulebook-name> |	
	/b/ livre de règles <new-rulebook-name> |
	/c/ à *** |								[issues PM_RulebookWithAt]
	/d/ pour *** |								[issues PM_RulebookWithTo]
	/e/ définition *** |						[issues PM_RulebookWithDefinition]
	/f/ ...										

<rulebook-name-construction> ::=
	règles ... |
	livre de règles ...			

<rulebook-stem-inner-unarticled> ::=
	règle sur <rulebook-stem-name> |	[??? problème avec "pour"]
	règle <rulebook-stem-name> |				
	première <rulebook-stem-name> |			
	dernière <rulebook-stem-name> |				
	<rulebook-stem-name>					

<rulebook-stem-name> ::=
	{quand/lorsque ... commence} |						
	{quand/lorsque ... se termine} |						
	...										

<rulebook-property> ::=
	comme résultat/résultats <rulebook-outcome-list> |
	par défaut <rulebook-default-outcome> |
	...									[issues PM_NonOutcomeProperty]

<rule-outcome> ::=
	réussite |				
	échec |				
	sans résultat					

<rulebook-outcome-tail> ::=
	, _et/ou <rulebook-outcome-list> |							
	_,/et/ou <rulebook-outcome-list>

<form-of-named-rule-outcome> ::=
	/b/ ... ( <rule-outcome> - par défaut ) |	
	/c/ ... ( <rule-outcome> ) |			
	/d/ ... ( ... ) |						[issues PM_BadOutcomeClarification]
	/e/ ...

<listed-in-sentence-object> ::=
	dans aucun livre de règles |						
	dans <destination-rulebook> |				
	en premier dans <destination-rulebook> |		
	en dernier dans <destination-rulebook> |		
	à la place de <rule-name> dans <rulebook-name> |
	à la place de <rule-name> dans ... |			[issues PM_NoSuchRulebookPlacement]
	à la place de ... dans ... |					[issues PM_NoSuchRuleExists]
	avant <rule-name> dans <rulebook-name> |	
	avant <rule-name> dans ... |				[issues PM_NoSuchRulebookPlacement]
	avant ... dans ... |						[issues PM_NoSuchRuleExists]
	après <rule-name> dans <rulebook-name> |	
	après <rule-name> dans ... |				[issues PM_NoSuchRulebookPlacement]
	après ... dans ... |						[issues PM_NoSuchRuleExists]
	à la place de ... |						[issues PM_UnspecifiedRulebookPlacement]
	avant ... |							[issues PM_UnspecifiedRulebookPlacement]
	après ... |								[issues PM_UnspecifiedRulebookPlacement]
	...										[issues PM_ImproperRulePlacement]					

<activity-noted> ::=
	<activity-new-name> ( action future ) |		[???]
	<activity-new-name> ( ... )	|				[issues PM_ActivityNoteUnknown]
	<activity-new-name>							

<activity-new-name> ::=
	... de quelque chose |				
	... quelque chose |					
	...											

<activity-name-construction> ::=
	activité ...

<run-time-context> ::=
	non <activity-list-unnegated> |				
	<activity-list-unnegated>				

<activity-tail> ::=
	, _ou <run-time-context> |					
	_,/ou <run-time-context>					

<activity-list-entry> ::=
	<activity-name> |							
	<activity-name> du/de/des/pour <activity-operand> |		[le "pour" peut poser problème ???]
	<activity-name> <activity-operand> |		
	^<if-parsing-al-conditions> ... |			
	<if-parsing-al-conditions> <spec-condition>	

<activity-operand> ::=
	quelque chose |						
	quelque chose d'autre |					
	<spec-type-expression-or-value>				

[???]
<inline-phrase-definition> ::=
	(- ### - in to only | 		
	(- ### - in to decide if only |
	(- ### - in to decide only |
	(- ### |					
	(- ### ...					[issues PM_TailAfterInline]

<rule-preamble> ::=
	définition |					
	ceci est la {règle ...} |		
	ceci est la règle |				[issues PM_NamelessRule]
	ceci est la règle ... |				[issues PM_UnarticledRule]
	<event-rule-preamble> |			
	pour |							[issues PM_BareTo]
	pour ... ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées ... ) |			[issues PM_DontCallPhrasesWithCalled]
	{pour ...} ( ceci est la {fonction ###} inverse au/à/aux ### ) |
	{pour ...} ( ceci est la {fonction ###} ) |
	{pour ...} ( ceci est ... ) |		
	pour ... |						
	... ( ceci est la {règle ...} ) |
	... ( ceci est la règle ) |		[issues PM_NamelessRule]
	... ( ceci est la règle ... ) |		[issues PM_UnarticledRule]
	...								

<now-phrase-preamble> ::=
	to now ...		[??? J'ai laissé "now" car si on met "maintenant", il ne laisse plus créer la phrase dans "French Phrasebook.]

<rule-preamble-fine> ::=
	<rule-preamble-finer> pendant <spec-scene-description> |
	<rule-preamble-finer>	

<rule-preamble-finer> ::=
	{<rulebook-stem-embellished>} { ...} |
	{<rulebook-stem-embellished>} |					
	...												

<rulebook-stem-embellished> ::=
	<rulebook-stem> *** |				
	règle pour <rulebook-stem> *** |		
	règle <rulebook-stem> ***			

<rulebook-bud> ::=
	du/de/des/pour ... |						
	règle sur/pour ... |				
	règle								

<unrecognised-rule-stem-diagnosis> ::=
	quand *** |				[issues PM_BadRulePreambleWhen]
	...						[issues PM_BadRulePreamble]

<when-while-clause> ::=
	... quand/lorsque ...

<parametric-problem-diagnosis> ::=
	/a/ quand le jeu commence |		[issues PM_WhenThePlay]
	/a/ quand le jeu se termine |
	/b/ ...								[issues PM_BadParameter]

<action-problem-diagnosis> ::=
	en présence du/de/des ... |	[issues PM_NonActionInPresenceOf]
	dans ...						[issues PM_NonActionIn]

<action-when-diagnosis> ::=
	... appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées ... {quand/lorsque ...} |	
	... {quand/lorsque *** rien ***} |	
	... {quand/lorsque *** n'importe où ***} |	
	... et {quand/lorsque ...} |			
	... {quand/lorsque ...} 				

<anl-diagnosis> ::=
	<anl-inner-diagnosis> quand/lorsque ... |		
	<anl-inner-diagnosis>				

<anl-tail-diagnosis> ::=
	, _ou <anl-inner-diagnosis> |				
	_,/ou <anl-inner-diagnosis>							

<phrase-preamble> ::=
	<phrase-preamble> ( déprecié ) |		
	<say-preamble>	|						
	<to-preamble>							

<to-preamble> ::=
	<to-preamble> ( opération arithmétique <cardinal-number> ) |
	<to-preamble> (opération d'attribution ) |
	{soit ... donné/donnés/donnée/données par ...} |				
	{soit ...} |								
	... -- fin |							
	... -- fin condition |				
	... -- fin boucle |						
	... -- dans boucle |						
	... -- dans ### |							
	...										

[???]
<phrase-vetting> ::=
	( ...... ) esr {<preposition>} ( ...... )[issues PM_MasksRelation]

<say-preamble> ::=
	/a/ <say-preamble> -- running on |	[???]		
	/b/ {dire sinon} |					
	/c/ {dire sinon si ...} |
	/c/ {dire sinon à moins que ...} |	
	/d/ {dire si ...} |
	/d/ {dire à moins que ...} |					
	/e/ {dire fin si} |
	/e/ {dire fin à moins que} |					
	/f/ {dire ...} -- commençant ### |			
	/g/ {dire ...} -- continuant ### |			
	/h/ {dire ...} -- finissant ### avec le marqueur ### |
	/i/ {dire ...} -- finissant ### |				
	/j/ {dire ...}								

<to-return-data> ::=
	pour {décider oui/non} |						
	pour {décider sur ...} |						
	pour décider si le/la/les ... |				
	pour décider si ... |					
	pour décider quel/quels/quelle/quelles <return-kind> est le/la/les ... |
	pour décider quel/quels/quelle/quelles <return-kind> est ... |	
	pour ...

<phrase-option-declaration-tail> ::=
	, _ou <phrase-option-declaration-list> |	
	, \et/ou <phrase-option-declaration-list> |
	_,/ou <phrase-option-declaration-list> |	
	\et/ou <phrase-option-declaration-list>

<phrase-option-tail> ::=
	, _et <phrase-option-list> |					
	_,/et <phrase-option-list>		

<definition-header> ::=
	définition

<adjective-definition> ::=
	<adjective-domain> est/sont <adjective-wording> si ... |	
	<adjective-domain> est/sont <adjective-wording> à moins que ... |
	<adjective-domain> est/sont <adjective-wording>			

<adjective-domain> ::=
	... ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées le/la/les ... ) |	
	... ( appelé/appelés/appelée/appelées/nommé/nommés/nommée/nommées ... ) |		
	...							

<adjective-wording> ::=
	... plutôt que ... |		
	...							

<inform6-routine-adjective-definition> ::=
	routine i6 {<quoted-text-without-subs>} le dit ( ... ) |
	routine i6 {<quoted-text-without-subs>} l'indique ( ... )

<inform6-condition-adjective-definition> ::=
	condition i6 <quoted-text-without-subs> le dit ( ... )

<end-phrase-construction> ::=
	fin ...

<inline-substitution> ::=
	options de phrase |	[??? revoir phrase]				
	<phrase-option>	|					
	<name-local-to-inline-stack-frame> |
	...									[issues PM_BadInlineExpansion]					

<vm-description-tail> ::=
	, _et/ou <vm-description-list> |
	_,/et/ou <vm-description-list>

<version-identification> ::=
	version/versions <cardinal-number>

<inform6-inclusion-location> ::=
	<inclusion-side> {<quoted-text-without-subs>} |
	<inclusion-side> {<quoted-text-without-subs>} dans {<quoted-text-without-subs>} |
	lors de la définition du/de/des <spec-type-expression> |		
	lors de la définition du/de/des ... |							[issues PM_WhenDefiningUnknown]
	avant la bibliothèque |						[issues PM_BeforeTheLibrary]
	dans la grammaire preform						

<inclusion-side> ::=
	avant |
	à la place de |
	après

<use-sentence-object> ::=
	... d'au moins <cardinal-number-unlimited> |
	### de <cardinal-number-unlimited> |		
	<definite-article> ...	|					
	...

<immediate-use-tail> ::=
	, _et <immediate-use> |
	_,/et <immediate-use>

<episode-sentence-object> ::=
	<cardinal-number> de/du/des <quoted-text-without-subs> |	
	...													[issues PM_BadEpisode]


<release-sentence-object> ::=
	<privacy-indicator> <exposed-innards> |		
	<privacy-indicator> ...	|					[issues PM_NoSuchPublicRelease]
	<exposed-innards> |							
	image de couverture ( <quoted-text> ) |				
	image de couverture |									
	fichier d'histoire existant |						
	fichier {<quoted-text-without-subs>} appelé/nommé {<quoted-text-without-subs>} |
	fichier {<quoted-text-without-subs>} dans {<quoted-text-without-subs>} |
	fichier {<quoted-text-without-subs>} |			
	feuille de style {<quoted-text-without-subs>} |	
	javascript {<quoted-text-without-subs>} |	
	livret d'introduction |						
	carte postale d'introduction |		[???]		
	site internet |									
	figures séparées |							
	sons séparés |							
	site internet {<quoted-text-without-subs>} |		
	interpréteur |								
	interpréteur {<quoted-text-without-subs>}	

<privacy-indicator> ::=
	privé/privés/privée/privées |
	public/publics/publique/publiques

<exposed-innards> ::=
	solution |
	texte source |
	carte de libraire	[???]

<spatial-specifying-nouns> ::=
	/a/ _quelque _chose *** |
	/a/ _n'importe _quoi *** |
	/b/ _quelque _part *** |
	/b/ _n'importe _où *** |
	/c/ _quelqu'un *** |
	/c/ _n'importe _qui *** | 
	/d/ _tout *** |		
	/e/ _partout *** |		
	/f/ _tout _le _monde *** |
	/g/ _nulle _part *** |			
	/h/ _personne *** |				

<notable-spatial-noun-phrases> ::=
	nulle part

<notable-backdrops-noun-phrases> ::=
	partout

<notable-map-noun-phrases> ::=
	au-dessus |
	en dessous

[???]
<mapping-relation-construction> ::=
	mapping ...

[???]
<mapping-preposition-construction> ::=
	mapped ... of |
	mapped ...

<map-name-abbreviation-omission-words> ::=
	dans |
	de/du/des |
	<article>

<index-map-sentence-subject> ::=
	fichier eps |										
	<direction-name> placé/placés/placée/placées à/au/aux <direction-name> |	
	... mapped as ... |								[issues PM_MapDirectionClue] [???]
	<instance-of-object> placé/placés/placée/placées à/au/aux <map-positioning> |		
	... mapped ... |								[issues PM_MapPlacement] [???]
	<map-setting> réglé/réglés/réglée/réglées sur <map-setting-value> |		
	<map-setting> réglé/réglés/réglée/réglées sur ... |		[issues PM_MapSettingTooLong]
	... réglé/réglés/réglée/réglées sur ... |						[issues PM_MapSettingOfUnknown]
	rubrique {<quoted-text-without-subs>} *** |		
	...												[issues PM_MapHintUnknown]

<map-positioning> ::=
	<instance-of-object> of/from <instance-of-object> | [???]
	au-dessus <instance-of-object> |					
	en dessous <instance-of-object>						

<map-setting> ::=
	<map-parameter> du/de/des <map-setting-scope> |
	<map-parameter> |						
	... du/de/des <map-setting-scope>				[issues PM_MapSettingUnknown]

<map-setting-scope-unarticled> ::=
	premier endroit |			
	niveau <cardinal-number> |
	<k-kind> |				
	<instance-of-object>					

<map-setting-boolean> ::=
	marche/on |					
	arrêt/off

<map-rubric> ::=
	taille <cardinal-number> *** |					
	font/police {<quoted-text-without-subs>} *** |
	couleur {<quoted-text-without-subs>} *** |
	at <map-offset> from ... |	[???]					
	at <map-offset> ***		[???]

<scene-ends-sentence-object> ::=
	<text-including-a-calling> |		[issues PM_ScenesDisallowCalled]
	jeu commence |						
	jeu se termine |							[issues PM_ScenesNotPlay]
	<scene-name> commence |				
	<scene-name> se termine |					
	<scene-name> se termine <scene-end-name> |
	<scene-name> se termine ... |				[issues PM_ScenesUnknownEnd]
	<spec-condition>

<action-name-construction> ::=
	action ...

[utile ???]
<action-optional-trailing-prepositions> ::=
	... to

<action-variable> ::=
	<action-variable-name> ( correspondant à {<quoted-text-without-subs>} ) |	[???]
	<action-variable-name> ( ... ) |					[issues PM_BadMatchingSyntax]
	<action-variable-name>			

<action-clause> ::=
	/a/ hors du monde |						
	/b/ abrégeable |						
	/c/ avec participe passé ... |			
	/d/ s'appliquant à <action-applications> |
	/d/ ne s'appliquant à <action-applications> |	
	/e/ nécessitant de la lumière	

<action-applications> ::=
	/a/ rien |						
	/b/ un/une <act-req> et un/une <act-req> |
	/b/ un/une <act-req> et à un/une <act-req> |
	/c/ un/une <act-req> et <act-req> |
	/c/ un/une <act-req> et à <act-req> |	
	/d/ <act-req> et un/une <act-req> |
	/d/ <act-req> et à un/une <act-req> |	
	/e/ <act-req> et <act-req> |
	/e/ <act-req> et à <act-req> |		
	/f/ un/une <act-req> |					
	/g/ deux <act-req>	|				
	/h/ <act-req> |						
	/i/ ...								[issues PM_ActionMisapplied]					

<action-access> ::=
	visible/visibles |		
	touchable/touchables |		
	porté/portés/portée/portées/tenu/tenus/tenue/tenues		

<action-clause-terminated> ::=
	<action-clause> , et |					
	<action-clause> et |					
	<action-clause> , |						
	<action-clause>							

<action-list> ::=
	/a/ faire quelque chose autre que <anl-excluded> |
	/b/ faire quelque chose excepté <anl-excluded> |	
	/c/ faire quelque chose au/à/aux/avec <anl-to-tail> |	
	/d/ faire quelque chose |						
	/f/ <anl>												

<anl-excluded> ::=
	<anl> au/à/aux/avec {<anl-minimal-common-operand>} |		
	<anl>												

<anl-minimal-common-operand> ::=
	_,/ou ... |											
	... au/à/aux/avec/avec ... |									
	...						

<anl-in-tail> ::=
	fixé sur place *** |	 [utile ???]			
	est/sont/était/étaient/été/listé dans *** |
	dans ...		

<anl-tail> ::=
	, _ou <anl> |				
	_,/ou <anl>

<action-pattern> ::=
	demander <action-parameter> d'essayer de/d' <action-pattern-core> |			
	<action-parameter> essayant <action-pattern-core> |		[???]			
	un acteur essayant de/d' <action-pattern-core> |											
	un acteur <action-pattern-core> |												
	essayant de/d' <action-pattern-core> |													
	<action-pattern-core-actor>														

[TODO]
<we-are-action-pattern> ::=
	we are asking <action-parameter> to try <action-pattern-core> |	
	asking <action-parameter> to try <action-pattern-core> |			
	<action-parameter> trying <action-pattern-core> |					
	an actor trying <action-pattern-core> |											
	an actor <action-pattern-core> |												
	we are trying <action-pattern-core> |											
	trying <action-pattern-core> |													
	we are <action-pattern-core> |													
	<action-pattern-core-actor>														

[TODO]
<action-pattern-negated> ::=
	we are not asking <action-parameter> to try <action-pattern-core> |
	not asking <action-parameter> to try <action-pattern-core> |		
	<action-parameter> not trying <action-pattern-core> |				
	an actor not trying <action-pattern-core> |										
	an actor not <action-pattern-core> |											
	we are not trying <action-pattern-core> |										
	not trying <action-pattern-core> |												
	we are not <action-pattern-core> |												
	not <action-pattern-core-actor>													

[TODO]
<action-pattern-past> ::=
	we have asked <action-parameter> to try <action-pattern-core> |	
	<action-parameter> has tried <action-pattern-core> |				
	an actor has tried <action-pattern-core> |										
	an actor has <action-pattern-past-core> |										
	we have tried <action-pattern-core> |											
	we have <action-pattern-past-core>												

[TODO]
<action-pattern-past-negated> ::=
	we have not asked <action-parameter> to try <action-pattern-core> |
	<action-parameter> has not tried <action-pattern-core> |			
	an actor has not tried <action-pattern-core> |									
	an actor has not <action-pattern-past-core> |									
	we have not tried <action-pattern-core> |										
	we have not <action-pattern-past-core>		

<action-pronominal> ::=
	le faire

<ap-common-core> ::=
	<ap-common-core-inner> quand/lorsque <condition-in-ap> |
	<ap-common-core-inner> |							
	... quand/lorsque <condition-in-ap> |					
	... quand/lorsque ...									

<ap-common-core-inner> ::=
	<ap-common-core-inner-inner> en présence du/de/des <action-parameter> |
	<ap-common-core-inner-inner>										

<ap-common-core-inner-inner> ::=
	dans <action-parameter> |								
	<ap-common-core-inner-inner-inner>					

<action-operand> ::=
	quelque chose | 		
	quelque chose d'autre | 	
	<action-parameter> 			

<going-action-irregular-operand> ::=
	nulle part |					
	quelque part					

<understanding-action-irregular-operand> ::=
	quelque chose |		
	le/la/les/l'

<understand-sentence-subject> ::=
	rien |		[pour comprendre "comprendre rien". À refaire pour inclure la négation ???]	
	<understand-property-list> |					
	la/les commande/commandes <understand-regular-list> |
	le/les verbe/verbes ... |							[issues PM_OldVerbUsage]
	<understand-regular-list>						

<understand-regular-tail> ::=
	, _et/ou <understand-regular-list> |					
	_,/et/ou <understand-regular-list>													

<understand-property-tail> ::=
	, _et/ou <understand-property-list> |					
	_,/et/ou <understand-property-list>					

<understand-property-entry> ::=
	propriété <property-name> |								
	propriété...									[issues PM_UnknownUnderstandProperty]

<understand-sentence-object> ::=
	<understand-sentence-object-uncond> quand/lorsque ... |
	<understand-sentence-object-uncond>						

<understand-sentence-object-tail> ::=
	, _et/ou <understand-sentence-object-uncond> |		
	_,/et/ou <understand-sentence-object-uncond>							

<understand-as-this> ::=
	... |									
	une erreur |								
	une erreur ( <quoted-text> ) |			
	une erreur ... |							[issues PM_TextlessMistake]
	le pluriel du/de/des <understand-ref> |		
	le pluriel du/de/des <understand-ref> |			
	<quoted-text> |							
	<understand-ref> ( avec les noms inversés ) |
	<understand-ref>

<understand-command-sentence-object> ::=
	... quand/lorsque ... |		[issues PM_UnderstandCommandWhen]
	quelque chose de nouveau |				
	<quoted-text> |				
	...							[issues PM_NotOldCommand]

<understand-property-sentence-object> ::=
	<understand-property-sentence-object-unconditional> quand/lorsque ... |
	<understand-property-sentence-object-unconditional>					

<understand-property-sentence-object-unconditional> ::=
	référant au/à/aux <understand-property-reference> |
	décrivant <understand-property-reference> |
	...											[issues PM_BadUnderstandProperty]

<grammar-token> ::=
	<named-grammar-token> |			
	n'importe quel/quels/quelle/quelles <spec-description> |		
	n'importe quel/quels/quelle/quelles <spec-kind> |				
	n'importe quoi |						
	n'importe qui |						
	anyone |	[à enlever ???]						
	n'importe où |						
	something related by reversed <relation-name> |	[???]
	something related by <relation-name> |			[???]
	something related by ... |		[issues PM_GrammarBadRelation]	[???]
	<standard-grammar-token> |		
	<spec-instance> |				
	<spec-description> |			
	<spec-kind> |					
	<spec-type-expression>	|		[issues PM_BizarreToken]
	...								[issues PM_UnknownToken]

<standard-grammar-token> ::=
	quelque chose |						
	des choses |						
	des choses à l'intérieur |					
	des choses  tenues de préférence  |		
	quelque chose tenu de préférence |		
	d'autres choses |					
	quelqu'un	|						
	somebody |		[à enlever ???]
	texte |							
	sujet |							[issues PM_UseTextNotTopic]
	un sujet |						[issues PM_UseTextNotTopic]
	objet |						[issues PM_UseThingNotObject]
	un objet |						[issues PM_UseThingNotObject]
	quelque chose tenu |				[issues something held]
	des choses tenues						[issues things held]

[utile ???]
<test-sentence-subject> ::=
	<internal-test-case-name> ( internal ) |
	### ( internal ) |						[issues PM_UnknownInternalTest]
	###	|									
	...										[issues PM_TestMultiWord]

[utile ???]
<internal-test-case-name> ::=
	headline |
	sentence |
	description |
	dimensions |
	evaluation |
	equation |
	article |
	verb |
	adjective |
	participle |
	kind |
	map					

<test-case-circumstance> ::=
	dans <instance-of-object> |			
	en tenant/et/, <instance-of-object> |
	dans ... |							[issues PM_TestBadRequirements]
	en tenant/et/, ... |					[issues PM_TestBadRequirements]
	avec ...							[issues PM_TestDoubleWith]				

[utile ???]
<figure-source> ::=
	of cover art |		
	<quoted-text> |		
	...					[issues PM_PictureNotTextual]

<external-file-sentence-subject> ::=
	<definite-article> <external-file-sentence-subject> |
	<external-file-name> texte |			
	<external-file-name> binaire |		
	<external-file-name>				

<external-file-name> ::=
	{fichier ...} ( possédé par <external-file-owner> ) | [à revoir ???]	
	{fichier ...}										

<external-file-owner> ::=
	un autre projet |								
	projet {<quoted-text-without-subs>} |	
	...												[issues PM_BadFileOwner]

<translates-into-i6-sentence-subject> ::=
	propriété ... |					
	objet/type ...  |				
	{règle ... } |					
	variable ... |					
	action ... |					
	jeton de compréhension ... |	[???]			
	...								[issues PM_TranslatedUnknownCategory]

<translates-into-i6-sentence-object> ::=
	<quoted-text> avec <nounphrase-articled-list> |
	<quoted-text>

<use-language-element-sentence-subject> ::=
	no <plugin-name> |	[??? à revoir]
	<plugin-name> |		
	...					[issues PM_NoSuchLanguageElement]

-) in the Preform grammar.

Volume 2 - Variables

Book 1 - Standard Rules

Section SR2/1 - Situation

[La traduction de la variable « player » causait des bugs quand on l'utilisait pour changer le joueur en cours de jeu (la nouvelle personne restait « described », des articles appairaissant à des endroits où il ne fallait pas… Je pense que c'est parce que Inform détecte à la compilation quand on change le joueur pour générer un code I6 différent que quand on change une bête variable (par exemple).
Par sécurité, j'ai désactivé toutes les traductions des variables, même si je ne pense pas qu'elles posaient problème quand on ne faisait que les utiliser dans des comparaisons.

The joueur is a person that varies.
The joueur variable translates into I6 as "player".

The emplacement -- documented at var_location -- is an object that varies. [*] The l'emplacement -- documented at var_location -- is an object that varies.
[The score -- documented at var_score -- is a number that varies.]
The dernier score notifié is a number that varies.
The score maximum is a number that varies. [*]
The compteur de tours is a number that varies. [TODO: Pas sûr]
The heure actuelle -- documented at var_time -- is a time that varies. [*]
[The darkness witnessed is a truth state that varies.]

The emplacement variable translates into I6 as "real_location".
[The score variable translates into I6 as "score".]
The dernier score notifié variable translates into I6 as "last_score".
The score maximum variable translates into I6 as "MAX_SCORE".
The compteur de tours variable translates into I6 as "turns".
The heure actuelle variable translates into I6 as "the_time".]

Section SR2/2 - Current action

[Idem que pour ci-dessus.

The nom -- documented at var_noun -- is an object that varies. [*]
The second nom is an object that varies. [*]
The personne demandée -- documented at var_person_asked -- is an object that varies. [*]
The raison pour laquelle l'action a échoué -- documented at var_reason -- is an action name
based rule producing nothing that varies.
[TODO: Ne fonctionne pas à cause de la définition de l'adjectif « décrit »
The objet décrit is an object that varies.]

The nom variable translates into I6 as "noun".
The second nom variable translates into I6 as "second".
The personne demandée variable translates into I6 as "actor".
The raison pour laquelle l'action a échoué variable translates into I6 as "reason_the_action_failed".
[The objet décrit variable translates into I6 as "self".]]

Section SR2/3 - Used when ruling on accessibility

[Idem que pour plus haut

The personne atteignant -- documented at var_person_reaching -- is an object that varies. [TODO: Pas sûr]
The conteneur en question is an object that varies.
The support en question is an object that varies.
The possession spécifique -- documented at var_particular -- is a thing that varies. [TODO: particular -> spécifique ?]

The personne atteignant variable translates into I6 as "actor".
The conteneur en question variable translates into I6 as "parameter_object".
The support en question variable translates into I6 as "parameter_object".
The possession spécifique variable translates into I6 as "particular_possession".]

Section SR2/4 - Used when understanding typed commands

[Idem.

The commande du joueur -- documented at var_command -- is a snippet that varies.
The texte correspondant is a snippet that varies.
[TODO
The number understood -- documented at var_understood -- is a number that varies. [*]
The real number understood -- documented at var_understood -- is a real number that varies. [*]
The time understood is a time that varies. [*]]
The sujet compris is a snippet that varies. [*]
[The truth state understood is a truth state that varies. [*]]
The objet actuel dans la liste d'objets multiples is an object that varies.

The commande du joueur variable translates into I6 as "players_command".
The texte correspondant variable translates into I6 as "matched_text".
The sujet compris variable translates into I6 as "parsed_number".
The objet actuel dans la liste d'objets multiples variable translates into I6 as
	"multiple_object_item".]

Section SR2/5 - Presentation on screen

[The command prompt -- documented at var_prompt -- is a text that varies. [**]
The command prompt is ">".]

[Idem.

The partie gauche de la barre de statut -- documented at var_sl -- is a text that varies.
The partie droite de la barre de statut is a text that varies.

The partie gauche de la barre de statut variable translates into I6 as "left_hand_status_line".
The partie droite de la barre de statut variable translates into I6 as "right_hand_status_line".]

[TODO: Ne fonctionne pas
The taille de listage de groupe is a number that varies.
The taille de listage de groupe translates into I6 as "listing_size".]

Section SR2/6 - Language generation

[A natural language is a kind of value.
The language of play is a natural language that varies.]

[Idem.

The dernier objet nommé is an object that varies.
The dernier objet nommé variable translates into I6 as "prior_named_noun".]

Section SR2/6a - Unindexed Standard Rules variables - Unindexed

[Déjà modifié dans l'extension French Language

The story title, the story author, the story headline, the story genre
and the story description are text variables. [*****]
The release number and the story creation year are number variables. [**]

The release number is usually 1.
The story headline is usually "An Interactive Fiction".
The story genre is usually "Fiction".

The story title variable translates into I6 as "Story".
]

Section SR2/6b - Unindexed Standard Rules variables - Unindexed (In place of Section SR2/6b - Unindexed Standard Rules variables - Unindexed (for figures language element only) in Standard Rules by Graham Nelson)

[TODO: à mettre dans l'extension French Language ?]

Figure of cover is the file of cover art ("L'image de couverture.").

Section SR2/6c - Unindexed Standard Rules variables - Unindexed

[TODO: Pas besoin de traduire puisque ce sont des variables cachées ? De toute façon, maintenant, j'ai enlevé la traduction des variables.

The I6-nothing-constant is an object that varies. [*]
The I6-nothing-constant variable translates into I6 as "nothing".

The I6-varying-global is an object that varies. [*]
The I6-varying-global variable translates into I6 as "nothing".

The item-pushed-between-rooms is an object that varies.
The item-pushed-between-rooms variable translates into I6 as "move_pushing".

The actor-location is an object that varies. [*]
The actor-location variable translates into I6 as "actor_location".

The parameter-object is an object that varies. [*]
The parameter-object variable translates into I6 as "parameter_value".

The scene being changed is a scene that varies. [*]
The scene being changed variable translates into I6 as "parameter_value".
]

Book 2 - English Language

[Idem.

The temps de l'histoire is a grammatical tense that varies.
The temps de l'histoire variable translates into I6 as "story_tense".
The point de vue de l'histoire is a narrative viewpoint that varies.
The point de vue de l'histoire variable translates into I6 as "story_viewpoint".]

Volume 3 - Adjectives

[A door has an object called autre côté.
The autre côté property translates into I6 as "door_to".]

A thing can be mettable.
The mettable property translates into I6 as "clothing".
A thing can be mettables.
The mettables property translates into I6 as "clothing".

[« Décrit » ne possède pas véritablement d'antonyme, c'est pourquoi j'ai utilisé « non-décrit ».
En pratique, il ne sera jamais utilisé car il suffit d'écrire « non décrit » (équivalent de « not described »).]
A thing can be décrit or non-décrit. A thing is usually décrit.
The non-décrit property translates into I6 as "concealed".
A thing can be décrite or non-décrite. A thing is usually décrite.
The non-décrite property translates into I6 as "concealed".
A thing can be décrits or non-décrits. A thing is usually décrits.
The non-décrits property translates into I6 as "concealed".
A thing can be décrites or non-décrites. A thing is usually décrite.
The non-décrites property translates into I6 as "concealed".

[TODO: « mangeable » à la place de comestible ?]
A thing can be comestible or incomestible. A thing is usually incomestible.
The comestible property translates into I6 as "edible".
A thing can be comestibles or incomestibles. A thing is usually incomestibles.
The comestibles property translates into I6 as "edible".

[TODO: trouver un mot plus français.]
A container can be entrable.
A supporter can be entrable.
A vehicle is always entrable.
The entrable property translates into I6 as "enterable".
A container can be entrables.
A supporter can be entrables.
A vehicle is always entrables.
The entrables property translates into I6 as "enterable".

[TODO: Pas sûr si c'est utile avec l'extension French Language.
A person can be female or male. A person is usually male.
The female property translates into I6 as "female".]

[Même remarque que pour « non-décrit ».]
A thing can be mentionné or non-mentionné. A thing is usually mentionné.
The mentionné property translates into I6 as "mentioned".
A thing can be mentionnée or non-mentionnée. A thing is usually mentionnée.
The mentionnée property translates into I6 as "mentioned".
A thing can be mentionnés or non-mentionnés. A thing is usually mentionnés.
The mentionnés property translates into I6 as "mentioned".
A thing can be mentionnées or non-mentionnées. A thing is usually mentionnées.
The mentionnées property translates into I6 as "mentioned".

[TODO: touver un meilleur mot pour terne. Aussi, j'ai dû inventer des mots pour certains pluriels et féminin, pour que certaines formes ne soient pas définies 2 fois.]
A thing can be lumineux or terne. A thing is usually terne.
The lumineux property translates into I6 as "light".
A thing can be lumineuse. A thing is usually not lumineuse.
The lumineuse property translates into I6 as "light".
A thing can be lumineuxs or ternes. A thing is usually ternes.
The lumineuxs property translates into I6 as "light".
A thing can be lumineuses. A thing is usually not lumineuses.
The lumineuses property translates into I6 as "light".

A room can be éclairé or sombre. A room is usually éclairé.
The éclairé property translates into I6 as "light".
A room can be éclairée. A room is usually éclairée.
The éclairée property translates into I6 as "light".
A room can be éclairés or sombres. A room is usually éclairés.
The éclairés property translates into I6 as "light".
A room can be éclairées. A room is usually éclairées.
The éclairées property translates into I6 as "light".

A door can be verrouillable. A door is usually not verrouillable.
A container can be verrouillable. A container is usually not verrouillable.
The verrouillable property translates into I6 as "lockable".
A door can be verrouillables. A door is usually not verrouillables.
A container can be verrouillables. A container is usually not verrouillables.
The verrouillables property translates into I6 as "lockable".

A door can be verrouillé or déverrouillé. A door is usually déverrouillé.
A container can be verrouillé or déverrouillé. A container is usually déverrouillé.
The verrouillé property translates into I6 as "locked".
A door can be verrouillée or déverrouillée. A door is usually déverrouillée.
A container can be verrouillée or déverrouillée. A container is usually déverrouillée.
The verrouillée property translates into I6 as "locked".
A door can be verrouillés or déverrouillés. A door is usually déverrouillés.
A container can be verrouillés or déverrouillés. A container is usually déverrouillés.
The verrouillés property translates into I6 as "locked".
A door can be verrouillées or déverrouillées. A door is usually déverrouillées.
A container can be verrouillées or déverrouillées. A container is usually déverrouillées.
The verrouillées property translates into I6 as "locked".

A thing can be manipulé.
The manipulé property translates into I6 as "moved".
A thing can be manipulée.
The manipulée property translates into I6 as "moved".
A thing can be manipulés.
The manipulés property translates into I6 as "moved".
A thing can be manipulées.
The manipulées property translates into I6 as "moved".

[TODO: Pas sûr si c'est utile
A person can be neuter. A person is usually not neuter.
The neuter property translates into I6 as "neuter".]


A device can be allumé or éteint. A device is usually éteint.
The allumé property translates into I6 as "on".
A device can be allumée or éteinte. A device is usually éteinte.
The allumée property translates into I6 as "on".
A device can be allumés or éteints. A device is usually éteints.
The allumés property translates into I6 as "on".
A device can be allumées or éteintes. A device is usually éteintes.
The allumées property translates into I6 as "on".

A door can be ouvert or fermé. A door is usually fermé.
A container can be ouvert or fermé. A container is usually ouvert.
The ouvert property translates into I6 as "open".
A door can be ouverte or fermée. A door is usually fermée.
A container can be ouverte or fermée. A container is usually ouverte.
The ouverte property translates into I6 as "open".
A door can be ouverts or fermés. A door is usually fermés.
A container can be ouverts or fermés. A container is usually ouverts.
The ouverts property translates into I6 as "open".
A door can be ouvertes or fermées. A door is usually fermées.
A container can be ouvertes or fermées. A container is usually ouvertes.
The ouvertes property translates into I6 as "open".

[TODO: ouvrable n'a pas ce sens-là en vrai, mais tant pis pour l'instant. Aussi, même chose que pour « non-décrit »]
A door can be ouvrable or non-ouvrable. A door is usually ouvrable.
A container can be ouvrable or non-ouvrable. A container is usually non-ouvrable.
The ouvrable property translates into I6 as "openable".
A door can be ouvrables or non-ouvrables. A door is usually ouvrables.
A container can be ouvrables or non-ouvrables. A container is usually non-ouvrables.
The ouvrables property translates into I6 as "openable".

[Ne fonctionne pas.
A thing can be nommé en privé or nommé publiquement. A thing is usually nommé publiquement.
A direction can be nommé en privé or nommé publiquement. A direction is nommé publiquement.
A room can be nommé en privé or nommé publiquement. A room is usually nommé publiquement.
A region can be nommé en privé or nommé publiquement. A region is usually nommé publiquement.
The nommé en privé property translates into I6 as "privately_named".]

[TODO: trouver mieux comme traduction ?]
An object can be au pluriel or au singulier. An object is usually au singulier.
The au pluriel property translates into I6 as "pluralname".

[TODO: Utile ? En tout cas je sais pas à quoi cet adjectif sert.
An object can be ambiguously plural.
The ambiguously plural property translates into I6 as "ambigpluralname".]

[TODO: Pas sûr]
An object can be à nom propre or à nom commun. An object is usually à nom commun.
The à nom propre property translates into I6 as "proper".

[TODO: je n'ai rien trouvé de mieux :( ]
A thing can be poussable entre endroits. A door is never poussable entre endroits. A backdrop is never poussable entre endroits.
The poussable entre endroits property translates into I6 as "pushable".
A thing can be poussables entre endroits. A door is never poussables entre endroits. A backdrop is never poussables entre endroits.
The poussables entre endroits property translates into I6 as "pushable".

A thing can be décoratif. A backdrop is usually décoratif.
The décoratif property translates into I6 as "scenery".
A thing can be décorative. A backdrop is usually décorative.
The décorative property translates into I6 as "scenery".
A thing can be décoratifs. A backdrop is usually décoratifs.
The décoratifs property translates into I6 as "scenery".
A thing can be décoratives. A backdrop is usually décoratives.
The décoratives property translates into I6 as "scenery".

[Portable a déjà été défini en anglais.]
A thing can be fixé sur place[ or portable]. A thing is usually not fixé sur place. A door is always fixé sur place. A supporter is usually fixé sur place. A backdrop is always fixé sur place. A vehicle is usually fixé sur place. A player's holdall is always not fixé sur place. An décoratif object is usually fixé sur place.
The fixé sur place property translates into I6 as "static".
A thing can be fixée sur place[ or portable]. A thing is usually not fixée sur place. A door is always fixée sur place. A supporter is usually fixée sur place. A backdrop is always fixée sur place. A vehicle is usually fixée sur place. A player's holdall is always not fixée sur place. An décoratif object is usually fixée sur place.
The fixée sur place property translates into I6 as "static".
A thing can be fixés sur place or portables. A thing is usually not fixés sur place. A door is always fixés sur place. A supporter is usually fixés sur place. A backdrop is always fixés sur place. A vehicle is usually fixés sur place. A player's holdall is always not fixés sur place. An décoratif object is usually fixés sur place.
The fixés sur place property translates into I6 as "static".
A thing can be fixées sur place[ or portable]. A thing is usually not fixées sur place. A door is always fixées sur place. A supporter is usually fixées sur place. A backdrop is always fixées sur place. A vehicle is usually fixées sur place. A player's holdall is always not fixées sur place. An décoratif object is usually fixées sur place.
The fixées sur place property translates into I6 as "static".

[c'est la même chose qu'en anglais, mais il faut quand même le définir au pluriel et au féminin.
A container can be opaque or transparent. A container is usually opaque.
The transparent property translates into I6 as "transparent".]
A container can be transparente. A container is usually not transparente.
The transparente property translates into I6 as "transparent".
A container can be opaques or transparents. A container is usually opaques.
The transparents property translates into I6 as "transparent".
A container can be transparentes. A container is usually not transparentes.
The transparentes property translates into I6 as "transparent".

[TODO: même chose que pour « non-décrit »]
A room can be visité or non-visité. A room is usually non-visité.
The visité property translates into I6 as "visited".
A room can be visitée or non-visitée. A room is usually non-visitée.
The visitée property translates into I6 as "visited".
A room can be visités or non-visités. A room is usually non-visités.
The visités property translates into I6 as "visited".
A room can be visitées or non-visitées. A room is usually non-visitées.
The visitées property translates into I6 as "visited".

A thing can be marqué pour le listage or non-marqué pour le listage. A thing is usually non-marqué pour le listage.
A direction can be marqué pour le listage or non-marqué pour le listage. A direction is usually non-marqué pour le listage.
The marqué pour le listage property translates into I6 as "workflag".

[Ci-dessous : ne fonctionne pas.]

[TODO: Aucune idée pour ça. Je pense pas que ce soit utile
An object has a text called list grouping key.
The list grouping key property translates into I6 as "list_together".]

[An object has a text called an article indéfini.
The article indéfini property translates into I6 as "article".]

[
[TODO: pas sûr pour celui-là. Je veux pas mettre juste « capacité », car ça pourrait causer problème si on veut créer des capacités comme dans un jeu de rôle]
A container has a number called capacité de contenu.
A supporter has a number called capacité de contenu.
A person has a number called capacité de contenu.
The capacité de contenu property translates into I6 as "capacity".]

[A thing has a text called an apparence initiale.
The apparence initiale property translates into I6 as "initial".]

[A room has an object called région de la carte. The région de la carte of a room is usually nothing.
The région de la carte property translates into I6 as "map_region".]

[An object has a text called nom pluriel affiché.
The nom pluriel affiché property translates into I6 as "plural".]

[An object has a text called nom affiché.
The nom affiché property translates into I6 as "short_name".]

[A door has an object called a clef correspondante.
A container has an object called a clef correspondante.
The clef correspondante property translates into I6 as "with_key".]

[TODO: Ceux-là ne peuvent pas se traduire, apparemment.
An object has a text called specification.
An object has a text called indefinite appearance text.
An object has a value called variable initial value.
A direction has a direction called an opposite.]


Section SR2/12 - Adjectival definitions

[Les définitions de « vide » ne fonctionnent pas à cause du conflit avec l'adjectif.]

Definition: Something is sur scène rather than hors scène if I6 routine "OnStage"
	makes it so (it is indirectly in one of the rooms).

Definition: a number is pair rather than impair if the remainder after dividing it by 2 is 0.
Definition: a number is paire rather than impaire if the remainder after dividing it by 2 is 0.
Definition: a number is pairs rather than impairs if the remainder after dividing it by 2 is 0.
Definition: a number is paires rather than impaires if the remainder after dividing it by 2 is 0.
Definition: a number is positif if it is greater than zero.
[Le féminin de « positif » est identique à l'anglais.]
Definition: a number is positifs if it is greater than zero.
Definition: a number is positives if it is greater than zero.
Definition: a number is négatif if it is less than zero.
Definition: a number is négative if it is less than zero.
Definition: a number is négatifs if it is less than zero.
Definition: a number is négatives if it is less than zero.

[Definition: a text is vide rather than non-vide if I6 routine
	"TEXT_TY_Empty" says so (it contains no characters).]

Definition: a text is substitué if I6 routine
	"TEXT_TY_IsSubstituted" says so (any square-bracketed text substitutions
	in it have been made).

[TODO: Pas sûr.]
Definition: a scene is en train de se dérouler if I6 condition "scene_status-->(*1-1)==1"
	says so (it is currently taking place).

[Definition: a table name is vide rather than non-vide if the number of filled rows in it is 0.]
Definition: a table name is plein if the number of blank rows in it is 0.

[Definition: a rulebook is vide rather than non-vide if I6 routine "RulebookEmpty" says so (it
	contains no rules, so that following it does nothing and makes no decision).]

[Definition: an activity is vide rather than non-vide if I6 routine "ActivityEmpty" says so (its
	before, for and after rulebooks are all empty).]
[TODO: Ne sais pas pour celui-là
Definition: an activity is going on if I6 routine "TestActivity" says so (one
	of its three rulebooks is currently being run).]

[Definition: a list of values is vide rather than non-vide if I6 routine
	"LIST_OF_TY_Empty" says so (it contains no entries).]

[Même chose qu'en français
Definition: a use option is active rather than inactive if I6 routine
	"TestUseOption" says so (it has been requested in the source text).]

Definition: a relation is équivalence if I6 routine
	"RELATION_TY_EquivalenceAdjective" makes it so (it is an equivalence
	relation, that is, it relates in groups).

Definition: a relation is symétrique if I6 routine
	"RELATION_TY_SymmetricAdjective" makes it so (it is a symmetric relation,
	that is, it's always true that X is related to Y if and only if Y is
	related to X).

Definition: a relation is un-à-un if I6 routine
	"RELATION_TY_OToOAdjective" makes it so (it is a one-to-one relation,
	that is, any given X can relate to only one Y, and vice versa).

Definition: a relation is un-à-plusieurs if I6 routine
	"RELATION_TY_OToVAdjective" makes it so (it is a one-to-various
	relation, that is, any given Y has only one X such that X relates to Y).

Definition: a relation is plusieurs-à-un if I6 routine
	"RELATION_TY_VToOAdjective" makes it so (it is a various-to-one
	relation, that is, any given X relates to only one Y).

Definition: a relation is plusieurs-à-plusieurs if I6 routine
	"RELATION_TY_VToVAdjective" makes it so (it is a
	various-to-various relation, that is, there are no limitations on how many
	X can relate to a given Y, or vice versa).

[Definition: a relation is vide rather than non-vide if I6 routine
	"RELATION_TY_Empty" makes it so (it does not relate any values, that is,
	R(x,y) is false for all x and y).]

[Même chose qu'en français
Definition: a verb is modal rather than non-modal if I6 routine "VerbIsModal"
	says so (it modifies the likelihood of another verb happening, rather than
	being meaningful itself).]

[TODO: ne sais pas
Definition: a verb is meaningful rather than meaningless if I6 routine "VerbIsMeaningful"
	says so (it has a meaning in Inform as a relation, rather than existing only to be
	printed out).]

Section SR2/12a - Adjectival definitions (for Glulx only)

Definition: a real number is positif if it is greater than zero.
Definition: a real number is positifs if it is greater than zero.
Definition: a real number is positives if it is greater than zero.
Definition: a real number is négatif if it is less than zero.
Definition: a real number is négative if it is less than zero.
Definition: a real number is négatifs if it is less than zero.
Definition: a real number is négatives if it is less than zero.
Definition: a real number is infini rather than fini if it is plus infinity or it is minus infinity.
Definition: a real number is infinie rather than finie if it is plus infinity or it is minus infinity.
Definition: a real number is infinis rather than finis if it is plus infinity or it is minus infinity.
Definition: a real number is infinies rather than finies if it is plus infinity or it is minus infinity.
Definition: a real number is non-existant rather than existant if I6 routine
	"REAL_NUMBER_TY_Nan" says so (it results from an impossible calculation,
	like the square root of minus one).

Volume 4 - Phrasebook

Book 1 - Standard Rules

Section SR5/1/1 - Saying - Values

To dire (something - text)
	(documented at ph_say):
	(- {-say:something} -).
To say (val - sayable value of kind K)
	(documented at phs_value):
	(- print ({-printing-routine:K}) {-by-reference:val}; -).

To say (something - number)
	(documented at phs_value):
	(- print (say__n={something}); -).

To say (ch - unicode character) -- running on
	(documented at phs_unicode):
	(- #ifdef TARGET_ZCODE; unicode_temp = {ch}; @print_unicode unicode_temp;
	#ifnot; unicode_temp = {ch}; @streamunichar unicode_temp; #endif; -).

To say (something - number) en lettres
	(documented at phs_numwords):
	(- print (number) say__n=({something}); -).
To say (something - time) en lettres
	(documented at phs_timewords):
	(- print (PrintTimeOfDayEnglish) {something}; -).
To say s
	(documented at phs_s):
	(- STextSubstitution(); -).

Section SR5/1/2 - Saying - Names with articles

[
To say a (something - object)
	(documented at phs_a):
	(- print (a) {something}; -).
To say an (something - object)
	(documented at phs_a):
	(- print (a) {something}; -).
To say A (something - object)
	(documented at phs_A):
	(- CIndefArt({something}); -).
To say An (something - object)
	(documented at phs_A):
	(- CIndefArt({something}); -).
To say the (something - object)
	(documented at phs_the):
	(- print (the) {something}; -).
To say The (something - object)
	(documented at phs_The):
	(- print (The) {something}; -).
]

Section SR5/1/3 - Saying - Say if and otherwise

To say si (c - condition)
	(documented at phs_if): (- {-erase}
	if (~~({c})) jump {-label:Say};
		-).
To say à moins que (c - condition)
	(documented at phs_unless): (- {-erase}
	if ({c}) jump {-label:Say};
		-).
To say sinon si (c - condition)
	(documented at phs_elseif): (- {-erase}
	jump {-label:SayX}; .{-label:Say}{-counter-up:Say}; if (~~({c})) jump {-label:Say};
		-).
To say sinon à moins que (c - condition)
	(documented at phs_elseunless): (- {-erase}
	jump {-label:SayX}; .{-label:Say}{-counter-up:Say}; if ({c}) jump {-label:Say};
		-).
To say sinon
	(documented at phs_otherwise): (- {-erase}
	jump {-label:SayX}; .{-label:Say}{-counter-up:Say};
		-).
To say sinon
	(documented at phs_otherwise): (- {-erase}
	jump {-label:SayX}; .{-label:Say}{-counter-up:Say};
		-).
To say fin si
	(documented at phs_endif): (- {-erase}
	.{-label:Say}{-counter-up:Say}; .{-label:SayX}{-counter-up:SayX};
		-).
To say fin à moins que
	(documented at phs_endunless): (- {-erase}
	.{-label:Say}{-counter-up:Say}; .{-label:SayX}{-counter-up:SayX};
		-).

Section SR5/1/4 - Saying - Say one of

To say parmi -- beginning say_parmi (documented at phs_oneof): (-
	{-counter-makes-array:say_one_of}
	{-counter-makes-array:say_one_flag}
	if (I7_ST_say_one_flag-->{-counter:say_one_flag} == false) {
		I7_ST_say_one_of-->{-counter:say_one_of} = {-final-segment-marker}(I7_ST_say_one_of-->{-counter:say_one_of},
{-segment-count});
	 	I7_ST_say_one_flag-->{-counter:say_one_flag} = true;
	}
	if (say__comp == false) I7_ST_say_one_flag-->{-counter:say_one_flag}{-counter-up:say_one_flag} =
false;
	switch ((I7_ST_say_one_of-->{-counter:say_one_of}{-counter-up:say_one_of})%({-segment-count}+1)-1)
{-open-brace}
		0: -).
To say ou -- continuing say_parmi (documented at phs_or):
	(- @nop; {-segment-count}: -).
To say au hasard -- ending say_parmi with marker I7_SOO_RAN (documented at phs_random):
	(- {-close-brace} -).
To say totalement au hasard -- ending say_parmi with marker I7_SOO_PAR (documented at phs_purelyrandom):
	(- {-close-brace} -).
To say puis au hasard -- ending say_parmi with marker I7_SOO_TRAN (documented at phs_thenrandom):
	(- {-close-brace} -).
To say puis totalement au hasard -- ending say_parmi with marker I7_SOO_TPAR (documented at phs_thenpurelyrandom):
	(- {-close-brace} -).
To say permanent -- ending say_parmi with marker I7_SOO_STI (documented at phs_sticky):
	(- {-close-brace} -).
To say chances diminuant -- ending say_parmi with marker I7_SOO_TAP (documented at phs_decreasing):
	(- {-close-brace} -).
To say en ordre aléatoire -- ending say_parmi with marker I7_SOO_SHU (documented at phs_order):
	(- {-close-brace} -).
To say tour à tour -- ending say_parmi with marker I7_SOO_CYC (documented at phs_cycling):
	(- {-close-brace} -).
To say stoppant -- ending say_parmi with marker I7_SOO_STOP (documented at phs_stopping):
	(- {-close-brace} -).

To say première fois -- beginning say_premiere_fois (documented at phs_firsttime):
	(- {-counter-makes-array:say_first_time}
	if ((say__comp == false) && ((I7_ST_say_first_time-->{-counter:say_first_time}{-counter-up:say_first_time})++ == 0)) {-open-brace}
		-).
To say seulement -- ending say_premiere_fois (documented at phs_firsttime):
	(- {-close-brace} -).

Section SR5/1/5 - Saying - Paragraph control

To say à la ligne -- running on
	(documented at phs_linebreak):
	(- new_line; -).
To say sans passage à la ligne -- running on
	(documented at phs_nolinebreak): do nothing.
To say saut de paragraphe conditionnel -- running on
	(documented at phs_condparabreak):
	(- DivideParagraphPoint(); -).
To say saut de clarification de commande -- running on
	(documented at phs_clarifbreak):
	(- CommandClarificationBreak(); -).
To say saut de paragraphe -- running on
	(documented at phs_parabreak):
	(- DivideParagraphPoint(); new_line; -).
[TODO
To say run paragraph on -- running on
	(documented at phs_runparaon):
	(- RunParagraphOn(); -).
To say run paragraph on with special look spacing -- running on
	(documented at phs_runparaonsls):
	(- SpecialLookSpacingBreak(); -).
To decide if a paragraph break is pending
	(documented at ph_breakpending):
	(- (say__p) -).
]

Section SR5/1/6 - Saying - Special characters

To say crochet -- running on
	(documented at phs_bracket):
	(- print "["; -).
To say crochet fermant -- running on
	(documented at phs_closebracket):
	(- print "]"; -).
To say apostrophe/' -- running on
	(documented at phs_apostrophe):
	(- print "'"; -).
To say guillemet droit -- running on
	(documented at phs_quotemark):
	(- print "~"; -).

Section SR5/1/7 - Saying - Fonts and visual effects

To say gras -- running on
	(documented at phs_bold):
	(- style bold; -).
To say italique -- running on
	(documented at phs_italic):
	(- style underline; -).
To say romain -- running on
	(documented at phs_roman):
	(- style roman; -).
To say largeur fixe -- running on
	(documented at phs_fixedspacing):
	(- font off; -).
To say largeur variable -- running on
	(documented at phs_varspacing):
	(- font on; -).
To afficher la citation encadrée (Q - text)
	(documented at ph_boxed):
	(- DisplayBoxedQuotation({-box-quotation-text:Q}); -).

Section SR5/1/8 - Saying - Some built-in texts

[TODO: pas sûr pour « crédits »]

To say la/-- bannière
	(documented at phs_banner):
	(- Banner(); -).
To say la/-- liste des crédits des extensions
	(documented at phs_extcredits):
	(- ShowExtensionVersions(); -).
To say la/-- liste complète des crédits des extensions
	(documented at phs_compextcredits):
	(- ShowFullExtensionVersions(); -).
To say les/-- alentours du joueur
	(documented at phs_surroundings):
	(- SL_Location(true); -).

Section SR5/1/9 - Saying - Saying lists of things

To lister le contenu du/de/des (O - an object),
	avec passages à la ligne,
	indenté,
	en donnant les informations d'inventaire,
	en tant que phrase,
	en incluant le contenu,
	en incluant tout le contenu,
	brièvement,
	en donnant de brèves informations d'inventaire,
	en utilisant les articles définis,
	en listant les objets marqués seulement,
	en débutant par est-sont,
	en ne listant pas les objets cachés,
	en supprimant tous les articles,
	avec de l'indentation supplémentaire,
	and/or avec des majuscules
	(documented at ph_listcontents):
	(- WriteListFrom(child({O}), {phrase options}); -).

To say une liste du/de/des (OS - description of objects)
	(documented at phs_alistof): (-
	 	objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT);
	-).
To say Une liste du/de/des (OS - description of objects)
	(documented at phs_Alistof):
	(-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		TEXT_TY_Say_Capitalised((+ "[list-writer list of marked objects]" +));
	-).

To say liste du/de/des (OS - description of objects)
	(documented at phs_listof): (-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+NOARTICLE_BIT);
	-).
To say la liste du/de/des (OS - description of objects)
	(documented at phs_thelistof): (-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+DEFART_BIT);
	-).
To say La liste du/de/des (OS - description of objects)
	(documented at phs_Thelistof):
	(-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		TEXT_TY_Say_Capitalised((+ "[list-writer articled list of marked objects]" +));
	-).
To say est-sont une liste du/de/des (OS - description of objects)
	(documented at phs_isalistof): (-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+ISARE_BIT);
	-).
To say est-sont liste du/de/des (OS - description of objects)
	(documented at phs_islistof): (-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+ISARE_BIT+NOARTICLE_BIT);
	-).
To say est-sont la liste du/de/des (OS - description of objects)
	(documented at phs_isthelistof): (-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+DEFART_BIT+ISARE_BIT);
	-).
To say une liste du/de/des (OS - description of objects) en incluant le contenu
	(documented at phs_alistofconts): (-
		objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:OS})
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		WriteListOfMarkedObjects(ENGLISH_BIT+RECURSE_BIT+PARTINV_BIT+
			TERSE_BIT+CONCEAL_BIT);
	-).

Section SR5/1/10 - Saying - Group in and omit from lists

To grouper (OS - description of objects)
	(documented at ph_group): (-
		objectloop({-my:1} provides list_together)
			if ({-matches-description:1:OS})
				BlkValueCopy({-my:1}.list_together, {-list-together:unarticled});
	-).
To grouper (OS - description of objects) en affichant les articles
	(documented at ph_groupart): (-
		objectloop({-my:1} provides list_together)
			if ({-matches-description:1:OS})
				BlkValueCopy({-my:1}.list_together, {-list-together:articled});
	-).
To grouper (OS - description of objects) en tant que (T - text)
	(documented at ph_grouptext): (-
		{-my:2} = BlkValueCreate(TEXT_TY);
		{-my:2} = TEXT_TY_SubstitutedForm({-my:2}, {-by-reference:T});
		objectloop({-my:1} provides list_together)
			if ({-matches-description:1:OS})
				BlkValueCopy({-my:1}.list_together, {-my:2});
		BlkValueFree({-my:2});
	-).
To omettre le contenu dans le listage
	(documented at ph_omit):
	(- c_style = c_style &~ (RECURSE_BIT+FULLINV_BIT+PARTINV_BIT); -).

Section SR5/1/11 - Saying - Lists of values

To say (L - a list of values) avec accolades
	(documented at phs_listbraced):
	(- LIST_OF_TY_Say({-by-reference:L}, 1); -).
To say (L - a list of objects) avec les articles définis
	(documented at phs_listdef):
	(- LIST_OF_TY_Say({-by-reference:L}, 2); -).
To say (L - a list of objects) avec les articles indéfinis
	(documented at phs_listindef):
	(- LIST_OF_TY_Say({-by-reference:L}, 3); -).

Section SR5/1/12 - Saying - Filtering contents - Unindexed

[TODO
To filter list recursion to (D - description of objects):
	(- list_filter_routine = {D}; -).
To unfilter list recursion:
	(- list_filter_routine = 0; -).
]

Section SR5/1/13 - Saying - Responses

To say texte du/de/des (R - response)
	(documented at phs_response):
	carry out the issuing the response text activity with R.

Section SR5/2/1 - Values - Making conditions true

To maintenant (cn - now-condition)
	(documented at ph_now):
	(- {cn} -).

Section SR5/2/2 - Values - Giving values temporary names

[TODO: pas sûr pour « soit … étant » comme dans « soit N étant 4 ».
Aussi, ne fonctionne pas bien : les variables créées comme cela sont de type « value » et certaines opérations deviennent impossibles (même si les tests comme « si N est un nombre » fonctionne, on ne pas « incrémenter N », par exemple).
Aussi, on ne peut pas écrire « soit N étant un nombre », par exemple.]

To soit (t - nonexisting variable) étant (u - value)
	(assignment operation)
	(documented at ph_let): (-
		{-unprotect:t}
		{-copy:t:u}
	-).
To soit (t - nonexisting variable) étant (u - name of kind of value)
	(assignment operation)
	(documented at ph_letdefault): (-
		{-unprotect:t}
		{-initialise:t}
	-).
To soit (t - nonexisting variable) étant (u - description of relations of values
	of kind K to values of kind L)
	(assignment operation)
	(documented at ph_letrelation): (-
		{-unprotect:t}
		{-initialise:t}
		{-now-matches-description:t:u};
	-).
To soit (t - nonexisting variable) donné par (Q - equation name)
	(documented at ph_letequation): (-
		{-unprotect:t}
		{-primitive-definition:solve-equation};
	-).

To soit (t - existing variable) étant (u - value)
	(assignment operation)
	(documented at ph_let): (-
	 	{-copy:t:u}
	-).
To soit (t - existing variable) donné par (Q - equation name)
	(documented at ph_letequation): (-
		{-primitive-definition:solve-equation};
	-).

To augmenter (S - storage) du/de/des/par (w - value)
	(assignment operation)
	(documented at ph_increase): (-
		{-copy:S:+w};
	-).
To diminuer (S - storage) du/de/des/par (w - value)
	(assignment operation)
	(documented at ph_decrease): (-
		{-copy:S:-w};
	-).
To incrémenter (S - storage)
	(documented at ph_increment): (-
		{-copy:S:+};
	-).
[TODO: ça se dit ?]
To décrémenter (S - storage)
	(documented at ph_decrement): (-
		{-copy:S:-};
	-).

Section SR5/2/4 - Values - Arithmetic

To decide which arithmetic value is (X - arithmetic value) moins (Y - arithmetic value)
	(arithmetic operation 1)
	(documented at ph_minus):
	(- ({-arithmetic-operation:X:Y}) -).
To decide which arithmetic value is (X - arithmetic value) fois (Y - arithmetic value)
	(arithmetic operation 2)
	(documented at ph_times):
	(- ({-arithmetic-operation:X:Y}) -).
To decide which arithmetic value is (X - arithmetic value) multiplié/multipliée/multipliés/multipliées par (Y - arithmetic value)
	(arithmetic operation 2)
	(documented at ph_times):
	(- ({-arithmetic-operation:X:Y}) -).
To decide which arithmetic value is (X - arithmetic value) divisé/divisée/divisés/divisées par (Y - arithmetic value)
	(arithmetic operation 3)
	(documented at ph_divide):
	(- ({-arithmetic-operation:X:Y}) -).
To decide which arithmetic value is reste après avoir divisé (X - arithmetic value)
	par (Y - arithmetic value)
	(arithmetic operation 4)
	(documented at ph_remainder):
	(- ({-arithmetic-operation:X:Y}) -).
To decide which arithmetic value is (X - arithmetic value) arrondi/arrondie/arrondis/arrondies à/au (Y - arithmetic value)
	(arithmetic operation 5)
	(documented at ph_nearest):
	(- ({-arithmetic-operation:X:Y}) -).
To decide which arithmetic value is racine carrée du/de/des (X - arithmetic value)
	(arithmetic operation 6)
	(documented at ph_squareroot):
	(- ({-arithmetic-operation:X}) -).
To decide which arithmetic value is racine cubique du/de/des (X - arithmetic value)
	(arithmetic operation 8)
	(documented at ph_cuberoot):
	(- ({-arithmetic-operation:X}) -).
[TODO: Pas sûr pour celui là]
To decide which arithmetic value is total (p - arithmetic value valued property)
	de (S - description of values)
	(arithmetic operation 12)
	(documented at ph_total):
	(- {-primitive-definition:total-of} -).

Section SR5/2/4a - Values - Real Arithmetic (for Glulx only)

To say (R - a real number) avec (N - number) décimale/décimales
	(documented at phs_realplaces):
	(- Float({R}, {N}); -).
To say (R - a real number) en notation décimale
	(documented at phs_decimal):
	(- FloatDec({R}); -).
To say (R - a real number) avec (N - number) décimale/décimales en notation décimale
	(documented at phs_decimalplaces):
	(- FloatDec({R}, {N}); -).
To say (R - a real number) en notation scientifique
	(documented at phs_scientific):
	(- FloatExp({R}); -).
To say (R - a real number) avec (N - number) décimale/décimales en notation scientifique
	(documented at phs_scientificplaces):
	(- FloatExp({R}, {N}); -).

To decide which real number is the inverse du/de/des (R - a real number)
	(documented at ph_reciprocal):
	(- REAL_NUMBER_TY_Reciprocal({R}) -).
To decide which real number is the valeur absolue du/de/des (R - a real number)
	(documented at ph_absolutevalue):
	(- REAL_NUMBER_TY_Abs({R}) -).
To decide which real number is the racine carrée réelle du/de/des (R - a real number)
	(arithmetic operation 7)
	(documented at ph_realsquareroot):
	(- REAL_NUMBER_TY_Root({R}) -).
To decide which real number is the (R - a real number) réel au carré:
	let x be given by x = R^2 where x is a real number;
	decide on x.
To decide which real number is the plafond du/de/des (R - a real number)
	(documented at ph_ceiling):
	(- REAL_NUMBER_TY_Ceiling({R}) -).
To decide which real number is the partie entière (R - a real number)
	(documented at ph_floor):
	(- REAL_NUMBER_TY_Floor({R}) -).
To decide which number is (R - a real number) à l'entier le plus proche
	(documented at ph_nearestwholenumber):
	(- REAL_NUMBER_TY_to_NUMBER_TY({R}) -).

To decide which real number is the logarithme naturel/néperien/-- du/de/des (R - a real number)
	(documented at ph_logarithm):
	(- REAL_NUMBER_TY_Log({R}) -).
To decide which real number is the logarithme en base (N - a number) du/de/des (R - a real number)
	(documented at ph_logarithmto):
	(- REAL_NUMBER_TY_BLog({R}, {N}) -).
To decide which real number is the exponentielle du/de/des (R - a real number)
	(documented at ph_exp):
	(- REAL_NUMBER_TY_Exp({R}) -).
To decide which real number is (R - a real number) puissance (P - a real number)
	(documented at ph_power):
	(- REAL_NUMBER_TY_Pow({R}, {P}) -).

Section SR5/2/4a - Values - Trigonometry (for Glulx only)

To decide which real number is (R - a real number) degré/degrés
	(documented at ph_degrees):
	(- REAL_NUMBER_TY_Times({R}, $+0.0174532925) -).

To decide which real number is the sinus du/de/des (R - a real number)
	(documented at ph_sine):
	(- REAL_NUMBER_TY_Sin({R}) -).
To decide which real number is the cosinus du/de/des (R - a real number)
	(documented at ph_cosine):
	(- REAL_NUMBER_TY_Cos({R}) -).
To decide which real number is the tangente du/de/des (R - a real number)
	(documented at ph_tangent):
	(- REAL_NUMBER_TY_Tan({R}) -).
To decide which real number is the arc sinus du/de/des (R - a real number)
	(documented at ph_arcsine):
	(- REAL_NUMBER_TY_Arcsin({R}) -).
To decide which real number is the arc cosinus du/de/des (R - a real number)
	(documented at ph_arccosine):
	(- REAL_NUMBER_TY_Arccos({R}) -).
To decide which real number is the arc tangente du/de/des (R - a real number)
	(documented at ph_arctangent):
	(- REAL_NUMBER_TY_Arctan({R}) -).

Section SR5/2/4a - Values - Hyperbolic functions (for Glulx only)

To decide which real number is the sinus hyperbolique du/de/des (R - a real number)
	(documented at ph_hyperbolicsine):
	(- REAL_NUMBER_TY_Sinh({R}) -).
To decide which real number is the cosinus hyperbolique du/de/des (R - a real number)
	(documented at ph_hyperboliccosine):
	(- REAL_NUMBER_TY_Cosh({R}) -).
To decide which real number is the tangente hyperbolique du/de/des (R - a real number)
	(documented at ph_hyperbolictangent):
	(- REAL_NUMBER_TY_Tanh({R}) -).
To decide which real number is the arg sinus du/de/des (R - a real number)
	(documented at ph_hyperbolicarcsine):
	let x be given by x = log(R + root(R^2 + 1)) where x is a real number;
	decide on x.
To decide which real number is the arg cosinus du/de/des (R - a real number)
	(documented at ph_hyperbolicarccosine):
	let x be given by x = log(R + root(R^2 - 1)) where x is a real number;
	decide on x.
To decide which real number is the arg tangente du/de/des (R - a real number)
	(documented at ph_hyperbolicarctangent):
	let x be given by x = 0.5*(log(1+R) - log(1-R)) where x is a real number;
	decide on x.

Section SR5/2/5 - Values - Enumerations

To decide which number is nombre du/de/des (S - description of values)
	(documented at ph_numberof):
	(- {-primitive-definition:number-of} -).
To decide which K is (name of kind of enumerated value K) après (X - K)
	(documented at ph_enumafter):
	(- A_{-printing-routine:K}({X}) -).
To decide which K is (name of kind of enumerated value K) avant (X - K)
	(documented at ph_enumbefore):
	(- B_{-printing-routine:K}({X}) -).
To decide which K is the première valeur du/de/des (name of kind of enumerated value K)
	(documented at ph_enumfirst):
	decide on the default value of K.
To decide which K is the dernière valeur du/de/des (name of kind of enumerated value K)
	(documented at ph_enumlast):
	decide on K before the default value of K.

Section SR5/2/6 - Values - Truth states

[TODO?
To decide what truth state is whether or not (C - condition)
	(documented at ph_whether):
	(- ({C}) -).
]

Section SR5/2/7 - Values - Randomness

To decide which K is un/une/-- (S - description of values of kind K) aléatoire
	(documented at ph_randomdesc):
	(- {-primitive-definition:random-of} -).
To decide which K is un/une (name of kind of arithmetic value K) aléatoire entre (first value - K) et (second value - K)
	(documented at ph_randombetween):
	(- R_{-printing-routine:K}({first value}, {second value}) -).
To decide which K is un/une (name of kind of arithmetic value K) aléatoire du/de/des (first value - K) au/à/aux (second value - K)
	(documented at ph_randombetween):
	(- R_{-printing-routine:K}({first value}, {second value}) -).
To decide which K is un/une (name of kind of enumerated value K) aléatoire entre (first value - K) et (second value - K)
	(documented at ph_randombetween):
	(- R_{-printing-routine:K}({first value}, {second value}) -).
To decide which K is un/une (name of kind of enumerated value K) aléatoire du/de/des (first value - K) au/à/aux (second value - K)
	(documented at ph_randombetween):
	(- R_{-printing-routine:K}({first value}, {second value}) -).
To decide whether une chance du/de/des (N - number) sur (M - number) réussit
	(documented at ph_randomchance):
	(- (GenerateRandomNumber(1, {M}) <= {N}) -).
[TODO: à vérifier]
To régler la graine aléatoire sur (N - number)
	(documented at ph_seed):
	(- VM_Seed_RNG({N}); -).

Section SR5/2/8 - Values - Tables

To choisir une/la/-- ligne (N - number) du/de/des/dans (T - table name)
	(documented at ph_chooserow):
	(- {-my:ct_0} = {T}; {-my:ct_1} = {N}; -).
To choisir une/la/-- ligne avec un/une/des/-- (TC - K valued table column) du/de/des (w - value of kind K)
	du/de/des (T - table name)
	(documented at ph_chooserowwith):
	(- {-my:ct_0} = {T}; {-my:ct_1} = TableRowCorr(ct_0, {TC}, {w}); -).
To choisir une/la/-- ligne vide du/de/des/dans (T - table name)
	(documented at ph_chooseblankrow):
	(- {-my:ct_0} = {T}; {-my:ct_1} = TableBlankRow(ct_0); -).
To choisir une/la/-- ligne aléatoire du/de/des/dans (T - table name)
	(documented at ph_chooserandomrow):
	(- {-my:ct_0} = {T}; {-my:ct_1} = TableRandomRow(ct_0); -).
To decide which number is nombre de lignes du/de/des/dans (T - table name)
	(documented at ph_numrows):
	(- TableRows({T}) -).
To decide which number is nombre de lignes vides du/de/des/dans (T - table name)
	(documented at ph_numblank):
	(- TableBlankRows({T}) -).
To decide which number is nombre de lignes remplies du/de/des/dans (T - table name)
	(documented at ph_numfilled):
	(- TableFilledRows({T}) -).
To decide if il y a (TR - table-reference)
	(documented at ph_thereis):
	(- (Exists{-by-reference:TR}) -).
To decide if il n'y a pas (TR - table-reference)
	(documented at ph_thereisno):
	(- (Exists{-by-reference:TR} == false) -).
To effacer (tr - table-reference)
	(documented at ph_blankout):
	(- {-by-reference:tr}{-backspace},4); -).
To effacer la ligne en entier
	(documented at ph_blankoutrow):
	(- TableBlankOutRow({-my:ct_0}, {-my:ct_1}); -).
To effacer (TC - table column) du/de/des/dans (T - table name)
	(documented at ph_blankoutcol):
	(- TableBlankOutColumn({T}, {TC}); -).
To effacer en entier le/la (T - table name)
	(documented at ph_blankouttable):
	(- TableBlankOutAll({T}); -).
To montremoi le contenu du/de/des (T - table name)
	(documented at ph_showmetable):
	(- TableDebug({T}); -).
To say la/-- ligne choisie
	(documented at phs_currenttablerow):
	(- TableRowDebug({-my:ct_0}, {-my:ct_1}); -).
To say ligne (N - number) du/de/des/dans (T - table name)
	(documented at phs_tablerow):
	(- TableRowDebug({T}, {N}); -).
To say (TC - table column) du/de/des/dans (T - table name)
	(documented at phs_tablecolumn):
	(- TableColumnDebug({T}, {TC}); -).

Section SR5/2/9 - Values - Sorting tables

To classer (T - table name) aléatoirement
	(documented at ph_sortrandom):
	(- TableShuffle({T}); -).
To classer (T - table name) selon (TC - table column)
	(documented at ph_sortcolumn):
	(- TableSort({T}, {TC}, 1); -).
[TODO: Pas sûr]
To classer (T - table name) selon (TC - table column) en sens inverse
	(documented at ph_sortcolumnreverse):
	(- TableSort({T}, {TC}, -1); -).

Section SR5/2/10 - Values - Breaking down text

To decide what number is the nombre de caractères dans (T - text)
	(documented at ph_numchars):
	(- TEXT_TY_BlobAccess({-by-reference:T}, CHR_BLOB) -).
To decide what number is the nombre de mots dans (T - text)
	(documented at ph_numwords):
	(- TEXT_TY_BlobAccess({-by-reference:T}, WORD_BLOB) -).
To decide what number is the nombre de mots ponctués dans (T - text)
	(documented at ph_numpwords):
	(- TEXT_TY_BlobAccess({-by-reference:T}, PWORD_BLOB) -).
To decide what number is the nombre de mots non ponctués dans (T - text)
	(documented at ph_numupwords):
	(- TEXT_TY_BlobAccess({-by-reference:T}, UWORD_BLOB) -).
To decide what number is the nombre de lignes dans (T - text)
	(documented at ph_numlines):
	(- TEXT_TY_BlobAccess({-by-reference:T}, LINE_BLOB) -).
To decide what number is the nombre de paragraphes dans (T - text)
	(documented at ph_numparas):
	(- TEXT_TY_BlobAccess({-by-reference:T}, PARA_BLOB) -).

To decide what text is caractère numéro (N - a number) dans (T - text)
	(documented at ph_charnum):
	(- TEXT_TY_GetBlob({-new:text}, {-by-reference:T}, {N}, CHR_BLOB) -).
To decide what text is mot numéro (N - a number) dans (T - text)
	(documented at ph_wordnum):
	(- TEXT_TY_GetBlob({-new:text}, {-by-reference:T}, {N}, WORD_BLOB) -).
To decide what text is mot ponctué numéro (N - a number) dans (T - text)
	(documented at ph_pwordnum):
	(- TEXT_TY_GetBlob({-new:text}, {-by-reference:T}, {N}, PWORD_BLOB) -).
To decide what text is mot non ponctué numéro (N - a number) dans (T - text)
	(documented at ph_upwordnum):
	(- TEXT_TY_GetBlob({-new:text}, {-by-reference:T}, {N}, UWORD_BLOB) -).
To decide what text is ligne numéro (N - a number) dans (T - text)
	(documented at ph_linenum):
	(- TEXT_TY_GetBlob({-new:text}, {-by-reference:T}, {N}, LINE_BLOB) -).
To decide what text is paragraphe numéro (N - a number) dans (T - text)
	(documented at ph_paranum):
	(- TEXT_TY_GetBlob({-new:text}, {-by-reference:T}, {N}, PARA_BLOB) -).

To decide what text is the forme substituée du/de/des (T - text)
	(documented at ph_subform):
	(- TEXT_TY_SubstitutedForm({-new:text}, {-by-reference:T}) -).

Section SR5/2/11 - Values - Matching text

To decide if (T - text) correspond exactement au texte (find - text),
	sans respecter la casse
	(documented at ph_exactlymatches):
	(- TEXT_TY_Replace_RE(CHR_BLOB,{-by-reference:T},{-by-reference:find},0,{phrase options},1) -).
To decide if (T - text) correspond au texte (find - text),
	sans respecter la casse
	(documented at ph_matches):
	(- TEXT_TY_Replace_RE(CHR_BLOB,{-by-reference:T},{-by-reference:find},0,{phrase options}) -).
To decide what number is nombre de fois que (T - text) correspond au texte
	(find - text), sans respecter la casse
	(documented at ph_nummatches):
	(- TEXT_TY_Replace_RE(CHR_BLOB,{-by-reference:T},{-by-reference:find},1,{phrase options}) -).

To decide if (T - text) correspond exactement à l'expression régulière (find - text),
	sans respecter la casse
	(documented at ph_exactlymatchesre):
	(- TEXT_TY_Replace_RE(REGEXP_BLOB,{-by-reference:T},{-by-reference:find},0,{phrase options},1) -).
To decide if (T - text) correspond à l'expression régulière (find - text),
	sans respecter la casse
	(documented at ph_matchesre):
	(- TEXT_TY_Replace_RE(REGEXP_BLOB,{-by-reference:T},{-by-reference:find},0,{phrase options}) -).
To decide what text is texte correspondant à l'expression régulière
	(documented at ph_matchtext):
	(- TEXT_TY_RE_GetMatchVar(0) -).
To decide what text is texte correspondant à la sous-expression (N - a number)
	(documented at ph_subexpressiontext):
	(- TEXT_TY_RE_GetMatchVar({N}) -).
To decide what number is nombre de fois que (T - text) correspond à l'expression régulière
	(find - text), sans respecter la casse
	(documented at ph_nummatchesre):
	(- TEXT_TY_Replace_RE(REGEXP_BLOB,{-by-reference:T},{-by-reference:find},1,{phrase options}) -).

Section SR5/2/12 - Values - Replacing text

To remplacer le texte (find - text) dans (T - text) par (replace - text),
	sans respecter la casse
	(documented at ph_replace):
	(- TEXT_TY_Replace_RE(CHR_BLOB, {-lvalue-by-reference:T}, {-by-reference:find},
		{-by-reference:replace}, {phrase options}); -).
To remplacer l'expression régulière (find - text) dans (T - text) par
	(replace - text), sans respecter la casse
	(documented at ph_replacere):
	(- TEXT_TY_Replace_RE(REGEXP_BLOB, {-lvalue-by-reference:T}, {-by-reference:find},
		{-by-reference:replace}, {phrase options}); -).
To remplacer le mot (find - text) dans (T - text) par
	(replace - text)
	(documented at ph_replacewordin):
	(- TEXT_TY_ReplaceText(WORD_BLOB, {-lvalue-by-reference:T}, {-by-reference:find}, {-by-reference:replace}); -).
To remplacer le mot ponctué (find - text) dans (T - text)
	par (replace - text)
	(documented at ph_replacepwordin):
	(- TEXT_TY_ReplaceText(PWORD_BLOB, {-lvalue-by-reference:T}, {-by-reference:find}, {-by-reference:replace}); -).

To remplacer le caractère numéro (N - a number) dans (T - text)
	par (replace - text)
	(documented at ph_replacechar):
	(- TEXT_TY_ReplaceBlob(CHR_BLOB, {-lvalue-by-reference:T}, {N}, {-by-reference:replace}); -).
To remplacer le mot numéro (N - a number) dans (T - text)
	par (replace - text)
	(documented at ph_replaceword):
	(- TEXT_TY_ReplaceBlob(WORD_BLOB, {-lvalue-by-reference:T}, {N}, {-by-reference:replace}); -).
To remplacer le mot ponctué numéro (N - a number) dans (T - text)
	par (replace - text)
	(documented at ph_replacepword):
	(- TEXT_TY_ReplaceBlob(PWORD_BLOB, {-lvalue-by-reference:T}, {N}, {-by-reference:replace}); -).
To remplacer le mot non ponctué numéro (N - a number) dans (T - text)
	par (replace - text)
	(documented at ph_replaceupword):
	(- TEXT_TY_ReplaceBlob(UWORD_BLOB, {-lvalue-by-reference:T}, {N}, {-by-reference:replace}); -).
To remplacer la ligne numéro (N - a number) dans (T - text) par (replace - text)
	(documented at ph_replaceline):
	(- TEXT_TY_ReplaceBlob(LINE_BLOB, {-lvalue-by-reference:T}, {N}, {-by-reference:replace}); -).
To remplacer le paragraphe numéro (N - a number) dans (T - text) par (replace - text)
	(documented at ph_replacepara):
	(- TEXT_TY_ReplaceBlob(PARA_BLOB, {-lvalue-by-reference:T}, {N}, {-by-reference:replace}); -).

Section SR5/2/13 - Values - Casing of text

[TODO: pas sûr pour titre et phrase]

To decide what text is (T - text) en minuscules
	(documented at ph_lowercase):
	(- TEXT_TY_CharactersToCase({-new:text}, {-by-reference:T}, 0) -).
To decide what text is (T - text) en capitales
	(documented at ph_uppercase):
	(- TEXT_TY_CharactersToCase({-new:text}, {-by-reference:T}, 1) -).
To decide what text is (T - text) en casse de titre
	(documented at ph_titlecase):
	(- TEXT_TY_CharactersToCase({-new:text}, {-by-reference:T}, 2) -).
To decide what text is (T - text) en casse de phrase
	(documented at ph_sentencecase):
	(- TEXT_TY_CharactersToCase({-new:text}, {-by-reference:T}, 3) -).
To decide if (T - text) est en minuscules
	(documented at ph_inlower):
	(- TEXT_TY_CharactersOfCase({-by-reference:T}, 0) -).
To decide if (T - text) est en capitales
	(documented at ph_inupper):
	(- TEXT_TY_CharactersOfCase({-by-reference:T}, 1) -).

Section SR5/2/14 - Values - Adaptive text

To say infinitif du/de/des (V - a verb)
	(documented at phs_infinitive):
	(- {V}(1); -).
To say participe passé du/de/des (V - a verb)
	(documented at phs_pastpart):
	(- {V}(2); -).
To say participe présent du/de/des (V - a verb)
	(documented at phs_prespart):
	(- {V}(3); -).

To say adapter (V - verb)
	(documented at phs_adapt):
	(- {V}(CV_POS, PNToVP(), story_tense); -).
To say adapter (V - verb) à/au (T - grammatical tense)
	(documented at phs_adaptt):
	(- {V}(CV_POS, PNToVP(), {T}); -).
To say adapter (V - verb) au/à/aux (P - narrative viewpoint)
	(documented at phs_adaptv):
	(- {V}(CV_POS, {P}, story_tense); -).
To say adapter (V - verb) à/au (T - grammatical tense) au/à/aux (P - narrative viewpoint)
	(documented at phs_adaptvt):
	(- {V}(CV_POS, {P}, {T}); -).
To say négativer (V - verb)
	(documented at phs_negate):
	(- {V}(CV_NEG, PNToVP(), story_tense); -).
To say négativer (V - verb) à/au (T - grammatical tense)
	(documented at phs_negatet):
	(- {V}(CV_NEG, PNToVP(), {T}); -).
To say négativer (V - verb) au/à/aux (P - narrative viewpoint)
	(documented at phs_negatev):
	(- {V}(CV_NEG, {P}, story_tense); -).
To say négativer (V - verb) à/au (T - grammatical tense) au/à/aux (P - narrative viewpoint)
	(documented at phs_negatevt):
	(- {V}(CV_NEG, {P}, {T}); -).

To decide which relation of objects is signification du/de/des (V - a verb): (- {V}(CV_MEANING) -).

Section SR5/2/15 - Values - Lists

To insérer/ajouter (new entry - K) au/à/aux/dans (L - list of values of kind K), si absent
	(documented at ph_addtolist):
	(- LIST_OF_TY_InsertItem({-lvalue-by-reference:L}, {new entry}, 0, 0, {phrase options}); -).

To insérer/ajouter (new entry - K) au/à/auxla position (E - number) dans (L - list of values of kind K), si absent
	(documented at ph_addatentry):
	(- LIST_OF_TY_InsertItem({-lvalue-by-reference:L}, {new entry}, 1, {E}, {phrase options}); -).

To insérer/ajouter (LX - list of Ks) au/à/aux/dans (L - list of values of kind K), si absent
	(documented at ph_addlisttolist):
	(- LIST_OF_TY_AppendList({-lvalue-by-reference:L}, {-by-reference:LX}, 0, 0, {phrase options}); -).

To insérer/ajouter (LX - list of Ks) au/à/aux la position (E - number) dans (L - list of values of kind K)
	(documented at ph_addlistatentry):
	(- LIST_OF_TY_AppendList({-lvalue-by-reference:L}, {-by-reference:LX}, 1, {E}, 0); -).

To retirer (existing entry - K) du/de/des (L - list of values of kind K), si présent
	(documented at ph_remfromlist):
	(- LIST_OF_TY_RemoveValue({-lvalue-by-reference:L}, {existing entry}, {phrase options}); -).

To retirer (N - list of Ks) du/de/des (L - list of values of kind K), si présent
	(documented at ph_remlistfromlist):
	(- LIST_OF_TY_Remove_List({-lvalue-by-reference:L}, {-by-reference:N}, {phrase options}); -).

[TODO: pas sûr pour « entrée »]
To retirer l'entrée (N - number) du/de/des (L - list of values), si présent
	(documented at ph_rementry):
	(- LIST_OF_TY_RemoveItemRange({-lvalue-by-reference:L}, {N}, {N}, {phrase options}); -).

To retirer les entrées (N - number) au/à/aux (N2 - number) du/de/des (L - list of values), si présent
	(documented at ph_rementries):
	(- LIST_OF_TY_RemoveItemRange({-lvalue-by-reference:L}, {N}, {N2}, {phrase options}); -).

To decide if (N - K) est listé/listée dans (L - list of values of kind K)
	(documented at ph_islistedin):
	(- (LIST_OF_TY_FindItem({-by-reference:L}, {N})) -).

To decide if (N - K) n'est pas listé/listée dans (L - list of values of kind K)
	(documented at ph_isnotlistedin):
	(- (LIST_OF_TY_FindItem({-by-reference:L}, {N}) == false) -).

To decide what list of Ks is the liste du/de/des (D - description of values of kind K)
	(documented at ph_listofdesc):
	(- {-new-list-of:list of K} -).
To decide what list of objects is the liste d'objets multiples
	(documented at ph_multipleobjectlist):
	(- LIST_OF_TY_Mol({-new:list of objects}) -).
To changer la liste d'objets multiples pour (L - list of objects)
	(documented at ph_altermultipleobjectlist):
	(- LIST_OF_TY_Set_Mol({-by-reference:L}); -).

Section SR5/2/16 - Values - Length of lists

[TODO: pareil pour « entrée »]

To decide what number is the nombre d'entrées dans/du/de/des (L - a list of values)
	(documented at ph_numberentries):
	(- LIST_OF_TY_GetLength({-by-reference:L}) -).
To tronquer (L - a list of values) au/à/aux (N - a number) entrée/entrées
	(documented at ph_truncate):
	(- LIST_OF_TY_SetLength({-lvalue-by-reference:L}, {N}, -1, 1); -).
To tronquer (L - a list of values) au/aux (N - a number) première/premières entrée/entrées
	(documented at ph_truncatefirst):
	(- LIST_OF_TY_SetLength({-lvalue-by-reference:L}, {N}, -1, 1); -).
To tronquer (L - a list of values) au/aux (N - a number) dernière/dernières entrée/entrées
	(documented at ph_truncatelast):
	(- LIST_OF_TY_SetLength({-lvalue-by-reference:L}, {N}, -1, -1); -).
To agrandir (L - a list of values) au/à/aux (N - a number) entrée/entrées
	(documented at ph_extend):
	(- LIST_OF_TY_SetLength({-lvalue-by-reference:L}, {N}, 1); -).
[TODO: pas sûr]
To changer (L - a list of values) pour avoir (N - a number) entrée/entrées
	(documented at ph_changelength):
	(- LIST_OF_TY_SetLength({-lvalue-by-reference:L}, {N}, 0); -).

Section SR5/2/17 - Values - Reversing and rotating lists

To inverser (L - a list of values)
	(documented at ph_reverselist):
	(- LIST_OF_TY_Reverse({-lvalue-by-reference:L}); -).
[TODO: pas sûr pour pivoter]
To pivoter (L - a list of values)
	(documented at ph_rotatelist):
	(- LIST_OF_TY_Rotate({-lvalue-by-reference:L}, 0); -).
To pivoter (L - a list of values) en sens inverse
	(documented at ph_rotatelistback):
	(- LIST_OF_TY_Rotate({-lvalue-by-reference:L}, 1); -).

Section SR5/2/18 - Values - Sorting lists

To classer (L - a list of values)
	(documented at ph_sortlist):
	(- LIST_OF_TY_Sort({-lvalue-by-reference:L}, 1); -).
To classer (L - a list of values) en sens inverse
	(documented at ph_sortlistreverse):
	(- LIST_OF_TY_Sort({-lvalue-by-reference:L}, -1); -).
To classer (L - a list of values) aléatoirement
	(documented at ph_sortlistrandom):
	(- LIST_OF_TY_Sort({-lvalue-by-reference:L}, 2); -).
To classer (L - a list of objects) selon (P - property)
	(documented at ph_sortlistproperty):
	(- LIST_OF_TY_Sort({-lvalue-by-reference:L}, 1, {P}, {-property-holds-block-value:P}); -).
To classer (L - a list of objects) selon (P - property) en sens inverse
	(documented at ph_sortlistpropertyreverse):
	(- LIST_OF_TY_Sort({-lvalue-by-reference:L}, -1, {P}, {-property-holds-block-value:P}); -).

Section SR5/2/19 - Values - Relations

To montrer la relation (R - relation)
	(documented at ph_showrelation):
	(- {-show-me:R}; RelationTest({-by-reference:R}, RELS_SHOW); -).

To decide which object is prochaine étape via (R - relation of objects) du/de/des (O1 - object) à/au/aux (O2 - object)
	(documented at ph_nextstep):
	(- RelationRouteTo({-by-reference:R},{O1},{O2},false) -).
To decide which number is nombre d'étapes via (R - relation of objects)
	du/de/des (O1 - object) à/au/aux (O2 - object)
	(documented at ph_numbersteps):
	(- RelationRouteTo({-by-reference:R},{O1},{O2},true) -).

[TODO: Aucune idée]
To decide which list of Ks is list of (name of kind of value K)
	that/which/whom (R - relation of Ks to values of kind L) relates
	(documented at ph_leftdomain):
	(- RelationTest({-by-reference:R}, RELS_LIST, {-new:list of K}, RLIST_ALL_X) -).

[TODO: Aucune idée]
To decide which list of Ls is list of (name of kind of value L)
	to which/whom (R - relation of values of kind K to Ls) relates
	(documented at ph_rightdomain):
	(- RelationTest({-by-reference:R}, RELS_LIST, {-new:list of L}, RLIST_ALL_Y) -). [1]

[TODO: Aucune idée]
To decide which list of Ls is list of (name of kind of value L)
	that/which/whom (R - relation of values of kind K to Ls) relates to
	(documented at ph_rightdomain):
	(- RelationTest({-by-reference:R}, RELS_LIST, {-new:list of L}, RLIST_ALL_Y) -). [2]

[TODO: Aucune idée]
To decide which list of Ks is list of (name of kind of value K) that/which/who
	relate to (Y - L) by (R - relation of Ks to values of kind L)
	(documented at ph_leftlookuplist):
	(- RelationTest({-by-reference:R}, RELS_LOOKUP_ALL_X, {Y}, {-new:list of K}) -).

[TODO: Aucune idée]
To decide which list of Ls is list of (name of kind of value L) to which/whom (X - K)
	relates by (R - relation of values of kind K to Ls)
	(documented at ph_rightlookuplist):
	(- RelationTest({-by-reference:R}, RELS_LOOKUP_ALL_Y, {X}, {-new:list of L}) -). [1]

[TODO: Aucune idée]
To decide which list of Ls is list of (name of kind of value L)
	that/which/whom (X - K) relates to by (R - relation of values of kind K to Ls)
	(documented at ph_rightlookuplist):
	(- RelationTest({-by-reference:R}, RELS_LOOKUP_ALL_Y, {X}, {-new:list of L}) -). [2]

To decide whether (name of kind of value K) est en relation avec (Y - L) par
	(R - relation of Ks to values of kind L)
	(documented at ph_ifright):
	(- RelationTest({-by-reference:R}, RELS_LOOKUP_ANY, {Y}, RLANY_CAN_GET_X) -).

To decide whether (X - K) est en relation avec (name of kind of value L) par
	(R - relation of values of kind K to Ls)
	(documented at ph_ifleft):
	(- RelationTest({-by-reference:R}, RELS_LOOKUP_ANY, {X}, RLANY_CAN_GET_Y) -).

[TODO: Aucune idée]
To decide which K is (name of kind of value K) that/which/who relates to
	(Y - L) by (R - relation of Ks to values of kind L)
	(documented at ph_leftlookup):
	(- RelationTest({-by-reference:R}, RELS_LOOKUP_ANY, {Y}, RLANY_GET_X) -).

[TODO: Aucune idée]
To decide which L is (name of kind of value L) to which/whom (X - K)
	relates by (R - relation of values of kind K to Ls)
	(documented at ph_rightlookup):
	(- RelationTest({-by-reference:R}, RELS_LOOKUP_ANY, {X}, RLANY_GET_Y) -). [1]

[TODO: Aucune idée]
To decide which L is (name of kind of value L) that/which/whom (X - K)
	relates to by (R - relation of values of kind K to Ls)
	(documented at ph_rightlookup):
	(- RelationTest({-by-reference:R}, RELS_LOOKUP_ANY, {X}, RLANY_GET_Y) -). [2]

Section SR5/2/20 - Values - Functional programming

To decide whether (val - K) correspond au/à/aux (desc - description of values of kind K)
	(documented at ph_valuematch):
	(- {-primitive-definition:description-application} -).

To decide what K is (function - phrase nothing -> value of kind K) appliquée
	(documented at ph_applied0):
	(- {-primitive-definition:function-application} -).

To decide what L is (function - phrase value of kind K -> value of kind L)
	appliquée au/à/aux (input - K)
	(documented at ph_applied1):
	(- {-primitive-definition:function-application} -).

To decide what M is (function - phrase (value of kind K, value of kind L) -> value of kind M)
	appliquée au/à/aux (input - K) et (second input - L)
	(documented at ph_applied2):
	(- {-primitive-definition:function-application} -).

To decide what N is (function - phrase (value of kind K, value of kind L, value of kind M) -> value of kind N)
	appliquée au/à/aux (input - K) et (second input - L) et (third input - M)
	(documented at ph_applied3):
	(- {-primitive-definition:function-application} -).

To appliquer (function - phrase nothing -> nothing)
	(documented at ph_apply0):
	(- {-primitive-definition:function-application}; -).

To appliquer (function - phrase value of kind K -> nothing)
	au/à/aux (input - K)
	(documented at ph_apply1):
	(- {-primitive-definition:function-application}; -).

To appliquer (function - phrase (value of kind K, value of kind L) -> nothing)
	au/à/aux (input - K) et (second input - L)
	(documented at ph_apply2):
	(- {-primitive-definition:function-application}; -).

To appliquer (function - phrase (value of kind K, value of kind L, value of kind M) -> nothing)
	au/à/aux (input - K) et (second input - L) et (third input - M)
	(documented at ph_apply3):
	(- {-primitive-definition:function-application}; -).

To decide what list of L is (function - phrase K -> value of kind L) appliquée au/à/aux (original list - list of values of kind K)
	(documented at ph_appliedlist):
	let the result be a list of Ls;
	repeat with item running through the original list:
		let the mapped item be the function applied to the item;
		add the mapped item to the result;
	decide on the result.

[TODO: Aucune idée]
To decide what K is the (function - phrase (K, K) -> K) reduction of (original list - list of values of kind K)
	(documented at ph_reduction):
	let the total be a K;
	let the count be 0;
	repeat with item running through the original list:
		increase the count by 1;
		if the count is 1, now the total is the item;
		otherwise now the total is the function applied to the total and the item;
	decide on the total.

[TODO: Aucune idée]
To decide what list of K is the filter to (criterion - description of Ks) of
	(full list - list of values of kind K)
	(documented at ph_filter):
	let the filtered list be a list of K;
	repeat with item running through the full list:
		if the item matches the criterion:
			add the item to the filtered list;
	decide on the filtered list.

To montremoi (V - value)
	(documented at ph_showme):
	(- {-show-me:V} -).

To decide what K is the valeur par défaut du/de/des (V - name of kind of value of kind K)
	(documented at ph_defaultvalue):
	(- {-new:K} -).

Section SR5/2/21 - Values - Files (for Glulx external files language element only)

To lire (filename - external file) dans (T - table name)
	(documented at ph_readtable):
	(- FileIO_GetTable({filename}, {T}); -).
To écrire (filename - external file) depuis (T - table name)
	(documented at ph_writetable):
	(- FileIO_PutTable({filename}, {T}); -).
To decide if (filename - external file) existe
	(documented at ph_fileexists):
	(- (FileIO_Exists({filename}, false)) -).
To decide if (filename - external file) est prêt à être lu
	(documented at ph_fileready):
	(- (FileIO_Ready({filename}, false)) -).
To marquer (filename - external file) comme prêt à être lu
	(documented at ph_markfileready):
	(- FileIO_MarkReady({filename}, true); -).
To marquer (filename - external file) comme non prêt à être lu
	(documented at ph_markfilenotready):
	(- FileIO_MarkReady({filename}, false); -).
To écrire (T - text) dans (FN - external file)
	(documented at ph_writetext):
	(- FileIO_PutContents({FN}, {T}, false); -).
To ajouter (T - text) à/au (FN - external file)
	(documented at ph_appendtext):
	(- FileIO_PutContents({FN}, {T}, true); -).
To say texte du/de/des (FN - external file)
	(documented at ph_saytext):
	(- FileIO_PrintContents({FN}); say__p = 1; -).

Section SR5/2/22 - Values - Figures (for figures language element only)

To afficher (F - figure name), une seule fois
	(documented at ph_displayfigure):
	(- DisplayFigure(ResourceIDsOfFigures-->{F}, {phrase options}); -).
To decide which number is the ID de ressource Glulx du/de/des (F - figure name)
	(documented at ph_figureid):
	(- ResourceIDsOfFigures-->{F} -).

Section SR5/2/23 - Values - Sound effects (for sounds language element only)

To jouer (SFX - sound name), une seule fois
	(documented at ph_playsf):
	(- PlaySound(ResourceIDsOfSounds-->{SFX}, {phrase options}); -).
To decide which number is the ID de ressource Glulx du/de/des (SFX - sound name)
	(documented at ph_soundid):
	(- ResourceIDsOfSounds-->{SFX} -).

Section SR5/3/1 - Control phrases - If and unless

[TODO: La version indentée et celle avec virgule ne fonctionne pas si l'on n'a pas copié le code de syntaxe approprié au début de la source du jeu.]

To si (c - condition) , (ph - phrase)
	(documented at ph_if):
	(- if {c} {ph} -).
To si (c - condition) begin -- end conditional
	(documented at ph_if):
	(- if {c}  -).
To à moins que (c - condition) , (ph - phrase)
	(documented at ph_unless):
	(- if (~~{c}) {ph} -).
To à moins que (c - condition) begin -- end conditional
	(documented at ph_unless):
	(- if (~~{c})  -).

To sinon si (c - condition)
	(documented at ph_otherwise):
	(- } else if {c} { -).
To sinon à moins que (c - condition)
	(documented at ph_otherwise):
	(- } else if (~~{c}) { -).
To sinon (ph - phrase)
	(documented at ph_otherwise):
	(- else {ph} -).

To si (V - word value) est begin -- end conditional
	(documented at ph_switch):
	(- switch({V})  -).

[Étrangement, il faut définir ce « sinon » pour que le compilateur ne donne pas d'erreur.
Peut-être que cela peut causer des problèmes ?]
To sinon
	(documented at ph_otherwise):
	(- } else { -).

Section SR5/3/2 - Control phrases - While

To tant que (c - condition) begin -- end loop
	(documented at ph_while):
	(- while {c}  -).

Section SR5/3/3 - Control phrases - Repeat

To répéter avec (loopvar - nonexisting K variable)
	allant du/de/des (v - arithmetic value of kind K) au/à/aux (w - K) begin -- end loop
	(documented at ph_repeat):
		(- for ({loopvar}={v}: {loopvar}<={w}: {loopvar}++)  -).
To répéter avec (loopvar - nonexisting K variable)
	allant du/de/des (v - enumerated value of kind K) à/au/aux (w - K) begin -- end loop
	(documented at ph_repeat):
		(- for ({loopvar}={v}: {loopvar}<={w}: {loopvar}++)  -).
To répéter avec (loopvar - nonexisting K variable)
	parcourant (OS - description of values of kind K) begin -- end loop
	(documented at ph_runthrough):
		(- {-primitive-definition:repeat-through} -).
To répéter avec (loopvar - nonexisting object variable)
	parcourant (L - list of values) begin -- end loop
	(documented at ph_repeatlist):
		(- {-primitive-definition:repeat-through-list} -).

[TODO: répéter ou parcourir ?]
To parcourir (T - table name) begin -- end loop
	(documented at ph_repeattable): (-
		@push {-my:ct_0}; @push {-my:ct_1};
		for ({-my:1}={T}, {-my:2}=1, ct_0={-my:1}, ct_1={-my:2}:
			{-my:2}<=TableRows({-my:1}):
			{-my:2}++, ct_0={-my:1}, ct_1={-my:2})
			if (TableRowIsBlank(ct_0, ct_1)==false)
				{-block}
		@pull {-my:ct_1}; @pull {-my:ct_0};
	-).
To parcourir (T - table name) en sens inverse begin -- end loop
	(documented at ph_repeattablereverse): (-
		@push {-my:ct_0}; @push {-my:ct_1};
		for ({-my:1}={T}, {-my:2}=TableRows({-my:1}), ct_0={-my:1}, ct_1={-my:2}:
			{-my:2}>=1:
			{-my:2}--, ct_0={-my:1}, ct_1={-my:2})
			if (TableRowIsBlank(ct_0, ct_1)==false)
				{-block}
		@pull {-my:ct_1}; @pull {-my:ct_0};
	-).
To parcourir (T - table name) selon (TC - table column) begin -- end loop
	(documented at ph_repeattablecol): (-
		@push {-my:ct_0}; @push {-my:ct_1};
		for ({-my:1}={T}, {-my:2}=TableNextRow({-my:1}, {TC}, 0, 1), ct_0={-my:1}, ct_1={-my:2}:
			{-my:2}~=0:
			{-my:2}=TableNextRow({-my:1}, {TC}, {-my:2}, 1), ct_0={-my:1}, ct_1={-my:2})
				{-block}
		@pull {-my:ct_1}; @pull {-my:ct_0};
	-).
To parcourir (T - table name) selon (TC - table column) en sens inverse begin -- end loop
	(documented at ph_repeattablecolreverse): (-
		@push {-my:ct_0}; @push {-my:ct_1};
		for ({-my:1}={T}, {-my:2}=TableNextRow({-my:1}, {TC}, 0, -1), ct_0={-my:1}, ct_1={-my:2}:
			{-my:2}~=0:
			{-my:2}=TableNextRow({-my:1}, {TC}, {-my:2}, -1), ct_0={-my:1}, ct_1={-my:2})
				{-block}
		@pull {-my:ct_1}; @pull {-my:ct_0};
	-).

Section SR5/3/6 - Control phrases - Changing the flow of loops

[TODO: aucune idée pour celui-là]
To break -- in loop
	(documented at ph_break):
	(- {-primitive-definition:break} -).
To suivant -- in loop
	(documented at ph_next):
	(- continue; -).

Section SR5/3/7 - Control phrases - Deciding outcomes

To oui
	(documented at ph_yes):
	(- rtrue; -) - in to decide if only.
To se décider pour oui
	(documented at ph_yes):
	(- rtrue; -) - in to decide if only.
To non
	(documented at ph_no):
	(- rfalse; -) - in to decide if only.
To se décider pour non
	(documented at ph_no):
	(- rfalse; -) - in to decide if only.

To se décider pour (something - value)
	(documented at ph_decideon):
	(- return {-return-value:something}; -).

Section SR5/3/8 - Control phrases - Stop or go

To ne rien faire (documented at ph_nothing):
	(- ; -).

[Identique à l'anglais.
To stop (documented at ph_stop):
	(- return; -) - in to only.
]

Section SR5/4/1 - Actions, activities and rules - Trying actions

To essayer de/d'/-- (doing something - action)
	(documented at ph_try):
	(- {doing something}; -).
To essayer silencieusement de/-- (doing something - action)
	(documented at ph_trysilently):
	(- @push keep_silent; keep_silent=1; @push say__p; @push say__pc;
		ClearParagraphing(1); {doing something}; DivideParagraphPoint();
		@pull say__pc; @pull say__p; AdjustParagraphPoint(); @pull keep_silent; -).
To decide whether l'action n'est pas silencieuse:
	(- (keep_silent == false) -).

Section SR5/4/2 - Actions, activities and rules - Action requirements

To decide whether l'action requiert un nom touchable
	(documented at ph_requirestouch):
	(- (NeedToTouchNoun()) -).
To decide whether l'action requiert un second nom touchable
	(documented at ph_requirestouch2):
	(- (NeedToTouchSecondNoun()) -).
To decide whether l'action requiert un nom tenu
	(documented at ph_requirescarried):
	(- (NeedToCarryNoun()) -).
To decide whether l'action requiert un second nom tenu
	(documented at ph_requirescarried2):
	(- (NeedToCarrySecondNoun()) -).
To decide whether l'action requiert de la lumière
	(documented at ph_requireslight):
	(- (NeedLightForAction()) -).

Section SR5/4/3 - Actions, activities and rules - Stop or continue

To arrêter l'action
	(documented at ph_stopaction):
	(- rtrue; -) - in to only.
To continuer l'action
	(documented at ph_continueaction):
	(- rfalse; -) - in to only.

Section SR5/4/4 - Actions, activities and rules - Stored actions

To decide what stored action is the action en cours
	(documented at ph_currentaction):
	(- STORED_ACTION_TY_Current({-new:stored action}) -).
To decide what stored action is the action de (A - action)
	(documented at ph_actionof):
	(- {A}{-backspace}{-backspace}, STORED_ACTION_TY_Current({-new:stored action})) -).
To essayer de/-- (S - stored action)
	(documented at ph_trystored):
	(- STORED_ACTION_TY_Try({S}); -).
To essayer silencieusement de/-- (S - stored action)
	(documented at ph_trystoredsilently):
	(- STORED_ACTION_TY_Try({S}, true); -).
To decide if (act - a stored action) implique (X - an object)
	(documented at ph_involves):
	(- (STORED_ACTION_TY_Involves({-by-reference:act}, {X})) -).
To decide what action name is the nom d'action du/de/des (act - a stored action)
	(documented at ph_actionpart):
	(- (STORED_ACTION_TY_Part({-by-reference:act}, STORA_ACTION_F)) -).
To decide what object is the nom du/de/des (act - a stored action)
	(documented at ph_nounpart):
	(- (STORED_ACTION_TY_Part({-by-reference:act}, STORA_NOUN_F)) -).
To decide what object is the second nom du/de/des (act - a stored action)
	(documented at ph_secondpart):
	(- (STORED_ACTION_TY_Part({-by-reference:act}, STORA_SECOND_F)) -).
To decide what object is the acteur du/de/des (act - a stored action)
	(documented at ph_actorpart):
	(- (STORED_ACTION_TY_Part({-by-reference:act}, STORA_ACTOR_F)) -).

Section SR5/4/5 - Actions, activities and rules - Carrying out activities

To exécuter l'activité (A - activity on nothing)
	(documented at ph_carryout):
	(- CarryOutActivity({A}); -).
To exécuter l'activité (A - activity on value of kind K) avec (val - K)
	(documented at ph_carryoutwith):
	(- CarryOutActivity({A}, {val}); -).

To continuer l'activité
	(documented at ph_continueactivity):
	(- rfalse; -) - in to only.

Section SR5/4/6 - Actions, activities and rules - Advanced activities

To commencer l'activité (A - activity on nothing)
	(documented at ph_beginactivity):
	(- BeginActivity({A}); -).
To commencer l'activité (A - activity on value of kind K) avec (val - K)
	(documented at ph_beginactivitywith):
	(- BeginActivity({A}, {val}); -).
[TODO: Pas sûr pour les deux suivantes]
To decide whether l'activité (A - activity) est en cours
	(documented at ph_handlingactivity):
	(- (~~(ForActivity({A}))) -).
To decide whether l'activité (A - activity on value of kind K) avec (val - K) est en cours
	(documented at ph_handlingactivitywith):
	(- (~~(ForActivity({A}, {val}))) -).
To terminer l'activité (A - activity on nothing)
	(documented at ph_endactivity):
	(- EndActivity({A}); -).
To terminer l'activité (A - activity on value of kind K) avec (val - K)
	(documented at ph_endactivitywith):
	(- EndActivity({A}, {val}); -).
To abandonner l'activité (A - activity on nothing)
	(documented at ph_abandonactivity):
	(- AbandonActivity({A}); -).
To abandonner l'activité (A - activity on value of kind K) avec (val - K)
	(documented at ph_abandonactivitywith):
	(- AbandonActivity({A}, {val}); -).

Section SR5/4/7 - Actions, activities and rules - Following rules

To suivre (RL - a rule)
	(documented at ph_follow):
	(- FollowRulebook({RL}); -).
To suivre (RL - value of kind K based rule producing a value) pour (V - K)
	(documented at ph_followfor):
	(- FollowRulebook({RL}, {V}, true); -).
To suivre (RL - a nothing based rule)
	(documented at ph_follow):
	(- FollowRulebook({RL}); -).
To decide what K is the (name of kind K) produit/produite par (RL - rule producing a value of kind K)
	(documented at ph_producedby):
	(- ResultOfRule({RL}, 0, true, {-strong-kind:K}) -).
To decide what L is the (name of kind L) produit/produite par (RL - value of kind K based rule
	producing a value of kind L) pour (V - K)
	(documented at ph_producedbyfor):
	(- ResultOfRule({RL}, {V}, true, {-strong-kind:L}) -).
To decide what K is the (name of kind K) produit/produite (RL - nothing based rule producing a value of kind K)
	(documented at ph_producedby):
	(- ResultOfRule({RL}, 0, true, {-strong-kind:K}) -).
[TODO abide -> se conformer à ???]
To se conformer au/à/aux (RL - a rule)
	(documented at ph_abide):
	(- if (FollowRulebook({RL})) rtrue; -) - in to only.
To se conformer au/à/aux (RL - value of kind K based rule producing a value) pour (V - K)
	(documented at ph_abidefor):
	(- if (FollowRulebook({RL}, {V}, true)) rtrue; -) - in to only.
To se conformer au/à/aux (RL - a nothing based rule)
	(documented at ph_abide):
	(- if (FollowRulebook({RL})) rtrue; -) - in to only.
To se conformer anonymement au/à/aux (RL - a rule)
	(documented at ph_abideanon):
	(- if (temporary_value = FollowRulebook({RL})) {
		if (RulebookSucceeded()) ActRulebookSucceeds(temporary_value);
		else ActRulebookFails(temporary_value);
		return 2;
	} -) - in to only.
To se conformer anonymement au/à/aux (RL - value of kind K based rule producing a value) pour (V - K)
	(documented at ph_abideanon):
	(- if (temporary_value = FollowRulebook({RL}, {V}, true)) {
		if (RulebookSucceeded()) ActRulebookSucceeds(temporary_value);
		else ActRulebookFails(temporary_value);
		return 2;
	} -) - in to only.
To se conformer anonymement au/à/aux (RL - a nothing based rule)
	(documented at ph_abideanon):
	(- if (temporary_value = FollowRulebook({RL})) {
		if (RulebookSucceeded()) ActRulebookSucceeds(temporary_value);
		else ActRulebookFails(temporary_value);
		return 2;
	} -) - in to only.

Section SR5/4/8 - Actions, activities and rules - Success and failure

To ne pas prendre de décision
	(documented at ph_nodecision): (- rfalse; -) - in to only.
To règle réussit
	(documented at ph_succeeds):
	(- RulebookSucceeds(); rtrue; -) - in to only.
To règle échoue
	(documented at ph_fails):
	(- RulebookFails(); rtrue; -) - in to only.
To règle réussit avec pour résultat (val - a value)
	(documented at ph_succeedswith):
	(- RulebookSucceeds({-weak-kind:rule-return-kind},{-return-value-from-rule:val}); rtrue; -) - in to only.
To decide if règle a réussi
	(documented at ph_succeeded):
	(- (RulebookSucceeded()) -).
To decide if règle a échoué
	(documented at ph_failed):
	(- (RulebookFailed()) -).
[TODO: pas sûr pour celui-là (ni pour au-dessus d'ailleurs)]
To decide which rulebook outcome is the résultat de règles
	(documented at ph_rulebookoutcome):
	(- (ResultOfRule()) -).

Section SR5/5/1 - Model world - Ending the story

[TODO: ou bien « finir l'histoire » ?]

To fin de l'histoire
	(documented at ph_end):
	(- deadflag=3; story_complete=false; -).
To fin définitive de l'histoire
	(documented at ph_endfinally):
	(- deadflag=3; story_complete=true; -).
To fin de l'histoire en disant (finale - text)
	(documented at ph_endsaying):
	(- deadflag={-by-reference:finale}; story_complete=false; -).
To fin définitive de l'histoire en disant (finale - text)
	(documented at ph_endfinallysaying):
	(- deadflag={-by-reference:finale}; story_complete=true; -).
To decide whether l'histoire est finie
	(documented at ph_ended):
	(- (deadflag~=0) -).
To decide whether l'histoire est finie définitivement
	(documented at ph_finallyended):
	(- (story_complete) -).
To decide whether l'histoire n'est pas finie
	(documented at ph_notended):
	(- (deadflag==0) -).
To decide whether l'histoire n'est pas finie définitivement
	(documented at ph_notfinallyended):
	(- (story_complete==false) -).
To reprendre l'histoire
	(documented at ph_resume):
	(- resurrect_please = true; -).

Section SR5/5/2 - Model world - Times of day

To decide which number is the minutes dans (t - time)
	(documented at ph_minspart):
	(- ({t}%ONE_HOUR) -).
To decide which number is the heures dans (t - time)
	(documented at ph_hourspart):
	(- ({t}/ONE_HOUR) -).

To decide if (t - time) est avant (t2 - time)
	(documented at ph_timebefore):
	(- ((({t}+20*ONE_HOUR)%(TWENTY_FOUR_HOURS))<(({t2}+20*ONE_HOUR)%(TWENTY_FOUR_HOURS))) -).
To decide if (t - time) est après (t2 - time)
	(documented at ph_timeafter):
	(- ((({t}+20*ONE_HOUR)%(TWENTY_FOUR_HOURS))>(({t2}+20*ONE_HOUR)%(TWENTY_FOUR_HOURS))) -).
To decide which time is (t - time) avant (t2 - time)
	(documented at ph_shiftbefore):
	(- (({t2}-{t}+TWENTY_FOUR_HOURS)%(TWENTY_FOUR_HOURS)) -).
To decide which time is (t - time) après (t2 - time)
	(documented at ph_shiftafter):
	(- (({t2}+{t}+TWENTY_FOUR_HOURS)%(TWENTY_FOUR_HOURS)) -).

Section SR5/5/3 - Model world - Durations

To decide which time is (n - number) minute/minutes
	(documented at ph_durationmins):
	(- (({n})%(TWENTY_FOUR_HOURS)) -).
To decide which time is (n - number) heure/heures
	(documented at ph_durationhours):
	(- (({n}*ONE_HOUR)%(TWENTY_FOUR_HOURS)) -).

Section SR5/5/4 - Model world - Timed events

To (R - rule) dans (t - number) tour/tours à partir de maintenant
	(documented at ph_turnsfromnow):
	(- SetTimedEvent({-mark-event-used:R}, {t}+1, 0); -).
To (R - rule) au/à/aux (t - time)
	(documented at ph_attime):
	(- SetTimedEvent({-mark-event-used:R}, {t}, 1); -).
To (R - rule) dans (t - time) à partir de maintenant
	(documented at ph_timefromnow):
	(- SetTimedEvent({-mark-event-used:R}, (the_time+{t})%(TWENTY_FOUR_HOURS), 1); -).

Section SR5/5/5 - Model world - Scenes

To decide if (sc - scene) a eu lieu
	(documented at ph_hashappened):
	(- (scene_endings-->({sc}-1)) -).
To decide if (sc - scene) n'a pas eu lieu
	(documented at ph_hasnothappened):
	(- (scene_endings-->({sc}-1) == 0) -).
To decide if (sc - scene) s'est pas terminé/terminée/terminés/terminées
	(documented at ph_hasended):
	(- (scene_endings-->({sc}-1) > 1) -).
To decide if (sc - scene) ne s'est pas terminé/terminée/terminés/terminées
	(documented at ph_hasnotended):
	(- (scene_endings-->({sc}-1) <= 1) -).

Section SR5/5/6 - Model world - Timing of scenes

To decide which time is the temps depuis que (sc - scene) a commencé
	(documented at ph_scenetimesincebegan):
	(- (SceneUtility({sc}, 1)) -).
To decide which time is l'heure à laquelle (sc - scene) a commencé
	(documented at ph_scenetimewhenbegan):
	(- (SceneUtility({sc}, 2)) -).
To decide which time is the temps depuis que (sc - scene) s'est terminé/terminée/terminés/terminées
	(documented at ph_scenetimesinceended):
	(- (SceneUtility({sc}, 3)) -).
To decide which time is l'heure à laquelle (sc - scene) s'est terminé/terminée/terminés/terminées
	(documented at ph_scenetimewhenended):
	(- (SceneUtility({sc}, 4)) -).

Section SR5/5/7 - Model world - Player's identity and location

To decide whether dans l'obscurité
	(documented at ph_indarkness):
	(- (location==thedark) -).

Section SR5/5/8 - Model world - Moving and removing things

To déplacer (something - object) vers (something else - object),
	sans afficher la description de l'endroit
	or en affichant une description abrégée de l'endroit
	(documented at ph_move):
	(- MoveObject({something}, {something else}, {phrase options}, false); -).
To retirer (something - object) du jeu
	(deprecated)
	(documented at ph_remove):
	(- RemoveFromPlay({something}); -).
To déplacer la toile de fond (O - object) vers tous les (D - description of objects)
	(documented at ph_movebackdrop):
	(- MoveBackdrop({O}, {D}); -).
To actualiser la position des toiles de fond
	(documented at ph_updatebackdrop):
	(- MoveFloatingObjects(); -).

Section SR5/5/9 - Model world - The map

To decide which room is l'emplacement/emplacement du/de/des (O - object)
	(documented at ph_locationof):
	(- LocationOf({O}) -).
To decide which room is l'endroit à/au/en (D - direction) du/de/des (R1 - room)
	(documented at ph_roomdirof):
	(- MapConnection({R1},{D}) -).
To decide which door is porte à/au/en (D - direction) du/de/des (R1 - room)
	(documented at ph_doordirof):
	(- DoorFrom({R1},{D}) -).
To decide which object is l'autre côté du/de/des (D - door) depuis (R1 - room)
	(documented at ph_othersideof):
	(- OtherSideOfDoor({D},{R1}) -).
To decide which object is the direction du/de/des (D - door) depuis (R1 - room)
	(documented at ph_directionofdoor):
	(- DirectionDoorLeadsIn({D},{R1}) -).
To decide which object is porte-ou-endroit à/au/en (D - direction) du/de/des (R1 - room)
	(documented at ph_roomordoor):
	(- RoomOrDoorFrom({R1},{D}) -).
To changer la sortie (D - direction) du/de/des (R1 - room) pour (R2 - room)
	(documented at ph_changeexit):
	(- AssertMapConnection({R1},{D},{R2}); -).
To changer la sortie (D - direction) du/de/des (R1 - room) pour nulle part
	(documented at ph_changenoexit):
	(- AssertMapConnection({R1},{D},nothing); -).
To decide which room is l'avant du/de/des (D - object)
	(documented at ph_frontside):
	(- FrontSideOfDoor({D}) -).
To decide which room is l'arrière du/de/des (D - object)
	(documented at ph_backside):
	(- BackSideOfDoor({D}) -).

Section SR5/5/10 - Model world - Route-finding

To decide which object is meilleur chemin du/de/des (R1 - object) à/au/aux (R2 - object),
	en utilisant les portes or en utilisant même les portes verrouillées
	(documented at ph_bestroute):
	(- MapRouteTo({R1},{R2},0,{phrase options}) -).
To decide which number is nombre de déplacements du/de/des (R1 - object) à/au/aux (R2 - object),
	en utilisant les portes or en utilisant même les portes verrouillées
	(documented at ph_bestroutelength):
	(- MapRouteTo({R1},{R2},0,{phrase options},true) -).
To decide which object is meilleur chemin du/de/des (R1 - object) à/au/aux (R2 - object) en passant par
	(RS - description of objects),
	en utilisant les portes or en utilisant même les portes verrouillées
	(documented at ph_bestroutethrough):
	(- MapRouteTo({R1},{R2},{RS},{phrase options}) -).
To decide which number is nombre de déplacements du/de/des (R1 - object) à/au/aux (R2 - object) en passant par
	(RS - description of objects),
	en utilisant les portes or en utilisant même les portes verrouillées
	(documented at ph_bestroutethroughlength):
	(- MapRouteTo({R1},{R2},{RS},{phrase options},true) -).

Section SR5/5/11 - Model world - The object tree

To decide which object is porteur du/de/des (something - object)
	(documented at ph_holder):
	(- (HolderOf({something})) -).
To decide which object is prochaine chose tenue après (something - object)
	(documented at ph_nextheld):
	(- (sibling({something})) -).
To decide which object is première chose tenue par (something - object)
	(documented at ph_firstheld):
	(- (child({something})) -).

Section SR5/6/1 - Understanding - Asking yes/no questions

To decide whether joueur accepte
	(documented at ph_consents):
		(- YesOrNo() -).

Section SR5/6/2 - Understanding - The player's command

To decide if (S - a snippet) correspond/correspondent à/au/aux (T - a topic)
	(documented at ph_snippetmatches):
	(- (SnippetMatches({S}, {T})) -).
To decide if (S - a snippet) ne correspond/correspondent pas à/au/aux (T - a topic)
	(documented at ph_snippetdoesnotmatch):
	(- (SnippetMatches({S}, {T}) == false) -).
To decide if (S - a snippet) contient (T - a topic)
	(documented at ph_snippetincludes):
	(- (matched_text=SnippetIncludes({T},{S})) -).
To decide if (S - a snippet) ne contient pas (T - a topic)
	(documented at ph_snippetdoesnotinclude):
	(- (SnippetIncludes({T},{S})==0) -).

Section SR5/6/3 - Understanding - Changing the player's command

To changer le texte de la commande du joueur pour (T - text)
	(documented at ph_changecommand):
	(- SetPlayersCommand({-by-reference:T}); -).
To remplacer (S - a snippet) avec (T - text)
	(documented at ph_replacesnippet):
	(- SpliceSnippet({S}, {-by-reference:T}); -).
To couper (S - a snippet)
	(documented at ph_cutsnippet):
	(- SpliceSnippet({S}, 0); -).
To rejeter la commande du joueur
	(documented at ph_rejectcommand):
	(- RulebookFails(); rtrue; -) - in to only.

Section SR5/6/4 - Understanding - Scope and pronouns

[TODO: pas sûr]
To placer (O - an object) à la vue, mais pas son contenu
	(documented at ph_placeinscope):
	(- PlaceInScope({O}, {phrase options}); -).
To placer le contenu du/de/des (O - an object) à la vue
	(documented at ph_placecontentsinscope):
	(- ScopeWithin({O}); -).
To établir les pronoms pour (O - an object)
	(documented at ph_setpronouns):
	(- PronounNotice({O}); -).

Section SR5/8/1 - Message support - Issuance - Unindexed

[TODO: je sais pas s'il faut traduire, étant donné que ce sont des instructions « secrètes ».

To issue score notification message:
	(- NotifyTheScore(); -).
To say pronoun dictionary word:
	(- print (address) pronoun_word; -).
To say recap of command:
	(- PrintCommand(); -).
The pronoun reference object is an object that varies.
The pronoun reference object variable translates into I6 as "pronoun_obj".

To say pronoun i6 dictionary word:
	(- print (address) pronoun_word; -).

To say parser command so far:
	(- PrintCommand(); -).
]

Section SR5/9/1 - Miscellaneous other phrases - Unindexed

[TODO: je sais pas s'il faut traduire, étant donné que ce sont des instructions « secrètes ».
To decide which object is the component parts core of (X - an object):
	(- CoreOf({X}) -).
To decide which object is the common ancestor of (O - an object) with
	(P - an object):
	 (- (CommonAncestor({O}, {P})) -).
To decide which object is the not-counting-parts holder of (O - an object):
	 (- (CoreOfParentOfCoreOf({O})) -).
To decide which object is the visibility-holder of (O - object):
	(- VisibilityParent({O}) -).
To calculate visibility ceiling at low level:
	(- FindVisibilityLevels(); -).
To decide which object is the touchability ceiling of (O - object):
	(- TouchabilityCeiling({O}) -).

To decide which number is the visibility ceiling count calculated:
	(- visibility_levels -).
To decide which object is the visibility ceiling calculated:
	(- visibility_ceiling -).

To produce a room description with going spacing conventions:
	(- LookAfterGoing(); -).

To print the location's description:
	(- PrintOrRun(location, description); -).

To decide if expanding text for comparison purposes:
	(- say__comp -).

To decide whether the I6 parser is running multiple actions:
	(- (multiflag==1) -).

To decide if set to sometimes abbreviated room descriptions:
	(- (lookmode == 1) -).
To decide if set to unabbreviated room descriptions:
	(- (lookmode == 2) -).
To decide if set to abbreviated room descriptions:
	(- (lookmode == 3) -).

To convert to (AN - an action name) on (O - an object):
	(- return GVS_Convert({AN},{O},0); -) - in to only.
To convert to request of (X - object) to perform (AN - action name) with
	(Y - object) and (Z - object):
	(- return ConvertToRequest({X}, {AN}, {Y}, {Z}); -).
To convert to special going-with-push action:
	(- return ConvertToGoingWithPush(); -).

To surreptitiously move (something - object) to (something else - object):
	(- move {something} to {something else}; -).
To surreptitiously move (something - object) to (something else - object) during going:
	(- MoveDuringGoing({something}, {something else}); -).
To surreptitiously reckon darkness:
	(- SilentlyConsiderLight(); -).

To say list-writer list of marked objects: (-
	 	WriteListOfMarkedObjects(ENGLISH_BIT);
	-).
To say list-writer articled list of marked objects: (-
	 	WriteListOfMarkedObjects(ENGLISH_BIT+DEFART_BIT+CFIRSTART_BIT);
	-).

To ***:
	(- {-primitive-definition:verbose-checking} -).
To *** (T - text):
	(- {-primitive-definition:verbose-checking} -).
]

Book 2 - English Language

To say à propos du/de/des (item - an object): (- RegardingSingleObject({item}); -).

[TODO: sais pas quoi mettre
To say regarding list writer internals: (- RegardingLWI(); -).
]

To say à propos du/de/des (D - a description of objects): (-
	 	objectloop({-my:1} ofclass Object)
			if ({-matches-description:1:D}) 
				give {-my:1} workflag2;
			else
				give {-my:1} ~workflag2;
		RegardingMarkedObjects();
	-).

[TODO: pas sûr non plus.
To decide if the prior naming context is plural:
	(- ((prior_named_list >= 2) || (prior_named_noun && prior_named_noun has pluralname)) -).
]

Book 3 - Basic Screen Effects (for use with Basic Screen Effects by Emily Short)

Section - Clearing the screen

To effacer l'écran:
	(- VM_ClearScreen(0); -).

To effacer l'écran principal seulement:
	(- VM_ClearScreen(2); -).

To effacer la barre de statut seulement:
	(- VM_ClearScreen(1); -).

Section - Waiting for key-presses, quitting suddenly

To attendre une touche:
	(- KeyPause(); -).

To attendre la barre espace:
	(- SPACEPause(); -).

To mettre l'histoire en pause:
	carry out the pausing the game activity.

To arrêter l'histoire abruptement:
	(- quit; -).

To decide what number is the lettre choisie:
	(- VM_KeyChar() -).

Section - Showing the current quotation

To montrer la citation actuelle:
	(- ClearBoxedText(); -);

Section - Centering text on-screen

To centrer (quote - text):
	(- CenterPrintComplex({quote}); -).

To centrer (quote - text) sur la ligne (depth - a number):
	(- CenterPrint({quote}, {depth}); -).

To decide what number is largeur de l'écran:
	(- VM_ScreenWidth() -).

To decide what number is hauteur de l'écran:
	(- I7ScreenHeight() -).

Section - Customizing the status line

[TODO: Pas besoin de traduire je pense : c'est seulement utile pour l'extension.
To deepen the/-- status line to (depth - a number) rows:
	(- DeepStatus({depth}); -).

To move the/-- cursor to (depth - a number):
	(- I7VM_MoveCursorInStatusLine({depth}); -).

To right align the/-- cursor to (depth - a number):
	(- RightAlign({depth}); -).

Status bar table is a table-name that varies. Status bar table is the Table of Ordinary Status.
]

To remplir la barre de statut avec (selected table - a table-name):
	fill the status bar with selected table

[Right alignment depth is a number that varies. Right alignment depth is 14.]

Section - Color effects (for Z-machine only)

To say lettres par défaut:
	(- @set_colour 1 1; -)

To say lettres rouges:
	(- @set_colour 3 0; -)

To say lettres vertes:
	(- @set_colour 4 0; -)

To say lettres jaunes:
	(- @set_colour 5 0; -)

To say lettres bleues:
	(- @set_colour 6 0; -)

To say lettres magenta:
	(- @set_colour 7 0; -)

To say lettres cyan:
	(- @set_colour 8 0; -)

To say lettres blanches:
	(- @set_colour 9 0; -)

To say lettres noires:
	(- @set_colour 2 0; -)

To rendre le fond noir:
	(- @set_colour 0 2; -);

To rendre le fond rouge:
	(- @set_colour 0 3; -);

To rendre le fond vert:
	(- @set_colour 0 4; -);

To rendre le fond jaune:
	(- @set_colour 0 5; -);

To rendre le fond bleu:
	(- @set_colour 0 6; -);

To rendre le fond magenta:
	(- @set_colour 0 7; -);

To rendre le fond cyan:
	(- @set_colour 0 8; -);

To rendre le fond blanc:
	(- @set_colour 0 9; -);

Book 4 - Glulx Text Effects

To say style d'alerte:
	(- glk_set_style( style_Alert ); -).

To say style de citation en bloc:
	(- glk_set_style( style_BlockQuote ); -).

To say style d'en-tête:
	(- glk_set_style( style_Header ); -).

To say style d'entrée:
	(- glk_set_style( style_Input ); -).

To say style de note:
	(- glk_set_style( style_Note ); -).

To say premier style personnalisé:
	(- glk_set_style( style_User1 ); -).

To say second/deuxième style personnalisé:
	(- glk_set_style( style_User2 ); -).

Volume 5 - Uses options

Use le dialecte américain translates as (- Constant DIALECT_US; -). [ne fonctionne sûrement pas car les tests sont écrits dans la forme I7, et est de toute façon inutile en français.]
Use la virgule en série translates as (- Constant SERIAL_COMMA; -). [ne fonctionne pas pour la même raison.]
Use les descriptions longues pour les endroits translates as (- Constant I7_LOOKMODE = 2; -).
Use les descriptions abrégées pour les endroits translates as (- Constant I7_LOOKMODE = 3; -).
Use l'économie de mémoire translates as (- Constant MEMORY_ECONOMY; -).
Use la modestie d'auteur translates as (- Constant AUTHORIAL_MODESTY; -).
Use le score translates as (- Constant USE_SCORING = 1; -).
Use aucun score translates as (- Constant USE_SCORING = 0; -).
Use la notation d'ingénieur translates as (- Constant USE_E_NOTATION = 0; -).
Use les noms d'objet non abrégés translates as (- Constant UNABBREVIATED_OBJECT_NAMES = 0; -).
[Ne sait pas
Use command line echoing translates as (- Constant ECHO_COMMANDS; -).
Use manual pronouns translates as (- Constant MANUAL_PRONOUNS; -).]
Use l'impossibilité d'annuler translates as (- Constant PREVENT_UNDO; -).
[Use predictable randomisation translates as (- Constant FIX_RNG; -).]
Use la recherche de chemin rapide translates as (- Constant FAST_ROUTE_FINDING; -).
Use la recherche de chemin lente translates as (- Constant SLOW_ROUTE_FINDING; -).
[Use numbered rules translates as (- Constant NUMBERED_RULES; -).
Use telemetry recordings translates as (- Constant TELEMETRY_ON; -).
Use no deprecated features translates as (- Constant NO_DEPRECATED_FEATURES; -).]
Use gn testing version translates as (- Constant GN_TESTING_VERSION; -).
Use VERBOSE room descriptions translates as (- Constant DEFAULT_VERBOSE_DESCRIPTIONS; -).
Use BRIEF room descriptions translates as (- Constant DEFAULT_BRIEF_DESCRIPTIONS; -).
Use SUPERBRIEF room descriptions translates as (- Constant DEFAULT_SUPERBRIEF_DESCRIPTIONS; -).

Experimental French Features end here.

---- DOCUMENTATION ----

Chapter: Introduction

Section: Fonctionnalités ajoutées

Cette extension rend possible l'écriture d'une grande partie de son code source en français. Elle traduit la syntaxe, les adjectifs, les phrases et les options. Aucun moyen de traduire le nom des actions, des règles et des propriétés n'a encore été trouvé. Enfin, le nom des variables étaient précédemment traduits, mais cela pouvait causer des bugs, alors ce n'est plus le cas; il vous faudra remplacer les "nom", "emplacement" ou autre par "noun" et "location" et ainsi de suite.

Il est recommandé de lire le premier chapitre de cette documentation, de survoler le reste rapidement afin d'avoir une idée de ce qui est traduit et de ce qu'il n'est pas possible de faire, puis d'écrire sa fiction interactive en recherchant au fur et à mesure les traductions.

Section: Suggestions d'amélioration

Les traductions qui suivent sont toutes pour le moins arbitraires. Bien que certaines soient évidentes ("if" en "si", par exemple), d'autres peuvent être sujet à interprétation ; certains choix ne sont également peut-être pas appropriés.

Si jamais vous trouvez que quelque chose peut être traduit d'une meilleur façon, n'hésitez pas à le faire savoir sur le forum de la fiction interactive francophone :

	http://ifiction.free.fr/taverne/index.php

Section: Avertissements

Utilisez cette extension à vos propres risques !

La syntaxe en français n'est pas entièrement documentée, d'une part car elle risque de changer, d'autre part car cela reviendrait presque à réécrire la documentation d'Inform.
Il se peut donc que tout ne fonctionne pas comme il le faut. Si vous obtenez une erreur lors de la compilation, essayez de supprimer ce que vous avez ajouté en dernier, ou de le réécrire en anglais, dans la formulation officielle. Si vous n'arrivez pas à résoudre le problème, posez une question sur notre forum.

Chapter: La syntaxe

Section: Ce qui a été traduit

Voici quelques exemples de ce que la traduction de la syntaxe permet d'écrire. Tout n'a pas été testé, et tout ce qui fonctionne n'est pas forcément indiqué ci-dessous ; vous pouvez toujours essayer d'improviser en utilisant la traduction la plus évidente de ce que vous essayer de faire, il se pourrait que ça fonctionne !

	Understand "..." as ... >>> Comprendre "..." comme ...
	(mais "comprendre comme une erreur" et "comprendre quand" ne fonctionnent pas.)
	
	something >>> quelque chose
	somebody >>> quelqu'un
	somewhere >>> quelque part
	anything >>> n'importe quoi
	anybody >>> n'importe qui
	anywhere >>> n'importe où
	nothing >>> rien
	nobody >>> personne
	(pas certain que ça fonctionne, à cause du conflit avec "une personne".)
	nowhere >>> nulle part
	
	... of ... >>> ... de/du/des ...
	
	true >>> vrai
	false >>> faux
	
	... is a ... that varies >>> ... est un(e) ... qui varie
	always >>> toujours
	usually >>> généralement
	seldom >>> rarement
	never >>> jamais
	(il faut écrire la phrase à la forme affirmative aussi pour celui-ci : "Un secret est jamais décrit".)
	
	when >>> quand
	(ne fonctionne pas tout le temps.)
	in (un endroit) >>> dans (un endroit)
	called >>> appelé/appelée/appelés/appelées
	(ne fonctionne pas tout le temps.)
	
	and >>> et
	or >>> ou
	
	at (heure) >>> à (heure)

Section: Limites

Comme indiqué précédemment, tout ne fonctionne pas encore. Cette section grandira en fonction des tests effectués.

De plus, certains passages du code de syntaxe doivent être recopiés directement dans la source du jeu pour fonctionner. C'est le cas pour les conditions avec virgule et indentées. Donc, si vous souhaitez utiliser les traduction des conditions :

	si la porte est ouverte, ...
	
	si la porte est ouverte:
		...
	sinon:
		...

Il faudra copier ce code AU TOUT DÉBUT DE VOTRE SOURCE :

	*: Include (-
	language French
	
	<control-structure-phrase> ::=
		/a/ si ... est début |
		/b/ si ... est |
		/c/ si ... |
		/c/ à moins que |
		/d/ répéter/parcourir ... |
		/e/ tant que ... |
		/f/ sinon |
		/g/ sinon si ... |
		/g/ sinon à moins que |
		/h/ -- sinon |
		/i/ -- ... |
	
	-) in the Preform grammar.

Chapter: Les variables

Le nom des variables avaient été traduites dans une version précédente de cette extension. Néanmoins, certains traductions causaient des bugs. Par précaution, toutes les traductions de variable ont été enlevées. Il vous faudra les réécrire en anglais. Désolé !

Chapter: les adjectifs

Section: ce qui a été traduit

Pour les adjectifs qui n'ont pas d'antonyme (alors qu'ils en avaient en anglais), il suffit d'utiliser "non + (adjectif)". Par exemple, "undescribed" devient "non décrit".

	wearable >>> mettable
	described >>> décrit
	comestible/incomestible >>> edible/unedible
	enterable >>> entrable (?)
	mentioned >>> mentionné
	lit/unlit >>> lumineux/terne (?)
	lighted/dark >>> éclairé/sombre
	lockable >>> verrouillable
	locked/unlocked >>> verrouillé/déverrouillé
	handled >>> manipulé (?)
	switched on/switched off >>> éteint/allumé
	open/closed >>> ouvert/fermé
	openable >>> ouvrable (?)
	singular-named/plural-named >>> au singulier/au pluriel (?)
	improper-named/proper-named >>> à nom commun/à nom propre (?)
	pushable between rooms >>> poussable entre endroits (?)
	scenery >>> décoratif
	fixed in place/portable >>> fixé sur place/portable
	opaque/transparent >>> opaque/transparent
	visited >>> visité
	marked for listing >>> marqué pour le listage (?)
	
	off-stage/on-stage >>> hors scène/sur scène
	even/odd >>> pair/impair
	positive >>> positif
	negative >>> négatif
	finite/infinite >>> fini/infini
	existent >>> existant
	substituted >>> substitué
	happening >>> en train de se dérouler (?)
	full >>> plein
	equivalence >>> équivalence
	symetric >>> symétrique
	one-to-one >>> un-à-un
	one-to-various >>> un-à-plusieurs
	various-to-one >>> plusieurs-à-un
	various-to-various >>> plusieurs-à-plusieurs
	meaningful/meaningless >>> (?)

Section: Limites

L'adjectif "vide" n'a pas pu être défini car il créait un conflit avec l'adjectif "vide" défini par l'extension "French Language" (et utilisé dans les réponses).

Les propriétés ci-dessus ont été définies plusieurs fois afin d'autoriser leur utilisation au féminin ou au pluriel. Heureusement, elles restent tous synchronisés, mais cela peut causer une gêne (cosmétique plus qu'autre chose) avec une commande comme "showme" :

	>showme coffre
	coffre - open container
	location: in le donjon
	singular-named, improper-named, au singulier, à nom commun; lit, inedible, portable, incomestible, incomestibles, lumineux, lumineuse, lumineuxs, lumineuses; opaque, open, unopenable, unlocked, déverrouillé, déverrouillée, déverrouillés, déverrouillées, ouvert, ouverte, ouverts, ouvertes, non-ouvrable, non-ouvrables, opaques; male
	...

Chapter: Les phrases

Section: Ce qui a été traduit

Toutes les phrases ont été traduites, excepté quelques unes pour lesquelles une traduction n'a pas été trouvée ; certaines ne fonctionnent pas non plus.

La liste est tellement longue qu'il ne serait pas pratique de l'inclure ici. C'est pourquoi un fichier pdf listant toutes les traductions est disponible cette adresse :

	https://bitbucket.org/informfr/i7-french-language/src

Section: Limites

Les phrases "let ... be ..." ont été traduites (par "soit ... étant ..."), mais elles ne fonctionnent pas correctement : les variables créées de cette façon sont de type "value" plutôt que le type donné dans la phrase, et certaines opérations deviennent impossibles (même si les tests comme "si N est un nombre" fonctionne, on ne pas "incrémenter N", par exemple). De plus, écrire "soit N étant un nombre" ne fonctionne pas. Il est donc préférable d'utiliser la phrase en anglais.

Pour que la phrase "si" (traduction de "if") fonctionne, il est nécessaire de copier un passage du code de la syntaxe au début de votre source (voir section 2.2). Si vous ne le faites pas, vous ne pourrez pas utiliser la forme indenté et la forme avec virgule (la forme avec "begin ... end si" fonctionne dans tous les cas). La même remarque devrait s'appliquer pour "à moins que" (traduction de "unless"), "répéter" (traduction de "repeat") et "tant que" (traduction de "while"), mais ces phrases n'ont pas été totalement testées.

Chapter: Les options

Section: Ce qui a été traduit

La plupart des options ont été traduites

	Use full-lenght room descriptions >>> Utiliser les descriptions longues pour les endroits.
	Use abbreviated room descriptions >>> Utiliser les descriptions abrégées pour les endroits.
	Use memory economy >>> Utiliser l'économie de mémoire.
	Use authorial modesty >>> Utiliser la modestie d'auteur.
	Use scoring >>> Utiliser le score.
	Use no scoring >>> Utiliser aucun score translates.
	Use engineering notation >>> Utiliser la notation d'ingénieur.
	Use unabbreviated object names >>> Utiliser les noms d'objet non abrégés.
	Use undo prevention >>> Utiliser l'impossibilité d'annuler.
	Use fast route-finding >>> Utiliser la recherche de chemin rapide.
	Use slow route-finding >>> Utiliser la recherche de chemin lente.

Section: Limites

Les options non présentes dans la liste n'ont pas pu être traduites, ou ne semblent pas être utilisés lors d'une utilisation normale d'Inform. De plus, leur utilisation n'a pas été testée de manière approfondie.