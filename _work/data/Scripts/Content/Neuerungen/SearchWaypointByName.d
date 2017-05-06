FUNC int SearchWaypointByName(VAR string wp)
{
    MEM_InitGlobalInst();
    
    //Variablen setzen
    VAR zCWaypoint curWp;
    VAR zCListSort curItem;
    VAR zCListSort lastItem;
        
    //Bereitstellen vom ersten Waypoint-zCListSort
    MEM_AssignInst (curItem, MEM_Waynet.wplist_next); //MEM_Waynet.wplist_data sollte immer leer sein -> nächste (erste) zCListSort holen
   
    //Label initialisieren
    MEM_InitLabels();
    VAR int label;
    label = MEM_StackPos.position;
    //###// "Schleifen"-Anfang 

        IF (!curItem.data)  //Zur Sicherheit (Sollte nur aufgerufen werden, wenn es gar keine WPs gibt)
        {
            //Waypointliste zu Ende (Kein Fund)
            RETURN 0; 
        };

        MEM_AssignInst (curWp, curItem.data);
        
        //"Schleife" verlassen?
        IF (Hlp_StrCmp(curWp.name, wp))    //Ist es der gesuchte WP?
        {
            //Gefunden!
            RETURN MEM_InstGetOffset(curWp);    //MEM_InstGetOffset schien mir eigentlich nicht notwendig, aber es kam ansonsten zu Abstürzen
        };
        
        IF (!curItem.next)
        {
           //Waypointliste zu Ende (Kein Fund)
            RETURN 0;  
        };
                
        //Nächste zCListSort holen
        MEM_AssignInst (lastItem, MEM_InstGetOffset(curItem));  //Etwas verschachtelt, weil es sonst bei mir zu Abstürzen kam
        MEM_AssignInst (curItem, lastItem.next);
        
    //###// Zurück an den "Schleifen"-Anfang
    MEM_StackPos.position = label;   
    
    MEM_Warn("SearchWaypointByName: Schleifenfehler");
    RETURN 0;    //Zur Sicherheit
        
};
