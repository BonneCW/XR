// ******************
// SPL_GolemChargeFireball
// ******************

const int SPL_Cost_GolemChargeFireball		= 0; //4*40
const int STEP_GolemChargeFireball			= 0;
const int SPL_Damage_GolemChargeFireball 	= 75;

INSTANCE Spell_GolemChargeFireball (C_Spell_Proto)
{
	time_per_mana			= 30;
	damage_per_level		= SPL_Damage_GolemChargeFireball;
	damageType				= DAM_MAGIC;	
	canTurnDuringInvest     = TRUE;
};

func int Spell_Logic_GolemChargeFireball (var int manaInvested) 
{
	if (manaInvested <= STEP_GolemChargeFireball*1)
	{
		self.aivar[AIV_SpellLevel] = 1; //Start mit Level 1
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if (manaInvested > (STEP_GolemChargeFireball*1))
	&& (self.aivar[AIV_SpellLevel] <= 1)
	{
		
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL; //Lev2 erreicht
	}
	else if (manaInvested > (STEP_GolemChargeFireball*2))
	&& (self.aivar[AIV_SpellLevel] <= 2)
	{
		
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL; //Lev3 erreicht
	}
	else if (manaInvested > (STEP_GolemChargeFireball*3))
	&& (self.aivar[AIV_SpellLevel] <= 3)
	{
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL; //Lev4 erreicht
	}
	else if (manaInvested > (STEP_GolemChargeFireball*3))
	&& (self.aivar[AIV_SpellLevel] == 4)
	{
		return SPL_DONTINVEST;	
	};

	return SPL_STATUS_CANINVEST_NO_MANADEC;	
};

func void Spell_Cast_GolemChargeFireball(var int spellLevel)
{

	B_PrismaAdd(SPL_Damage_GolemChargeFireball*self.aivar[AIV_SpellLevel]);	
	
	self.aivar[AIV_SelectSpell] += 1;
};
