using System;
using System.Collections.Generic;
using UnityEngine;

public class UIButton : UIButtonColor
{
	public static UIButton current;

	public bool dragHighlight;

	public string hoverSprite;

	public string pressedSprite;

	public string disabledSprite;

	public Sprite hoverSprite2D;

	public Sprite pressedSprite2D;

	public Sprite disabledSprite2D;

	public bool pixelSnap;

	public List<EventDelegate> onClick;

	[NonSerialized]
	private UISprite mSprite;

	[NonSerialized]
	private UI2DSprite mSprite2D;

	[NonSerialized]
	private string mNormalSprite;

	[NonSerialized]
	private Sprite mNormalSprite2D;

	public override bool isEnabled
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public string normalSprite
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public Sprite normalSprite2D
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public void SetEnabled(bool value)
	{
	}

	protected override void OnInit()
	{
	}

	protected override void OnEnable()
	{
	}

	protected override void OnDragOver()
	{
	}

	protected override void OnDragOut()
	{
	}

	protected virtual void OnClick()
	{
	}

	public override void SetState(State state, bool immediate)
	{
	}

	protected void SetSprite(string sp)
	{
	}

	protected void SetSprite(Sprite sp)
	{
	}

	public void SetText(string text, bool style = true)
	{
	}

	public UILabel GetLabel()
	{
		return null;
	}

	public void SetSprite(string atlasName, string spriteName)
	{
	}

	public void HideSprite()
	{
	}

	public UISprite GetSprite()
	{
		return null;
	}

	private void OnDestroy()
	{
	}
}
