using System;
using UnityEngine;

public class UILoading : UIBase
{
	public UIWidget ProgressGroup;

	public UILabel VersionLabel;

	public UILabel MessageLabel;

	public UILabel ProgressLabel;

	public UILabel StartLabel;

	public UIInput UidInput;

	public UITexture BackImg;

	public UISlider ProgressSlider;

	public Renderer[] Renderers;

	public GameObject StartBtn;

	public GameObject ProgressBar;

	private float _progress;

	private float _progressStep;

	private bool _progressNotify;

	public void Init()
	{
	}

	public void ShowProgrssBar(bool flag)
	{
	}

	public void SetVersionLabel(string version)
	{
	}

	public void SetMessageLabel(string message)
	{
	}

	public void SetProgressLabel(string progress)
	{
	}

	public void SetProgress(float progress, bool notify)
	{
	}

	public void SetProgress(float progress, float step, bool notify)
	{
	}

	public void SetSortingOrder()
	{
	}

	public void SetStartLabel(string startText)
	{
	}

	public void SetStartScreen(Action callback)
	{
	}

	private void Update()
	{
	}
}
