// ************
// SPL_GolemWindfist
// ************

const int SPL_Cost_GolemWindfist				= 0; //4*20
const int STEP_GolemWindfist					= 0;
const int SPL_Damage_GolemWindfist			= 50;

INSTANCE Spell_GolemWindfist (C_Spell_Proto)
{
	time_per_mana			= 30;
	damage_per_level		= SPL_Damage_GolemWindfist;			//pro Level !!!
	damageType				= DAM_FLY;
	canTurnDuringInvest     = TRUE;
	
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange		= 1000;
	targetCollectType		= TARGET_TYPE_NPCS;
};

func int Spell_Logic_GolemWindfist (var int manaInvested)
{
	if (manaInvested <= STEP_GolemWindfist*1)
	{
		self.aivar[AIV_SpellLevel] = 1; //Start mit Level 1
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if (manaInvested > (STEP_GolemWindfist*1))
	&& (self.aivar[AIV_SpellLevel] <= 1)
	{
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL; //Lev2 erreicht
	}
	else if (manaInvested > (STEP_GolemWindfist*2))
	&& (self.aivar[AIV_SpellLevel] <= 2)
	{
		
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL; //Lev3 erreicht
	}
	else if (manaInvested > (STEP_GolemWindfist*3))
	&& (self.aivar[AIV_SpellLevel] <= 3)
	{
		
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL; //Lev4 erreicht
	}
	else if (manaInvested > (STEP_GolemWindfist*3))
	&& (self.aivar[AIV_SpellLevel] == 4)
	{
		return SPL_DONTINVEST;	
	};

	return SPL_STATUS_CANINVEST_NO_MANADEC;	
};

func void Spell_Cast_GolemWindfist(var int spellLevel)
{

	B_PrismaAdd(SPL_Damage_GolemWindfist*self.aivar[AIV_SpellLevel]);
	
	self.aivar[AIV_SelectSpell] += 1;
};
