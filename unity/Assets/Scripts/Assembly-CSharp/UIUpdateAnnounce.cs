using System;
using UnityEngine;

public class UIUpdateAnnounce : UIBase
{
	public UILabel TitleLabel;

	public UILabel MessageLabel;

	public UITexture BannerTexture;

	public UIButton YesButton;

	private Action _callback;

	public void Init(string title, string message, string banner, string buttonText, Action callback)
	{
	}

	public override void OnClick(GameObject go)
	{
	}
}
