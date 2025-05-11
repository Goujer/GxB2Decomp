using System;
using System.Collections;
using System.Diagnostics;
using UnityEngine;

public class UIAccountBanned : UIBase
{
	public UILabel TitleLabel;

	public UILabel MessageLabel;

	public UILabel MessageLabel2;

	public UILabel MessageLabel3;

	public UILabel PlayerNameLabel;

	public UILabel PlayerNameLabel2;

	public UILabel PlayerIDLabel;

	public UILabel PlayerIDLabel2;

	public UILabel KingdomIDLabel;

	public UILabel KingdomIDLabel2;

	public UILabel PlayerLevelLabel;

	public UILabel PlayerLevelLabel2;

	public UILabel BanReasonLabel;

	public UILabel BanReasonLabel2;

	public UIButton YesButton;

	public UIButton NoButton;

	private int _bannedTime;

	private string _bannedDesc;

	private Action<bool> _callback;

	public void Init(string title, string message, string message2, string info, string yesText, string noText, Action<bool> callback)
	{
	}

	private void Start()
	{
	}

	[DebuggerHidden]
	private IEnumerator CountDownCoroutine()
	{
		return null;
	}

	public override void OnClick(GameObject go)
	{
	}

	private string SecondsToTimeString(int seconds)
	{
		return null;
	}
}
