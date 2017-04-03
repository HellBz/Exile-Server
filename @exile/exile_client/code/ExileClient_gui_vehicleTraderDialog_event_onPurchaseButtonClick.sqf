/**
 * ExileClient_gui_vehicleTraderDialog_event_onPurchaseButtonClick
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleClass","_pin"];
_vehicleClass = uiNameSpace getVariable ["RscExileVehicleTraderDialogVehicleClass", ""];
_pin = ctrlText ((uiNamespace getVariable ["RscExileVehicleTraderDialog",displayNull]) displayCtrl 4008);
["purchaseVehicleRequest", [_vehicleClass,_pin]] call ExileClient_system_network_send;
closeDialog 0;