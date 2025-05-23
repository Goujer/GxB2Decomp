﻿-- chunkname: @../../../Product/Bundles/Android/src/data/tables/misc.lua

local table = {}

table.keys = {
	value = 2,
	key = 1,
	desc = 3
}
table.rows = {
	awake_add_level_limit = {
		"awake_add_level_limit",
		20,
		-1
	},
	awake_open_need_grade = {
		"awake_open_need_grade",
		6,
		-1
	},
	awake_time_limit = {
		"awake_time_limit",
		3,
		-1
	},
	treasure_open_level = {
		"treasure_open_level",
		40,
		-1
	},
	treasure_max_level = {
		"treasure_max_level",
		23,
		-1
	},
	decompose_grade_coin_return_ratio = {
		"decompose_grade_coin_return_ratio",
		"0.7",
		-1
	},
	decompose_partner_exp_return_ratio = {
		"decompose_partner_exp_return_ratio",
		0.65,
		-1
	},
	decompose_treasure_return_base = {
		"decompose_treasure_return_base",
		"14#3",
		-1
	},
	decompose_treasure_return_ratio = {
		"decompose_treasure_return_ratio",
		0.6,
		-1
	},
	herobag_buy_cost = {
		"herobag_buy_cost",
		"2#100",
		-1
	},
	herobag_buy_num = {
		"herobag_buy_num",
		5,
		-1
	},
	herobag_buy_limit = {
		"herobag_buy_limit",
		"32",
		-1
	},
	artifact_upgrade_excess_return = {
		"artifact_upgrade_excess_return",
		"6000#10",
		-1
	},
	equip_type_max = {
		"equip_type_max",
		7,
		-1
	},
	daily_mission_all_complete_id = {
		"daily_mission_all_complete_id",
		11,
		-1
	},
	quiz_free_time = {
		"quiz_free_time",
		2,
		-1
	},
	quiz_buy_cost = {
		"quiz_buy_cost",
		"2#50",
		-1
	},
	pub_mission_refresh_cost = {
		"pub_mission_refresh_cost",
		"2#10",
		-1
	},
	midas_interval_time = {
		"midas_interval_time",
		28800,
		-1
	},
	midas_cost = {
		"midas_cost",
		"0#0|2#20|2#50",
		-1
	},
	midas_award_multiple = {
		"midas_award_multiple",
		"1|2|5",
		-1
	},
	arena_teach_num = {
		"arena_teach_num",
		2,
		-1
	},
	arena_default_point = {
		"arena_default_point",
		1000,
		-1
	},
	arena_ticket_free = {
		"arena_ticket_free",
		2,
		-1
	},
	arena_ticket_cost = {
		"arena_ticket_cost",
		20,
		-1
	},
	arena_season_time = {
		"arena_season_time",
		15,
		-1
	},
	checkin_turn = {
		"checkin_turn",
		30,
		-1
	},
	initial_avatar = {
		"initial_avatar",
		"11001|11002|11003|12001|12002|12003|13001|13002|13003|14001|14002|14003|21001|21002|21003|21004|22001|22002|22003|22004|23001|23002|23003|23004|24001|24002|24003|24004|31001|31002|31003|31004|31005|32001|32002|32003|32004|32005|33001|33002|33003|33004|33005|34001|34002|34003|34004|34005|35001|36001|42004|652002|27030",
		-1
	},
	edit_name_cost = {
		"edit_name_cost",
		"2#200",
		-1
	},
	edit_name_length_limit = {
		"edit_name_length_limit",
		"4|12",
		-1
	},
	tower_drip_cost = {
		"tower_drip_cost",
		"13#1",
		-1
	},
	tower_init_water = {
		"tower_init_water",
		"13#10",
		-1
	},
	tower_water_cd = {
		"tower_water_cd",
		1800,
		-1
	},
	tower_water_max = {
		"tower_water_max",
		10,
		-1
	},
	shop_black_init_id = {
		"shop_black_init_id",
		5,
		-1
	},
	arena_init_score = {
		"arena_init_score",
		1000,
		-1
	},
	arena_free_times = {
		"arena_free_times",
		2,
		-1
	},
	first_charge_awards = {
		"first_charge_awards",
		"930146#50|1#200000|1042#1|3042#1",
		-1
	},
	talk_level = {
		"talk_level",
		"4",
		-1
	},
	talk_cd = {
		"talk_cd",
		"10",
		-1
	},
	qa_content_length = {
		"qa_content_length",
		500,
		-1
	},
	tower_top = {
		"tower_top",
		2000,
		-1
	},
	dungeon_top = {
		"dungeon_top",
		600,
		-1
	},
	activity_gacha_partner_awards = {
		"activity_gacha_partner_awards",
		"53012#20002",
		-1
	},
	activity_gacha_partners = {
		"activity_gacha_partners",
		55014,
		-1
	},
	activity_gacha_partner_show = {
		"activity_gacha_partner_show",
		55014,
		-1
	},
	gacha_ensure_dropbox_id = {
		"gacha_ensure_dropbox_id",
		10006,
		-1
	},
	gacha_ensure_weight_ini_total = {
		"gacha_ensure_weight_ini_total",
		1000000,
		-1
	},
	gacha_ensure_weight_ini_get = {
		"gacha_ensure_weight_ini_get",
		180,
		-1
	},
	gacha_ensure_weight_add = {
		"gacha_ensure_weight_add",
		7,
		-1
	},
	gacha_ensure_is_wish = {
		"gacha_ensure_is_wish",
		"1",
		-1
	},
	gacha_ensure_weight_wish_total = {
		"gacha_ensure_weight_wish_total",
		"1000000",
		-1
	},
	gacha_ensure_weight_wish_get = {
		"gacha_ensure_weight_wish_get",
		"100",
		-1
	},
	gacha_ensure_weight_wish_add = {
		"gacha_ensure_weight_wish_add",
		"100",
		-1
	},
	gacha_ensure_add_num = {
		"gacha_ensure_add_num",
		"100",
		-1
	},
	gacha_ensure_guarantee = {
		"gacha_ensure_guarantee",
		"500",
		-1
	},
	gacha_ensure_partner = {
		"gacha_ensure_partner",
		"55014#655023#755013",
		-1
	},
	gacha_ensure_partner_handbook = {
		"gacha_ensure_partner_handbook",
		"55014#655023#755013",
		-1
	},
	daily_mail_awards_gacha = {
		"daily_mail_awards_gacha",
		36,
		-1
	},
	daily_mail_awards_tree = {
		"daily_mail_awards_tree",
		"3|18|43|47",
		-1
	},
	daily_mail_awards_gamble = {
		"daily_mail_awards_gamble",
		"",
		-1
	},
	daily_mail_awards_drift = {
		"daily_mail_awards_drift",
		"30|6|39|40",
		-1
	},
	daily_mail_awards_lost_space = {
		"daily_mail_awards_lost_space",
		"50|4|27|24",
		-1
	},
	daily_mail_awards_week = {
		"daily_mail_awards_week",
		"18|22",
		-1
	},
	daily_mail_awards_arena = {
		"daily_mail_awards_arena",
		"30|8|19",
		-1
	},
	daily_mail_awards_boss = {
		"daily_mail_awards_boss",
		"4|10",
		-1
	},
	daily_mail_awards_wish = {
		"daily_mail_awards_wish",
		"2|58",
		-1
	},
	partner_force_req_lev = {
		"partner_force_req_lev",
		"29|39|49|59|79|99|139|159|179|199|249|259|269|289",
		-1
	},
	friend_energy_cd = {
		"friend_energy_cd",
		7200,
		-1
	},
	friend_energy_max = {
		"friend_energy_max",
		10,
		-1
	},
	love_coin_daily_max = {
		"love_coin_daily_max",
		30,
		-1
	},
	friend_max_num = {
		"friend_max_num",
		50,
		-1
	},
	friend_search_level = {
		"friend_search_level",
		36,
		-1
	},
	friend_recommend_num = {
		"friend_recommend_num",
		10,
		-1
	},
	friend_recommend_update = {
		"friend_recommend_update",
		7200,
		-1
	},
	friend_search_cd = {
		"friend_search_cd",
		28800,
		-1
	},
	friend_love_sum_max = {
		"friend_love_sum_max",
		"1000",
		-1
	},
	friend_recommend_servernum = {
		"friend_recommend_servernum",
		"50",
		-1
	},
	friend_recommend_level = {
		"friend_recommend_level",
		"10",
		-1
	},
	friend_recommend_power = {
		"friend_recommend_power",
		"200000",
		-1
	},
	mail_cd = {
		"mail_cd",
		"30",
		-1
	},
	arena_robot_min_score = {
		"arena_robot_min_score",
		"900",
		-1
	},
	arena_robot_add_score = {
		"arena_robot_add_score",
		"30",
		-1
	},
	facebook_follow_award = {
		"facebook_follow_award",
		"36#1|9#100000",
		-1
	},
	activity_arena_win = {
		"activity_arena_win",
		2,
		-1
	},
	activity_arena_lose = {
		"activity_arena_lose",
		1,
		-1
	},
	guild_recruit = {
		"guild_recruit",
		"3600",
		-1
	},
	week_card_extra_output = {
		"week_card_extra_output",
		"1",
		-1
	},
	create_guild_cost = {
		"create_guild_cost",
		"2#500",
		-1
	},
	guild_dissolve_cd = {
		"guild_dissolve_cd",
		"7200",
		-1
	},
	modify_guild_name_cost = {
		"modify_guild_name_cost",
		"2#1000",
		-1
	},
	guild_sign_in_coin = {
		"guild_sign_in_coin",
		"4#50",
		-1
	},
	guild_sign_in_exp = {
		"guild_sign_in_exp",
		"30",
		-1
	},
	guild_sign_in_show = {
		"guild_sign_in_show",
		"4#50|5#30",
		-1
	},
	shelter_model_scale = {
		"shelter_model_scale",
		"1",
		-1
	},
	guild_boss_fight_cost = {
		"guild_boss_fight_cost",
		"0#0|0#0|2#40|2#80",
		-1
	},
	guild_boss_fight_cd = {
		"guild_boss_fight_cd",
		57600,
		-1
	},
	guild_reset_skill_cost = {
		"guild_reset_skill_cost",
		"2#2000",
		-1
	},
	guild_mill_donate = {
		"guild_mill_donate",
		"1#100000|1#1000000",
		-1
	},
	guild_order_cd = {
		"guild_order_cd",
		"43200",
		-1
	},
	talk_guild_cd = {
		"talk_guild_cd",
		"0",
		-1
	},
	guild_name_num_max = {
		"guild_name_num_max",
		"3|12",
		-1
	},
	guild_order_open = {
		"guild_order_open",
		"8",
		-1
	},
	chat_blacklist_num = {
		"chat_blacklist_num",
		"30",
		-1
	},
	chat_player_save_num = {
		"chat_player_save_num",
		"100",
		-1
	},
	chat_list_num_max = {
		"chat_list_num_max",
		"50",
		-1
	},
	guild_boss_exp_num_max = {
		"guild_boss_exp_num_max",
		"5",
		-1
	},
	arena_3v3_open_awards = {
		"arena_3v3_open_awards",
		"34#5",
		-1
	},
	arena_3v3_ticket_cost = {
		"arena_3v3_ticket_cost",
		"34#3",
		-1
	},
	activity_boss_buy_limit = {
		"activity_boss_buy_limit",
		"9999999999",
		-1
	},
	activity_boss_buy_cost = {
		"activity_boss_buy_cost",
		"2#50",
		-1
	},
	activity_boss_fight_cost = {
		"activity_boss_fight_cost",
		"28#1",
		-1
	},
	activity_boss_open_award = {
		"activity_boss_open_award",
		"9",
		-1
	},
	activity_cv_share_award = {
		"activity_cv_share_award",
		"2#100",
		-1
	},
	stage_activity_dropbox = {
		"stage_activity_dropbox",
		74,
		-1
	},
	stage_activity_dropbox2 = {
		"stage_activity_dropbox2",
		16,
		-1
	},
	stage_activity_dropbox3 = {
		"stage_activity_dropbox3",
		74,
		-1
	},
	stage_activity_dropbox4 = {
		"stage_activity_dropbox4",
		74,
		-1
	},
	guild_transfer_cd = {
		"guild_transfer_cd",
		"604800",
		-1
	},
	activity_guard_boss_hp = {
		"activity_guard_boss_hp",
		"100",
		-1
	},
	activity_guard_item_atk = {
		"activity_guard_item_atk",
		"49#10",
		-1
	},
	activity_guard_fixed_award = {
		"activity_guard_fixed_award",
		"2#288|1#1000000",
		-1
	},
	activity_guard_random_award = {
		"activity_guard_random_award",
		700001,
		-1
	},
	COMMIC_NUM = {
		"COMMIC_NUM",
		"2",
		-1
	},
	activity_guard_random_award_1 = {
		"activity_guard_random_award_1",
		"20#1#25",
		-1
	},
	activity_guard_random_award_2 = {
		"activity_guard_random_award_2",
		"940002#20#40",
		-1
	},
	activity_guard_random_award_3 = {
		"activity_guard_random_award_3",
		"43#20#35",
		-1
	},
	activity_guard_random_award_num = {
		"activity_guard_random_award_num",
		"3",
		-1
	},
	arena_team_energy_max = {
		"arena_team_energy_max",
		12,
		-1
	},
	arena_team_energy_cd = {
		"arena_team_energy_cd",
		3600,
		-1
	},
	arena_team_energy_start = {
		"arena_team_energy_start",
		"6",
		-1
	},
	guild_war_battle_min_num = {
		"guild_war_battle_min_num",
		10,
		-1
	},
	guild_war_battle_max_num = {
		"guild_war_battle_max_num",
		15,
		-1
	},
	guild_war_battle_hide_num = {
		"guild_war_battle_hide_num",
		3,
		-1
	},
	guild_war_energy_cd = {
		"guild_war_energy_cd",
		10800,
		-1
	},
	guild_war_energy_max = {
		"guild_war_energy_max",
		40,
		-1
	},
	guild_war_energy_start = {
		"guild_war_energy_start",
		1,
		-1
	},
	guild_war_point_start = {
		"guild_war_point_start",
		1000,
		-1
	},
	guild_war_avatar_cd = {
		"guild_war_avatar_cd",
		25200,
		-1
	},
	comic_comment_length_limit_zh_tw = {
		"comic_comment_length_limit_zh_tw",
		"12|120",
		-1
	},
	comic_comment_length_limit_en_en = {
		"comic_comment_length_limit_en_en",
		"8|72",
		-1
	},
	comic_comment_length_limit_ja_jp = {
		"comic_comment_length_limit_ja_jp",
		"12|120",
		-1
	},
	comic_update_time = {
		"comic_update_time",
		"900",
		-1
	},
	comic_comment_cd = {
		"comic_comment_cd",
		"10",
		-1
	},
	comic_cancel_cd = {
		"comic_cancel_cd",
		"60",
		-1
	},
	initial_background_girl = {
		"initial_background_girl",
		"652002|652002",
		-1
	},
	guild_war_time_interval = {
		"guild_war_time_interval",
		"432000|489600|496800|604800",
		-1
	},
	guild_war_open = {
		"guild_war_open",
		"12",
		-1
	},
	prophet_cost = {
		"prophet_cost",
		"20#1|20#10",
		-1
	},
	activity_jigsaw_buy_limit = {
		"activity_jigsaw_buy_limit",
		"50",
		-1
	},
	activity_jigsaw_energy_init = {
		"activity_jigsaw_energy_init",
		"40#1",
		-1
	},
	activity_jigsaw_use_cost = {
		"activity_jigsaw_use_cost",
		"40#1",
		-1
	},
	subscription_rate_gold = {
		"subscription_rate_gold",
		"1",
		-1
	},
	subscription_rate_juice = {
		"subscription_rate_juice",
		"0.6",
		-1
	},
	gm_image_limit = {
		"gm_image_limit",
		"5",
		-1
	},
	partner_comment_length_limit_zh_tw = {
		"partner_comment_length_limit_zh_tw",
		"12|400",
		-1
	},
	partner_comment_length_limit_en_en = {
		"partner_comment_length_limit_en_en",
		"12|400",
		-1
	},
	partner_comment_length_limit_ja_jp = {
		"partner_comment_length_limit_ja_jp",
		"12|400",
		-1
	},
	partner_comment_length_limit_ko_kr = {
		"partner_comment_length_limit_ko_kr",
		"12|400",
		-1
	},
	partner_comment_length_limit_de_de = {
		"partner_comment_length_limit_de_de",
		"12|400",
		-1
	},
	love_point_max_base = {
		"love_point_max_base",
		"10000",
		-1
	},
	love_point_max_grow = {
		"love_point_max_grow",
		"12000",
		-1
	},
	love_point_max_wall_papper = {
		"love_point_max_wall_papper",
		"8000",
		-1
	},
	love_point_time_interval = {
		"love_point_time_interval",
		"99999999",
		-1
	},
	love_gift_cost = {
		"love_gift_cost",
		"44#10",
		-1
	},
	love_gift_point = {
		"love_gift_point",
		"0|20|40",
		-1
	},
	love_point_icon_vow = {
		"love_point_icon_vow",
		"love_point_icon6",
		-1
	},
	gm_image_open_lv = {
		"gm_image_open_lv",
		"0",
		-1
	},
	pub_mission_max = {
		"pub_mission_max",
		"200",
		-1
	},
	love_gift_item_num = {
		"love_gift_item_num",
		"1000001|40",
		-1
	},
	partner_sound_keys = {
		"partner_sound_keys",
		"start_sound|click_sound1|click_sound2|click_sound3|click_sound4|click_sound5|battle_sound|skill_sound|lvlup_sound|gradeup_sound|shengxue_sound|awake_sound|equip_sound1|equip_sound2|hangteam_sound|house_sound|house_set_sound|idle_sound|dagong_sound|daily_mission_sound|new_stage_sound|gift_sound1|gift_sound2|gift_sound3|login_sound|victory_sound|failed_sound|vow_sound",
		-1
	},
	partner_sound_text = {
		"partner_sound_text",
		"dialog|click_dialog1|click_dialog2|click_dialog3|click_dialog4|click_dialog5|battle_dialog|skill_dialog|lvlup_dialog|gradeup_dialog|shengxue_dialog|awake_dialog|equip_dialog1|equip_dialog2|hangteam_dialog|house_set_dialog|house_dialog|idle_dialog|dagong_dialog|daily_mission_dialog|new_stage_dialog|love_gift_dialog1|love_gift_dialog2|love_gift_dialog3|login_dialog|victory_dialog|failed_dialog|vow_dialog",
		-1
	},
	love_point_vow_cost = {
		"love_point_vow_cost",
		"45#1",
		-1
	},
	limit_duration_time_rate = {
		"limit_duration_time_rate",
		"20",
		-1
	},
	partner_data_lev = {
		"partner_data_lev",
		"2000|4000|6000|8000",
		-1
	},
	love_gift_initial = {
		"love_gift_initial",
		"1000001#1|1000006#1|1000018#1",
		-1
	},
	guild_boss_max_id = {
		"guild_boss_max_id",
		"61",
		-1
	},
	partner_achievement_cost = {
		"partner_achievement_cost",
		"1|2|43|44",
		-1
	},
	login_loop_exclude = {
		"login_loop_exclude",
		30,
		-1
	},
	login_loop_max = {
		"login_loop_max",
		"390",
		-1
	},
	hang_up_time_max = {
		"hang_up_time_max",
		43200,
		-1
	},
	activity_10_replace_cost = {
		"activity_10_replace_cost",
		"47#5",
		-1
	},
	pet_frame_use = {
		"pet_frame_use",
		"pet_bg03|pet_bg03|pet_bg04|pet_bg04|pet_bg05",
		-1
	},
	sakura_date_energy_init = {
		"sakura_date_energy_init",
		"1",
		-1
	},
	sakura_date_buy_cost = {
		"sakura_date_buy_cost",
		"2#60",
		-1
	},
	sakura_date_buy_limit = {
		"sakura_date_buy_limit",
		"10",
		-1
	},
	sakura_date_plot_1st_page = {
		"sakura_date_plot_1st_page",
		10000001,
		-1
	},
	sakura_date_plot_end_pages = {
		"sakura_date_plot_end_pages",
		"10000380|10000391|10000444|10000457|10000526|10000533",
		-1
	},
	announcement_repeat_times = {
		"announcement_repeat_times",
		"4",
		-1
	},
	announcement_blanking = {
		"announcement_blanking",
		"8",
		-1
	},
	wedding_vote_time_interval = {
		"wedding_vote_time_interval",
		"4|8|14|15|17",
		-1
	},
	wedding_vote_cost = {
		"wedding_vote_cost",
		"51#1",
		-1
	},
	activity_dorm_finish_awards = {
		"activity_dorm_finish_awards",
		"6437#1",
		-1
	},
	activity_dorm_finish_awards_mail = {
		"activity_dorm_finish_awards_mail",
		72,
		-1
	},
	activity_delegated_test_awards = {
		"activity_delegated_test_awards",
		"2#150|20#1|36#2",
		-1
	},
	activity_delegated_test_complete = {
		"activity_delegated_test_complete",
		"16",
		-1
	},
	main_window_bgm_switch = {
		"main_window_bgm_switch",
		"2005|2",
		-1
	},
	activity_fit_up_dorm_get_time = {
		"activity_fit_up_dorm_get_time",
		"25",
		-1
	},
	activity_fit_up_dorm_get_item = {
		"activity_fit_up_dorm_get_item",
		"52#10",
		-1
	},
	basic_frame = {
		"basic_frame",
		"8007",
		-1
	},
	activity_equip_gacha_cost = {
		"activity_equip_gacha_cost",
		"54#1",
		-1
	},
	activity_equip_gacha_dropbox = {
		"activity_equip_gacha_dropbox",
		900001,
		-1
	},
	activity_equip_gacha_buy_limit = {
		"activity_equip_gacha_buy_limit",
		20,
		-1
	},
	activity_equip_gacha_buy_cost = {
		"activity_equip_gacha_buy_cost",
		"2#300",
		-1
	},
	activity_equip_gacha_insure_time = {
		"activity_equip_gacha_insure_time",
		50,
		-1
	},
	activity_equip_gacha_appoint = {
		"activity_equip_gacha_appoint",
		"1066|2066|3066|4066",
		-1
	},
	activity_equip_gacha_cost_all = {
		"activity_equip_gacha_cost_all",
		"54#1|54#10",
		-1
	},
	activity_equip_gacha_list = {
		"activity_equip_gacha_list",
		"1066|2066|3066|4066|1065|2065|3065|4065|1064|2064|3064|4064|1063|2063|3063|4063|1062|2062|3062|4062|1061|2061|3061|4061|1054|2054|3054|4054|1053|2053|3053|4053|1052|2052|3052|4052|1051|2051|3051|4051",
		-1
	},
	activity_beach_pink_damage = {
		"activity_beach_pink_damage",
		1,
		-1
	},
	activity_beach_blue_damage = {
		"activity_beach_blue_damage",
		3,
		-1
	},
	activity_beach_red_damage = {
		"activity_beach_red_damage",
		5,
		-1
	},
	activity_beach_free_attack_num = {
		"activity_beach_free_attack_num",
		5,
		-1
	},
	activity_beach_buy_attack_num = {
		"activity_beach_buy_attack_num",
		5,
		-1
	},
	activity_beach_critical_times = {
		"activity_beach_critical_times",
		3,
		-1
	},
	activity_beach_buy_attack_price = {
		"activity_beach_buy_attack_price",
		"2#200",
		-1
	},
	activity_beach_buy_critical_price = {
		"activity_beach_buy_critical_price",
		"2#100",
		-1
	},
	activity_beach_buy_game_price = {
		"activity_beach_buy_game_price",
		"2#300",
		-1
	},
	challenge_voucher_init = {
		"challenge_voucher_init",
		"55#10",
		-1
	},
	challenge_voucher_max = {
		"challenge_voucher_max",
		10,
		-1
	},
	challenge_voucher_cd = {
		"challenge_voucher_cd",
		1800,
		-1
	},
	partner_challenge_cost = {
		"partner_challenge_cost",
		"55#1",
		-1
	},
	challenge_random_partner = {
		"challenge_random_partner",
		"20001|20074",
		-1
	},
	challenge_random_pet = {
		"challenge_random_pet",
		"101|201|301|401|501|601",
		-1
	},
	challenge_pet_lv = {
		"challenge_pet_lv",
		90,
		-1
	},
	challenge_pet_skill = {
		"challenge_pet_skill",
		"30|30|30|30",
		-1
	},
	challenge_pet_tier = {
		"challenge_pet_tier",
		4,
		-1
	},
	challenge_reset_cost = {
		"challenge_reset_cost",
		"55#1",
		-1
	},
	activity_jackpot_energy_initial = {
		"activity_jackpot_energy_initial",
		"57#15",
		-1
	},
	activity_jackpot_energy_cd = {
		"activity_jackpot_energy_cd",
		14400,
		-1
	},
	activity_jackpot_energy_add = {
		"activity_jackpot_energy_add",
		1,
		-1
	},
	activity_jackpot_energy_limit = {
		"activity_jackpot_energy_limit",
		20,
		-1
	},
	activity_jackpot_energy_bet_num = {
		"activity_jackpot_energy_bet_num",
		"1|2|5|10",
		-1
	},
	activity_jackpot_exchange_item = {
		"activity_jackpot_exchange_item",
		58,
		-1
	},
	govern_team_kick_limit = {
		"govern_team_kick_limit",
		6,
		-1
	},
	govern_team_join_limit = {
		"govern_team_join_limit",
		3,
		-1
	},
	govern_team_time = {
		"govern_team_time",
		172800,
		-1
	},
	govern_team_apply_interval = {
		"govern_team_apply_interval",
		86400,
		-1
	},
	govern_team_challenge_num = {
		"govern_team_challenge_num",
		2,
		-1
	},
	govern_team_buy_num = {
		"govern_team_buy_num",
		1,
		-1
	},
	govern_team_buy_price = {
		"govern_team_buy_price",
		"1#1000000",
		-1
	},
	govern_team_modify_interval = {
		"govern_team_modify_interval",
		259200,
		-1
	},
	govern_team_kill_monster_hurt = {
		"govern_team_kill_monster_hurt",
		0.2,
		-1
	},
	questionnaire_award = {
		"questionnaire_award",
		"2#100|36#1",
		-1
	},
	player_return_award = {
		"player_return_award",
		"50002",
		-1
	},
	music_game_perfect_inter = {
		"music_game_perfect_inter",
		19,
		-1
	},
	music_game_great_inter = {
		"music_game_great_inter",
		38,
		-1
	},
	music_game_good_inter = {
		"music_game_good_inter",
		58,
		-1
	},
	music_game_miss_inter = {
		"music_game_miss_inter",
		77,
		-1
	},
	music_game_beat_invalid = {
		"music_game_beat_invalid",
		154,
		-1
	},
	music_game_beat_disappear = {
		"music_game_beat_disappear",
		77,
		-1
	},
	music_game_perfect_score = {
		"music_game_perfect_score",
		2,
		-1
	},
	music_game_great_score = {
		"music_game_great_score",
		1,
		-1
	},
	music_game_good_score = {
		"music_game_good_score",
		0.5,
		-1
	},
	music_game_miss_score = {
		"music_game_miss_score",
		0,
		-1
	},
	music_game_perfect_fever = {
		"music_game_perfect_fever",
		2,
		-1
	},
	music_game_great_fever = {
		"music_game_great_fever",
		1,
		-1
	},
	music_game_good_fever = {
		"music_game_good_fever",
		0.5,
		-1
	},
	music_game_miss_fever = {
		"music_game_miss_fever",
		-1,
		-1
	},
	music_game_drop_time = {
		"music_game_drop_time",
		"2.8|1.6|1|0.6",
		-1
	},
	music_game_drop_acceleration = {
		"music_game_drop_acceleration",
		50,
		-1
	},
	music_game_basic_score = {
		"music_game_basic_score",
		100,
		-1
	},
	music_game_basic_fever = {
		"music_game_basic_fever",
		1,
		-1
	},
	music_game_fever_decline = {
		"music_game_fever_decline",
		1,
		-1
	},
	music_game_fever_time = {
		"music_game_fever_time",
		10,
		-1
	},
	music_game_fever_end = {
		"music_game_fever_end",
		50,
		-1
	},
	music_game_long_score = {
		"music_game_long_score",
		50,
		-1
	},
	music_game_long_period = {
		"music_game_long_period",
		150,
		-1
	},
	music_game_mult_score = {
		"music_game_mult_score",
		20,
		-1
	},
	music_game_fever_score = {
		"music_game_fever_score",
		2,
		-1
	},
	background_default = {
		"background_default",
		"1",
		-1
	},
	loading_default = {
		"loading_default",
		"4|5|6|7|8|9|10|11|12|13",
		-1
	},
	activity_music_day_jigsaw_award = {
		"activity_music_day_jigsaw_award",
		"7051#1",
		-1
	},
	activity_music_day_jigsaw_mail = {
		"activity_music_day_jigsaw_mail",
		84,
		-1
	},
	activity_music_day_unlock_normal = {
		"activity_music_day_unlock_normal",
		"2#100",
		-1
	},
	activity_music_day_unlock_hard = {
		"activity_music_day_unlock_hard",
		"2#1000",
		-1
	},
	activity_music_day_plot_start = {
		"activity_music_day_plot_start",
		59,
		-1
	},
	activity_music_day_plot_main = {
		"activity_music_day_plot_main",
		"1|2|6|7|12|13|17|18|19|20",
		-1
	},
	activity_music_day_plot_branch = {
		"activity_music_day_plot_branch",
		"3|4|5|8|9|10|11|14|15|16",
		-1
	},
	player_sign_num_max = {
		"player_sign_num_max",
		"100",
		-1
	},
	music_game_accuracy = {
		"music_game_accuracy",
		"0.9|0.8|0.65|0.5|0",
		-1
	},
	activity_music_day_hard_award = {
		"activity_music_day_hard_award",
		"7052#1",
		-1
	},
	activity_music_day_hard_award_mail = {
		"activity_music_day_hard_award_mail",
		86,
		-1
	},
	music_game_inter_multiple = {
		"music_game_inter_multiple",
		"1|1.75|2.8|4.6",
		-1
	},
	music_game_weight = {
		"music_game_weight",
		"1|0.8|0.5|0",
		-1
	},
	music_game_long_release = {
		"music_game_long_release",
		"1.2",
		-1
	},
	new_story_lock_time = {
		"new_story_lock_time",
		"1570752000",
		-1
	},
	arena_all_server_bet_times = {
		"arena_all_server_bet_times",
		17280,
		-1
	},
	nsshaft_bg_speed = {
		"nsshaft_bg_speed",
		"0#0.22|200#0.232|500#0.244|1000#0.255|2000#0.2784|3000#0.3016|4000#0.3132|6000#0.3248|8000#0.3364|10000#0.348|12000#0.36|14000#0.371|16000#0.383|18000#0.394|20000#0.406|22000#0.418|24000#0.429|26000#0.441|28000#0.452|30000#0.464",
		-1
	},
	nsshaft_player_volume = {
		"nsshaft_player_volume",
		"60|100",
		-1
	},
	nsshaft_player_xspeed = {
		"nsshaft_player_xspeed",
		0.4,
		-1
	},
	nsshaft_player_a = {
		"nsshaft_player_a",
		0.002,
		-1
	},
	nsshaft_init_hp = {
		"nsshaft_init_hp",
		12,
		-1
	},
	nsshaft_max_hp = {
		"nsshaft_max_hp",
		12,
		-1
	},
	nsshaft_top_dmg = {
		"nsshaft_top_dmg",
		10,
		-1
	},
	nsshaft_floor_heal = {
		"nsshaft_floor_heal",
		1,
		-1
	},
	nsshaft_floor_space = {
		"nsshaft_floor_space",
		150,
		-1
	},
	nsshaft_line2_time = {
		"nsshaft_line2_time",
		200,
		-1
	},
	nsshaft_line3_dmg = {
		"nsshaft_line3_dmg",
		5,
		-1
	},
	nsshaft_line4_yspeed = {
		"nsshaft_line4_yspeed",
		0.63,
		-1
	},
	nsshaft_line5_xspeed = {
		"nsshaft_line5_xspeed",
		0.133,
		-1
	},
	nsshaft_rd_limit_x = {
		"nsshaft_rd_limit_x",
		"220|4",
		-1
	},
	nsshaft_rd_limit_type = {
		"nsshaft_rd_limit_type",
		"4#10|7#11|5#15|5#13|5#17|7#11",
		-1
	},
	nsshaft_init_point = {
		"nsshaft_init_point",
		0,
		-1
	},
	nsshaft_line_point = {
		"nsshaft_line_point",
		10,
		-1
	},
	nsshaft_ex_point = {
		"nsshaft_ex_point",
		5,
		-1
	},
	nsshaft_ex_point_line = {
		"nsshaft_ex_point_line",
		"1|5",
		-1
	},
	nsshaft_max_empty_line = {
		"nsshaft_max_empty_line",
		3,
		-1
	},
	first_all_server_arena_time = {
		"first_all_server_arena_time",
		1570406400,
		-1
	},
	funopen_all_server_arena_time = {
		"funopen_all_server_arena_time",
		1570406400,
		-1
	},
	nsshaft_bgm = {
		"nsshaft_bgm",
		"8006",
		-1
	},
	new_questionnaire_begin_time = {
		"new_questionnaire_begin_time",
		1659657600,
		-1
	},
	new_questionnaire_end_time = {
		"new_questionnaire_end_time",
		1660262400,
		-1
	},
	new_questionnaire_award = {
		"new_questionnaire_award",
		"2#100|36#1",
		-1
	},
	new_questionnaire_level_limit = {
		"new_questionnaire_level_limit",
		"70",
		-1
	},
	new_questionnaire_type = {
		"new_questionnaire_type",
		"10",
		-1
	},
	govern_team_kill_result = {
		"govern_team_kill_result",
		"1#0|4#0",
		-1
	},
	school_practise_ticket_default = {
		"school_practise_ticket_default",
		"2",
		-1
	},
	school_practise_ticket_limit_up = {
		"school_practise_ticket_limit_up",
		"9|18|30",
		-1
	},
	school_practise_ticket_buy_limit = {
		"school_practise_ticket_buy_limit",
		"10",
		-1
	},
	school_practise_ticket02_default = {
		"school_practise_ticket02_default",
		"10",
		-1
	},
	school_practise_ticket02_buy = {
		"school_practise_ticket02_buy",
		"2#25",
		-1
	},
	dorm_comfort_top_num_by_type = {
		"dorm_comfort_top_num_by_type",
		"999|999|9999|9999|9999|9999|9999|9999|9999|999",
		-1
	},
	dorm_top_num_by_type = {
		"dorm_top_num_by_type",
		"1|1|40|20|20|20|20|40|30|1",
		-1
	},
	dorm_max_partner = {
		"dorm_max_partner",
		"5",
		-1
	},
	dorm_show_furniture_type = {
		"dorm_show_furniture_type",
		"0|1|2|10|3|4|5|6|8|9",
		-1
	},
	replace_10_cost_hero = {
		"replace_10_cost_hero",
		"5|6|7|7|8|9",
		-1
	},
	hero_break_lv_cap = {
		"hero_break_lv_cap",
		"260|270|290|310|330",
		-1
	},
	hero_break_attr_up = {
		"hero_break_attr_up",
		"0.14|0.1",
		-1
	},
	house_partner_speed = {
		"house_partner_speed",
		"1",
		-1
	},
	house_shadow = {
		"house_shadow",
		"0.75|1",
		-1
	},
	house_senpai_offset_idle = {
		"house_senpai_offset_idle",
		"0|0",
		-1
	},
	therm_story_level_adapt = {
		"therm_story_level_adapt",
		"60|90|120|150|180",
		-1
	},
	house_furniture_initial = {
		"house_furniture_initial",
		"1010001#1|1010002#1|1010003#1|1010004#1|1010005#1|1010006#1|1010007#1|1010009#1|1010013#1|1010017#1|1010018#1|1090022#1|1100003#1",
		-1
	},
	house_furniture_unit_initial = {
		"house_furniture_unit_initial",
		"1",
		-1
	},
	activity_therm_story_adapt_rate = {
		"activity_therm_story_adapt_rate",
		"2|7",
		-1
	},
	activity_therm_story_adapt_level = {
		"activity_therm_story_adapt_level",
		"101|141",
		-1
	},
	return_10star_partner_exp_return_ratio = {
		"return_10star_partner_exp_return_ratio",
		0.65,
		-1
	},
	return_10star_treasure_return_ratio = {
		"return_10star_treasure_return_ratio",
		0.6,
		-1
	},
	return_10star_grade_coin_return = {
		"return_10star_grade_coin_return",
		"10#8000|10#16000|10#24000|10#36000|10#48000|10#64000",
		-1
	},
	return_10star_puppet_id = {
		"return_10star_puppet_id",
		"561001|562001|563001|564001|565001|566001|661001|662001|663001|664001|665001|666001|761001|762001|763001|764001|765001|766001",
		-1
	},
	return_10star_cost = {
		"return_10star_cost",
		"47#5",
		-1
	},
	picture_max = {
		"picture_max",
		1.4,
		-1
	},
	picture_min = {
		"picture_min",
		"0.6",
		-1
	},
	warmup_challenge_partner = {
		"warmup_challenge_partner",
		"0",
		-1
	},
	girls_model_bubble_time = {
		"girls_model_bubble_time",
		"5000",
		-1
	},
	partner_data_record_time = {
		"partner_data_record_time",
		"0",
		-1
	},
	house_dialog_area = {
		"house_dialog_area",
		"8|8",
		-1
	},
	house_dialog_init_count = {
		"house_dialog_init_count",
		"0.8",
		-1
	},
	house_dialog_count = {
		"house_dialog_count",
		"-0.2|0.2",
		-1
	},
	house_dialog_count_cd = {
		"house_dialog_count_cd",
		"20",
		-1
	},
	house_dialog_cd1 = {
		"house_dialog_cd1",
		"4",
		-1
	},
	house_dialog_cd2 = {
		"house_dialog_cd2",
		"900",
		-1
	},
	house_dialog_cd3 = {
		"house_dialog_cd3",
		"180",
		-1
	},
	direct_partner_point_full = {
		"direct_partner_point_full",
		"5",
		-1
	},
	lucky_device_max_per_server = {
		"lucky_device_max_per_server",
		"5",
		-1
	},
	lucky_device_min_interval = {
		"lucky_device_min_interval",
		"899",
		-1
	},
	lucky_device_max_day = {
		"lucky_device_max_day",
		"7",
		-1
	},
	wedding_vote_award_avatar = {
		"wedding_vote_award_avatar",
		"8006|8021",
		-1
	},
	lucky_player_phone_models = {
		"lucky_player_phone_models",
		"iPhone11,1|iPhone11,2|iPhone11,3|iPhone11,4|iPhone11,5|iPhone11,6|iPhone11,7|iPhone11,8",
		-1
	},
	wedding_vote2_time_interval = {
		"wedding_vote2_time_interval",
		"4|8|14|15|17",
		-1
	},
	wedding_vote2_cost = {
		"wedding_vote2_cost",
		"156#1|157#1|158#1",
		-1
	},
	activity_newyear_box2_item = {
		"activity_newyear_box2_item",
		"36#1|29#1|20#1|940002#10|956001#5",
		-1
	},
	activity_newyear_box1_item = {
		"activity_newyear_box1_item",
		"1#388000|9#388000|10#388|14#388|26#388|27#66",
		-1
	},
	direct_partner_appear_full = {
		"direct_partner_appear_full",
		"143",
		-1
	},
	giftbag_japan_interval = {
		"giftbag_japan_interval",
		"1|3|7",
		-1
	},
	partner_comment_length_limit_fr_fr = {
		"partner_comment_length_limit_fr_fr",
		"12|400",
		-1
	},
	questionnaire_str_limit = {
		"questionnaire_str_limit",
		"1000|50",
		-1
	},
	guild_final_boss_begin_time = {
		"guild_final_boss_begin_time",
		"1581638400",
		-1
	},
	scratch_card_item_id = {
		"scratch_card_item_id",
		"86",
		-1
	},
	scratch_card_dropbox_id = {
		"scratch_card_dropbox_id",
		800006,
		-1
	},
	scratch_card_buy_cost = {
		"scratch_card_buy_cost",
		"2#100",
		-1
	},
	scratch_card_buy_limit = {
		"scratch_card_buy_limit",
		1000,
		-1
	},
	scratch_card_awards_identical_1 = {
		"scratch_card_awards_identical_1",
		"435#5",
		-1
	},
	scratch_card_awards_identical_2 = {
		"scratch_card_awards_identical_2",
		"940001#5",
		-1
	},
	scratch_card_awards_identical_3 = {
		"scratch_card_awards_identical_3",
		"940001#30",
		-1
	},
	scratch_card_awards_identical_4 = {
		"scratch_card_awards_identical_4",
		"940004#50",
		-1
	},
	scratch_card_awards_identical_5 = {
		"scratch_card_awards_identical_5",
		"170#25",
		-1
	},
	scratch_card_unmask_r = {
		"scratch_card_unmask_r",
		25,
		-1
	},
	main_window_icon_position = {
		"main_window_icon_position",
		"-80#990|-80#1110|-80#1230|-200#990|-320#990|-200#1110|-320#1110|-200#1230|-320#1230|-440#990|-440#1110|-440#1230",
		-1
	},
	show_in_game = {
		"show_in_game",
		"1579212000",
		-1
	},
	warmup_no_partner = {
		"warmup_no_partner",
		"1676592000",
		-1
	},
	direct_partner_appear_full_new = {
		"direct_partner_appear_full_new",
		"157",
		-1
	},
	dorm_comfort_version = {
		"dorm_comfort_version",
		"2",
		-1
	},
	activity_making_coffee_speedup = {
		"activity_making_coffee_speedup",
		"7200",
		-1
	},
	test_server_prophet_entry_time = {
		"test_server_prophet_entry_time",
		"1597622400",
		-1
	},
	test_server_prophet_test_time = {
		"test_server_prophet_test_time",
		"1597968000|1598572800",
		-1
	},
	test_server_entry_level_limit = {
		"test_server_entry_level_limit",
		"120",
		-1
	},
	test_server_entry_tower_limit = {
		"test_server_entry_tower_limit",
		"400",
		-1
	},
	activity_pray_buy_price = {
		"activity_pray_buy_price",
		"2#100",
		-1
	},
	activity_pray_buy_limit = {
		"activity_pray_buy_limit",
		200,
		-1
	},
	activity_pray_select_price = {
		"activity_pray_select_price",
		"2#500",
		-1
	},
	activity_pray_submit_award = {
		"activity_pray_submit_award",
		32003,
		-1
	},
	activity_pray_submit_rate_normal = {
		"activity_pray_submit_rate_normal",
		1,
		-1
	},
	activity_pray_submit_rate_special = {
		"activity_pray_submit_rate_special",
		1,
		-1
	},
	activity_pray_submit_bonus = {
		"activity_pray_submit_bonus",
		"1#6000|2#3000|3#1000",
		-1
	},
	activity_pray_cost = {
		"activity_pray_cost",
		"269#1",
		-1
	},
	activity_pray_submit_bonus_special = {
		"activity_pray_submit_bonus_special",
		"1#8500|2#1300|3#200",
		-1
	},
	activity_plot_list = {
		"activity_plot_list",
		"81|82|83|84|85|86|87|88|89|90|91|92|93|94|95|96|97|98|99|100|101|102|103|104|105|106|107|108|109|110|111|112|113|114|115|116|117|118|119|120",
		-1
	},
	pub_mission_ensure_weight = {
		"pub_mission_ensure_weight",
		"1000000|338|5",
		-1
	},
	partner_jackpot_start = {
		"partner_jackpot_start",
		1582934400,
		-1
	},
	partner_jackpot_cd = {
		"partner_jackpot_cd",
		345600,
		-1
	},
	partner_jackpot_cost = {
		"partner_jackpot_cost",
		"93#1",
		-1
	},
	partner_challenge_speed_fort = {
		"partner_challenge_speed_fort",
		"11",
		-1
	},
	partner_challenge_speed_img = {
		"partner_challenge_speed_img",
		"partner_challenge_yinyue",
		-1
	},
	new_trial_drop = {
		"new_trial_drop",
		1100001,
		-1
	},
	new_trial_drop_cost = {
		"new_trial_drop_cost",
		"97#10",
		-1
	},
	new_trial_drop_show = {
		"new_trial_drop_show",
		"1#500000|9#500000|14#600|10#600|940004#10|73#5",
		-1
	},
	activity_factory_item_price = {
		"activity_factory_item_price",
		"1#50000",
		-1
	},
	activity_factory_easter_egg_weight = {
		"activity_factory_easter_egg_weight",
		"500",
		-1
	},
	player_red_point_lev = {
		"player_red_point_lev",
		"50",
		-1
	},
	player_red_point_partner_num = {
		"player_red_point_partner_num",
		"6",
		-1
	},
	tour_time_interval = {
		"tour_time_interval",
		"14400",
		-1
	},
	tour_point = {
		"tour_point",
		"120|140",
		-1
	},
	tour_award = {
		"tour_award",
		"108#6-10|1#100000-100000|9#100000-100000",
		-1
	},
	tour_ex_award = {
		"tour_ex_award",
		"108#3|1#50000|9#50000",
		-1
	},
	soft_guide_to_select_hero_lev = {
		"soft_guide_to_select_hero_lev",
		"30",
		-1
	},
	hero_select_soft_guide_pos = {
		"hero_select_soft_guide_pos",
		"40|430",
		-1
	},
	gacha_bg_replace_activity_id = {
		"gacha_bg_replace_activity_id",
		"99",
		-1
	},
	activity_easter_egg_submit_award = {
		"activity_easter_egg_submit_award",
		"32001|32002",
		-1
	},
	activity_easter_egg_submit_point = {
		"activity_easter_egg_submit_point",
		"1|2",
		-1
	},
	activity_easter_egg_bonus_weight = {
		"activity_easter_egg_bonus_weight",
		"10000|600|1000",
		-1
	},
	activity_easter_egg_cost = {
		"activity_easter_egg_cost",
		"186#1",
		-1
	},
	activity_sports_time_interval = {
		"activity_sports_time_interval",
		"86400|864000|7200|252000|86400",
		-1
	},
	activity_sports_energy_start = {
		"activity_sports_energy_start",
		"6",
		-1
	},
	activity_sports_pvp3_score = {
		"activity_sports_pvp3_score",
		"10|-6",
		-1
	},
	activity_sports_score_limit = {
		"activity_sports_score_limit",
		"100",
		-1
	},
	activity_sports_guess_cost = {
		"activity_sports_guess_cost",
		"109#1|109#3|109#5",
		-1
	},
	activity_sports_guess_award = {
		"activity_sports_guess_award",
		"109#2|109#7|109#13",
		-1
	},
	activity_sports_match = {
		"activity_sports_match",
		"1100|1200|1500",
		-1
	},
	activity_easter_egg_show = {
		"activity_easter_egg_show",
		"1#750000#10|9#750000#10|940001#30#10|14#500#10|10#500#10|26#400#10|27#50#10|216#20#10|198#500#10|199#100#10",
		-1
	},
	activity_easter_egg_show_bonus = {
		"activity_easter_egg_show_bonus",
		"418#1#5|4206001#1#5|170#5#5|20#1#15|29#1#30|36#1#40",
		-1
	},
	activity_sports_top_num = {
		"activity_sports_top_num",
		"100",
		-1
	},
	activity_sports_rank_pattern = {
		"activity_sports_rank_pattern",
		"1100|1200|1400|1600",
		-1
	},
	activity_sports_limit_lev = {
		"activity_sports_limit_lev",
		"30",
		-1
	},
	activity_sports_start_item = {
		"activity_sports_start_item",
		"109#1",
		-1
	},
	mail_last_time = {
		"mail_last_time",
		1728000,
		-1
	},
	bp_start_time = {
		"bp_start_time",
		1583452800,
		-1
	},
	bp_duration = {
		"bp_duration",
		"3628800",
		-1
	},
	bp_buy_level_duration = {
		"bp_buy_level_duration",
		"2419200",
		-1
	},
	activity_preview_plot = {
		"activity_preview_plot",
		"3766",
		-1
	},
	battle_pass_plot = {
		"battle_pass_plot",
		"3641",
		-1
	},
	trial_enter_girl_pos_scale = {
		"trial_enter_girl_pos_scale",
		"150|1260|0.81",
		-1
	},
	trial_boss_levs = {
		"trial_boss_levs",
		"26|60|80|100",
		-1
	},
	mail_limit = {
		"mail_limit",
		"40",
		-1
	},
	collection_point_level = {
		"collection_point_level",
		"500|1500|2500",
		-1
	},
	max_partner_equip = {
		"max_partner_equip",
		"1066|2066|3066|4066|0|0|0",
		-1
	},
	activity_date_cost_dice = {
		"activity_date_cost_dice",
		"131#1|132#1",
		-1
	},
	activity_warmup_arena_default_partner = {
		"activity_warmup_arena_default_partner",
		"755009|756008",
		-1
	},
	activity_date_buydice_cost = {
		"activity_date_buydice_cost",
		"2#100|2#150|2#200",
		-1
	},
	activity_date_buydice = {
		"activity_date_buydice",
		"131#3|132#1",
		-1
	},
	avtivity_date_gift = {
		"avtivity_date_gift",
		"131#12|132#4",
		-1
	},
	act_summon_energy_pool = {
		"act_summon_energy_pool",
		"930178#50|930177#50|930179#50|930182#50|930176#50",
		-1
	},
	act_summon_energy_weight = {
		"act_summon_energy_weight",
		"2350|2350|2350|2350|600",
		-1
	},
	act_summon_energy_weight_add = {
		"act_summon_energy_weight_add",
		"175|525|0|0|0",
		-1
	},
	act_summon_energy_cost = {
		"act_summon_energy_cost",
		2000,
		-1
	},
	act_summon_energy_limit = {
		"act_summon_energy_limit",
		"200|500",
		-1
	},
	act_summon_energy_num = {
		"act_summon_energy_num",
		"10|10",
		-1
	},
	is_unity_initial_background_girl = {
		"is_unity_initial_background_girl",
		"27030",
		-1
	},
	activity_45_hero_model = {
		"activity_45_hero_model",
		"spdegula_pifu05_lihui01|543|-1990|0.67|5101706|7309",
		-1
	},
	act_summon_energy_item = {
		"act_summon_energy_item",
		136,
		-1
	},
	activity_chose_gift_free = {
		"activity_chose_gift_free",
		"10115|10121",
		-1
	},
	activity_date_buydice_limit = {
		"activity_date_buydice_limit",
		"3",
		-1
	},
	bp_start_time_season2 = {
		"bp_start_time_season2",
		"1593129600",
		-1
	},
	activity_date_public_favor_limit = {
		"activity_date_public_favor_limit",
		"100",
		-1
	},
	activity_date_unique_favor_limit = {
		"activity_date_unique_favor_limit",
		"300",
		-1
	},
	school_explore_energy_cd = {
		"school_explore_energy_cd",
		"10800",
		-1
	},
	school_explore_energy_max = {
		"school_explore_energy_max",
		"5",
		-1
	},
	school_explore_energy_start = {
		"school_explore_energy_start",
		"5",
		-1
	},
	activity_fanpai_weight_reset = {
		"activity_fanpai_weight_reset",
		"1",
		-1
	},
	activity_fanpai_weight_add = {
		"activity_fanpai_weight_add",
		"2",
		-1
	},
	activity_fanpai_buy_limit = {
		"activity_fanpai_buy_limit",
		"80",
		-1
	},
	activity_fanpai_buy_cost = {
		"activity_fanpai_buy_cost",
		"2#220",
		-1
	},
	activity_fanpai_card_cost = {
		"activity_fanpai_card_cost",
		"146#1",
		-1
	},
	is_unity_background_default = {
		"is_unity_background_default",
		"34",
		-1
	},
	school_explore_items = {
		"school_explore_items",
		"137|138|139|140|141|142|143|144|145",
		-1
	},
	language_order = {
		"language_order",
		"zh_tw|en_en|zh_cn|ja_jp|fr_fr|ko_kr",
		-1
	},
	comic_comment_length_limit_fr_fr = {
		"comic_comment_length_limit_fr_fr",
		"8|72",
		-1
	},
	comic_comment_length_limit_ko_kr = {
		"comic_comment_length_limit_ko_kr",
		"12|120",
		-1
	},
	activity_letter = {
		"activity_letter",
		"36#10|2#1000|940002#50",
		-1
	},
	activity_birthday_colour_awards = {
		"activity_birthday_colour_awards",
		"1#18000|1#16000",
		-1
	},
	activity_birthday_colour_limit = {
		"activity_birthday_colour_limit",
		"100000",
		-1
	},
	activity_44_hero_model = {
		"activity_44_hero_model",
		"spdegula_pifu05_lihui01|543|-1990|0.67|5101706|7309",
		-1
	},
	activity_birthday_colour_cost = {
		"activity_birthday_colour_cost",
		"147#1",
		-1
	},
	activity_birthday_cake_cost = {
		"activity_birthday_cake_cost",
		"148#1",
		-1
	},
	activity_birthday_cake_rounds_limit = {
		"activity_birthday_cake_rounds_limit",
		"25",
		-1
	},
	activity_birthday_colour_colour = {
		"activity_birthday_colour_colour",
		"0x666666|0xffffff|0xff8080|0xffb57f|0xffff7f|0x80ff7f|0x00aaff|0xff7fff",
		-1
	},
	activity_birthday_cake_random = {
		"activity_birthday_cake_random",
		"4",
		-1
	},
	activity_birthday_probability = {
		"activity_birthday_probability",
		"2|4|4",
		-1
	},
	activity_privileged_card_trial_rewards = {
		"activity_privileged_card_trial_rewards",
		"1*2000|15*2000",
		-1
	},
	activity_privileged_card_dungeon_rewards = {
		"activity_privileged_card_dungeon_rewards",
		"1*1000|2*1000|10*1000|26*1000|27*1000",
		-1
	},
	activity_privileged_card_dungeon_drugs = {
		"activity_privileged_card_dungeon_drugs",
		"2",
		-1
	},
	activity_birthday_colour_progress_bit = {
		"activity_birthday_colour_progress_bit",
		"0.1",
		-1
	},
	merge_server_now_next = {
		"merge_server_now_next",
		"618|634|1999999999",
		-1
	},
	activity_privileged_card_ui_type = {
		"activity_privileged_card_ui_type",
		"0#0|1#0",
		-1
	},
	arena_revenge_cd = {
		"arena_revenge_cd",
		"300",
		-1
	},
	activity_swimsuit_cost = {
		"activity_swimsuit_cost",
		"154#1",
		-1
	},
	activity_swimsuit_mission_cost_2 = {
		"activity_swimsuit_mission_cost_2",
		"114",
		-1
	},
	activity_swimsuit_mail = {
		"activity_swimsuit_mail",
		"128",
		-1
	},
	activity_privileged_card_function_open = {
		"activity_privileged_card_function_open",
		"18|19",
		-1
	},
	activity_ice_secret_weight = {
		"activity_ice_secret_weight",
		"100|50|70|100|150|240|322|420|502|700|880|966|1000|966|880|700|502|420|322|240|150|100|70|50|100",
		-1
	},
	activity_ice_secret_hammer = {
		"activity_ice_secret_hammer",
		"180#15",
		-1
	},
	activity_ice_secret_boss = {
		"activity_ice_secret_boss",
		"3000100",
		-1
	},
	activity_ice_secret_limit = {
		"activity_ice_secret_limit",
		"1",
		-1
	},
	activity_ice_secret_skill = {
		"activity_ice_secret_skill",
		"200000702|200000703|200000704|200000705",
		-1
	},
	house_no_jamb = {
		"house_no_jamb",
		"1100001|1100002|1140001|1140002",
		-1
	},
	activity_return_player_lv_limit = {
		"activity_return_player_lv_limit",
		"50",
		-1
	},
	activity_return_player_offline_limit = {
		"activity_return_player_offline_limit",
		"2592000",
		-1
	},
	activity_return_player_time_range = {
		"activity_return_player_time_range",
		"2419200",
		-1
	},
	activity_return_binding_limit = {
		"activity_return_binding_limit",
		"2",
		-1
	},
	activity_return_apply_limit = {
		"activity_return_apply_limit",
		"15",
		-1
	},
	activity_return_drop_period = {
		"activity_return_drop_period",
		"1209600",
		-1
	},
	partner_challenge_weight_balance = {
		"partner_challenge_weight_balance",
		"-60",
		-1
	},
	activity_return_recommend_reason1 = {
		"activity_return_recommend_reason1",
		"150",
		-1
	},
	activity_return_recommend_reason2 = {
		"activity_return_recommend_reason2",
		"10",
		-1
	},
	activity_return_recommend_reason3 = {
		"activity_return_recommend_reason3",
		"86400",
		-1
	},
	activity_return_recommend_reason4 = {
		"activity_return_recommend_reason4",
		"1200000",
		-1
	},
	house_furniture_type_num = {
		"house_furniture_type_num",
		"10",
		-1
	},
	activity_fairytale_energy_init = {
		"activity_fairytale_energy_init",
		"166#10",
		-1
	},
	activity_fairytale_energy_cd = {
		"activity_fairytale_energy_cd",
		"7200",
		-1
	},
	activity_fairytale_energy_max = {
		"activity_fairytale_energy_max",
		"10",
		-1
	},
	wish_gacha_partners = {
		"wish_gacha_partners",
		"51019|51018|51017|51016|52020|52019|52018|52017|53019|53018|53017|53016|54018|54017|54016|54015|55014|55013|55012|55011|56012|56011|56010|56009",
		-1
	},
	wish_gacha_dropbox_id = {
		"wish_gacha_dropbox_id",
		"10009",
		-1
	},
	wish_gacha_weight_ini_total = {
		"wish_gacha_weight_ini_total",
		"1000000",
		-1
	},
	wish_gacha_weight_ini_get = {
		"wish_gacha_weight_ini_get",
		"100",
		-1
	},
	wish_gacha_weight_add = {
		"wish_gacha_weight_add",
		"100",
		-1
	},
	wish_gacha_weight_add_num = {
		"wish_gacha_weight_add_num",
		"100",
		-1
	},
	wish_gacha_guarantee = {
		"wish_gacha_guarantee",
		"500",
		-1
	},
	wish_gacha_mail_id = {
		"wish_gacha_mail_id",
		"131",
		-1
	},
	activity_keyboard_cost = {
		"activity_keyboard_cost",
		"169#1",
		-1
	},
	match_group_limit = {
		"match_group_limit",
		"2",
		-1
	},
	arena_all_server_time = {
		"arena_all_server_time",
		"5",
		-1
	},
	arena_all_server_lock_limit_time = {
		"arena_all_server_lock_limit_time",
		"7200",
		-1
	},
	activity_fairytale_energy_cost = {
		"activity_fairytale_energy_cost",
		"166#1",
		-1
	},
	chosen_arena_init_partner_ids = {
		"chosen_arena_init_partner_ids",
		"751009|751009",
		-1
	},
	chosen_arena_buy_costs = {
		"chosen_arena_buy_costs",
		"2#30|2#30|2#30|2#30|2#50|2#50|2#50|2#50|2#80|2#80|2#80|2#80",
		-1
	},
	house_wallpaper = {
		"house_wallpaper",
		"1100003",
		-1
	},
	activity_sprouts_cost = {
		"activity_sprouts_cost",
		"171#1",
		-1
	},
	one_click_upgrade_level = {
		"one_click_upgrade_level",
		"100",
		-1
	},
	one_click_upgrade_duration = {
		"one_click_upgrade_duration",
		"5",
		-1
	},
	activity_sprouts_limit = {
		"activity_sprouts_limit",
		"400",
		-1
	},
	activity_fairytale_main_cell = {
		"activity_fairytale_main_cell",
		"1.25",
		-1
	},
	school_practise_season1_start_time = {
		"school_practise_season1_start_time",
		"1600387200",
		-1
	},
	school_practise_season_duration = {
		"school_practise_season_duration",
		1209600,
		-1
	},
	school_practise_display_duration = {
		"school_practise_display_duration",
		86400,
		-1
	},
	activity_red_riding_hood_mail = {
		"activity_red_riding_hood_mail",
		"193|192|138|137|136|242",
		-1
	},
	activity_fairytale_boss_skill = {
		"activity_fairytale_boss_skill",
		"12701|12703|12704|12705",
		-1
	},
	activity_fairytale_first_plot = {
		"activity_fairytale_first_plot",
		"4455",
		-1
	},
	activity_red_riding_hood_awards_1 = {
		"activity_red_riding_hood_awards_1",
		"358#15|4206001#23",
		-1
	},
	school_practise_effect_pos = {
		"school_practise_effect_pos",
		"1#-45#-45|1#-130#-10|1#-60#-5|1#0#0|-1#470#-70|-1#540#-90",
		-1
	},
	treasure_reserve_unlock = {
		"treasure_reserve_unlock",
		"2#0|2#1000|2#2000",
		-1
	},
	altar_6up_day_limit = {
		"altar_6up_day_limit",
		"5",
		-1
	},
	activity_tower_fund_bonus = {
		"activity_tower_fund_bonus",
		"4200|5000|5000|5000|5000|6000|7000|8000|9000",
		-1
	},
	slot_sort_type_show_list = {
		"slot_sort_type_show_list",
		"10|9|4|5|6|7|0|1|8",
		-1
	},
	partner_challenge_chess_cost1 = {
		"partner_challenge_chess_cost1",
		"3",
		-1
	},
	partner_challenge_chess_cost2 = {
		"partner_challenge_chess_cost2",
		"1",
		-1
	},
	partner_challenge_chess_award2 = {
		"partner_challenge_chess_award2",
		"10",
		-1
	},
	partner_challenge_chess_hp = {
		"partner_challenge_chess_hp",
		"50",
		-1
	},
	partner_challenge_chess_sell = {
		"partner_challenge_chess_sell",
		"2|7",
		-1
	},
	entrance_test_slot_sort_type_show_list = {
		"entrance_test_slot_sort_type_show_list",
		"9|4|5|6|7|0|1|8",
		-1
	},
	activity_147_hero_model = {
		"activity_147_hero_model",
		"spdegula_pifu05_lihui01|543|-1990|0.67|5101706|7309",
		-1
	},
	school_practise_ticket02_default_2 = {
		"school_practise_ticket02_default_2",
		"25",
		-1
	},
	school_practise_new_help_tips = {
		"school_practise_new_help_tips",
		"2",
		-1
	},
	plot_fade_time = {
		"plot_fade_time",
		"0.5",
		-1
	},
	up_dorm_limit = {
		"up_dorm_limit",
		"0|200",
		-1
	},
	activity_sports_term = {
		"activity_sports_term",
		"4",
		-1
	},
	partner_warmup_random_seed = {
		"partner_warmup_random_seed",
		"666665",
		-1
	},
	herobag_buy_new_cost = {
		"herobag_buy_new_cost",
		"2#100|2#200|2#300|2#400|2#500|2#600|2#700|2#800|2#900|2#1000|2#1100|2#1200|2#1300|2#1400|2#1500|2#1600|2#1700|2#1800|2#1900|2#2000|2#2000|2#2000|2#2000|2#2000|2#2000|2#2000|2#2000|2#2000|2#2000|2#2000|2#2000|2#2000",
		-1
	},
	daily_mission_award = {
		"daily_mission_award",
		"101|186#1",
		-1
	},
	halloween_buy = {
		"halloween_buy",
		"2#150|182#1",
		-1
	},
	halloween_limit = {
		"halloween_limit",
		"30",
		-1
	},
	halloween_cost = {
		"halloween_cost",
		"182#1",
		-1
	},
	midas_time_interval = {
		"midas_time_interval",
		"86400",
		-1
	},
	school_practise_point_time_stamp = {
		"school_practise_point_time_stamp",
		"1604016000",
		-1
	},
	old_rookie_ddl = {
		"old_rookie_ddl",
		"1606694400|1605830400",
		-1
	},
	friend_boss_skip_limit = {
		"friend_boss_skip_limit",
		"3",
		-1
	},
	activity_limit_gacha_boss = {
		"activity_limit_gacha_boss",
		"3000200",
		-1
	},
	activity_limit_gacha_boss_effect = {
		"activity_limit_gacha_boss_effect",
		"88200|88201",
		-1
	},
	activity_limit_gacha_boss_limit = {
		"activity_limit_gacha_boss_limit",
		"2",
		-1
	},
	activity_limit_gacha_boss_skill = {
		"activity_limit_gacha_boss_skill",
		"75101401|75101402|75101403|75101404",
		-1
	},
	activity_limit_gacha_security_time = {
		"activity_limit_gacha_security_time",
		"50|52017",
		-1
	},
	activity_limit_gacha_10_dropbox = {
		"activity_limit_gacha_10_dropbox",
		"10|40003",
		-1
	},
	activity_limit_gacha_partner_award = {
		"activity_limit_gacha_partner_award",
		"52017",
		-1
	},
	activity_limit_gacha_partner_show = {
		"activity_limit_gacha_partner_show",
		"52017",
		-1
	},
	activity_limit_gacha_partner_jump = {
		"activity_limit_gacha_partner_jump",
		"52017",
		-1
	},
	activity_limit_gacha_buy = {
		"activity_limit_gacha_buy",
		"2#300|265#1",
		-1
	},
	activity_limit_gacha_limit = {
		"activity_limit_gacha_limit",
		"50",
		-1
	},
	new_trial_match_chance = {
		"new_trial_match_chance",
		"0.9",
		-1
	},
	new_trial_match_partner = {
		"new_trial_match_partner",
		"655023|656016|755013|756006",
		-1
	},
	tower_giftbag_floors1 = {
		"tower_giftbag_floors1",
		"20|80|140|200",
		-1
	},
	tower_giftbag_floors2 = {
		"tower_giftbag_floors2",
		"220|280|340|400",
		-1
	},
	tower_giftbag_floors3 = {
		"tower_giftbag_floors3",
		"420|480|540|600",
		-1
	},
	tower_giftbag_floors4 = {
		"tower_giftbag_floors4",
		"620|680|740|800",
		-1
	},
	tower_giftbag_floors5 = {
		"tower_giftbag_floors5",
		"820|880|940|900",
		-1
	},
	tower_giftbag_floors6 = {
		"tower_giftbag_floors6",
		"1050|1100|1150|1200",
		-1
	},
	tower_giftbag_floors7 = {
		"tower_giftbag_floors7",
		"1300|1350|1400|1450",
		-1
	},
	level_fund_window_lvl = {
		"level_fund_window_lvl",
		"40|50|60",
		-1
	},
	battle_pass_time = {
		"battle_pass_time",
		"7|3|1",
		-1
	},
	battle_pass_level = {
		"battle_pass_level",
		"10",
		-1
	},
	battle_pass_item_light = {
		"battle_pass_item_light",
		"2|120|222|976001|940002|940004|7230|7221|1900007|1900006",
		-1
	},
	battle_speed_up = {
		"battle_speed_up",
		"1|1.8|2.5",
		-1
	},
	battle_skip_level = {
		"battle_skip_level",
		"30",
		-1
	},
	treasures_refresh_gurantee = {
		"treasures_refresh_gurantee",
		"4",
		-1
	},
	activity_lafuli_star = {
		"activity_lafuli_star",
		"21",
		-1
	},
	activity_lafuli_cost1 = {
		"activity_lafuli_cost1",
		"189#1",
		-1
	},
	activity_lafuli_cost2 = {
		"activity_lafuli_cost2",
		"190#1",
		-1
	},
	activity_lafuli_recover = {
		"activity_lafuli_recover",
		"2",
		-1
	},
	activity_lafuli_buy = {
		"activity_lafuli_buy",
		"2#150|189#1",
		-1
	},
	activity_lafuli_limit = {
		"activity_lafuli_limit",
		"30",
		-1
	},
	partner_picture_show_animation = {
		"partner_picture_show_animation",
		"animation_show",
		-1
	},
	shengdan_zhujiemian_stop = {
		"shengdan_zhujiemian_stop",
		"1609977600",
		-1
	},
	activity_doll_3 = {
		"activity_doll_3",
		"193#11",
		-1
	},
	activity_doll_4 = {
		"activity_doll_4",
		"193#55",
		-1
	},
	activity_doll_5 = {
		"activity_doll_5",
		"193#500",
		-1
	},
	activity_year_fund_sell_time = {
		"activity_year_fund_sell_time",
		"3",
		-1
	},
	activity_year_fund_get_time = {
		"activity_year_fund_get_time",
		"30",
		-1
	},
	new_limit_skin_item_id = {
		"new_limit_skin_item_id",
		"",
		-1
	},
	old_building_floor_limit = {
		"old_building_floor_limit",
		"300",
		-1
	},
	old_building_star_limit = {
		"old_building_star_limit",
		"22",
		-1
	},
	old_building_time_interval = {
		"old_building_time_interval",
		"1123200|86400",
		-1
	},
	activity_newyear_item_id = {
		"activity_newyear_item_id",
		"312|313",
		-1
	},
	partner_exskill_reset_cost = {
		"partner_exskill_reset_cost",
		"2#500",
		-1
	},
	activity_study_energy = {
		"activity_study_energy",
		"4",
		-1
	},
	activity_study_energy_limit = {
		"activity_study_energy_limit",
		"4",
		-1
	},
	activity_study_host = {
		"activity_study_host",
		"2",
		-1
	},
	old_building_start_time = {
		"old_building_start_time",
		"1610668800",
		-1
	},
	artifact_shop_start_time = {
		"artifact_shop_start_time",
		"1611273600",
		-1
	},
	travel_train_grade_limit = {
		"travel_train_grade_limit",
		"1#0|2#1|3#1|4#2|5#2|6#3|7#3|8#4|9#4|10#5|11#5|12#6|13#6|14#7|15#7|16#8|17#8|18#9|19#9|20#10|21#10|22#11|23#11|24#12|25#12|26#13|27#13|28#14|29#14|30#15",
		-1
	},
	travel_train_slot_limit = {
		"travel_train_slot_limit",
		"1#1|11#2|21#3",
		-1
	},
	travel_building_slot_limit = {
		"travel_building_slot_limit",
		"1#1|15#2|25#3|35#4",
		-1
	},
	travel_train_facility_limit = {
		"travel_train_facility_limit",
		"1#0|2#3|3#6|4#9|5#12|6#15|7#18|8#21|9#24|10#27|11#30|12#33|13#36|14#39|15#42|16#45|17#48|18#51|19#54|20#57|21#60|22#63|23#66|24#69|25#72|26#75|27#78|28#81|29#84|30#87|31#90|32#93|33#96|34#99|35#102|36#105|37#108|38#111|39#114|40#117|41#120|42#123|43#126|44#129|45#132|46#135|47#138|48#141|49#144|50#147",
		-1
	},
	travel_facility_cd = {
		"travel_facility_cd",
		"3600|3600|3600",
		-1
	},
	travel_event_model = {
		"travel_event_model",
		"65501601|5100302|5301103|5400203|5500402",
		-1
	},
	travel_event_consume = {
		"travel_event_consume",
		"203#10",
		-1
	},
	travel_strong_enemy_condition = {
		"travel_strong_enemy_condition",
		"5|2",
		-1
	},
	travel_buy_time_limit = {
		"travel_buy_time_limit",
		"10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26",
		-1
	},
	travel_buy = {
		"travel_buy",
		"203#10|2#20",
		-1
	},
	travel_begin_amount = {
		"travel_begin_amount",
		"50000|10|50",
		-1
	},
	mission_act_point_exchange = {
		"mission_act_point_exchange",
		"2#5",
		-1
	},
	activity_newbee_fund_sell_time = {
		"activity_newbee_fund_sell_time",
		"7",
		-1
	},
	activity_newbee_fund_get_time = {
		"activity_newbee_fund_get_time",
		"30",
		-1
	},
	newbee_10gacha_time = {
		"newbee_10gacha_time",
		"604800",
		-1
	},
	newbee_10gacha = {
		"newbee_10gacha",
		"1#3#6|2#4#4|2#8#0|4#6#0|8#2#0",
		-1
	},
	newbee_10gacha2 = {
		"newbee_10gacha2",
		"1#3#6|2#4#4|2#8#0|4#6#0|8#2#0",
		-1
	},
	newbee_10gacha_dropbox = {
		"newbee_10gacha_dropbox",
		"900009|900010|900011",
		-1
	},
	newbee_10gacha_dropbox2 = {
		"newbee_10gacha_dropbox2",
		"900002|900003|900004",
		-1
	},
	activity_newbee_fund_level_limit = {
		"activity_newbee_fund_level_limit",
		"10",
		-1
	},
	activity_63_hero_model = {
		"activity_63_hero_model",
		"guojia_pifu03_lihui01|-340|-1178|0.864|1",
		-1
	},
	activity_newbee_total_value = {
		"activity_newbee_total_value",
		"20000",
		-1
	},
	newbee_10gacha_partner_jump = {
		"newbee_10gacha_partner_jump",
		"51017|53017|54017|52018",
		-1
	},
	activity_mission_time = {
		"activity_mission_time",
		"7|14",
		-1
	},
	activity_newbee_gacha_security_time = {
		"activity_newbee_gacha_security_time",
		"20|5",
		-1
	},
	activity_newbee_gacha_dropbox = {
		"activity_newbee_gacha_dropbox",
		900005,
		-1
	},
	activity_newbee_gacha_dropbox_5 = {
		"activity_newbee_gacha_dropbox_5",
		900006,
		-1
	},
	activity_newbee_gacha_jump = {
		"activity_newbee_gacha_jump",
		"55006|55007|56006|56005",
		-1
	},
	activity_newbee_gacha_cost = {
		"activity_newbee_gacha_cost",
		"202#1",
		-1
	},
	activity_newbee_gacha_time = {
		"activity_newbee_gacha_time",
		"604800",
		-1
	},
	newbee_gacha_giftbag_limit = {
		"newbee_gacha_giftbag_limit",
		"5",
		-1
	},
	newbee_gacha_giftbag_cost = {
		"newbee_gacha_giftbag_cost",
		"2#600@202#4|4203016#1",
		-1
	},
	govern_team_offline_notice = {
		"govern_team_offline_notice",
		"7",
		-1
	},
	plot_unlock_item = {
		"plot_unlock_item",
		"208",
		-1
	},
	plot_unlock_item_limit = {
		"plot_unlock_item_limit",
		"10",
		-1
	},
	plot_unlock_item_recover = {
		"plot_unlock_item_recover",
		"10800#1",
		-1
	},
	potential_plan_num = {
		"potential_plan_num",
		"11#1|13#2|15#3",
		-1
	},
	old_building_buff_num = {
		"old_building_buff_num",
		"0|20|40|0",
		-1
	},
	old_building_buff_num_2 = {
		"old_building_buff_num_2",
		"0|0|0|9",
		-1
	},
	old_building_buff_lock_1 = {
		"old_building_buff_lock_1",
		"3|3|2|1|1",
		-1
	},
	old_building_buff_lock_2 = {
		"old_building_buff_lock_2",
		"3|3|3|3|2",
		-1
	},
	old_building_buff_lock_3 = {
		"old_building_buff_lock_3",
		"3|3|3|3|6",
		-1
	},
	old_building_buff_lock_4 = {
		"old_building_buff_lock_4",
		"3|3|3|3|7",
		-1
	},
	fair_arena_explore_chance_once = {
		"fair_arena_explore_chance_once",
		6,
		-1
	},
	fair_arena_explore_chance_day = {
		"fair_arena_explore_chance_day",
		2,
		-1
	},
	fair_arena_explore_chance_price = {
		"fair_arena_explore_chance_price",
		"2#100|2#200|2#300|2#400|2#400|2#400|2#400|2#400|2#400|2#400|2#400|2#400",
		-1
	},
	fair_arena_explore_play_time = {
		"fair_arena_explore_play_time",
		1,
		-1
	},
	fair_arena_explore_replay_price = {
		"fair_arena_explore_replay_price",
		"2#150",
		-1
	},
	fair_arena_simu_chance = {
		"fair_arena_simu_chance",
		5,
		-1
	},
	fair_arena_records_amount = {
		"fair_arena_records_amount",
		10,
		-1
	},
	fair_arena_partners_amount_origin = {
		"fair_arena_partners_amount_origin",
		5,
		-1
	},
	fair_arena_collection_sort_type_show_list = {
		"fair_arena_collection_sort_type_show_list",
		"2|9|4|5|6|7",
		-1
	},
	activity_pet_giftbag_limit = {
		"activity_pet_giftbag_limit",
		"2",
		-1
	},
	activity_pet_giftbag_cost = {
		"activity_pet_giftbag_cost",
		"2#2000@26#3600|27#720|216#360",
		-1
	},
	activity_pet_task_golem_id = {
		"activity_pet_task_golem_id",
		"901",
		-1
	},
	activity_valentine_plot_memory = {
		"activity_valentine_plot_memory",
		"158|159|160|161|162",
		-1
	},
	activity_valentine_plot_model_id = {
		"activity_valentine_plot_model_id",
		"5401203",
		-1
	},
	activity_valentine_plot_model_animation = {
		"activity_valentine_plot_model_animation",
		"houseidle|hit",
		-1
	},
	potential_name_length_limit = {
		"potential_name_length_limit",
		"1|12",
		-1
	},
	activity_newbee_total_value2 = {
		"activity_newbee_total_value2",
		"30000",
		-1
	},
	activity_newbee_fund2_start_time = {
		"activity_newbee_fund2_start_time",
		"1616112000",
		-1
	},
	activity_sprouts_10_award = {
		"activity_sprouts_10_award",
		"10|215#10",
		-1
	},
	activity_sprouts_point_award = {
		"activity_sprouts_point_award",
		"80|930200#50",
		-1
	},
	activity_sprouts_partner_award = {
		"activity_sprouts_partner_award",
		"51014",
		-1
	},
	battle_version = {
		"battle_version",
		"4",
		-1
	},
	activity_newbee_fund_get_time_new = {
		"activity_newbee_fund_get_time_new",
		"20",
		-1
	},
	puppet_debris_id = {
		"puppet_debris_id",
		"940031|940032|940033|940034|940035|940036|940041|940042|940043|940044|940045|940046|940047|940048|940049|940050|940051|940052",
		-1
	},
	activity_new_partner_test_id = {
		"activity_new_partner_test_id",
		"51014",
		-1
	},
	pet_exlevel_add_pas = {
		"pet_exlevel_add_pas",
		"0|0|0|0|5|5|5|5|5|10|10|10|10|10|15|15|15|15|15|20",
		-1
	},
	pet_exlevel_unlock_cost = {
		"pet_exlevel_unlock_cost",
		"1#1000000|27#5|216#10",
		-1
	},
	guild_competition_time = {
		"guild_competition_time",
		"3|7|1",
		-1
	},
	guild_competition_boss_limit = {
		"guild_competition_boss_limit",
		30,
		-1
	},
	guild_competition_personal_limit = {
		"guild_competition_personal_limit",
		3,
		-1
	},
	guild_competition_challenge = {
		"guild_competition_challenge",
		"1.1|1.2|1.3",
		-1
	},
	guild_competition_partner_cost = {
		"guild_competition_partner_cost",
		"1#50000",
		-1
	},
	partner_equip_job1 = {
		"partner_equip_job1",
		"1169|2169|3169|4169",
		-1
	},
	partner_equip_job2 = {
		"partner_equip_job2",
		"1269|2269|3269|4269",
		-1
	},
	partner_equip_job3 = {
		"partner_equip_job3",
		"1369|2369|3369|4369",
		-1
	},
	partner_equip_job4 = {
		"partner_equip_job4",
		"1469|2469|3469|4469",
		-1
	},
	partner_equip_job5 = {
		"partner_equip_job5",
		"1569|2569|3569|4569",
		-1
	},
	guild_competition_boss_model = {
		"guild_competition_boss_model",
		"753011#754017#753019|756009#757002#754013|757003#755009#752020",
		-1
	},
	guild_competition_frame_time = {
		"guild_competition_frame_time",
		"1670198400",
		-1
	},
	activity_puppet_item = {
		"activity_puppet_item",
		"217",
		-1
	},
	pet_exskill_open_level = {
		"pet_exskill_open_level",
		"120",
		-1
	},
	bp_lottery_cost = {
		"bp_lottery_cost",
		"221#50",
		-1
	},
	bp_lottery_dropbox = {
		"bp_lottery_dropbox",
		"800013",
		-1
	},
	bp_lottery_limit = {
		"bp_lottery_limit",
		"999",
		-1
	},
	activity_smash_egg_cost = {
		"activity_smash_egg_cost",
		"2#100|291#1",
		-1
	},
	activity_smash_egg_limit = {
		"activity_smash_egg_limit",
		"30",
		-1
	},
	travel_shop_time = {
		"travel_shop_time",
		"10800",
		-1
	},
	travel_shop_amount = {
		"travel_shop_amount",
		"6",
		-1
	},
	cdkey_gxb222_stage_id = {
		"cdkey_gxb222_stage_id",
		"11",
		-1
	},
	cdkey_gxb222_icon = {
		"cdkey_gxb222_icon",
		"guide_icon_22",
		-1
	},
	talk_text_line_limit = {
		"talk_text_line_limit",
		"20",
		-1
	},
	travel_event_model_u3 = {
		"travel_event_model_u3",
		"7030|5100302|5301103|5400203|5500402",
		-1
	},
	activity_bomb_make_cost = {
		"activity_bomb_make_cost",
		"225#25",
		-1
	},
	activity_bomb_make_lv = {
		"activity_bomb_make_lv",
		"100",
		-1
	},
	graduate_gift_partner = {
		"graduate_gift_partner",
		"53015|653022|753015",
		-1
	},
	graduate_gift_duration = {
		"graduate_gift_duration",
		"1209600",
		-1
	},
	graduate_gift_open_limit = {
		"graduate_gift_open_limit",
		"604800",
		-1
	},
	guild_shop_open_limit = {
		"guild_shop_open_limit",
		"4",
		-1
	},
	guild_shop_buy_limit = {
		"guild_shop_buy_limit",
		"2|3|10",
		-1
	},
	jop_lock_limit_less = {
		"jop_lock_limit_less",
		"6",
		-1
	},
	guild_sale_refresh_days = {
		"guild_sale_refresh_days",
		"1|3|5|6",
		-1
	},
	travel_quick_limit = {
		"travel_quick_limit",
		"3",
		-1
	},
	activity_course_learning_cost = {
		"activity_course_learning_cost",
		"231#10",
		-1
	},
	activity_course_learning_award1 = {
		"activity_course_learning_award1",
		800020,
		-1
	},
	activity_course_learning_award2 = {
		"activity_course_learning_award2",
		"0.008#1000|0.009#3500|0.01#4000|0.011#1485|1#15",
		-1
	},
	activity_time_refresh_free = {
		"activity_time_refresh_free",
		"1",
		-1
	},
	activity_time_refresh_pay = {
		"activity_time_refresh_pay",
		"2#100",
		-1
	},
	activity_time_gamble_cost = {
		"activity_time_gamble_cost",
		"235#1",
		-1
	},
	activity_time_gamble_total = {
		"activity_time_gamble_total",
		10000,
		-1
	},
	activity_time_gamble_initial = {
		"activity_time_gamble_initial",
		"10",
		-1
	},
	activity_time_gamble_add = {
		"activity_time_gamble_add",
		"2",
		-1
	},
	activity_time_gamble_num = {
		"activity_time_gamble_num",
		"49",
		-1
	},
	activity_time_gamble_get = {
		"activity_time_gamble_get",
		"236",
		-1
	},
	activity_time_gamble_weight = {
		"activity_time_gamble_weight",
		"4#40|5#30|6#20|7#10",
		-1
	},
	activity_time_partner_id = {
		"activity_time_partner_id",
		54015,
		-1
	},
	activity_time_monster_id = {
		"activity_time_monster_id",
		1300049,
		-1
	},
	activity_time_battle_id = {
		"activity_time_battle_id",
		1300050,
		-1
	},
	activity_time_giftbag_limit = {
		"activity_time_giftbag_limit",
		"1",
		-1
	},
	activity_time_giftbag_cost = {
		"activity_time_giftbag_cost",
		"2#3000@316#10|302#10|20#10",
		-1
	},
	partner_signature_length_limit = {
		"partner_signature_length_limit",
		"3",
		-1
	},
	activity_fair_arena_battle_time = {
		"activity_fair_arena_battle_time",
		"6|1",
		-1
	},
	monthly_card_offer_giftbag = {
		"monthly_card_offer_giftbag",
		"282|283",
		-1
	},
	battlepass_106_hero_model = {
		"battlepass_106_hero_model",
		"weila_pifu03_lihui01|-150|-660|-0.6",
		-1
	},
	battlepass_124_hero_model = {
		"battlepass_124_hero_model",
		"weila_pifu03_lihui01|-150|-660|-0.6",
		-1
	},
	questionnaire_other_limit = {
		"questionnaire_other_limit",
		"200|12",
		-1
	},
	space_explore_dropbox = {
		"space_explore_dropbox",
		"40004",
		-1
	},
	adventure_giftbag_refresh_time = {
		"adventure_giftbag_refresh_time",
		604800,
		-1
	},
	space_explore_hurt_time = {
		"space_explore_hurt_time",
		"8",
		-1
	},
	adventure_giftbag_limit_giftbag = {
		"adventure_giftbag_limit_giftbag",
		"285",
		-1
	},
	adventure_giftbag_limit_partner = {
		"adventure_giftbag_limit_partner",
		"101023",
		-1
	},
	space_explore_gacha_cost = {
		"space_explore_gacha_cost",
		"238#1",
		-1
	},
	space_explore_gacha_guarantee = {
		"space_explore_gacha_guarantee",
		"50",
		-1
	},
	space_explore_begin_partner = {
		"space_explore_begin_partner",
		"101022",
		-1
	},
	giftbag_new_show = {
		"giftbag_new_show",
		"36|103|122|144|159|167|210",
		-1
	},
	space_explore_buff_look = {
		"space_explore_buff_look",
		"2001|2002|2003|2004|2005",
		-1
	},
	space_explore_buff_look_null = {
		"space_explore_buff_look_null",
		"3001|3002|3003",
		-1
	},
	space_explore_damage_min = {
		"space_explore_damage_min",
		"50",
		-1
	},
	space_explore_guide_place = {
		"space_explore_guide_place",
		"2",
		-1
	},
	space_explore_restore_cost = {
		"space_explore_restore_cost",
		"2#20",
		-1
	},
	pet_training_lock_level = {
		"pet_training_lock_level",
		"120",
		-1
	},
	pet_training_lesson_num = {
		"pet_training_lesson_num",
		"3",
		-1
	},
	pet_training_lesson_pet = {
		"pet_training_lesson_pet",
		"1|3",
		-1
	},
	pet_training_pet_atk = {
		"pet_training_pet_atk",
		"5|20|2",
		-1
	},
	pet_training_pet_damage = {
		"pet_training_pet_damage",
		"0.8|1.2",
		-1
	},
	pet_training_boss_limit = {
		"pet_training_boss_limit",
		"3",
		-1
	},
	pet_training_pet_energy = {
		"pet_training_pet_energy",
		"2",
		-1
	},
	pet_training_energy_buy_limit = {
		"pet_training_energy_buy_limit",
		"2",
		-1
	},
	pet_training_energy_buy_cost = {
		"pet_training_energy_buy_cost",
		"2#80|2#120",
		-1
	},
	pet_training_lesson_award = {
		"pet_training_lesson_award",
		"0#1|300#1.1|400#1.2|450#1.3|500#1.4|540#1.5",
		-1
	},
	pet_training_boss_level = {
		"pet_training_boss_level",
		"120",
		-1
	},
	activity_course_learning_2_cost = {
		"activity_course_learning_2_cost",
		"231#10",
		-1
	},
	activity_course_learning_2_award1 = {
		"activity_course_learning_2_award1",
		800020,
		-1
	},
	activity_course_learning_2_award2 = {
		"activity_course_learning_2_award2",
		"0.008#1000|0.009#3500|0.01#4000|0.011#1485|1#15",
		-1
	},
	activity_return2_point_exchange = {
		"activity_return2_point_exchange",
		"2#2",
		-1
	},
	activity_return2_time1 = {
		"activity_return2_time1",
		1209600,
		-1
	},
	activity_return2_time2 = {
		"activity_return2_time2",
		1814400,
		-1
	},
	activity_return2_time3 = {
		"activity_return2_time3",
		1209600,
		-1
	},
	activity_return2_time4 = {
		"activity_return2_time4",
		1814400,
		-1
	},
	activity_return2_time5 = {
		"activity_return2_time5",
		1209600,
		-1
	},
	activity_return2_limit = {
		"activity_return2_limit",
		"60|30",
		-1
	},
	activity_return2_limit_add = {
		"activity_return2_limit_add",
		"10|30",
		-1
	},
	activity_popularity_vote_grouping = {
		"activity_popularity_vote_grouping",
		"1|11|6|16|2|12|5|15|3|9|8|14|4|10|7|13",
		-1
	},
	activity_popularity_vote_stagetime = {
		"activity_popularity_vote_stagetime",
		"2|4|6|8|10|12|14|16|19|21",
		-1
	},
	activity_warmup_arena_guess_cost = {
		"activity_warmup_arena_guess_cost",
		"36#1|1#1000000",
		-1
	},
	activity_warmup_arena_guess_award = {
		"activity_warmup_arena_guess_award",
		"36#3|1#3000000",
		-1
	},
	activity_warmup_arena_attacks_limit2 = {
		"activity_warmup_arena_attacks_limit2",
		"6",
		-1
	},
	activity_warmup_arena_plotid = {
		"activity_warmup_arena_plotid",
		"5567",
		-1
	},
	cycle_giftbag_start_time = {
		"cycle_giftbag_start_time",
		1625184000,
		-1
	},
	activity_3birthday_gamble1 = {
		"activity_3birthday_gamble1",
		"248#5",
		-1
	},
	activity_3birthday_gamble2 = {
		"activity_3birthday_gamble2",
		"248#35",
		-1
	},
	annual_filter = {
		"annual_filter",
		"1623196800|22|100",
		-1
	},
	activity_popularity_vote_cost = {
		"activity_popularity_vote_cost",
		"249#1|250#1",
		-1
	},
	activity_return2_mission_score = {
		"activity_return2_mission_score",
		"5",
		-1
	},
	annual3_review_friends = {
		"annual3_review_friends",
		"15",
		-1
	},
	annual3_review_partners_lack = {
		"annual3_review_partners_lack",
		"0.2",
		-1
	},
	annual3_review_partners_plenty = {
		"annual3_review_partners_plenty",
		"0.9",
		-1
	},
	activity_3birthday_dinner_batch = {
		"activity_3birthday_dinner_batch",
		"10",
		-1
	},
	max_dress_style = {
		"max_dress_style",
		"5",
		-1
	},
	max_dress_point = {
		"max_dress_point",
		"10|50|100|150|200|300|400|500|600|750|900|1100|1300|1600|2000|2500|3000|3500|4000|4500|5000|5500",
		-1
	},
	max_guild_limit = {
		"max_guild_limit",
		"1000000",
		-1
	},
	min_guild_limit = {
		"min_guild_limit",
		"0",
		-1
	},
	change_guild_limit = {
		"change_guild_limit",
		"1000",
		-1
	},
	gacha_record_amount = {
		"gacha_record_amount",
		"50",
		-1
	},
	gacha_record_time_limit = {
		"gacha_record_time_limit",
		"30",
		-1
	},
	activity_beach_puzzle_cost = {
		"activity_beach_puzzle_cost",
		"253#10",
		-1
	},
	activity_beach_puzzle_dropbox = {
		"activity_beach_puzzle_dropbox",
		"240101",
		-1
	},
	dress_gacha_dropbox1 = {
		"dress_gacha_dropbox1",
		"50002",
		-1
	},
	dress_gacha_dropbox2 = {
		"dress_gacha_dropbox2",
		"50004",
		-1
	},
	dress_gacha_dropbox3 = {
		"dress_gacha_dropbox3",
		"50005",
		-1
	},
	dress_gacha_max_drop = {
		"dress_gacha_max_drop",
		"100",
		-1
	},
	dress_gacha_weight_total = {
		"dress_gacha_weight_total",
		"100000",
		-1
	},
	dress_gacha_weight_get1 = {
		"dress_gacha_weight_get1",
		"1500",
		-1
	},
	dress_gacha_weight_add = {
		"dress_gacha_weight_add",
		"50|400",
		-1
	},
	dress_gacha_weight_get2 = {
		"dress_gacha_weight_get2",
		"0.5",
		-1
	},
	dress_gacha_cost1 = {
		"dress_gacha_cost1",
		"258#1",
		-1
	},
	dress_gacha_cost2 = {
		"dress_gacha_cost2",
		"258#1|259#1",
		-1
	},
	activity_jungle_cost = {
		"activity_jungle_cost",
		"255#1",
		-1
	},
	activity_jungle_dropbox = {
		"activity_jungle_dropbox",
		250101,
		-1
	},
	activity_popularity_vote_open = {
		"activity_popularity_vote_open",
		"0",
		-1
	},
	dress_gacha_dropbox4 = {
		"dress_gacha_dropbox4",
		"50001",
		-1
	},
	dress_gacha_dropbox5 = {
		"dress_gacha_dropbox5",
		"50003",
		-1
	},
	dress_common_fragment_qlt_item_ids = {
		"dress_common_fragment_qlt_item_ids",
		"3999991|3999992|3999993|3999994|3999995|3999996",
		-1
	},
	dress_gacha_show = {
		"dress_gacha_show",
		"3101171|3101177|3101183|3101189|3101195",
		-1
	},
	dress_gacha_free1 = {
		"dress_gacha_free1",
		"86400|1",
		-1
	},
	dress_gacha_free2 = {
		"dress_gacha_free2",
		"43200|1",
		-1
	},
	activity_equip_decompose = {
		"activity_equip_decompose",
		"262|999999999999|6000",
		-1
	},
	activity_warmup_arena_score_start = {
		"activity_warmup_arena_score_start",
		"0",
		-1
	},
	activity_warmup_arena_awards_rank = {
		"activity_warmup_arena_awards_rank",
		"0",
		-1
	},
	activity_warmup_arena_awards = {
		"activity_warmup_arena_awards",
		"8063#1",
		-1
	},
	activity_warmup_arena_energy_start = {
		"activity_warmup_arena_energy_start",
		"3",
		-1
	},
	activity_warmup_arena_energy_reset = {
		"activity_warmup_arena_energy_reset",
		"10",
		-1
	},
	activity_warmup_arena_buy_costs = {
		"activity_warmup_arena_buy_costs",
		"2#20",
		-1
	},
	activity_warmup_arena_partners = {
		"activity_warmup_arena_partners",
		"756012",
		-1
	},
	activity_warmup_arena_revenge = {
		"activity_warmup_arena_revenge",
		"1",
		-1
	},
	guild_quick_order_open = {
		"guild_quick_order_open",
		"5",
		-1
	},
	gacha_10drawcard_endtime = {
		"gacha_10drawcard_endtime",
		"1674777600",
		-1
	},
	dress_gacha_activity_show = {
		"dress_gacha_activity_show",
		"40",
		-1
	},
	activity_equip_exchange_cost = {
		"activity_equip_exchange_cost",
		"268#3|268#6|268#9|268#12",
		-1
	},
	activity_equip_exchange_6 = {
		"activity_equip_exchange_6",
		"1166|2166|3166|4166#1266|2266|3266|4266#1366|2366|3366|4366#1466|2466|3466|4466#1566|2566|3566|4566",
		-1
	},
	activity_equip_exchange_1 = {
		"activity_equip_exchange_1",
		"1167|2167|3167|4167#1267|2267|3267|4267#1367|2367|3367|4367#1467|2467|3467|4467#1567|2567|3567|4567",
		-1
	},
	activity_equip_exchange_2 = {
		"activity_equip_exchange_2",
		"1168|2168|3168|4168#1268|2268|3268|4268#1368|2368|3368|4368#1468|2468|3468|4468#1568|2568|3568|4568",
		-1
	},
	activity_equip_exchange_3 = {
		"activity_equip_exchange_3",
		"1169|2169|3169|4169#1269|2269|3269|4269#1369|2369|3369|4369#1469|2469|3469|4469#1569|2569|3569|4569",
		-1
	},
	house_senpai_scale = {
		"house_senpai_scale",
		"0.7",
		-1
	},
	activity_red_riding_hood_awards_2 = {
		"activity_red_riding_hood_awards_2",
		"10#10000|14#10000",
		-1
	},
	activity_red_riding_hood_awards_3 = {
		"activity_red_riding_hood_awards_3",
		"940059#15|93#1",
		-1
	},
	house_senpai_shadow_scale = {
		"house_senpai_shadow_scale",
		"0.51|0.69",
		-1
	},
	dress_gacha_start_time = {
		"dress_gacha_start_time",
		"1631232000",
		-1
	},
	activity_pray_omni_pro = {
		"activity_pray_omni_pro",
		"9|10",
		-1
	},
	activity_pray_get = {
		"activity_pray_get",
		"269#1",
		-1
	},
	activity_pray_omni_num = {
		"activity_pray_omni_num",
		"282#100",
		-1
	},
	activity_monthly_skill_limit = {
		"activity_monthly_skill_limit",
		"0|30|50",
		-1
	},
	return_treasure_cost = {
		"return_treasure_cost",
		"2#500",
		-1
	},
	return_treasure_ratio = {
		"return_treasure_ratio",
		"0.6",
		-1
	},
	activity_fish_extra_pro = {
		"activity_fish_extra_pro",
		"1000",
		-1
	},
	activity_fish_extraawards = {
		"activity_fish_extraawards",
		"32004",
		-1
	},
	activity_fish_cost = {
		"activity_fish_cost",
		"283#5",
		-1
	},
	activity_pray_buy_get = {
		"activity_pray_buy_get",
		"269#1",
		-1
	},
	activity_tea_point = {
		"activity_tea_point",
		"1",
		-1
	},
	space_explore_auto_level = {
		"space_explore_auto_level",
		"31",
		-1
	},
	custom_skin_summer_houyi_or_feisina = {
		"custom_skin_summer_houyi_or_feisina",
		"2#300",
		-1
	},
	entrance_test_help_show = {
		"entrance_test_help_show",
		756012,
		-1
	},
	activity_lafuli_get = {
		"activity_lafuli_get",
		"283#1",
		-1
	},
	house_senpai_sit = {
		"house_senpai_sit",
		"-20|-30",
		-1
	},
	house_senpai_lie = {
		"house_senpai_lie",
		"15|-40",
		-1
	},
	time_cloister_energy_time = {
		"time_cloister_energy_time",
		"360",
		-1
	},
	time_cloister_card_time = {
		"time_cloister_card_time",
		"300",
		-1
	},
	time_cloister_cost = {
		"time_cloister_cost",
		"",
		-1
	},
	time_cloister_time_accelerata = {
		"time_cloister_time_accelerata",
		"287|600",
		-1
	},
	time_cloister_clear = {
		"time_cloister_clear",
		"0.85",
		-1
	},
	activity_tea_getway = {
		"activity_tea_getway",
		"14",
		-1
	},
	boss_act_skill_reset_cost = {
		"boss_act_skill_reset_cost",
		"2#100",
		-1
	},
	time_cloister_fight_energy_init = {
		"time_cloister_fight_energy_init",
		"289#10",
		-1
	},
	time_cloister_fight_energy_max = {
		"time_cloister_fight_energy_max",
		"289#10",
		-1
	},
	time_cloister_fight_energy_cd = {
		"time_cloister_fight_energy_cd",
		1800,
		-1
	},
	time_cloister_fight_energy_cost = {
		"time_cloister_fight_energy_cost",
		"289#1",
		-1
	},
	robot_dress_unit = {
		"robot_dress_unit",
		"1007501|1007601|1007701|1007801|1007901",
		-1
	},
	boss_act_key_hp = {
		"boss_act_key_hp",
		"25|50|75",
		-1
	},
	school_practise_switch_time = {
		"school_practise_switch_time",
		"1633046400",
		-1
	},
	time_cloister_sp_battle_rate = {
		"time_cloister_sp_battle_rate",
		"0.0002|1",
		-1
	},
	time_cloister_sp_battle_base_point = {
		"time_cloister_sp_battle_base_point",
		"10|0.5|2|0.5|1|0.5",
		-1
	},
	activity_monthly_stage6 = {
		"activity_monthly_stage6",
		"1|14|26#27",
		-1
	},
	new_arena_all_server_time = {
		"new_arena_all_server_time",
		"1635638400",
		-1
	},
	arena_all_server_schedule = {
		"arena_all_server_schedule",
		"1|19|3|3|2",
		-1
	},
	arena_all_server_cost = {
		"arena_all_server_cost",
		"34#2|34#2|34#2|34#2|34#2|34#3|34#3|34#3|34#3|34#3|34#4|34#4|34#4|34#4|34#4|34#5",
		-1
	},
	arena_all_server_same_num = {
		"arena_all_server_same_num",
		3,
		-1
	},
	arena_all_server_refresh_num = {
		"arena_all_server_refresh_num",
		"7",
		-1
	},
	arena_all_server_rank_num = {
		"arena_all_server_rank_num",
		320,
		-1
	},
	arena_all_server_award_limit = {
		"arena_all_server_award_limit",
		"10",
		-1
	},
	arena_all_server_area = {
		"arena_all_server_area",
		5,
		-1
	},
	arena_all_server_knockout = {
		"arena_all_server_knockout",
		"8|16|5",
		-1
	},
	arena_all_server_finals = {
		"arena_all_server_finals",
		"8|16|5",
		-1
	},
	arena_all_server_partner_round = {
		"arena_all_server_partner_round",
		"2",
		-1
	},
	activity_trickortreat_buy = {
		"activity_trickortreat_buy",
		"2#200",
		-1
	},
	activity_trickortreat_buy_limit = {
		"activity_trickortreat_buy_limit",
		"100",
		-1
	},
	activity_trickortreat_point = {
		"activity_trickortreat_point",
		"2|1",
		-1
	},
	activity_trickortreat_point_full = {
		"activity_trickortreat_point_full",
		"200",
		-1
	},
	activity_trickortreat_point_award = {
		"activity_trickortreat_point_award",
		"299#1",
		-1
	},
	activity_trickortreat_cost = {
		"activity_trickortreat_cost",
		"297#1",
		-1
	},
	activity_trickortreat_get = {
		"activity_trickortreat_get",
		"297#1",
		-1
	},
	fair_arena_ticket_item = {
		"fair_arena_ticket_item",
		"301#1",
		-1
	},
	fair_arena_free = {
		"fair_arena_free",
		"1#2|3#1|5#1",
		-1
	},
	fair_arena_ticket_price = {
		"fair_arena_ticket_price",
		"2#400",
		-1
	},
	fair_arena_buy_time = {
		"fair_arena_buy_time",
		"2",
		-1
	},
	fair_arena_winrate_amount = {
		"fair_arena_winrate_amount",
		"30",
		-1
	},
	fair_arena_winrate_threshold = {
		"fair_arena_winrate_threshold",
		"0.1",
		-1
	},
	fair_arena_free_mail = {
		"fair_arena_free_mail",
		"209",
		-1
	},
	fair_arena_explore_stage = {
		"fair_arena_explore_stage",
		"42",
		-1
	},
	main_bg_volume = {
		"main_bg_volume",
		"0.4",
		-1
	},
	find_treasure_sp_count = {
		"find_treasure_sp_count",
		"20|140|230|340|450|570|600|750|1050|1200",
		-1
	},
	find_treasure_sp_last = {
		"find_treasure_sp_last",
		"4|14|14|15|15|17|17|19|21|23",
		-1
	},
	find_treasure_base_rate = {
		"find_treasure_base_rate",
		"0",
		-1
	},
	find_treasure_increase_rate = {
		"find_treasure_increase_rate",
		"0.02",
		-1
	},
	find_treasure_modle = {
		"find_treasure_modle",
		"5301601|5100203|5201401",
		-1
	},
	find_treasure_item = {
		"find_treasure_item",
		"302#1",
		-1
	},
	find_treasure_autostep = {
		"find_treasure_autostep",
		"40",
		-1
	},
	find_treasure_skipstep = {
		"find_treasure_skipstep",
		"40",
		-1
	},
	find_treasure_treasurestep = {
		"find_treasure_treasurestep",
		"20",
		-1
	},
	thanksgiving_giftawards = {
		"thanksgiving_giftawards",
		"36#10|358#5|4201042#5",
		-1
	},
	thanksgiving_giftcost = {
		"thanksgiving_giftcost",
		"2#2000",
		-1
	},
	activity_fish_golden_awards = {
		"activity_fish_golden_awards",
		"976001#10|258#2|259#2",
		-1
	},
	school_practise_quick1 = {
		"school_practise_quick1",
		"60",
		-1
	},
	school_practise_quick2 = {
		"school_practise_quick2",
		"30",
		-1
	},
	expedition_time_interval = {
		"expedition_time_interval",
		"1|12|1",
		-1
	},
	expedition_energy_cd = {
		"expedition_energy_cd",
		17280,
		-1
	},
	expedition_energy_max = {
		"expedition_energy_max",
		15,
		-1
	},
	expedition_energy_buy_count = {
		"expedition_energy_buy_count",
		2,
		-1
	},
	expedition_energy_price = {
		"expedition_energy_price",
		"2#100",
		-1
	},
	expedition_girls_lv = {
		"expedition_girls_lv",
		100,
		-1
	},
	expedition_girls_labor = {
		"expedition_girls_labor",
		24,
		-1
	},
	expedition_girls_labor_cd = {
		"expedition_girls_labor_cd",
		3600,
		-1
	},
	expedition_gather_rank = {
		"expedition_gather_rank",
		50,
		-1
	},
	expedition_gather_price = {
		"expedition_gather_price",
		"2#50",
		-1
	},
	expedition_gather_cd = {
		"expedition_gather_cd",
		"86400|3600",
		-1
	},
	expedition_gather_show_count = {
		"expedition_gather_show_count",
		3,
		-1
	},
	expedition_state_battle = {
		"expedition_state_battle",
		3600,
		-1
	},
	expedition_win_enemyBuff = {
		"expedition_win_enemyBuff",
		"125600201|125600202|125600203|125600204",
		-1
	},
	expedition_hpLoseSeal = {
		"expedition_hpLoseSeal",
		125600001,
		-1
	},
	expedition_boss_partner = {
		"expedition_boss_partner",
		2000011,
		-1
	},
	activity_growth_plan_cost = {
		"activity_growth_plan_cost",
		"2#2",
		-1
	},
	activity_growth_plan_score = {
		"activity_growth_plan_score",
		"5",
		-1
	},
	activity_jackpot_gift = {
		"activity_jackpot_gift",
		"347",
		-1
	},
	activity_jackpot_transfer = {
		"activity_jackpot_transfer",
		"58#1|305#1",
		-1
	},
	activity_jackpot_unlock = {
		"activity_jackpot_unlock",
		"40",
		-1
	},
	activity_jackpot_normal = {
		"activity_jackpot_normal",
		"58#5",
		-1
	},
	activity_jackpot_updated = {
		"activity_jackpot_updated",
		"305#5",
		-1
	},
	activity_growth_plan_partner = {
		"activity_growth_plan_partner",
		"51018|52017|53016|54017",
		-1
	},
	activity_jackpot_draw = {
		"activity_jackpot_draw",
		"57#5",
		-1
	},
	activity_growth_plan_picture = {
		"activity_growth_plan_picture",
		"-73#-178#0.65#0.65|-54#-260#0.6#0.6|-71#-295#0.6#0.6|-47#-352#0.65#0.65",
		-1
	},
	activity_growth_plan_cut = {
		"activity_growth_plan_cut",
		"960#410#800#600|1088#100#750#700|1145#100#265#0|1225#0#760#0",
		-1
	},
	time_cloister_card_cd7 = {
		"time_cloister_card_cd7",
		21600,
		-1
	},
	time_cloister_card_cd10 = {
		"time_cloister_card_cd10",
		21600,
		-1
	},
	activity_luckyboxes_pointmax = {
		"activity_luckyboxes_pointmax",
		"100",
		-1
	},
	activity_luckyboxes_pointuprise = {
		"activity_luckyboxes_pointuprise",
		"2",
		-1
	},
	activity_luckyboxes_cost = {
		"activity_luckyboxes_cost",
		"309#1",
		-1
	},
	activity_christmas_socks_cost = {
		"activity_christmas_socks_cost",
		"310#1",
		-1
	},
	activity_christmas_socks_get = {
		"activity_christmas_socks_get",
		"311#1",
		-1
	},
	activity_christmas_socks_buy = {
		"activity_christmas_socks_buy",
		"2#20|311#1",
		-1
	},
	activity_christmas_socks_buy_limit = {
		"activity_christmas_socks_buy_limit",
		"100",
		-1
	},
	activity_christmas_socks_insure = {
		"activity_christmas_socks_insure",
		"100",
		-1
	},
	activity_newbee_gacha_old_close_time = {
		"activity_newbee_gacha_old_close_time",
		"1640260800",
		-1
	},
	activity_newbee_gacha_dropbox_new = {
		"activity_newbee_gacha_dropbox_new",
		"900005",
		-1
	},
	activity_newbee_gacha_dropbox_5_new = {
		"activity_newbee_gacha_dropbox_5_new",
		"900006",
		-1
	},
	activity_newbee_gacha_dropbox_new_time = {
		"activity_newbee_gacha_dropbox_new_time",
		"1640908800",
		-1
	},
	activity_christmas_socks_max = {
		"activity_christmas_socks_max",
		"300",
		-1
	},
	activity_newbee_gacha_jump_new = {
		"activity_newbee_gacha_jump_new",
		"55010|52017|53017|51016|54016|56008",
		-1
	},
	friend_apply_limit = {
		"friend_apply_limit",
		"50",
		-1
	},
	show_window_shop_refresh = {
		"show_window_shop_refresh",
		"604800",
		-1
	},
	show_window_point_rank = {
		"show_window_point_rank",
		"0|170|450|800|1100|1400",
		-1
	},
	gacha_guarantee_dropbox_2 = {
		"gacha_guarantee_dropbox_2",
		"10010",
		-1
	},
	gacha_ensure_guarantee_dropbox_2 = {
		"gacha_ensure_guarantee_dropbox_2",
		"10011",
		-1
	},
	gacha_guarantee_dropbox_8 = {
		"gacha_guarantee_dropbox_8",
		"10012",
		-1
	},
	gacha_ensure_weight_special_start = {
		"gacha_ensure_weight_special_start",
		"400",
		-1
	},
	gacha_ensure_weight_special_add = {
		"gacha_ensure_weight_special_add",
		"220",
		-1
	},
	wish_gacha_weight_special_start = {
		"wish_gacha_weight_special_start",
		"400",
		-1
	},
	wish_gacha_weight_special_add = {
		"wish_gacha_weight_special_add",
		"220",
		-1
	},
	firework_ticket_daily = {
		"firework_ticket_daily",
		46,
		-1
	},
	firework_ticket_buy_count = {
		"firework_ticket_buy_count",
		20,
		-1
	},
	firework_ticket_buy_prize = {
		"firework_ticket_buy_prize",
		"2#100",
		-1
	},
	firework_ticket_item = {
		"firework_ticket_item",
		316,
		-1
	},
	firework_token = {
		"firework_token",
		"317#1",
		-1
	},
	firework_ratio_5 = {
		"firework_ratio_5",
		5,
		-1
	},
	firework_fire_weights = {
		"firework_fire_weights",
		"0|50|50|50|50|50|20|0",
		-1
	},
	firework_energy = {
		"firework_energy",
		30,
		-1
	},
	firework_ratio_5_unlock = {
		"firework_ratio_5_unlock",
		"5|50",
		-1
	},
	firework_energy_init = {
		"firework_energy_init",
		"0",
		-1
	},
	activity_276_hero_model = {
		"activity_276_hero_model",
		"weiweian_pifu04_lihui01|510|-1092|0.67|5101305|7320",
		-1
	},
	new_pingfen_stage_id = {
		"new_pingfen_stage_id",
		"12|22|42|52|62|72|82|92|102|112|122|132|142",
		-1
	},
	new_pingfen_level_limit = {
		"new_pingfen_level_limit",
		35,
		-1
	},
	defense_team_save = {
		"defense_team_save",
		1.5,
		-1
	},
	activity_vampire_unlock = {
		"activity_vampire_unlock",
		"330#1",
		-1
	},
	activity_vampire_giftbag = {
		"activity_vampire_giftbag",
		"403",
		-1
	},
	activity_vampire_awake = {
		"activity_vampire_awake",
		"328#1|1",
		-1
	},
	shrine_open_limit = {
		"shrine_open_limit",
		"500",
		-1
	},
	shrine_time_start = {
		"shrine_time_start",
		1646956800,
		-1
	},
	shrine_time_interval = {
		"shrine_time_interval",
		"12|2",
		-1
	},
	shrine_hurdle_ticket = {
		"shrine_hurdle_ticket",
		"322#15",
		-1
	},
	shrine_hurdle_ticket_buy_cost = {
		"shrine_hurdle_ticket_buy_cost",
		"2#10",
		-1
	},
	shrine_hurdle_ticket_buy_limit = {
		"shrine_hurdle_ticket_buy_limit",
		"5",
		-1
	},
	shrine_hurdle_buff_giveup = {
		"shrine_hurdle_buff_giveup",
		"324#180",
		-1
	},
	shrine_hurdle_difficulty_count = {
		"shrine_hurdle_difficulty_count",
		"return %d/%d/10/(%d/10+1.5)+%d+5",
		-1
	},
	shrine_hurdle_difficulty_float = {
		"shrine_hurdle_difficulty_float",
		5,
		-1
	},
	shrine_hurdle_boss_score_count = {
		"shrine_hurdle_boss_score_count",
		"return math.ceil(1000*%d*(1-math.pow(2.71828,-0.00000000002*%d)))",
		-1
	},
	activity_vampire_battlepass_item = {
		"activity_vampire_battlepass_item",
		"327",
		-1
	},
	senpai_dress_guide_point = {
		"senpai_dress_guide_point",
		"300",
		-1
	},
	arena_corss_match_people_num = {
		"arena_corss_match_people_num",
		"1000",
		-1
	},
	arena_corss_match_base_people_num = {
		"arena_corss_match_base_people_num",
		"700",
		-1
	},
	arena_corss_match_oldserver_span = {
		"arena_corss_match_oldserver_span",
		"50",
		-1
	},
	arena_corss_match_midserver_span = {
		"arena_corss_match_midserver_span",
		"30",
		-1
	},
	arena_corss_match_newserver_scope = {
		"arena_corss_match_newserver_scope",
		"30",
		-1
	},
	arena_corss_match_midserver_scope = {
		"arena_corss_match_midserver_scope",
		"200",
		-1
	},
	arena_corss_match_join_server_time = {
		"arena_corss_match_join_server_time",
		"6",
		-1
	},
	arena_corss_match_continue_time = {
		"arena_corss_match_continue_time",
		"14",
		-1
	},
	arena_corss_match_start_time = {
		"arena_corss_match_start_time",
		"1650067200",
		-1
	},
	arena_corss_match_rest_time = {
		"arena_corss_match_rest_time",
		"60",
		-1
	},
	activity_lflcastle_score = {
		"activity_lflcastle_score",
		"335|336",
		-1
	},
	activity_lflcastle_score_max = {
		"activity_lflcastle_score_max",
		"300|400",
		-1
	},
	activity_lflcastle_dropbox = {
		"activity_lflcastle_dropbox",
		"1300001|1300002|1300003|1300004",
		-1
	},
	activity_lflcastle_energy = {
		"activity_lflcastle_energy",
		20,
		-1
	},
	activity_lflcastle_task_award = {
		"activity_lflcastle_task_award",
		"1|336#1",
		-1
	},
	activity_lflcastle_task_award_limit = {
		"activity_lflcastle_task_award_limit",
		100,
		-1
	},
	activity_promotion_ladder_material = {
		"activity_promotion_ladder_material",
		"51019|52020|56011|55013|56012",
		-1
	},
	activity_promotion_ladder_target = {
		"activity_promotion_ladder_target",
		"55014",
		-1
	},
	activity_promotion_ladder_star = {
		"activity_promotion_ladder_star",
		"5#1|6#2|7#2|8#2|9#3|10#5|11#6|12#7|13#7|14#8|15#9",
		-1
	},
	activity_promotion_ladder_basenum = {
		"activity_promotion_ladder_basenum",
		"341#10",
		-1
	},
	activity_promotion_ladder_interval = {
		"activity_promotion_ladder_interval",
		9,
		-1
	},
	activity_promotion_ladder_increasenum = {
		"activity_promotion_ladder_increasenum",
		"341#5",
		-1
	},
	activity_promotion_test_picture = {
		"activity_promotion_test_picture",
		"4",
		-1
	},
	activity_promotion_test_giftbag = {
		"activity_promotion_test_giftbag",
		"407|408",
		-1
	},
	crystal_card_box_refresh = {
		"crystal_card_box_refresh",
		"15",
		-1
	},
	activity_lasso_end = {
		"activity_lasso_end",
		"26",
		-1
	},
	activity_lasso_gamble = {
		"activity_lasso_gamble",
		"32011|32011|32011|32012|32012|32012|32009|32009|32009|32009|32010|32010|32010|32010",
		-1
	},
	activity_lasso_weight = {
		"activity_lasso_weight",
		"20|20|20|20|20|20|20|20|20|20|20|20|20|20",
		-1
	},
	activity_lasso_dropbox = {
		"activity_lasso_dropbox",
		"32013",
		-1
	},
	activity_lasso_dropbox_weight = {
		"activity_lasso_dropbox_weight",
		"1|2|100",
		-1
	},
	time_cloister_crystal_card_item = {
		"time_cloister_crystal_card_item",
		"338|339|340",
		-1
	},
	activity_lasso_cost = {
		"activity_lasso_cost",
		"343#1",
		-1
	},
	assistant_open_limit = {
		"assistant_open_limit",
		"3|3|8|5",
		-1
	},
	activity_promotion_ladder_picture = {
		"activity_promotion_ladder_picture",
		"partner_picture_55014#0.6#-138#-498",
		-1
	},
	activity_lottery_vip_exp = {
		"activity_lottery_vip_exp",
		"50|250|500|750|1000|1500|2000|2500|2500|3500|3500",
		-1
	},
	time_cloister_crystal_card_buy_tips = {
		"time_cloister_crystal_card_buy_tips",
		"500|500|500",
		-1
	},
	activity_clock_cost = {
		"activity_clock_cost",
		"345#1",
		-1
	},
	activity_newbee_fund_4items_preview = {
		"activity_newbee_fund_4items_preview",
		"2|36|20|940004",
		-1
	},
	foolsday_giftawards = {
		"foolsday_giftawards",
		"349#6|363#2|345#6|35#50",
		-1
	},
	foolsday_giftcost = {
		"foolsday_giftcost",
		"2#5000",
		-1
	},
	foolsday_giftlimit = {
		"foolsday_giftlimit",
		"1",
		-1
	},
	activity_simulation_gacha_10_dropbox1 = {
		"activity_simulation_gacha_10_dropbox1",
		"1310001",
		-1
	},
	activity_simulation_gacha_10_dropbox2 = {
		"activity_simulation_gacha_10_dropbox2",
		"1310002",
		-1
	},
	activity_simulation_gacha_10_dropbox3 = {
		"activity_simulation_gacha_10_dropbox3",
		"1310003",
		-1
	},
	activity_simulation_gacha_10_dropbox4 = {
		"activity_simulation_gacha_10_dropbox4",
		"1310004",
		-1
	},
	activity_simulation_gacha_10_entrepot_free = {
		"activity_simulation_gacha_10_entrepot_free",
		"1|2",
		-1
	},
	activity_simulation_gacha_10_entrepot_pay = {
		"activity_simulation_gacha_10_entrepot_pay",
		"2#50|2#100|2#200",
		-1
	},
	activity_simulation_gacha_10_time = {
		"activity_simulation_gacha_10_time",
		"7",
		-1
	},
	activity_simulation_gacha_10_open = {
		"activity_simulation_gacha_10_open",
		"7|6",
		-1
	},
	activity_simulation_gacha_10_entrepot_cost = {
		"activity_simulation_gacha_10_entrepot_cost",
		"346#1",
		-1
	},
	activity_simulation_gacha_10_guarantee_time = {
		"activity_simulation_gacha_10_guarantee_time",
		"4",
		-1
	},
	tower_giftbag_nopay_redmark = {
		"tower_giftbag_nopay_redmark",
		"20|100|200|300|360|420|480|540|600|660|720|760|800",
		-1
	},
	activity_freebuy_time = {
		"activity_freebuy_time",
		"9",
		-1
	},
	activity_simulation_gacha_10_giftbag_diamonds = {
		"activity_simulation_gacha_10_giftbag_diamonds",
		"346#1|36#10|4201024#5",
		-1
	},
	activity_simulation_gacha_10_giftbag_diamonds_cost = {
		"activity_simulation_gacha_10_giftbag_diamonds_cost",
		"2#5000",
		-1
	},
	activity_simulation_gacha_10_partner_id = {
		"activity_simulation_gacha_10_partner_id",
		"53018|52018|54017|51014",
		-1
	},
	new_trial_restart_close_time = {
		"new_trial_restart_close_time",
		"1649808000",
		-1
	},
	new_trial_restart_open_time = {
		"new_trial_restart_open_time",
		"1649980800",
		-1
	},
	new_trial_restart_close_time2 = {
		"new_trial_restart_close_time2",
		"1649721600",
		-1
	},
	new_trial_battlepass_point_paid_cost = {
		"new_trial_battlepass_point_paid_cost",
		"2#1",
		-1
	},
	new_trial_battlepass_point_paid_limit = {
		"new_trial_battlepass_point_paid_limit",
		"1000",
		-1
	},
	new_trial_battlepass_point_paid_cost2 = {
		"new_trial_battlepass_point_paid_cost2",
		"2#3",
		-1
	},
	new_trial_battlepass_point_paid_limit2 = {
		"new_trial_battlepass_point_paid_limit2",
		"1000",
		-1
	},
	new_trial_battlepass_point_paid_cost3 = {
		"new_trial_battlepass_point_paid_cost3",
		"2#5",
		-1
	},
	new_trial_battlepass_point_paid_limit3 = {
		"new_trial_battlepass_point_paid_limit3",
		"1000",
		-1
	},
	new_trial_battlepass_point_all = {
		"new_trial_battlepass_point_all",
		"3000",
		-1
	},
	activity_lottery_limit = {
		"activity_lottery_limit",
		"62",
		-1
	},
	activity_easter2022_cost1 = {
		"activity_easter2022_cost1",
		"347#1",
		-1
	},
	activity_easter2022_cost2 = {
		"activity_easter2022_cost2",
		"348#1",
		-1
	},
	activity_easter2022_weight = {
		"activity_easter2022_weight",
		"10000|100|100",
		-1
	},
	activity_easter2022_dropbox1 = {
		"activity_easter2022_dropbox1",
		"32014",
		-1
	},
	activity_easter2022_dropbox2 = {
		"activity_easter2022_dropbox2",
		"32015",
		-1
	},
	pet_training_hangup_awards2_coefficient = {
		"pet_training_hangup_awards2_coefficient",
		"0#1|200#1.05|400#1.10|600#1.15|800#1.20|1000#1.25|1200#1.30|1350#1.35|1450#1.40|1550#1.45|1620#1.50",
		-1
	},
	pet_training_hangup_cycle = {
		"pet_training_hangup_cycle",
		"600",
		-1
	},
	fair_arena_explore_revive_buff = {
		"fair_arena_explore_revive_buff",
		"3",
		-1
	},
	activity_lost_space_item_cost = {
		"activity_lost_space_item_cost",
		"349#1",
		-1
	},
	activity_lost_space_energy_get = {
		"activity_lost_space_energy_get",
		"350#1",
		-1
	},
	activity_lost_space_supply1 = {
		"activity_lost_space_supply1",
		2,
		-1
	},
	activity_lost_space_supply2 = {
		"activity_lost_space_supply2",
		3,
		-1
	},
	activity_lost_space_buy_cost = {
		"activity_lost_space_buy_cost",
		"2#100",
		-1
	},
	activity_lost_space_buy_limit = {
		"activity_lost_space_buy_limit",
		"40",
		-1
	},
	activity_lost_space_plot = {
		"activity_lost_space_plot",
		"5875",
		-1
	},
	skill_resonate_reset_cost = {
		"skill_resonate_reset_cost",
		"2#500",
		-1
	},
	star_origin_reset_cost = {
		"star_origin_reset_cost",
		"2#500",
		-1
	},
	partner_group7_summon = {
		"partner_group7_summon",
		"10270|10276|10280",
		-1
	},
	star_origin_drawcard_endtime = {
		"star_origin_drawcard_endtime",
		"1661472000",
		-1
	},
	skill_resonate_level_limit = {
		"skill_resonate_level_limit",
		"0|0|1|1|3|3|5|5|7|-1",
		-1
	},
	starry_altar_open_time = {
		"starry_altar_open_time",
		"1653004800",
		-1
	},
	activity_children_gamble_cost = {
		"activity_children_gamble_cost",
		"364#1",
		-1
	},
	activity_children_gamble_award = {
		"activity_children_gamble_award",
		"363#10",
		-1
	},
	activity_children_gamble_weight = {
		"activity_children_gamble_weight",
		"20",
		-1
	},
	activity_children_buy_cost = {
		"activity_children_buy_cost",
		"2#500",
		-1
	},
	activity_children_buy_limit = {
		"activity_children_buy_limit",
		"50",
		-1
	},
	activity_children_gamble_dropbox = {
		"activity_children_gamble_dropbox",
		"32016",
		-1
	},
	activity_lost_space_skill = {
		"activity_lost_space_skill",
		"4|5|6",
		-1
	},
	activity_spfarm_energy = {
		"activity_spfarm_energy",
		"371#3",
		-1
	},
	activity_spfarm_recover_max = {
		"activity_spfarm_recover_max",
		"99",
		-1
	},
	activity_spfarm_energy_price = {
		"activity_spfarm_energy_price",
		"2#100",
		-1
	},
	activity_spfarm_buy_max = {
		"activity_spfarm_buy_max",
		"15",
		-1
	},
	activity_spfarm_invase_amount = {
		"activity_spfarm_invase_amount",
		"0.2",
		-1
	},
	activity_spfarm_invase_max = {
		"activity_spfarm_invase_max",
		"3",
		-1
	},
	activity_spfarm_battle_pos = {
		"activity_spfarm_battle_pos",
		"1|3|5",
		-1
	},
	activity_spfarm_gate_style = {
		"activity_spfarm_gate_style",
		"0|3|5",
		-1
	},
	activity_spfarm_gift_daily = {
		"activity_spfarm_gift_daily",
		"371#3",
		-1
	},
	activity_dragonboat2022_cost = {
		"activity_dragonboat2022_cost",
		"375#2",
		-1
	},
	activity_dragonboat2022_extra_weight = {
		"activity_dragonboat2022_extra_weight",
		"5|100",
		-1
	},
	activity_dragonboat2022_extra_awards = {
		"activity_dragonboat2022_extra_awards",
		"407#1",
		-1
	},
	activity_dragonboat2022_extra_get = {
		"activity_dragonboat2022_extra_get",
		"20",
		-1
	},
	activity_dragonboat2022_dropbox = {
		"activity_dragonboat2022_dropbox",
		"32017",
		-1
	},
	activity_spfarm_server_gap = {
		"activity_spfarm_server_gap",
		"498",
		-1
	},
	activity_spfarm_record_count = {
		"activity_spfarm_record_count",
		"15",
		-1
	},
	activity_spfarm_fast = {
		"activity_spfarm_fast",
		"10|10",
		-1
	},
	activity_spfarm_gift_daily_id = {
		"activity_spfarm_gift_daily_id",
		"438",
		-1
	},
	activity_spfarm_fight_lvl = {
		"activity_spfarm_fight_lvl",
		"3",
		-1
	},
	activity_spfarm_time = {
		"activity_spfarm_time",
		"14|1",
		-1
	},
	activity_spfarm_dress = {
		"activity_spfarm_dress",
		"1027401",
		-1
	},
	activity_lost_space_extra_award = {
		"activity_lost_space_extra_award",
		"427",
		-1
	},
	activity_red_riding_hood_awards_4 = {
		"activity_red_riding_hood_awards_4",
		"424#33|4201042#27",
		-1
	},
	activity_lost_space_random_skill_group1 = {
		"activity_lost_space_random_skill_group1",
		"3|6",
		-1
	},
	activity_lost_space_random_skill_group2 = {
		"activity_lost_space_random_skill_group2",
		"1|2|4|5",
		-1
	},
	team_preset_cost = {
		"team_preset_cost",
		"50|150",
		-1
	},
	activity_lost_space_repeat_award = {
		"activity_lost_space_repeat_award",
		"31",
		-1
	},
	activity_4birthday_task_bigaward = {
		"activity_4birthday_task_bigaward",
		"384#1",
		-1
	},
	activity_4birthday_task_awards = {
		"activity_4birthday_task_awards",
		"25#10|29#5|36#10|258#5|20#5|73#10|170#10",
		-1
	},
	activity_4birthday_task_cost = {
		"activity_4birthday_task_cost",
		"378#10",
		-1
	},
	activity_4birthday_task_get = {
		"activity_4birthday_task_get",
		"379#3|2#50",
		-1
	},
	activity_4birthday_cost = {
		"activity_4birthday_cost",
		"379#1",
		-1
	},
	activity_4birthday_get = {
		"activity_4birthday_get",
		"380#1",
		-1
	},
	activity_4birthday_get_dropbox = {
		"activity_4birthday_get_dropbox",
		"32018",
		-1
	},
	activity_4birthday_bigawards = {
		"activity_4birthday_bigawards",
		"5100020#1|5100021#1|359#100000|360#500000",
		-1
	},
	activity_4birthday_award_num = {
		"activity_4birthday_award_num",
		"250|1150",
		-1
	},
	activity_4birthday_gamble_cost = {
		"activity_4birthday_gamble_cost",
		"380#35",
		-1
	},
	activity_4birthday_gamble_type_num = {
		"activity_4birthday_gamble_type_num",
		"6|3|1",
		-1
	},
	activity_4birthday_gamble_type_weight = {
		"activity_4birthday_gamble_type_weight",
		"60|30|10",
		-1
	},
	activity_4birthday_fx = {
		"activity_4birthday_fx",
		"3",
		-1
	},
	activity_4anniversary_sign_cost = {
		"activity_4anniversary_sign_cost",
		"2#50",
		-1
	},
	activity_4anniversary_sign_giftbag_limit = {
		"activity_4anniversary_sign_giftbag_limit",
		"444#3|445#6|446#9|447#12",
		-1
	},
	vip_award_version = {
		"vip_award_version",
		"2",
		-1
	},
	gacha_guarantee_double_partner = {
		"gacha_guarantee_double_partner",
		"icon_3999991",
		-1
	},
	year_summary_star_10 = {
		"year_summary_star_10",
		"755011|756010",
		-1
	},
	year_summary_star_5 = {
		"year_summary_star_5",
		"55012|56010",
		-1
	},
	activity_4birthday_plot_en_en = {
		"activity_4birthday_plot_en_en",
		"162|176|162|162|162|339|339",
		-1
	},
	activity_4birthday_plot_zh_tw = {
		"activity_4birthday_plot_zh_tw",
		"162|162|162|162|162|339|339",
		-1
	},
	activity_4birthday_plot_fr_fr = {
		"activity_4birthday_plot_fr_fr",
		"120|162|162|162|167|339|339",
		-1
	},
	activity_4birthday_plot_de_de = {
		"activity_4birthday_plot_de_de",
		"162|162|103|103|162|339|339",
		-1
	},
	activity_4birthday_plot_ja_jp = {
		"activity_4birthday_plot_ja_jp",
		"162|162|162|162|162|339|339",
		-1
	},
	activity_4birthday_plot_ko_kr = {
		"activity_4birthday_plot_ko_kr",
		"162|162|162|162|162|339|339",
		-1
	},
	activity_chime_cost1 = {
		"activity_chime_cost1",
		"385#1",
		-1
	},
	activity_chime_cost2 = {
		"activity_chime_cost2",
		"386#1",
		-1
	},
	activity_chime_get = {
		"activity_chime_get",
		20,
		-1
	},
	activity_cupid_gift_award = {
		"activity_cupid_gift_award",
		"32019",
		-1
	},
	activity_cupid_gift_draw = {
		"activity_cupid_gift_draw",
		"387#1",
		-1
	},
	activity_cupid_gift_mail_award = {
		"activity_cupid_gift_mail_award",
		"2#300",
		-1
	},
	activity_warmup_arena_boss_model = {
		"activity_warmup_arena_boss_model",
		"752015|751017|757003",
		-1
	},
	old_building_floor11_point = {
		"old_building_floor11_point",
		"1000",
		-1
	},
	activity_sand_gift = {
		"activity_sand_gift",
		456,
		-1
	},
	activity_sand_cost = {
		"activity_sand_cost",
		"390#1",
		-1
	},
	activity_warmup_arena_ticket_limit = {
		"activity_warmup_arena_ticket_limit",
		"20",
		-1
	},
	activity_warmup_arena_ticket_day = {
		"activity_warmup_arena_ticket_day",
		"5",
		-1
	},
	activity_free_revert_partner = {
		"activity_free_revert_partner",
		"52006|651009|752003|53007|653018|753011|54011|654018|754011|51011|651018|751011",
		-1
	},
	activity_warmup_arena_guess_team = {
		"activity_warmup_arena_guess_team",
		"1#3|1#2|2#3",
		-1
	},
	activity_vampire_task_pic = {
		"activity_vampire_task_pic",
		"655023|-0.8#0.8|138#-600",
		-1
	},
	growth_diary_initialize_1 = {
		"growth_diary_initialize_1",
		"1|9|72|30|36|32|39|37|17|41",
		-1
	},
	growth_diary_initialize_6 = {
		"growth_diary_initialize_6",
		"75|55|79|42|76",
		-1
	},
	growth_diary_initialize_11 = {
		"growth_diary_initialize_11",
		"19|73|80|70|44",
		-1
	},
	growth_diary_initialize_16 = {
		"growth_diary_initialize_16",
		"53|46",
		-1
	},
	growth_diary_initialize_21 = {
		"growth_diary_initialize_21",
		"74|50|77|61|62",
		-1
	},
	growth_diary_initialize_26 = {
		"growth_diary_initialize_26",
		"71|78|56|57",
		-1
	},
	growth_diary_initialize_31 = {
		"growth_diary_initialize_31",
		"63|69|65",
		-1
	},
	activity_goldfish_cost = {
		"activity_goldfish_cost",
		"394#1",
		-1
	},
	activity_goldfish_coin_base = {
		"activity_goldfish_coin_base",
		"10000",
		-1
	},
	activity_goldfish_coin_add = {
		"activity_goldfish_coin_add",
		"200",
		-1
	},
	activity_goldfish_weight = {
		"activity_goldfish_weight",
		"90|10",
		-1
	},
	accumulated_consume_item01 = {
		"accumulated_consume_item01",
		"394",
		-1
	},
	activity_goldfish_guarantee = {
		"activity_goldfish_guarantee",
		"19",
		-1
	},
	activity_goldfish_pack_get = {
		"activity_goldfish_pack_get",
		"394#20|20#10",
		-1
	},
	activity_goldfish_pack_cost = {
		"activity_goldfish_pack_cost",
		"2#3000",
		-1
	},
	activity_goldfish_pack_times = {
		"activity_goldfish_pack_times",
		"2",
		-1
	},
	activity_goldfish_pack_addtimes = {
		"activity_goldfish_pack_addtimes",
		"0",
		-1
	},
	activity_goldfish_get = {
		"activity_goldfish_get",
		"395",
		-1
	},
	activity_goldfish_expectation = {
		"activity_goldfish_expectation",
		"0.9943|21136.93|177.23",
		-1
	},
	newbee_questionnaire_new_type = {
		"newbee_questionnaire_new_type",
		"1|11",
		-1
	},
	galaxy_trip_challenge = {
		"galaxy_trip_challenge",
		"10|10|25",
		-1
	},
	galaxy_trip_explore_place = {
		"galaxy_trip_explore_place",
		"6",
		-1
	},
	galaxy_trip_robber_time = {
		"galaxy_trip_robber_time",
		"259200",
		-1
	},
	galaxy_trip_open_time = {
		"galaxy_trip_open_time",
		"1660867200",
		-1
	},
	galaxy_trip_open_num = {
		"galaxy_trip_open_num",
		"4|4|6|6|6|8",
		-1
	},
	galaxy_trip_time = {
		"galaxy_trip_time",
		2419200,
		-1
	},
	galaxy_trip_enemy_weaken = {
		"galaxy_trip_enemy_weaken",
		"0.3|0.01|0.40",
		-1
	},
	galaxy_trip_black_hole_open = {
		"galaxy_trip_black_hole_open",
		"4|2|1",
		-1
	},
	galaxy_trip_boss_max_level = {
		"galaxy_trip_boss_max_level",
		"5|5|20",
		-1
	},
	galaxy_trip_stop_time_limit = {
		"galaxy_trip_stop_time_limit",
		"10",
		-1
	},
	galaxy_trip_black_hole_open_time = {
		"galaxy_trip_black_hole_open_time",
		"1661472000",
		-1
	},
	galaxy_trip_mail = {
		"galaxy_trip_mail",
		"86400|268",
		-1
	},
	partner_group7_summon_time = {
		"partner_group7_summon_time",
		"757003#1666915200",
		-1
	},
	legendary_skin_giftbag_limit = {
		"legendary_skin_giftbag_limit",
		"5",
		-1
	},
	legendary_skin_giftbag_cost = {
		"legendary_skin_giftbag_cost",
		"2#2000@4201042#1|403#10",
		-1
	},
	activity_legendary_skin_cost = {
		"activity_legendary_skin_cost",
		"403#1",
		-1
	},
	invitation_senpai = {
		"invitation_senpai",
		20,
		-1
	},
	invitation_senpai_day = {
		"invitation_senpai_day",
		"3",
		-1
	},
	invitation_senpai_num = {
		"invitation_senpai_num",
		"10",
		-1
	},
	invitation_new = {
		"invitation_new",
		"70",
		-1
	},
	invitation_new_awards = {
		"invitation_new_awards",
		"2#10|35#10",
		-1
	},
	invitation_daily_gift = {
		"invitation_daily_gift",
		"1#100000|9#100000",
		-1
	},
	invitation_delete_day = {
		"invitation_delete_day",
		"30",
		-1
	},
	invitation_weekly_share_awards = {
		"invitation_weekly_share_awards",
		"2#100",
		-1
	},
	gacha_ensure_guarantee_star5_times = {
		"gacha_ensure_guarantee_star5_times",
		4,
		-1
	},
	gacha_ensure_guarantee_star5_dropbox1 = {
		"gacha_ensure_guarantee_star5_dropbox1",
		"10013",
		-1
	},
	activity_spring_giftbag_cost = {
		"activity_spring_giftbag_cost",
		"2#2500|2",
		-1
	},
	activity_spring_giftbag_get = {
		"activity_spring_giftbag_get",
		"260#2500|261#500",
		-1
	},
	activity_dragonboat2022_gamble = {
		"activity_dragonboat2022_gamble",
		"1#30|2#30|3#30",
		-1
	},
	activity_repair_console_cost = {
		"activity_repair_console_cost",
		"408#1",
		-1
	},
	activity_repair_console_random_weight = {
		"activity_repair_console_random_weight",
		"45|30|25",
		-1
	},
	activity_repair_console_diamonds_giftbag = {
		"activity_repair_console_diamonds_giftbag",
		"2#2500@408#5|4201042#5",
		-1
	},
	activity_repair_console_diamonds_giftbag_limit = {
		"activity_repair_console_diamonds_giftbag_limit",
		"5",
		-1
	},
	activity_repair_console_dropbox_weight = {
		"activity_repair_console_dropbox_weight",
		"200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200|200",
		-1
	},
	activity_repair_console_max_time = {
		"activity_repair_console_max_time",
		"16",
		-1
	},
	time_cloister_default = {
		"time_cloister_default",
		"287#1",
		-1
	},
	top_arena_corss_match_people_num = {
		"top_arena_corss_match_people_num",
		"1500",
		-1
	},
	top_arena_corss_match_base_people_num = {
		"top_arena_corss_match_base_people_num",
		"1200",
		-1
	},
	top_arena_corss_match_oldserver_span = {
		"top_arena_corss_match_oldserver_span",
		"50",
		-1
	},
	top_arena_corss_match_midserver_span = {
		"top_arena_corss_match_midserver_span",
		"30",
		-1
	},
	top_arena_corss_match_newserver_scope = {
		"top_arena_corss_match_newserver_scope",
		"32",
		-1
	},
	top_arena_corss_match_midserver_scope = {
		"top_arena_corss_match_midserver_scope",
		"200",
		-1
	},
	top_arena_corss_match_start_time = {
		"top_arena_corss_match_start_time",
		"1663545600",
		-1
	},
	tower_skipfight_floor = {
		"tower_skipfight_floor",
		"1",
		-1
	},
	arena_corss_match_active_time = {
		"arena_corss_match_active_time",
		"30",
		-1
	},
	top_arena_revenge = {
		"top_arena_revenge",
		"1",
		-1
	},
	guild_new_war_initial_points = {
		"guild_new_war_initial_points",
		"10000|1",
		-1
	},
	guild_new_war_initial_points2 = {
		"guild_new_war_initial_points2",
		"100000|10",
		-1
	},
	guild_new_war_guard_courage = {
		"guild_new_war_guard_courage",
		200,
		-1
	},
	guild_new_war_courage_reduce = {
		"guild_new_war_courage_reduce",
		"5|10|15|20",
		-1
	},
	guild_new_war_attack_points = {
		"guild_new_war_attack_points",
		"15|15|20|20",
		-1
	},
	guild_new_war_attack_times = {
		"guild_new_war_attack_times",
		"10|20",
		-1
	},
	guild_new_war_pk_points = {
		"guild_new_war_pk_points",
		"2000|1000",
		-1
	},
	guild_new_war_flag_points = {
		"guild_new_war_flag_points",
		"15|100|150|300",
		-1
	},
	guild_new_war_sweep_points = {
		"guild_new_war_sweep_points",
		"10|5",
		-1
	},
	guild_new_war_extra_points = {
		"guild_new_war_extra_points",
		"50",
		-1
	},
	guild_new_war_flag_durability = {
		"guild_new_war_flag_durability",
		"100|50",
		-1
	},
	guild_new_war_join_limit = {
		"guild_new_war_join_limit",
		"1",
		-1
	},
	guild_new_war_time_interval = {
		"guild_new_war_time_interval",
		"4|1|2|1|2|1|1|2|1|2|1|1|2|1|2|1|1|2|1|2|4",
		-1
	},
	guild_new_war_guild_limit = {
		"guild_new_war_guild_limit",
		"12|7|5",
		-1
	},
	guild_new_war_command = {
		"guild_new_war_command",
		"43200|20220903",
		-1
	},
	tower_skipfight_level = {
		"tower_skipfight_level",
		"1",
		-1
	},
	activity_pirate_explore_cost = {
		"activity_pirate_explore_cost",
		"410#1",
		-1
	},
	activity_pirate_explore_is_drop = {
		"activity_pirate_explore_is_drop",
		"20|80",
		-1
	},
	activity_pirate_explore_dropbox_guarantee = {
		"activity_pirate_explore_dropbox_guarantee",
		"9",
		-1
	},
	activity_pirate_giftbag_open_time = {
		"activity_pirate_giftbag_open_time",
		"1700870400",
		-1
	},
	activity_pirate_plot_list_member = {
		"activity_pirate_plot_list_member",
		"1#173|2#174|3#175|4#176|5#177|6#178|7#179|8#180|9#181|10#182|11#183",
		-1
	},
	activity_pirate_shop_unlock_item = {
		"activity_pirate_shop_unlock_item",
		"411",
		-1
	},
	activity_pirate_drop_awards = {
		"activity_pirate_drop_awards",
		"411#20",
		-1
	},
	ios_price_version = {
		"ios_price_version",
		"1",
		-1
	},
	activity_pirate_giftbag_free_awards = {
		"activity_pirate_giftbag_free_awards",
		"2#500|410#25|36#10|4201042#3",
		-1
	},
	activity_pirate_giftbag_free_awards_limit = {
		"activity_pirate_giftbag_free_awards_limit",
		"1",
		-1
	},
	activity_pirate_giftbag_limit_max = {
		"activity_pirate_giftbag_limit_max",
		"250000",
		-1
	},
	soul_equip1_ex_num = {
		"soul_equip1_ex_num",
		"2|2|3|3|4|5",
		-1
	},
	soul_equip1_ex_first_cost = {
		"soul_equip1_ex_first_cost",
		"14#5000|418#5",
		-1
	},
	soul_equip1_ex_cost = {
		"soul_equip1_ex_cost",
		"14#1000|418#1",
		-1
	},
	soul_equip1_star_lvl = {
		"soul_equip1_star_lvl",
		"10|20|30|40|50|60",
		-1
	},
	soul_equip2_ex_buff_num = {
		"soul_equip2_ex_buff_num",
		"2#4900|3#4900|4#200",
		-1
	},
	soul_equip2_ex_buff_value = {
		"soul_equip2_ex_buff_value",
		"0.8|1",
		-1
	},
	soul_equip2_ex_cost = {
		"soul_equip2_ex_cost",
		"1#1000000|420#1",
		-1
	},
	soul_equip2_ex_buff_lvl = {
		"soul_equip2_ex_buff_lvl",
		"5#10#15#20",
		-1
	},
	soul_equip_limit = {
		"soul_equip_limit",
		"1000",
		-1
	},
	soul_equip_save_limit = {
		"soul_equip_save_limit",
		"20",
		-1
	},
	soul_equip_open_lvl = {
		"soul_equip_open_lvl",
		"200",
		-1
	},
	soul_land_ticket_init = {
		"soul_land_ticket_init",
		"421#10",
		-1
	},
	soul_land_ticket_max = {
		"soul_land_ticket_max",
		"421#100",
		-1
	},
	soul_land_ticket_daliy = {
		"soul_land_ticket_daliy",
		"421#10",
		-1
	},
	soul_land_battlepass_point = {
		"soul_land_battlepass_point",
		"500|2#8",
		-1
	},
	soul_equip2_lvl_exp_cost = {
		"soul_equip2_lvl_exp_cost",
		"0.5",
		-1
	},
	activity_newbee_fund_4items_preview2 = {
		"activity_newbee_fund_4items_preview2",
		"2|36|93|940016",
		-1
	},
	soul_equip2_sp_item = {
		"soul_equip2_sp_item",
		"426#1#1",
		-1
	},
	activity_2love_random_cost = {
		"activity_2love_random_cost",
		"427#1",
		-1
	},
	activity_lasso_buy = {
		"activity_lasso_buy",
		"2#200|343#1",
		-1
	},
	activity_lasso_buy_limit = {
		"activity_lasso_buy_limit",
		"30",
		-1
	},
	soul_land_start_time = {
		"soul_land_start_time",
		"1666310400",
		-1
	},
	soul_land_award_time_max = {
		"soul_land_award_time_max",
		"86400",
		-1
	},
	soul_land_open_lvl = {
		"soul_land_open_lvl",
		"200",
		-1
	},
	soul_equip2_qlt_cost = {
		"soul_equip2_qlt_cost",
		"2#500",
		-1
	},
	activity_halloween2022_insure = {
		"activity_halloween2022_insure",
		"9",
		-1
	},
	activity_halloween2022_point = {
		"activity_halloween2022_point",
		"431#1|432#5|433#25",
		-1
	},
	activity_halloween2022_limit_max = {
		"activity_halloween2022_limit_max",
		"20000000",
		-1
	},
	activity_halloween2022_get = {
		"activity_halloween2022_get",
		"433",
		-1
	},
	activity_halloween2022_gamble_max = {
		"activity_halloween2022_gamble_max",
		"20",
		-1
	},
	activity_5week_cost = {
		"activity_5week_cost",
		"434#1",
		-1
	},
	soul_land_cycle_time = {
		"soul_land_cycle_time",
		"2419200",
		-1
	},
	activity_promotion_ladder_material2 = {
		"activity_promotion_ladder_material2",
		"52020|55013|55014|56011|56012",
		-1
	},
	activity_promotion_ladder_target2 = {
		"activity_promotion_ladder_target2",
		"51019|51018|51017|51016|52020|52019|52018|52017|53019|53018|53017|53016|54018|54017|54016|54015|55014|55013|55012|55011|56012|56011|56010|56009",
		-1
	},
	activity_promotion_ladder_star2 = {
		"activity_promotion_ladder_star2",
		"5#1|6#2|7#2|8#2|9#3|10#5|11#6|12#7|13#7|14#8|15#9",
		-1
	},
	activity_promotion_ladder_basenum2 = {
		"activity_promotion_ladder_basenum2",
		"341#10",
		-1
	},
	activity_promotion_ladder_interval2 = {
		"activity_promotion_ladder_interval2",
		9,
		-1
	},
	activity_promotion_ladder_increasenum2 = {
		"activity_promotion_ladder_increasenum2",
		"341#5",
		-1
	},
	activity_promotion_ladder_picture2 = {
		"activity_promotion_ladder_picture2",
		"partner_picture_55014#0.7#-137#-547",
		-1
	},
	activity_blind_box_cost = {
		"activity_blind_box_cost",
		"438#1",
		-1
	},
	activity_blind_box_select_num = {
		"activity_blind_box_select_num",
		"3|3|1|1",
		-1
	},
	activity_blind_box_guarantee_time = {
		"activity_blind_box_guarantee_time",
		"29",
		-1
	},
	activity_new_growth_plan_cost = {
		"activity_new_growth_plan_cost",
		"2#5",
		-1
	},
	activity_new_growth_plan_score = {
		"activity_new_growth_plan_score",
		"2",
		-1
	},
	activity_new_growth_plan_partner = {
		"activity_new_growth_plan_partner",
		"51017|52017|53016|54017|55011|56006",
		-1
	},
	activity_new_growth_plan_picture = {
		"activity_new_growth_plan_picture",
		"-40#-254#0.65#0.65|-54#-260#0.6#0.6|-71#-295#0.6#0.6|-47#-352#0.65#0.65|-55#-306#0.65#0.65|-15#-135#0.65#0.65",
		-1
	},
	activity_new_growth_plan_cut = {
		"activity_new_growth_plan_cut",
		"1100#0#750#0|1088#100#750#700|1145#100#265#0|1225#0#760#0|1160#0#772#0|900#0#710#0",
		-1
	},
	activity_pay_day_free_awards = {
		"activity_pay_day_free_awards",
		"2#20|940002#5",
		-1
	},
	activity_new_growth_plan_show1 = {
		"activity_new_growth_plan_show1",
		"51017|52017|53016|54017|55011|56006",
		-1
	},
	activity_new_growth_plan_show2 = {
		"activity_new_growth_plan_show2",
		"2#5000|940053#650|940031#150|940041#50",
		-1
	},
	activity_new_growth_plan_show3 = {
		"activity_new_growth_plan_show3",
		"5000",
		-1
	},
	acticity_pay_day_awards_chang_time = {
		"acticity_pay_day_awards_chang_time",
		"0",
		-1
	},
	acticity_pay_day_awards_chang_excel = {
		"acticity_pay_day_awards_chang_excel",
		"activity_pay_day_awards1|activity_pay_day_awards2",
		-1
	},
	activity_new_growth_plan_start1 = {
		"activity_new_growth_plan_start1",
		"40",
		-1
	},
	activity_new_growth_plan_start2 = {
		"activity_new_growth_plan_start2",
		"3",
		-1
	},
	activity_new_growth_plan_start3 = {
		"activity_new_growth_plan_start3",
		"14",
		-1
	},
	activity_star_altar_login_cost = {
		"activity_star_altar_login_cost",
		"2#50",
		-1
	},
	activity_star_plan_cost = {
		"activity_star_plan_cost",
		"454#1",
		-1
	},
	activity_star_plan_dropbox = {
		"activity_star_plan_dropbox",
		"461|32022",
		-1
	},
	activity_star_plan_list = {
		"activity_star_plan_list",
		"4|3|4|3|4|2|4|3|4|3|4|3|4|2|1|4|2|4|3|4|2|4|3|4|3|4|3|4|2|3|4",
		-1
	},
	activity_star_plan_buy = {
		"activity_star_plan_buy",
		"2#100|20",
		-1
	},
	activity_star_altar_cost_time = {
		"activity_star_altar_cost_time",
		"604800",
		-1
	},
	loading_renew = {
		"loading_renew",
		74,
		-1
	},
	open_school_giftbag_jump_act_id = {
		"open_school_giftbag_jump_act_id",
		"90",
		-1
	}
}

return table
