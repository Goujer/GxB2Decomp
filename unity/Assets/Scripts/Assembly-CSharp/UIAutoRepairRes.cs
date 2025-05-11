using System;
using UnityEngine;

public class UIAutoRepairRes : UIBase
{
	public UILabel TitleLabel;

	public UILabel MessageLabel;

	public UILabel MessageLabel2;

	public UILabel MessageLabel3;

	public UILabel PlayerNameLabel;

	public UILabel CastleLevelLabel;

	public UILabel PlayerIDLabel;

	public UILabel PlayerLevelLabel;

	public UILabel KingdomIDLabel;

	public UIButton YesButton;

	private Action _callback;

	public void Init(string title, string message, string autoRes1, string autoRes2, string autoRes3, string autoRes4, string autoRes5, string message2, string message3, string yesText, Action callback)
	{
	}

	public override void OnClick(GameObject go)
	{
	}
}
