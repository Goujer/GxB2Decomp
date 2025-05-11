using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

[ExecuteInEditMode]
public class UIToggle : UIWidgetContainer
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate bool Validate(bool choice);

	public static BetterList<UIToggle> list;

	public static UIToggle current;

	public int group;

	public UIWidget activeSprite;

	public bool invertSpriteState;

	public Animation activeAnimation;

	public Animator animator;

	public UITweener tween;

	public bool startsActive;

	public bool instantTween;

	public bool optionCanBeNone;

	public List<EventDelegate> onChange;

	public Validate validator;

	[HideInInspector]
	[SerializeField]
	private UISprite checkSprite;

	[HideInInspector]
	[SerializeField]
	private Animation checkAnimation;

	[HideInInspector]
	[SerializeField]
	private GameObject eventReceiver;

	[HideInInspector]
	[SerializeField]
	private string functionName;

	[HideInInspector]
	[SerializeField]
	private bool startsChecked;

	private bool mIsActive;

	private bool mStarted;

	public bool value
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool isColliderEnabled
	{
		get
		{
			return false;
		}
	}

	[Obsolete]
	public bool isChecked
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public static UIToggle GetActiveToggle(int group)
	{
		return null;
	}

	private void OnEnable()
	{
	}

	private void OnDisable()
	{
	}

	public void Start()
	{
	}

	private void OnClick()
	{
	}

	public void SetInstantly(bool state, bool notify = true)
	{
	}

	public void Set(bool state, bool notify = true)
	{
	}

	private void OnDestroy()
	{
	}
}
