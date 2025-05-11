using System;
using System.Collections.Generic;
using UnityEngine;

public class UIColorPicker : MonoBehaviour
{
	public static UIColorPicker current;

	public Color value;

	public UIWidget selectionWidget;

	public List<EventDelegate> onChange;

	[NonSerialized]
	private Transform mTrans;

	[NonSerialized]
	private UITexture mUITex;

	[NonSerialized]
	private Texture2D mTex;

	[NonSerialized]
	private UICamera mCam;

	[NonSerialized]
	private Vector2 mPos;

	[NonSerialized]
	private int mWidth;

	[NonSerialized]
	private int mHeight;

	private static AnimationCurve mRed;

	private static AnimationCurve mGreen;

	private static AnimationCurve mBlue;

	private void Start()
	{
	}

	private void OnDestroy()
	{
	}

	private void OnPress(bool pressed)
	{
	}

	private void OnDrag(Vector2 delta)
	{
	}

	private void OnPan(Vector2 delta)
	{
	}

	private void Sample()
	{
	}

	public void Select(Vector2 v)
	{
	}

	public Vector2 Select(Color c)
	{
		return default(Vector2);
	}

	public static Color Sample(float x, float y)
	{
		return default(Color);
	}
}
