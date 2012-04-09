var int VictimCount;
var int VictimLevel;
var int ThiefLevel;

var int ThiefXP;
//------------------------------------------------------------------
FUNC VOID B_GiveThiefXP()
{
	
	VictimCount = (VictimCount +1);//zähl die Opfer
	
	
	if (VictimLevel == 0)
	{
		VictimLevel = 2; //Start

		ThiefLevel = 1;
	};
	
	if (VictimCount >= VictimLevel)
	{
		//----------------Kalkulation-----------------
		
		ThiefLevel = (ThiefLevel +1);
		VictimLevel =(VictimCount  + ThiefLevel); //Erhöhe die Anzahl der nötigen Opfer zum nächsten Level (aktuelleOpfer + aktueller Level)

		VictimCount = 0;
		
		//Platz für Goodies (Items, Attributes...) 
	};
		
		//-------------------XP-----------------------

	ThiefXP = (TheftGoldGlob * (1+(TheftDexGlob%20)))/(hero.attribute[ATR_DEXTERITY]/10);

	if (ThiefXP/ThiefLevel < 50)
	{
		ThiefXP = ThiefLevel*50;
	};
		
	B_GivePlayerXP (50);  
};
//------------------------------------------------------------------ 
FUNC VOID B_ResetThiefLevel()
{

	
	if (VictimCount > ThiefLevel)
	{
		VictimCount = (VictimCount - 1); 
	};
	
	
};
