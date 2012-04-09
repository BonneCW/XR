FUNC VOID Use_Bookstand_Drachental_01_S1()		
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	

		var int nDocID;
		

		nDocID = 	Doc_Create		()			  ;							
					Doc_SetPages	( nDocID,  2 );                         
					Doc_SetPage 	( nDocID,  0, "Book_Mage_L.tga", 	0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Mage_R.tga",	0		);
					
					Doc_SetFont 	( nDocID, -1, FONT_Book	   			); 	
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  	

					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Es ist nicht alles Gold, was glänzt."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					
					Doc_PrintLines	( nDocID,  0, "");
			
					
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
			
					Doc_PrintLines	( nDocID,  1, " "					);
					Doc_Show		( nDocID );

		if (Mod_JG_Gitter == 0)
		{
			Mod_JG_Gitter = 1;

			Wld_SendTrigger	("EVT_BOOK");

			Log_CreateTopic	(TOPIC_MOD_JG_VASALLEN, LOG_MISSION);
			B_SetTopicStatus	(TOPIC_MOD_JG_VASALLEN, LOG_RUNNING);
			B_LogEntry	(TOPIC_MOD_JG_VASALLEN, "Was glänzen soll, braucht Licht. Hm.");
		};

	};
};