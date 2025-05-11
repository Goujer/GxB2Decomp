using System;
using UnityEngine;

public class UIAlert : UIBase
{
	public UILabel TitleLabel;

	public UILabel MessageLabel;

	public UIButton YesButton;

	public UIButton NoButton;

	public UIButton CloseButton;

	private Action<bool> _callback;

	private Action _closeCallback;

	public void Init(int type, string title, string message, string yesText, string noText, bool showClose, Action<bool> callback, Action closeCallback)
	{
	}

	public override void OnClick(GameObject go)
	{
	}

	public override void OnClickClose()
	{
	}
}
