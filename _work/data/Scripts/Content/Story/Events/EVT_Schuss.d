/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/

var int ZIELVAR1;
var int ZIELVAR2;
var int ZIELVAR3;
var int ZIELVAR4;
var int ZIELVAREINGANG;

FUNC VOID EVENT_ZIELSCHEIBENFUNK_EINGANG ()
{
	if (ZIELVAREINGANG ==  FALSE)
	{
        	Wld_SendTrigger("LANGEHALLE_FERNKAMPF");
 
		Wld_InsertNpc 	(DUNGEONFireGolem, 	"FEUERGOLEM");

		ZIELVAR2 = TRUE;
		ZIELVAR3 = TRUE;
		ZIELVAR4 = TRUE;
		ZIELVAREINGANG = TRUE;
	};	
};

FUNC VOID EVENT_ZIELSCHEIBENFUNK_1 ()
{
	if (ZIELVAR1 ==  FALSE)
	{
		Wld_SendTrigger("ZIEL1PFX");
                 
		ZIELVAR1 = TRUE;
		ZIELVAR2 = FALSE;
		Snd_Play      ("MFX_SPAWN_CAST");
	};	
};

FUNC VOID EVENT_ZIELSCHEIBENFUNK_2 ()
{
	if (ZIELVAR2 ==  FALSE)
	{
		Wld_SendTrigger("ZIEL2PFX");
                 
		ZIELVAR2 = TRUE;
		ZIELVAR3 = FALSE;
		Snd_Play      ("MFX_SPAWN_CAST");
	};	
};

FUNC VOID EVENT_ZIELSCHEIBENFUNK_3 ()
{
	if (ZIELVAR3 ==  FALSE)
	{
		Wld_SendTrigger("ZIEL3PFX");
                 
		ZIELVAR3 = TRUE;
		ZIELVAR4 = FALSE;
		Snd_Play      ("MFX_SPAWN_CAST");
	};	
};

FUNC VOID EVENT_ZIELSCHEIBENFUNK_4 ()
{
	if (ZIELVAR4 ==  FALSE)
	{
		Wld_SendTrigger("ZIEL4PFX");
		Wld_SendTrigger("LAVAMOVER1TRIGGER");

		Wld_InsertItem	(ItMi_OrnamentEffekt_BIGFARM_Addon,	"FP_ITEM_ZIELSCHEIBENDINGENS");

		ZIELVAR4 = TRUE;
		Snd_Play      ("MFX_SPAWN_CAST");
	};	
};