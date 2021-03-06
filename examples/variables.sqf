//BOTH SERVER AND CLIENT VARIABLES


//SERVER ONLY VARAIBLES
if (isServer) then {
	diag_log "Loading custom server variables";
};

//CLIENT ONLY VARIABLES
if (!isDedicated) then {
	diag_log "Loading custom client variables";

	ZED_AllowedVehicles = [
		"hilux1_civil_3_open_DZE",
		"datsun1_civil_3_open_DZE",
		"hilux1_civil_1_open_DZE",
		"datsun1_civil_1_open_DZE",
		"V3S_Open_TK_CIV_EP1",
		"V3S_Open_TK_EP1",
		"KamazOpen_DZE"
	];

	//Player self-action handles - this function gets called by player_humanityMorph
	dayz_resetSelfActions = {
		s_player_equip_carry = -1;
		s_player_fire = -1;
		s_player_cook = -1;
		s_player_boil = -1;
		s_player_packtent = -1;
		s_player_packtentinfected = -1;
		s_player_fillfuel = -1;
		s_player_grabflare = -1;
		s_player_removeflare = -1;
		s_player_studybody = -1;
		s_player_deleteBuild = -1;
		s_player_flipveh = -1;
		s_player_sleep = -1;
		s_player_fillfuel210 = -1;
		s_player_fillfuel20 = -1;
		s_player_fillfuel5 = -1;
		s_player_siphonfuel = -1;
		s_player_repair_crtl = -1;
		s_player_fishing = -1;
		s_player_fishing_veh = -1;
		s_player_gather = -1;
		s_player_destroytent = -1;

		// Epoch Additions
		s_player_packvault = -1;
		s_player_lockvault = -1;
		s_player_unlockvault = -1;
		s_player_attack = -1;
		s_player_callzombies = -1;
		s_player_showname = -1;
		s_player_pzombiesattack = -1;
		s_player_pzombiesvision = -1;
		s_player_pzombiesfeed = -1;
		s_player_tamedog = -1;
		s_player_parts_crtl = -1;
		s_player_movedog = -1;
		s_player_speeddog = -1;
		s_player_calldog = -1;
		s_player_feeddog = -1;
		s_player_waterdog = -1;
		s_player_staydog = -1;
		s_player_trackdog = -1;
		s_player_barkdog = -1;
		s_player_warndog = -1;
		s_player_followdog = -1;
		s_player_information = -1;
		s_player_fuelauto = -1;
		s_player_fuelauto2 = -1;
		s_player_fillgen = -1;
		s_player_upgrade_build = -1;
		s_player_maint_build = -1;
		s_player_downgrade_build = -1;
		s_player_towing = -1;
		s_halo_action = -1;
		s_player_SurrenderedGear = -1;
		s_player_maintain_area = -1;
		s_player_maintain_area_force = -1;
		s_player_maintain_area_preview = -1;
		s_player_heli_lift = -1;
		s_player_heli_detach = -1;
		s_player_lockUnlock_crtl = -1;
		s_player_lockUnlockInside_ctrl = -1;
		s_player_toggleSnap = -1;
		s_player_toggleSnapSelect = -1;
		snapActions = -1;
		s_player_plot_boundary = -1;
		s_player_plotManagement = -1;
		s_player_toggleDegree = -1;
		degreeActions = -1;
		s_player_toggleVector = -1;
		vectorActions = -1;
		s_player_manageDoor = -1;
		s_player_hide_body = -1;
		s_player_changeDoorCode = -1;
		s_player_changeVaultCode = -1;
		s_givemoney_dialog = -1;
		s_bank_dialog = -1;
		s_bank_dialog1 = -1;
		s_bank_dialog2 = -1;
		s_bank_dialog3 = -1;
		s_player_checkWallet = -1;
		//ATTACH ZED SCRIPT
		s_player_zedsr = -1;
		s_player_zhide4 = -1;
		s_player_zhide5 = -1;
	};
	call dayz_resetSelfActions;
};