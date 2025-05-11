using System;
using UnityEngine;

public class TweenColor : UITweener
{
	public Color from;

	public Color to;

	public float colorScale;

	private bool mCached;

	private bool mSMatReplace;

	private UIWidget mWidget;

	private Material mMat;

	private Material sMat;

	private Material sMatClone;

	private Light mLight;

	private float mColorScale;

	private SpriteRenderer mSr;

	[Obsolete]
	public Color color
	{
		get
		{
			return default(Color);
		}
		set
		{
		}
	}

	public Color value
	{
		get
		{
			return default(Color);
		}
		set
		{
		}
	}

	private void Cache()
	{
	}

	protected override void OnUpdate(float factor, bool isFinished)
	{
	}

	protected void OnDisable()
	{
	}

	public static TweenColor Begin(GameObject go, float duration, Color color)
	{
		return null;
	}

	public override void SetStartToCurrentValue()
	{
	}

	public override void SetEndToCurrentValue()
	{
	}

	private void SetCurrentValueToStart()
	{
	}

	private void SetCurrentValueToEnd()
	{
	}
}
