var int Assassinen_Opferstaette_permanent;

FUNC VOID BOOKSTAND_ASSASSINEN_OPFERSTAETTE_S1()		//Buchständer in der Magierbibliothek
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	&& (Assassinen_Dabei == TRUE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Eremit_Zeremoniendolch4))
	{	
		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_MayaRead_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_MayaRead_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Das Ritual ward durchgeführt, die Verbundenheit der Menschen mit den Mächten des einen Gottes gegen das Böse zu nutzen. So wie die Leiber der Dahingeschlachteten ward auch Radanos geteilt, Wille und Macht voneinander gelöst und in 1000 Teile zersprengt. Allein sein Zeichen, der Dolch, wird hier beigelegt. Er möge die Zeiten überdauern, bis eines Tages der Würdige erscheint, der es versteht, den Bann zu brechen."					);
				
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, "So bedenke denn dein Tun, Auserwählter, auf dass dich die neun Wächter als Würdigen erkennen."); 
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_Show		( nDocID );
					
					if (Assassinen_Opferstaette_permanent == FALSE)
					{
						B_GivePlayerXP (XP_Bookstand);

						Assassinen_Opferstaette_permanent = TRUE;
					};
	};
};