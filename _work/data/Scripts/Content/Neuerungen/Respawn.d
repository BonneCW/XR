class RespawnObject {
	var int inst; //Die Monsterinstanz
	var string wp; //Der Wegpunkt
	var int respawnDay; // Der Tag des Respawns, wobei der erste Tag den Wert 0 hat... Genau wie Gothic.
	var int level; // Das Level, in welches das Monster gehört
	var int flag; // Respawn oder neu (für den Fall, dass z.b. Wolf durch Warg ersetzt wurde)
};

const int MAX_RESPAWN = 1024; //Wir definieren diese Konstante, um unser System leicher anpassen zu können, z.B. bei vielen Monstern. Außerdem ist das schöner.
var int RespawnArray[MAX_RESPAWN];
var int nextRespawnIndex;

instance RespawnObject@(RespawnObject);

func void AddToRespawnArray(var c_npc slf) {
	var int hndl; hndl = new(RespawnObject@);
	MEM_WriteStatArr(RespawnArray, nextRespawnIndex, hndl); // RespawnArray[nextRespawnIndex] = hndl;
	nextRespawnIndex += 1; // Beim nächsten Mal in den nächsten Index schreiben
	 
	var RespawnObject myRespawnObject; myRespawnObject = get(hndl);
	//myRespawnObject.wp = slf.spawnPoint;
	myRespawnObject.wp = slf.wp;
	myRespawnObject.respawnDay = Wld_GetDay() + r_max(slf.level/2); // Irgendeine Formel
	myRespawnObject.level = CurrentLevel;

	if (Kapitel >= 4)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Snapper))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(DragonSnapper);
	}
	else if (Kapitel >= 4)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fleischfly))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Demon);
	}
	else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YFleischfly))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Fleischfly);
	}
	else if (Kapitel >= 5)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Warrior_Visir))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Gobbo_Skeleton);
	}
	else if (Kapitel >= 4)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Warrior))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Gobbo_Warrior_Visir);
	}
	else if (Kapitel >= 3)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Black))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Gobbo_Warrior);
	}
	else if (Kapitel >= 2)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Green))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Gobbo_Black);
	}
	else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YGobbo_Green))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Gobbo_Green);
	}
	else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YGiant_Bug))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Giant_Bug);
	}
	else if (Kapitel >= 3)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Blackwolf))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Warg);
	}
	else if (Kapitel >= 2)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wolf))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Blackwolf);
	}
	else if (Kapitel >= 4)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Shadowbeast))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Shadowbeast_Skeleton);
	}
	else if (Kapitel >= 3)
	&& (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger))
	{
		myRespawnObject.inst = Hlp_GetInstanceID(Scavenger_Demon);
	}
	else
	{
		myRespawnObject.inst = Hlp_GetInstanceID(slf);
		myRespawnObject.flag = 1;
	};
};

func int MeetsRespawnCondition(var c_npc slf) {
	if (slf.guild < GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};

	if (CurrentLevel == ORCTEMPEL_ZEN)
	|| (CurrentLevel == BERGWELT_ZEN)
	|| (CurrentLevel == WOLKENWELT_ZEN)
	|| (CurrentLevel == DRACHENTAL_ZEN)
	|| (CurrentLevel == HALLUZINATION_ZEN)
	|| (CurrentLevel == XERESWELT_ZEN)
	{
		return FALSE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Alligator))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swamprat))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Blattcrawler))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bloodhound))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giant_DesertRat))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Warrior))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Warrior_Visir))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Tugettso01))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Tugettso02))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Tugettso03))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Tugettso04))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Icewolf))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Keiler))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Riesenkeiler))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(OrcBiter))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Razor))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Shadowbeast_Fire))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Puma))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(StonePuma))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SwampDrone))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DemonLord))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DragonSnapper))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Alraune_Moor))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bloodfly))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Demon))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Harpie))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(IceGolem))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Eisdrachensnapper))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(FireWaran))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(EisWaran))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(FireGolem))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YFleischfly))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fleischfly))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YGiant_Bug))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giant_Bug))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giant_Rat))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giant_EisRat))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rat))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Black))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YGobbo_Green))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Green))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Eisgoblin))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Gobbo_Skeleton))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Shadowbeast))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Shadowbeast_Skeleton))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lurker))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Meatbug))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Minecrawler))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(KristallMinecrawler))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Kristallcrawler))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MinecrawlerWarrior))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Molerat))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orcdog))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Rabbit))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(IceRabbit))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger_Demon))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Scavenger_Ice))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Troll))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Waran))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SkeletonWarrior))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lesser_Skeleton))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SkeletonMage))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Snapper))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Spider_01))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(StoneGolem))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wolf))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Riesenwolf))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(YWolf))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZombieRandom))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wisp))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Warg))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BlackWolf))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(SKELETRazor))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Schattenwark))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Hauertroll))
	{
		return TRUE;
	};

	return FALSE;
};

