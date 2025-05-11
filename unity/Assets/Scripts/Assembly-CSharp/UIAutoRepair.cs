using System;

public class UIAutoRepair : UIBase
{
	public UILabel TitleLabel;

	public UILabel MessageLabel;

	public UIButton CloseButton;

	private Action<string> _callback;

	private Action _closeCallback;

	public void Init(string title, string message, string urls, bool inGame, bool showClose, Action<string> callback, Action closeCallback)
	{
	}

	public void Init(string title, string message, string urls, bool inGame, string playerID, string logPath, bool showClose, Action<string> callback, Action closeCallback)
	{
	}

	private void OnRepairFinish(string str)
	{
	}

	public override void OnClickClose()
	{
	}
}
