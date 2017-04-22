FUNC VOID B_ShowBackground_Story(var int pos)
{
	Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_9, pos);
	Spine_UpdateAchievementProgress(SPINE_ACHIEVEMENT_10, pos);

	StPl_nDocID = Doc_Create		() ;							// DocManager
	Doc_SetPages	( StPl_nDocID,  2 );                         
	Doc_SetPage 	( StPl_nDocID,  0, "Book_MayaRead_L.tga", 	0 	);  
	Doc_SetPage 	( StPl_nDocID,  1, "Book_MayaRead_R.tga",	0	);
	Doc_SetFont 	( StPl_nDocID, -1, FONT_Book	   				); 	
	Doc_SetMargins	( StPl_nDocID,  0,  275, 20, 30, 20, 1   	);

	if (pos == 1)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "... es herrschte Weisheit und Vernunft. Und Radanos sah herab und ihm gefiel, was geschah.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Frei von Sorge und Kummer verrichteten alle Bewohner ihr Tagewerk, ein jeder, wie es ihm die Funktion seiner Kaste vorsah. Denn alle waren gesegnet mit einem Teil seiner göttlichen Macht und seiner Liebe. Und mit der Macht konnten die Menschen die Welt frei nach ihrem Willen gestalten. So hatten alle Menschen Teil an der göttlichen Schöpferkraft und waren gleich."		);     
	}
	else if (pos == 2)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Doch in der Kaste der Priester ward ein Mann, dessen Herz von Machtgier und Missgunst zerfressen war. Er vermochte nicht zu ertragen, dass ein jeder auf gleiche Weise durch den einen Gott gesegnet war. Sein Name war Xeres. Und er ersann einen Plan, der Harmonie und Gleichheit je beenden sollte.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Er schmiedete Intrigen und er gab vor, die niedreren Kasten wollen ihren Teil der göttlichen Macht nutzen, die anderen zu stürzen. Und es gelang ihm zahlreiche Priester, wie Gelehrte für seinen Plan zu gewinnen und das Herz vieler zu verderben. Und so beschlossen sie, den anderen einen Teil ihrer Macht zu nehmen, auf dass auch ihre große Zahl keine Gefahr mehr für sie bedeutete. Doch nur wenige unter ihnen wussten, welche Pläne er wirklich verfolgte."		);     
	}
	else if (pos == 3)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "So hielten sie ein Ritual ab, den Angehörigen der anderen Kasten einen Teil ihrer Macht zu rauben. Und jene, die mit Xeres konspirierten vereinigten ihren Teil der Macht, das Ritual zu vollziehen.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Doch wurden sie alle getäuscht und Xeres entzog ihnen Macht und Leben und verleibte es sich selbst ein. Nur seine engsten Verbündeten blieben verschont und vollzogen mit dem Blute der Betrogenen ihren finsteren Plan. Und das Blut vieler sollte noch ihrer Machtgier anheim fallen."		);     
	}
	else if (pos == 4)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Das Ritual ward fortgesetzt, die Verbundenheit der Menschen mit den Mächten des einen Gottes gegen ihn zu nutzen. Und so wie die Leiber der Dahingeschlachteten ward auch Radanos geteilt, Wille und Macht voneinander gelöst und in tausend Stücke zersprengt. Und der Himmel verfinsterte sich und die Erde bebte.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Die Menschen spürten, dass ihr Gott nicht mehr war und der Schock über den unfassbaren Verlust lähmte alles Leben. Die Erbauer erfuhren alsbald jedoch von dem schrecklichen Frevel, welchen Xeres verschuldet hatte. Und nachdem die Paralyse des ersten Augenblickes gewichen war, erhob sich unaussprechlicher Zorn in allen Kasten."		);     
	}
	else if (pos == 5)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Die Menschen griffen zu Schwert und Magie um den blasphemischen Xeres zu stellen und zu richten. Doch vermochte niemand ihm und seinen Getreuen etwas entgegenzusetzen ... zu groß war ihre Macht, unüberwindbar die magischen Schutzmechanismen.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Die Menschen mussten allmählich erkennen, dass ihr Aufbegehren vergebens war. Und nachdem der flammende Zorn über den Verlust ihres Gottes der Verzweiflung vollends gewichen war, erlosch augenblicklich jeder Kampfeswille. Und Xeres verheerte das Land mit Tyrannei und ein schreckliches Morden begann."		);     
	}
	else if (pos == 6)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Alles, was Xeres als Gefahr für seine Macht ansah wurde dem Erboden gleichgemacht. Tempel und Orte, welche den Menschen als unantastbar und heilig galten, wurden geschändet, verbrannt und zu Staub zermahlen. Und viele Bewohner erkannten, dass sie Xeres grausamen Treiben machtlos gegenüberstanden und suchten ihre Rettung in der Flucht. Doch es gab auch jene, welche sich dem Götzen unterwarfen und ihm Gefolgschaft schworen.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Und das, was einst eine blühende Kultur gewesen war, begann zu erlöschen durch Machtgier, Verblendung und Barbarei ..."		);     
	}
	else if (pos == 7)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Und Xeres entsann ein weiteres Vorhaben seine Macht und Existenz auf Erden für alle Zeiten zu festigen. Zu diesem Zweck erschuf er Machtträger, fünf an der Zahl, und speiste sie mit den freien Mächten des gestürzten Gottes.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Und es erschien jener Mann unbekannter Herkunft, der das heilige Schwert ergriff. Dieses war dem einen Gott geweiht… und ein Teil der ursprünglichen Macht ruhte noch immer in ihm. Und jener nahm das Schwert und richtete es gegen die Tyrannei… und er erschlug Xeres samt seiner Geschöpfe."		);     
	}
	else if (pos == 8)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Die Kokosnuss ist eine Frucht, die von besonderem Interesse für die magischen Künste ist. Der Genuss von Milch und Fleisch allein schon regeneriert und steigert die magische Befähigung.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Mischt man jedoch an einem Alchemietisch das Extrakt eines Feldknöterichs bei und erwärmt langsam und stetig, so erhält man einen Sud, der ungleich wirkungsvoller ist ..."		);     
	}
	else if (pos == 9)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "... gleichwohl regte sich in den Sphären des Himmlischen neue Schöpfung. Die Bruchstücke der Macht und des Willens, welche dem einen Gott entstammten, fügten sich wieder zusammen ... jedoch zu drei Teilen mit eigenem Willen und eigener Macht. Und es entstanden die neuen Himmlischen und sie nahmen die Herrschaft über das Erdenrund auf ...");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "... Und es ward ein neues Zeitalter begonnen ..."		);     
	}
	else if (pos == 10)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "... das Zeitalter der drei neuen Gottheiten: Innos, Adanos und Beliar.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Der erste unter ihnen war Innos. Er sah herab auf die Erde und musste erkennen, dass nur wenige Menschen sie noch bewohnten. Die vorangegangenen Ereignisse hatten allzu vielen das Leben gekostet. Und so beschloss er, neue Menschen zu erschaffen und setze sie auf verschiedene Teile der Welt."		);     
	}
	else if (pos == 11)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Als nächstes betrat Beliar das Land. Er sah, dass Innos Geschöpfe  - die Menschen - die Erde allein bewohnten und beherrschten. Auch er wollte sein Wirken in der Schöpfung verewigt sehen und so entstand das Tier durch seinen Willen.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Zuletzt trat Adanos in Erscheinung. Er teilte das meiste an Persönlichkeit und Gesinnung mit dem Urvater Radanos. Und er blickte herab auf die Erde und ihm gefiel, was geschah."		);     
	}
	else if (pos == 12)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Und erneut begann eine kurze Zeit des Friedens und der Blüte. Die überlebenden Erbauer, zerstreut an vielen Flecken der Erde, begannen allmählich zu ihrem gewohnten Alltag zurückzukehren, wie sie ihn vor den Schreckensereignissen gekannt hatten.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Und als die Tage, Wochen und Monate vergingen, schienen all die fürchterlichen Geschehnisse um Xeres - Gewalt, Zwietracht und Ungleichheit - der Vergangenheit anzugehören. Und die Menschen priesen und huldigten die neuen Gottheiten als Söhne ihres Urvaters und als drei gleiche Brüder."		);     
	}
	else if (pos == 13)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Doch so einheitlich der Ursprung der 3 Götter zu sein schien, als so unterschiedlich erwiesen sie sich mit der Zeit und ihr Vorstellungen darum, wie die Schöpfung zu formen sei. Und als kein Konsens mehr möglich schien, beanspruchte jeder einen anderen Teil der Schöpfung für sich. Beliar verschrieb sich der Finsternis und dem Chaos, Innos dem Feuer und der Ordnung. Adanos, der das meiste mit dem Urvater an Persönlichkeit und Gesinnung teilte, blieb zunächst unentschlossen ...");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Und die Menschen wollten einem jeden der Götter, die Verehrung angedeihen lassen, die ihm Zustand. Doch hieß die Verehrung des Feuers, gleichzeitig die Finsternis zu schmähen und umgekehrt. Und es entstanden Konflikte unter den Menschen, welche der Gottheiten denn die größte Verehrung zukommen sollte."		);     
	}
	else if (pos == 14)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Und der Ingrimm der beiden Gottheiten Innos und Beliar gegeneinander wuchs und gedieh zum offenen Konflikt. Und Innos und Beliar fochten miteinander und der Himmel verfinsterte sich ... und die Erde bebte ...");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Die Erde bebte, der Himmel verfinsterte sich. Zwischen Innos und Beliar tobte ein erbitterter Kampf der das Erdenrund verheerte. Und auch die Anhänger beider Gottheiten fochten miteinander. Sie richteten ihren Teil der göttlichen Macht gegen die Umgebung und bedrohten damit die gesamte Schöpfung."		);     
	}
	else if (pos == 15)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Da betrat Adanos den Schauplatz des Geschehens und er stellte sich zwischen seine Brüder, um ihren Streit zu schlichten. Und mit Einsatz seiner Weisheit und der göttlichen Macht gelang es ihm, den offenen Zwist seiner Brüder zu beenden. Und er sah herab, was auf der Erde geschah, wo erbitterter Krieg herrschte.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Erneut war die Schöpfung durch die Hände der Menschen bedroht, welche die göttliche Macht als Werkzeug der Zerstörung missbrauchten. Und er beschloss den Menschen einen Teil ihrer Macht zu nehmen. Nur Auserwählten, den Priestern der Götter, war es von nun an möglich die göttliche Kraft zu beeinflussen."		);     
	}
	else if (pos == 16)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Und er sah herab, was auf der Erde geschah, wo erbitterter Krieg herrschte. Erneut war die Schöpfung durch die Hände der Menschen bedroht, welche die göttliche Macht als Werkzeug der Zerstörung missbrauchten. Und so wie sein göttlicher Zorn sich erhob, so stiegen auch die Meere, Seen und Flüsse empor und rissen alles mit sich.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Menschen, Tiere kämpften um ihr Überleben und viele ertranken in den Fluten. Als das Wasser sich wieder legte, herrschte Stile auf dem Land. Erst allmählich begannen sich die Überlebenden wieder zu sammeln, um aufzubauen, was hinfort gespült worden war."		);     
	}
	else if (pos == 17)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "Adanos indes beschloss den Menschen einen Teil ihrer Macht zu nehmen. Nur Auserwählten, den Priestern der Götter, sollte es von nun an möglich sein die göttliche Kraft zu beeinflussen.");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Und Adanos entschied von nun an nach der Erhaltung des Gleichgewichtes zu streben. Er hatte erkannt, dass die Positionen seiner Brüder unvereinbar waren und dass niemals der Einfluss eines der beiden – Innos, oder Beliar – überwiegen dürfte. Weder das völlige Chaos, noch die absolute Ordnung könnten die Schöpfung gedeihen lassen. Und das wandelbare Wasser sollte zu seinem Element werden ..."		);     
	}
	else if (pos == 18)
	{
		Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLines	( StPl_nDocID,  0, "... so führte Xeres seine Priester zusammen, die Zeremonie zu beginnen und die Träger der Macht zu erschaffen. 5 an der Zahl, ausgestattet mit einem Teil der freigewordenen Mächte Radanos’ ... jedoch an Xeres Existenz gebunden. (verwittert)");                                             
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  0, ""						);                                
			                                                                                          
			Doc_SetMargins	( StPl_nDocID, -1, 30, 20, 275, 20, 1   		);                                
			Doc_PrintLine	( StPl_nDocID,  1, ""						);                                
			Doc_PrintLine	( StPl_nDocID,  1, "");                                
			Doc_PrintLines	( StPl_nDocID,  1, "Doch eines der Rituale schlug fehl und brachte ein Wesen hervor, das nicht wie die anderen war. Denn nicht die freigewordene Macht des vernichteten Gottes wurde ihm zu Teil ... es ward sein Wille ... (verwittert) ... und Xeres Diener schworen, seinen Namen für alle Zeiten aus den Schriften zu tilgen."		);     
	};

	Doc_Show		( StPl_nDocID );
};