func void RemoveRespawnObject(var int hndl) {
	if (nextRespawnIndex == 0) { // Das Array ist leer.
		return;
	};

	delete(hndl); // Hier erledigen wir den PM-Teil unseres Destruktors, alles weitere macht PM dann selber. Unter anderem wird versucht, Respawn_Object_Delete() aufzurufen, allerdings gibt es diese Funktion nicht (sie ist optional)
	
	var int i; i = 0; // Das mag verwirren, aber ich baue bloß eine Schleife in Daedalus. Mit dem neuen Ikarus-Release geht das auch wesentlich schöner. 
	var int pos; pos = MEM_StackPos.position; // Stellt euch einfach vor, das hier wäre eine While(1)-Schleife. Zur Übersicht habe ich eingerückt.

		var int h; h = MEM_ReadStatArr(RespawnArray, i); // h = RespawnArray;
		if (h == hndl) { // Wir haben unsere Referenz gefunden
			MEM_WriteStatArr(RespawnArray, i, MEM_ReadStatArr(RespawnArray, nextRespawnIndex-1)); // Alte Referenz mit der letzten Referenz überschreiben
			MEM_WriteStatArr(RespawnArray, nextRespawnIndex-1, 0); // Letzte Referenz gleich 0 setzen
			nextRespawnIndex -= 1; // Unseren Zähler dekrementieren
			return; // Mehr wollen wir nicht machen.
		};

	i += 1;	
	if (i >= nextRespawnIndex) { // Wenn i größer oder gleich dem nextRespawnIndex ist, haben wir das Array komplett durchlaufen.
	/* Anders formuliert: 
		if (i >= nextRespawnIndex) {
			break;
		}; */
		return;
	};
	MEM_StackPos.position = pos;
	
};

func void CheckRespawns() {
	if (nextRespawnIndex == 0) { // Das Array ist leer.
		return;
	};
	var int i; i = 0; // Das mag verwirren, aber ich baue bloß eine Schleife in Daedalus. Mit dem neuen Ikarus-Release geht das auch wesentlich schöner. 
	var int pos; pos = MEM_StackPos.position; // Stellt euch einfach vor, das hier wäre eine While(1)-Schleife. Zur Übersicht habe ich eingerückt.
	
		var int hndl; hndl = MEM_ReadStatArr(RespawnArray, i); // hndl = RespawnArray;

		if (Hlp_IsValidHandle(hndl))
		{
			var RespawnObject myRespawnObject; myRespawnObject = get(hndl);
		
			//Jetzt haben wir unser Objekt!
		
			if (myRespawnObject.level == CurrentLevel)
			&& (myRespawnObject.respawnDay < Wld_GetDay()) { // Der Tag des Respawns ist gekommen! \o/
				Wld_InsertNpc(myRespawnObject.inst, myRespawnObject.wp); // Daher fügen wir einfach den NPC an seinem WP ein :)
				if (myRespawnObject.flag == 1)
				{
					self.aivar[AIV_VictoryXPGiven] = -1;
				};
				// Allerdings müssen wir nun unser Objekt auch entfernen, sonst würde es ja beim nächsten Mal wieder eingefügt!
				// Ich werde daher einfach mal die Funktion RemoveRespawnObject() aufrufen - wie die aussehen muss, schauen wir später.
				RemoveRespawnObject(hndl);
			} else {
				i += 1; // Falls ich ein Objekt gelöscht habe, muss ich den selben Index nochmal lesen.
			};
		}
		else
		{
			RemoveRespawnObject(hndl);
		};
	if (i >= nextRespawnIndex) { // Wenn i größer oder gleich dem nextRespawnIndex ist, haben wir das Array komplett durchlaufen.
	/* Anders formuliert: 
		if (i >= nextRespawnIndex) {
			break;
		}; */
		return;
	};
	MEM_StackPos.position = pos;
	
};

FUNC VOID CleanRespawns()
{
	var int loop; loop = MEM_StackPos.position;

	if (nextRespawnIndex)
	{
		RemoveRespawnObject(MEM_ReadStatArr(RespawnArray, 0));

		MEM_StackPos.position = loop;
	};
};

const string RespawnObject_Struct = "auto|5";